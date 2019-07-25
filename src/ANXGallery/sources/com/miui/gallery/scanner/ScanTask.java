package com.miui.gallery.scanner;

import com.miui.gallery.threadpool.ThreadPool.Job;

public abstract class ScanTask implements Job<Void>, Comparable<ScanTask> {
    private final boolean mForceScan;
    private final boolean mForeground;
    private final long mNewTime = System.currentTimeMillis();
    private final int mPriority;

    public ScanTask(int i, boolean z) {
        this.mPriority = i;
        this.mForeground = z;
        this.mForceScan = false;
    }

    public ScanTask(int i, boolean z, boolean z2) {
        this.mPriority = i;
        this.mForeground = z;
        this.mForceScan = z2;
    }

    /* access modifiers changed from: protected */
    public boolean canRunningInBackground() {
        return false;
    }

    public int compareTo(ScanTask scanTask) {
        if (scanTask == null) {
            return -1;
        }
        if (this == scanTask) {
            return 0;
        }
        int priority = this.mPriority - scanTask.getPriority();
        if (priority == 0) {
            priority = Long.valueOf(this.mNewTime).compareTo(Long.valueOf(scanTask.getNewTime()));
        }
        return priority;
    }

    public long getNewTime() {
        return this.mNewTime;
    }

    public int getPriority() {
        return this.mPriority;
    }

    public boolean isForceScan() {
        return this.mForceScan;
    }

    public boolean isForeground() {
        return this.mForeground;
    }
}
