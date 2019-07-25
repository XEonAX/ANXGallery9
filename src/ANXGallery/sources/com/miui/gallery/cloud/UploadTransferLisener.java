package com.miui.gallery.cloud;

import com.miui.gallery.util.Log;
import com.xiaomi.opensdk.file.model.MiCloudFileListener;

public class UploadTransferLisener implements MiCloudFileListener {
    private RequestCloudItem mRequestItem;

    UploadTransferLisener(RequestCloudItem requestCloudItem) {
        this.mRequestItem = requestCloudItem;
    }

    public void onDataReceived(long j, long j2) {
        StringBuilder sb = new StringBuilder();
        sb.append("upload should not received, pos:");
        sb.append(j);
        sb.append(", total:");
        sb.append(j2);
        sb.append(", item:");
        sb.append(this.mRequestItem.getIdentity());
        Log.e("CloudGalleryTransferListener", sb.toString());
    }

    public void onDataSended(long j, long j2) {
        if (SyncConditionManager.check(this.mRequestItem.priority) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("net work is changed, interrupt this thread, priority=");
            sb.append(this.mRequestItem.priority);
            sb.append(", item:");
            sb.append(this.mRequestItem.getIdentity());
            Log.i("CloudGalleryTransferListener", sb.toString());
            Thread.currentThread().interrupt();
        }
    }
}
