package com.miui.gallery.util.deviceprovider;

import android.content.ContentValues;
import android.os.AsyncTask;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.cloud.RequestItemBase;
import com.miui.gallery.cloud.UpDownloadManager;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.cloud.syncstate.SyncStateManager;
import com.miui.gallery.cloud.syncstate.SyncStateUtil;
import com.miui.gallery.cloud.thread.RequestCommandQueue.OnItemChangedListener;
import com.miui.gallery.provider.deprecated.GalleryCloudProvider;
import com.miui.gallery.sdk.uploadstatus.SyncProxy;
import com.miui.gallery.sdk.uploadstatus.UploadStatusItem;
import com.miui.gallery.util.SyncLog;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class UploadStatusController implements OnItemChangedListener {
    private static UploadStatusController sThis;
    private int mCount = 0;
    /* access modifiers changed from: private */
    public volatile boolean mHasPendingItem;
    private final Object mLock = new Object();
    private final List<UploadStatusItem> mUploadingItems = new CopyOnWriteArrayList();

    private UploadStatusController() {
    }

    private boolean accept(RequestItemBase requestItemBase) {
        return requestItemBase.priority == 4 || requestItemBase.priority == 2 || requestItemBase.priority == 5 || requestItemBase.priority == 3;
    }

    private void checkPendingStatus() {
        new AsyncTask<Void, Void, Void>() {
            /* access modifiers changed from: protected */
            public Void doInBackground(Void... voidArr) {
                boolean access$000 = UploadStatusController.this.mHasPendingItem;
                UploadStatusController.this.mHasPendingItem = UpDownloadManager.instance(4).hasDelayedItem() || UpDownloadManager.instance(2).hasDelayedItem();
                if (access$000 != UploadStatusController.this.mHasPendingItem) {
                    UploadStatusController.this.refreshUploadStatus();
                }
                return null;
            }
        }.execute(new Void[0]);
    }

    public static synchronized UploadStatusController getInstance() {
        UploadStatusController uploadStatusController;
        synchronized (UploadStatusController.class) {
            if (sThis == null) {
                sThis = new UploadStatusController();
                UpDownloadManager.instance(4).addOnItemChangedListener(sThis);
                UpDownloadManager.instance(2).addOnItemChangedListener(sThis);
            }
            uploadStatusController = sThis;
        }
        return uploadStatusController;
    }

    /* access modifiers changed from: private */
    public void refreshUploadStatus() {
        ContentValues contentValues = new ContentValues();
        contentValues.put("is_upload", Boolean.valueOf(this.mCount > 0));
        contentValues.put("has_pending_item", Boolean.valueOf(this.mHasPendingItem));
        GalleryApp.sGetAndroidContext().getContentResolver().update(GalleryCloudProvider.UPLOAD_STATE_URI, contentValues, null, null);
        if (SyncStateUtil.getDirtyCount(GalleryApp.sGetAndroidContext()).getSyncableCount() == 0) {
            SyncLog.d("UploadStatusController", "recover syncType");
            SyncStateManager.getInstance().setSyncType(SyncType.UNKNOW, true);
        }
    }

    public synchronized void end(RequestItemBase requestItemBase) {
        if (accept(requestItemBase)) {
            UploadStatusItem uploadStatusItem = new UploadStatusItem((RequestCloudItem) requestItemBase);
            this.mUploadingItems.remove(uploadStatusItem);
            SyncProxy.getInstance().getUploadStatusProxy().onUploadStatusChanged(uploadStatusItem);
        }
    }

    public void endUpload() {
        synchronized (this.mLock) {
            this.mCount--;
            if (this.mCount == 0) {
                refreshUploadStatus();
                SyncLog.d("UploadStatusController", "end upload");
            }
        }
    }

    public UploadStatusItem getUploadStatus(UploadStatusItem uploadStatusItem) {
        for (UploadStatusItem uploadStatusItem2 : this.mUploadingItems) {
            if (uploadStatusItem2.equals(uploadStatusItem)) {
                return uploadStatusItem2;
            }
        }
        return null;
    }

    public boolean isPending() {
        return this.mHasPendingItem;
    }

    public boolean isUploading() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mCount > 0;
        }
        return z;
    }

    public void onAddItem(RequestCloudItem requestCloudItem) {
        checkPendingStatus();
    }

    public void onRemoveItem(RequestCloudItem requestCloudItem) {
        checkPendingStatus();
    }

    public synchronized void start(RequestItemBase requestItemBase) {
        if (accept(requestItemBase)) {
            UploadStatusItem uploadStatusItem = new UploadStatusItem((RequestCloudItem) requestItemBase);
            this.mUploadingItems.remove(uploadStatusItem);
            this.mUploadingItems.add(uploadStatusItem);
            SyncProxy.getInstance().getUploadStatusProxy().onUploadStatusChanged(uploadStatusItem);
        }
    }

    public void startUpload() {
        synchronized (this.mLock) {
            this.mCount++;
            if (this.mCount == 1) {
                refreshUploadStatus();
                SyncLog.d("UploadStatusController", "start upload");
            }
        }
    }
}
