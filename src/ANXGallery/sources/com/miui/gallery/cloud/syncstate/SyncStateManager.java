package com.miui.gallery.cloud.syncstate;

import android.content.Context;
import com.miui.gallery.cloud.SyncConditionManager;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.util.Log;

public class SyncStateManager {
    private Object mReasonLock;
    private long mSyncReason;
    private SyncStateInfo mSyncStateInfo;
    private SyncStateObserver mSyncStateObserver;

    private static class Singleton {
        /* access modifiers changed from: private */
        public static SyncStateManager INSTANCE = new SyncStateManager();
    }

    private SyncStateManager() {
        this.mSyncStateInfo = new SyncStateInfo();
        this.mSyncStateInfo.invalidate();
        this.mSyncStateObserver = new SyncStateObserver();
        this.mSyncReason = 0;
        this.mReasonLock = new Object();
    }

    public static SyncStateManager getInstance() {
        return Singleton.INSTANCE;
    }

    public boolean containsReason(long j) {
        boolean z;
        synchronized (this.mReasonLock) {
            z = (j | this.mSyncReason) == this.mSyncReason;
        }
        return z;
    }

    public long getSyncReason() {
        return this.mSyncReason;
    }

    public SyncStateInfo getSyncState() {
        return this.mSyncStateInfo;
    }

    public SyncType getSyncType() {
        SyncType syncType;
        synchronized (this.mSyncStateInfo) {
            syncType = this.mSyncStateInfo.getSyncType();
        }
        return syncType;
    }

    public void mergeReason(long j) {
        synchronized (this.mReasonLock) {
            this.mSyncReason = j | this.mSyncReason;
        }
    }

    /* access modifiers changed from: 0000 */
    public void onSyncCommandDispatched() {
        this.mSyncStateInfo.onSyncCommandDispatched();
    }

    public void registerSyncStateObserver(Context context, OnSyncStateChangeObserver onSyncStateChangeObserver) {
        this.mSyncStateInfo.registerObserver(onSyncStateChangeObserver);
        this.mSyncStateObserver.register(context);
        updateSyncStatus();
    }

    /* access modifiers changed from: 0000 */
    public void setIsBatteryLow(boolean z) {
        this.mSyncStateInfo.setIsBatteryLow(z);
    }

    /* access modifiers changed from: 0000 */
    public void setIsLocalSpaceFull(boolean z) {
        this.mSyncStateInfo.setIsLocalSpaceFull(z);
    }

    public void setSyncType(SyncType syncType, boolean z) {
        Log.i("SyncStateManager", "setSyncType old: %s, new: %s", getSyncType(), syncType);
        if (z || syncType.isForce()) {
            this.mSyncStateInfo.setSyncType(syncType);
            return;
        }
        SyncType syncType2 = getSyncType();
        if (syncType2.isForce()) {
            if (SyncConditionManager.checkIgnoreCancel(4, syncType) == 0) {
                this.mSyncStateInfo.setSyncType(syncType);
            }
        } else if (SyncType.compare(syncType, syncType2) > 0) {
            this.mSyncStateInfo.setSyncType(syncType);
        }
    }

    /* access modifiers changed from: 0000 */
    public void triggerMediaChanged() {
        this.mSyncStateInfo.triggerMediaChanged();
    }

    public void unmergeReason(long j) {
        synchronized (this.mReasonLock) {
            this.mSyncReason = (j ^ -1) ^ this.mSyncReason;
        }
    }

    public void unregisterSyncStateObserver(Context context, OnSyncStateChangeObserver onSyncStateChangeObserver) {
        this.mSyncStateInfo.unregisterObserver(onSyncStateChangeObserver);
        this.mSyncStateObserver.unregister(context);
    }

    /* access modifiers changed from: 0000 */
    public void updateSyncStatus() {
        this.mSyncStateInfo.invalidate();
    }
}
