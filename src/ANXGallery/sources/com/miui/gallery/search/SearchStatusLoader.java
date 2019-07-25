package com.miui.gallery.search;

import android.content.AsyncTaskLoader;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.os.Handler;
import android.support.v4.content.LocalBroadcastManager;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.provider.deprecated.GalleryCloudProvider;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.deprecated.Preference;
import java.lang.ref.WeakReference;

public class SearchStatusLoader extends AsyncTaskLoader<Integer> {
    private BroadcastReceiver mBroadCastReceiver;
    private ConnectivityReceiver mConnectivityReceiver;
    private Handler mHandler = new Handler();
    private int mLastStatus = -1;
    private WeakReference<StatusReportDelegate> mStatusReportDelegateRef;
    private ContentObserver mUploadingObserver;

    private class ConnectivityReceiver extends BroadcastReceiver {
        private Boolean mLastConnected;

        private ConnectivityReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if (("android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction()) || "android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE".equals(intent.getAction())) && SearchStatusLoader.this.getContext() != null) {
                boolean isNetworkConnected = NetworkUtils.isNetworkConnected();
                SearchLog.d("SearchStatusLoader", "mLastConnected: %b, noConn: %b", this.mLastConnected, Boolean.valueOf(isNetworkConnected));
                if (this.mLastConnected == null || this.mLastConnected.booleanValue() != NetworkUtils.isNetworkConnected()) {
                    this.mLastConnected = Boolean.valueOf(isNetworkConnected);
                    SearchStatusLoader.this.onContentChanged();
                }
            }
        }
    }

    public interface StatusReportDelegate {
        boolean shouldReportStatus(int i);
    }

    public SearchStatusLoader(Context context, StatusReportDelegate statusReportDelegate) {
        super(context);
        this.mStatusReportDelegateRef = new WeakReference<>(statusReportDelegate);
    }

    public void deliverResult(Integer num) {
        this.mLastStatus = num.intValue();
        if (isStarted()) {
            super.deliverResult(num);
        }
    }

    public Integer loadInBackground() {
        int i = 2;
        if (!shouldReportStatus(2) || !NetworkUtils.isActiveNetworkMetered()) {
            if (shouldReportStatus(1) && !NetworkUtils.isNetworkConnected()) {
                i = 1;
            } else if (!shouldReportStatus(3) || SyncUtil.existXiaomiAccount(getContext())) {
                if (!shouldReportStatus(4) || SyncUtil.isGalleryCloudSyncable(getContext())) {
                    if (!shouldReportStatus(10) || Preference.sIsFirstSynced()) {
                        i = 0;
                    } else if (SyncUtil.isGalleryCloudSyncable(getContext())) {
                        i = 10;
                    }
                }
                i = 4;
            } else {
                i = 3;
            }
        }
        return Integer.valueOf(i);
    }

    /* access modifiers changed from: protected */
    public void onReset() {
        super.onReset();
        onStopLoading();
    }

    /* access modifiers changed from: protected */
    public void onStartLoading() {
        super.onStartLoading();
        if (this.mLastStatus != -1) {
            deliverResult(Integer.valueOf(this.mLastStatus));
        }
        if (this.mConnectivityReceiver == null) {
            this.mConnectivityReceiver = new ConnectivityReceiver();
            IntentFilter intentFilter = new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE");
            intentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
            getContext().registerReceiver(this.mConnectivityReceiver, intentFilter);
        }
        if (this.mUploadingObserver == null) {
            this.mUploadingObserver = new ContentObserver(this.mHandler) {
                public void onChange(boolean z) {
                    SearchStatusLoader.this.onContentChanged();
                }
            };
            getContext().getContentResolver().registerContentObserver(GalleryCloudProvider.UPLOAD_STATE_URI, true, this.mUploadingObserver);
        }
        if (!Preference.sIsFirstSynced() && this.mBroadCastReceiver == null) {
            this.mBroadCastReceiver = new BroadcastReceiver() {
                public void onReceive(Context context, Intent intent) {
                    if ("com.miui.gallery.action.FIRST_SYNC_FINISHED".equals(intent.getAction()) || "com.miui.gallery.action.AI_ALBUM_SWITCH_CHANGE".equals(intent.getAction())) {
                        SearchStatusLoader.this.onContentChanged();
                    }
                }
            };
            LocalBroadcastManager instance = LocalBroadcastManager.getInstance(getContext());
            instance.registerReceiver(this.mBroadCastReceiver, new IntentFilter("com.miui.gallery.action.FIRST_SYNC_FINISHED"));
            instance.registerReceiver(this.mBroadCastReceiver, new IntentFilter("com.miui.gallery.action.AI_ALBUM_SWITCH_CHANGE"));
        }
        if (takeContentChanged() || this.mLastStatus == -1) {
            forceLoad();
        }
    }

    /* access modifiers changed from: protected */
    public void onStopLoading() {
        super.onStopLoading();
        cancelLoad();
        if (this.mConnectivityReceiver != null) {
            getContext().unregisterReceiver(this.mConnectivityReceiver);
            this.mConnectivityReceiver = null;
        }
        if (this.mUploadingObserver != null) {
            getContext().getContentResolver().unregisterContentObserver(this.mUploadingObserver);
        }
        if (this.mBroadCastReceiver != null) {
            LocalBroadcastManager.getInstance(getContext()).unregisterReceiver(this.mBroadCastReceiver);
            this.mBroadCastReceiver = null;
        }
    }

    /* access modifiers changed from: protected */
    public boolean shouldReportStatus(int i) {
        StatusReportDelegate statusReportDelegate = this.mStatusReportDelegateRef != null ? (StatusReportDelegate) this.mStatusReportDelegateRef.get() : null;
        return statusReportDelegate == null || statusReportDelegate.shouldReportStatus(i);
    }
}
