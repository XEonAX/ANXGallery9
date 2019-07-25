package com.miui.gallery.cloud.thread;

import android.accounts.Account;
import android.content.Context;
import com.miui.gallery.cloud.CreateOwnerImage;
import com.miui.gallery.cloud.CreateShareImage;
import com.miui.gallery.cloud.GalleryMiCloudServerException;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.cloud.RetryOperation;
import com.miui.gallery.cloud.ServerErrorCode.MiCloudServerExceptionHandler;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.cloud.control.BatteryMonitor;
import com.miui.gallery.cloud.control.SyncMonitor;
import com.miui.gallery.cloud.thread.RequestCommandQueue.OnItemChangedListener;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deviceprovider.UploadStatusController;
import java.util.HashMap;
import java.util.List;

public class BackUploadTask extends BaseSyncLockTask<DBImage> {
    private long mStartTime;
    private int mUploadCount;

    public BackUploadTask(int i, int i2, int i3, int i4, OnItemChangedListener onItemChangedListener) {
        super(i, i2, i3, i4, onItemChangedListener);
    }

    private void statUpload() {
        long round = (long) Math.round((((float) (System.currentTimeMillis() - this.mStartTime)) * 1.0f) / 1000.0f);
        HashMap hashMap = new HashMap();
        hashMap.put("cost", String.valueOf(round));
        hashMap.put("count", String.valueOf(this.mUploadCount));
        GallerySamplingStatHelper.recordCountEvent("Sync", "sync_upload_time_total", hashMap);
    }

    /* access modifiers changed from: protected */
    public GallerySyncResult<DBImage> handle(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, List<RequestCloudItem> list) {
        if (list.isEmpty()) {
            return new Builder().setCode(GallerySyncCode.OK).build();
        }
        this.mUploadCount += list.size();
        return RetryOperation.doOperation(context, account, galleryExtendedAuthToken, list, ((RequestCloudItem) list.get(0)).dbCloud.isShareItem() ? new CreateShareImage(context) : new CreateOwnerImage(context));
    }

    /* access modifiers changed from: protected */
    public GallerySyncResult<DBImage> onPerformSync() throws Throwable {
        try {
            return super.onPerformSync();
        } catch (GalleryMiCloudServerException e) {
            SyncLog.e(this.TAG, (Throwable) e);
            if (MiCloudServerExceptionHandler.handleMiCloudException(e.getCloudServerException())) {
                SyncLog.e(this.TAG, "throw Cloud server exception status code %d", Integer.valueOf(e.getStatusCode()));
            } else {
                SyncLog.d(this.TAG, "no retry");
            }
            return new Builder().setCode(GallerySyncCode.OK).build();
        }
    }

    /* access modifiers changed from: protected */
    public void onPostExecute() {
        UploadStatusController.getInstance().endUpload();
        BatteryMonitor.getInstance().end();
        releaseLock();
        statUpload();
        SyncMonitor.getInstance().onSyncEnd();
    }

    /* access modifiers changed from: protected */
    public void onPreExecute() {
        this.mStartTime = System.currentTimeMillis();
        this.mUploadCount = 0;
        UploadStatusController.getInstance().startUpload();
        BatteryMonitor.getInstance().start();
        acquireLock();
        SyncMonitor.getInstance().onSyncStart();
    }
}
