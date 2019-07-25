package com.miui.gallery.cloud.thread;

import com.miui.gallery.cloud.AsyncUpDownloadService;
import com.miui.gallery.cloud.AsyncUpDownloadService.SyncLock;
import com.miui.gallery.cloud.thread.RequestCommandQueue.OnItemChangedListener;

public abstract class BaseSyncLockTask<T> extends BaseTask<T> {
    private SyncLock mSyncLock;

    public BaseSyncLockTask(int i, int i2, int i3, int i4, OnItemChangedListener onItemChangedListener) {
        super(i, i2, i3, i4, onItemChangedListener);
    }

    /* access modifiers changed from: protected */
    public final void acquireLock() {
        if (this.mSyncLock == null) {
            this.mSyncLock = AsyncUpDownloadService.newSyncLock(this.TAG);
        }
        this.mSyncLock.acquire();
    }

    /* access modifiers changed from: protected */
    public final void releaseLock() {
        if (this.mSyncLock != null) {
            this.mSyncLock.release();
            this.mSyncLock = null;
        }
    }
}
