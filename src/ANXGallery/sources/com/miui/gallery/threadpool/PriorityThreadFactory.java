package com.miui.gallery.threadpool;

import android.os.Process;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

public class PriorityThreadFactory implements ThreadFactory {
    private final String mName;
    private final AtomicInteger mNumber = new AtomicInteger();
    /* access modifiers changed from: private */
    public final int mPriority;

    public PriorityThreadFactory(String str, int i) {
        this.mName = str;
        this.mPriority = i;
    }

    public Thread newThread(Runnable runnable) {
        StringBuilder sb = new StringBuilder();
        sb.append(this.mName);
        sb.append('-');
        sb.append(this.mNumber.getAndIncrement());
        return new Thread(runnable, sb.toString()) {
            public void run() {
                Process.setThreadPriority(PriorityThreadFactory.this.mPriority);
                super.run();
            }
        };
    }
}
