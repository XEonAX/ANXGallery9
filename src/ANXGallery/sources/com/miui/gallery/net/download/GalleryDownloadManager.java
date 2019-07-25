package com.miui.gallery.net.download;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class GalleryDownloadManager {
    public static final GalleryDownloadManager INSTANCE = new GalleryDownloadManager();
    private BlockingQueue<Runnable> mBlockingQueue = new LinkedBlockingQueue();
    private ThreadPoolExecutor mExecutor;
    private final Map<Request, DownloadTask> mTasks;
    private ThreadFactory mThreadFactory = new ThreadFactory() {
        private final AtomicInteger mCount = new AtomicInteger();

        public Thread newThread(Runnable runnable) {
            StringBuilder sb = new StringBuilder();
            sb.append("DownloadTask #");
            sb.append(this.mCount.getAndIncrement());
            return new Thread(runnable, sb.toString());
        }
    };

    public GalleryDownloadManager() {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(2, 4, 30, TimeUnit.SECONDS, this.mBlockingQueue, this.mThreadFactory);
        this.mExecutor = threadPoolExecutor;
        this.mTasks = new HashMap();
        this.mExecutor.allowCoreThreadTimeOut(true);
    }

    private void insert(Request request, DownloadTask downloadTask) {
        synchronized (this.mTasks) {
            this.mTasks.put(request, downloadTask);
        }
    }

    private DownloadTask query(Request request) {
        DownloadTask downloadTask;
        synchronized (this.mTasks) {
            downloadTask = (DownloadTask) this.mTasks.get(request);
        }
        return downloadTask;
    }

    public void cancel(Request request) {
        DownloadTask query = query(request);
        if (query != null) {
            query.cancel(false);
        }
    }

    public boolean enqueue(Request request) {
        DownloadTask query = query(request);
        if (query != null && !query.isDone()) {
            return false;
        }
        DownloadTask downloadTask = new DownloadTask(request);
        insert(request, downloadTask);
        downloadTask.execute(this.mExecutor);
        return true;
    }
}
