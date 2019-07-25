package com.miui.gallery.threadpool;

import io.reactivex.Scheduler;
import io.reactivex.schedulers.Schedulers;

public final class GallerySchedulers {

    private static final class MiscHolder {
        static final Scheduler SCHEDULER = Schedulers.from(ThreadManager.getMiscPool().asExecutorService());
    }

    public static Scheduler misc() {
        return MiscHolder.SCHEDULER;
    }
}
