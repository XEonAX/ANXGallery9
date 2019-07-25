package com.miui.gallery.loader;

import android.content.AsyncTaskLoader;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Loader.ForceLoadContentObserver;
import android.database.ContentObserver;
import com.miui.gallery.photosapi.PhotosOemApi;
import com.miui.gallery.provider.ProcessingMedia;
import com.miui.gallery.provider.ProcessingMediaManager;
import java.util.List;

public class ProcessingMediaLoader extends AsyncTaskLoader<List<ProcessingMedia>> {
    private static boolean sHasSpecialTypesProvider = true;
    private List<ProcessingMedia> mDataSet;
    private final ContentObserver mForceLoadContentObserver = new ForceLoadContentObserver(this);
    private boolean mIsObserversRegistered;

    public ProcessingMediaLoader(Context context) {
        super(context);
    }

    private void registerContentObservers() {
        if (!this.mIsObserversRegistered) {
            this.mIsObserversRegistered = true;
            ContentResolver contentResolver = getContext().getContentResolver();
            if (sHasSpecialTypesProvider) {
                try {
                    contentResolver.registerContentObserver(PhotosOemApi.getQueryProcessingUri(getContext()), true, this.mForceLoadContentObserver);
                } catch (Exception unused) {
                    sHasSpecialTypesProvider = false;
                }
            }
        }
    }

    private void unregisterContentObservers() {
        if (this.mIsObserversRegistered) {
            this.mIsObserversRegistered = false;
            getContext().getContentResolver().unregisterContentObserver(this.mForceLoadContentObserver);
        }
    }

    public final void deliverResult(List<ProcessingMedia> list) {
        if (isReset()) {
            if (list != null) {
                list.clear();
            }
            return;
        }
        List<ProcessingMedia> list2 = this.mDataSet;
        this.mDataSet = list;
        if (isStarted()) {
            super.deliverResult(list);
        }
        if (!(list2 == null || list2 == list)) {
            list2.clear();
        }
    }

    public List<ProcessingMedia> loadInBackground() {
        return ProcessingMediaManager.queryProcessingMedias();
    }

    /* access modifiers changed from: protected */
    public void onAbandon() {
        super.onAbandon();
        unregisterContentObservers();
    }

    public final void onCanceled(List<ProcessingMedia> list) {
        if (list != null) {
            list.clear();
        }
    }

    /* access modifiers changed from: protected */
    public final void onReset() {
        super.onReset();
        onStopLoading();
        unregisterContentObservers();
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
        registerContentObservers();
    }

    /* access modifiers changed from: protected */
    public void onStopLoading() {
        cancelLoad();
    }
}
