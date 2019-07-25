package com.miui.gallery.cloud;

import com.miui.gallery.cloud.thread.BaseTask;
import com.miui.gallery.util.Log;
import java.util.List;

public class RequestItemExecutor {
    private final String mTag;
    private final BaseTask mTask;
    private Object mWorkLock = new Object();
    private Thread mWorker = null;

    public RequestItemExecutor(BaseTask baseTask) {
        StringBuilder sb = new StringBuilder();
        sb.append("RequestItemExecutor#");
        sb.append(baseTask.getClass().getSimpleName());
        this.mTag = sb.toString();
        this.mTask = baseTask;
    }

    private void ensureWorker() {
        if (this.mTask.getPendingSize() > 0) {
            synchronized (this.mWorkLock) {
                if (!isWorkerAlive()) {
                    Log.i(this.mTag, "mWork null");
                    this.mWorker = new Thread(this.mTask, this.mTag);
                    this.mWorker.start();
                } else {
                    Log.i(this.mTag, "mWork alive %s, interrupt %s", Boolean.valueOf(this.mWorker.isAlive()), Boolean.valueOf(this.mWorker.isInterrupted()));
                    synchronized (this.mWorker) {
                        this.mWorker.notifyAll();
                    }
                }
            }
        }
    }

    private void interrupt() {
        synchronized (this.mWorkLock) {
            if (this.mWorker != null) {
                synchronized (this.mWorker) {
                    this.mWorker.interrupt();
                }
            }
        }
    }

    private boolean isWorkerAlive() {
        boolean z;
        synchronized (this.mWorkLock) {
            z = this.mWorker != null && this.mWorker.isAlive() && !this.mWorker.isInterrupted();
        }
        return z;
    }

    public void cancelAll(int i, boolean z, boolean z2) {
        this.mTask.cancelAll(i, z);
        if (z2 && this.mTask.getPendingSize() <= 0) {
            interrupt();
        }
    }

    public boolean hasDelayedItem() {
        return this.mTask.hasDelayedItem();
    }

    public int invoke(List<RequestCloudItem> list, boolean z) {
        if (!list.isEmpty()) {
            return invoke(list, z, !RequestItemBase.isBackgroundPriority(((RequestCloudItem) list.get(0)).priority));
        }
        return 0;
    }

    public int invoke(List<RequestCloudItem> list, boolean z, boolean z2) {
        int[] invoke = this.mTask.invoke(list, z, z2);
        if (invoke[0] > 0) {
            if (z && invoke[1] > 0) {
                interrupt();
            }
            ensureWorker();
        }
        return invoke[0];
    }
}
