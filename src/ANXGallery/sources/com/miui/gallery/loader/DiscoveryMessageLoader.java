package com.miui.gallery.loader;

import android.content.AsyncTaskLoader;
import android.content.Context;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.Looper;
import com.miui.gallery.discovery.DiscoveryMessageManager;
import com.miui.gallery.model.DiscoveryMessage;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

public class DiscoveryMessageLoader extends AsyncTaskLoader<ArrayList<DiscoveryMessage>> {
    private ForceLoadContentObserver mContentObserver;
    private Context mContext;
    private ArrayList<DiscoveryMessage> mDataSet;
    private int mMessageTypeMask;

    public static final class ForceLoadContentObserver extends ContentObserver {
        private WeakReference<DiscoveryMessageLoader> mLoaderRef;
        private int mMessageTypeMask;

        public ForceLoadContentObserver(DiscoveryMessageLoader discoveryMessageLoader, int i) {
            super(new Handler(Looper.myLooper()));
            this.mMessageTypeMask = i;
            this.mLoaderRef = new WeakReference<>(discoveryMessageLoader);
        }

        public int getMessageTypeMask() {
            return this.mMessageTypeMask;
        }

        public void onChange(boolean z) {
            if (this.mLoaderRef.get() != null) {
                ((DiscoveryMessageLoader) this.mLoaderRef.get()).onContentChanged();
            }
        }
    }

    public DiscoveryMessageLoader(Context context, int i) {
        super(context);
        this.mContext = context.getApplicationContext();
        this.mContentObserver = new ForceLoadContentObserver(this, i);
        this.mMessageTypeMask = i;
        DiscoveryMessageManager.getInstance().registerContentObserver(this.mContentObserver);
    }

    public final void deliverResult(ArrayList<DiscoveryMessage> arrayList) {
        if (isReset()) {
            if (arrayList != null) {
                arrayList.clear();
            }
            return;
        }
        ArrayList<DiscoveryMessage> arrayList2 = this.mDataSet;
        this.mDataSet = arrayList;
        if (isStarted()) {
            super.deliverResult(arrayList);
        }
        if (!(arrayList2 == null || arrayList2 == arrayList)) {
            arrayList2.clear();
        }
    }

    public ArrayList<DiscoveryMessage> loadInBackground() {
        return DiscoveryMessageManager.getInstance().loadMessage(this.mContext, this.mMessageTypeMask);
    }

    /* access modifiers changed from: protected */
    public void onAbandon() {
        super.onAbandon();
        DiscoveryMessageManager.getInstance().unregisterContentObserver(this.mContentObserver);
    }

    public final void onCanceled(ArrayList<DiscoveryMessage> arrayList) {
        if (arrayList != null) {
            arrayList.clear();
        }
    }

    /* access modifiers changed from: protected */
    public final void onReset() {
        super.onReset();
        onStopLoading();
        DiscoveryMessageManager.getInstance().unregisterContentObserver(this.mContentObserver);
        if (this.mDataSet != null) {
            this.mDataSet.clear();
            this.mDataSet = null;
        }
    }

    /* access modifiers changed from: protected */
    public final void onStartLoading() {
        if (this.mDataSet != null) {
            deliverResult(this.mDataSet);
        }
        if (takeContentChanged() || this.mDataSet == null) {
            forceLoad();
        }
    }
}
