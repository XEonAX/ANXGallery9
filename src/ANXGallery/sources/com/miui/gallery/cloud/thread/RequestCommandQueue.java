package com.miui.gallery.cloud.thread;

import android.os.SystemClock;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.cloud.SyncConditionManager;
import com.miui.gallery.cloud.UpDownloadManager;
import com.miui.gallery.cloud.thread.CommandQueue.OnQueueChangedListener;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public class RequestCommandQueue {
    private final int mAllowBatchMax;
    private final Map<String, RequestCommand> mExecutings;
    private final OnItemChangedListener mListener;
    private final ReadWriteLock mLock = new ReentrantReadWriteLock();
    private final CommandQueue<RequestCommand> mPendings;
    private final String mTag;

    public interface OnItemChangedListener {
        void onAddItem(RequestCloudItem requestCloudItem);

        void onRemoveItem(RequestCloudItem requestCloudItem);
    }

    public RequestCommandQueue(int i, int i2, int i3, OnItemChangedListener onItemChangedListener, String str) {
        this.mPendings = new CommandQueue<>(i, i3);
        this.mExecutings = Maps.newHashMap();
        this.mAllowBatchMax = i2;
        this.mListener = onItemChangedListener;
        this.mTag = str;
    }

    private void lock(boolean z) {
        if (z) {
            this.mLock.writeLock().lock();
        } else {
            this.mLock.readLock().lock();
        }
    }

    private void unlock(boolean z) {
        if (z) {
            this.mLock.writeLock().unlock();
        } else {
            this.mLock.readLock().unlock();
        }
    }

    public void cancelAll(int i, boolean z) {
        String str = this.mTag;
        StringBuilder sb = new StringBuilder();
        sb.append("cancelAll: remain count=");
        sb.append(this.mPendings.size());
        sb.append(", abandon=");
        sb.append(z);
        Log.d(str, sb.toString());
        int i2 = z ? 3 : 1;
        lock(true);
        try {
            for (RequestCommand requestCommand : this.mExecutings.values()) {
                if (requestCommand.mRequestItem.priority == i) {
                    requestCommand.mRequestItem.compareAndSetStatus(0, i2);
                }
            }
            ArrayList<RequestCommand> arrayList = new ArrayList<>();
            for (RequestCommand requestCommand2 : this.mPendings.values()) {
                if (requestCommand2.mRequestItem.priority == i) {
                    requestCommand2.mRequestItem.compareAndSetStatus(0, i2);
                    onRemoveCommand(requestCommand2);
                    arrayList.add(requestCommand2);
                }
            }
            for (RequestCommand key : arrayList) {
                this.mPendings.remove(key.getKey());
            }
        } finally {
            unlock(true);
        }
    }

    public void cancelAll(boolean z) {
        for (int i = 0; i < 14; i++) {
            if (!(SyncConditionManager.check(i) == 0 || UpDownloadManager.getThreadType(i) == -1)) {
                cancelAll(i, z);
            }
        }
    }

    public int getPengdingSize() {
        lock(false);
        try {
            return this.mPendings.size();
        } finally {
            unlock(false);
        }
    }

    /* access modifiers changed from: 0000 */
    public boolean hasDelayedItem() {
        lock(false);
        try {
            return this.mPendings.hasDelayedItem();
        } finally {
            unlock(false);
        }
    }

    public List<RequestCommand> interruptIfNotExecuting(List<RequestCommand> list) {
        String str = this.mTag;
        StringBuilder sb = new StringBuilder();
        sb.append("interruptExecuting: executing count=");
        sb.append(this.mExecutings.size());
        Log.d(str, sb.toString());
        ArrayList newArrayList = Lists.newArrayList();
        lock(true);
        try {
            for (RequestCommand key : list) {
                if (this.mExecutings.containsKey(key.getKey())) {
                    return newArrayList;
                }
            }
            for (RequestCommand requestCommand : this.mExecutings.values()) {
                requestCommand.mRequestItem.compareAndSetStatus(0, 1);
                onRemoveCommand(requestCommand);
                newArrayList.add(requestCommand);
            }
            this.mExecutings.clear();
            unlock(true);
            return newArrayList;
        } finally {
            unlock(true);
        }
    }

    /* access modifiers changed from: 0000 */
    public void onAddCommand(RequestCommand requestCommand) {
        this.mListener.onAddItem(requestCommand.mRequestItem);
    }

    /* access modifiers changed from: 0000 */
    public void onRemoveCommand(RequestCommand requestCommand) {
        this.mListener.onRemoveItem(requestCommand.mRequestItem);
    }

    public long pollToExecute(List<RequestCommand> list) {
        long j;
        lock(true);
        try {
            long uptimeMillis = SystemClock.uptimeMillis();
            this.mPendings.poll(list, this.mAllowBatchMax, uptimeMillis);
            if (!list.isEmpty()) {
                j = 0;
                for (RequestCommand requestCommand : list) {
                    this.mExecutings.put(requestCommand.getKey(), requestCommand);
                }
            } else {
                j = this.mPendings.getMinDelay(uptimeMillis);
            }
            String str = this.mTag;
            StringBuilder sb = new StringBuilder();
            sb.append("pollToExecute: remove count=");
            sb.append(list.size());
            sb.append(", remain count=");
            sb.append(this.mPendings.size());
            Log.d(str, sb.toString());
            return j;
        } finally {
            unlock(true);
        }
    }

    public int put(List<RequestCommand> list, boolean z) {
        lock(true);
        try {
            long uptimeMillis = SystemClock.uptimeMillis();
            ArrayList newArrayList = Lists.newArrayList();
            for (RequestCommand requestCommand : list) {
                if (!this.mExecutings.containsKey(requestCommand.getKey())) {
                    newArrayList.add(requestCommand);
                }
            }
            AnonymousClass1 r8 = new OnQueueChangedListener<RequestCommand>() {
                public void onAdd(RequestCommand requestCommand) {
                    requestCommand.mRequestItem.setStatus(0);
                    RequestCommandQueue.this.onAddCommand(requestCommand);
                }

                public void onRemove(RequestCommand requestCommand) {
                    requestCommand.mRequestItem.compareAndSetStatus(0, 3);
                    RequestCommandQueue.this.onRemoveCommand(requestCommand);
                }
            };
            int putAtFrist = z ? this.mPendings.putAtFrist(newArrayList, uptimeMillis, r8) : this.mPendings.putAtLast(newArrayList, uptimeMillis, r8);
            String str = this.mTag;
            StringBuilder sb = new StringBuilder();
            sb.append("put: add count=");
            sb.append(putAtFrist);
            sb.append(", atFirst=");
            sb.append(z);
            Log.d(str, sb.toString());
            return putAtFrist;
        } finally {
            unlock(true);
        }
    }

    public void removeFromExecuting(String str) {
        lock(true);
        try {
            RequestCommand requestCommand = (RequestCommand) this.mExecutings.remove(str);
            if (requestCommand != null) {
                onRemoveCommand(requestCommand);
            }
        } finally {
            unlock(true);
        }
    }
}
