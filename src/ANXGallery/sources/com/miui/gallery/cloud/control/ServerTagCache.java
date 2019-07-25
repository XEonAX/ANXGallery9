package com.miui.gallery.cloud.control;

import android.text.TextUtils;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.util.SyncLog;
import java.util.LinkedList;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public class ServerTagCache {
    private static final int MAX_CAPACITY = CloudControlStrategyHelper.getSyncStrategy().getMaxTempOperationServerTagCapacity();
    private final ReadWriteLock mLock;
    private final LinkedList<String> mPushTags;

    private static class Singleton {
        /* access modifiers changed from: private */
        public static final ServerTagCache SINSTANCE = new ServerTagCache();
    }

    private ServerTagCache() {
        this.mPushTags = new LinkedList<>();
        this.mLock = new ReentrantReadWriteLock();
    }

    public static ServerTagCache getInstance() {
        return Singleton.SINSTANCE;
    }

    private void lock(boolean z) {
        if (z) {
            this.mLock.writeLock().lock();
        } else {
            this.mLock.readLock().lock();
        }
    }

    private void trim() {
        while (this.mPushTags.size() > MAX_CAPACITY) {
            this.mPushTags.removeLast();
        }
    }

    private void unlock(boolean z) {
        if (z) {
            this.mLock.writeLock().unlock();
        } else {
            this.mLock.readLock().unlock();
        }
    }

    public boolean add(String str) {
        lock(true);
        try {
            if (!TextUtils.isEmpty(str)) {
                SyncLog.d("ServerTagCache", "add server tag: %s", (Object) str);
                this.mPushTags.addFirst(str);
                trim();
                return true;
            }
            unlock(true);
            return false;
        } finally {
            unlock(true);
        }
    }

    public boolean contains(String str) {
        lock(false);
        try {
            return this.mPushTags.contains(str);
        } finally {
            unlock(false);
        }
    }
}
