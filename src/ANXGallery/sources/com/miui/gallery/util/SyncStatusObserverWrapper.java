package com.miui.gallery.util;

import android.content.SyncStatusObserver;

public class SyncStatusObserverWrapper implements SyncStatusObserver {
    private SyncStatusObserver mWorker;

    public void onStatusChanged(int i) {
        SyncStatusObserver syncStatusObserver = this.mWorker;
        if (syncStatusObserver != null) {
            syncStatusObserver.onStatusChanged(i);
        }
    }

    public void setSyncStatusObserverWorker(SyncStatusObserver syncStatusObserver) {
        this.mWorker = syncStatusObserver;
    }
}
