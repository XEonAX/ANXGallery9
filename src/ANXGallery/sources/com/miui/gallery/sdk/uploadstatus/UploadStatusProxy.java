package com.miui.gallery.sdk.uploadstatus;

import com.google.common.collect.Sets;
import com.miui.gallery.util.deviceprovider.UploadStatusController;
import java.util.Set;

public class UploadStatusProxy {
    private Set<UploadStatusChangedListener> mListeners = Sets.newHashSet();

    public interface UploadStatusChangedListener {
        void onUploadStatusChanged(UploadStatusItem uploadStatusItem);
    }

    UploadStatusProxy() {
    }

    public synchronized void addUploadStatusChangedListener(UploadStatusChangedListener uploadStatusChangedListener) {
        this.mListeners.add(uploadStatusChangedListener);
    }

    public UploadStatusItem getUploadStatus(UploadStatusItem uploadStatusItem) {
        return UploadStatusController.getInstance().getUploadStatus(uploadStatusItem);
    }

    public synchronized void onUploadStatusChanged(UploadStatusItem uploadStatusItem) {
        for (UploadStatusChangedListener onUploadStatusChanged : this.mListeners) {
            onUploadStatusChanged.onUploadStatusChanged(uploadStatusItem);
        }
    }

    public synchronized void removeUploadStatusChangedListener(UploadStatusChangedListener uploadStatusChangedListener) {
        this.mListeners.remove(uploadStatusChangedListener);
    }
}
