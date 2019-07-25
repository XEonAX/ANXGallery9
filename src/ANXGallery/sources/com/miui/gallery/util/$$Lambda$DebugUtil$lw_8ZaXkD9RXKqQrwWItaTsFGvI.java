package com.miui.gallery.util;

import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;

/* renamed from: com.miui.gallery.util.-$$Lambda$DebugUtil$lw_8ZaXkD9RXKqQrwWItaTsFGvI reason: invalid class name */
/* compiled from: lambda */
public final /* synthetic */ class $$Lambda$DebugUtil$lw_8ZaXkD9RXKqQrwWItaTsFGvI implements Job {
    public static final /* synthetic */ $$Lambda$DebugUtil$lw_8ZaXkD9RXKqQrwWItaTsFGvI INSTANCE = new $$Lambda$DebugUtil$lw_8ZaXkD9RXKqQrwWItaTsFGvI();

    private /* synthetic */ $$Lambda$DebugUtil$lw_8ZaXkD9RXKqQrwWItaTsFGvI() {
    }

    public final Object run(JobContext jobContext) {
        return DebugUtil.doExportDB();
    }
}
