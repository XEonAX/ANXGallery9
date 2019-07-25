package com.miui.gallery.provider.cloudmanager;

import android.content.Context;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadPool;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.Log;
import java.util.concurrent.LinkedBlockingQueue;

class FileTaskExecutor implements FutureListener<FileTaskResult> {
    private Context mContext;
    private FileHandleListener mListener;
    private final Object mLock = new Object();
    private final ThreadPool mPool;
    private Future<FileTaskResult> mRunningTask = null;
    private LinkedBlockingQueue<long[]> mWaitingQueue;

    interface FileHandleListener {
        void onAllTaskExecuted();

        void onCancel();

        void onRecordsHandled(long[] jArr, long[] jArr2);
    }

    private static class FileTaskJob implements Job<FileTaskResult> {
        private Context mContext;
        private long[] mIds;

        public FileTaskJob(Context context, long[] jArr) {
            this.mContext = context;
            this.mIds = jArr;
        }

        public FileTaskResult run(JobContext jobContext) {
            return new FileTaskResult(this.mIds, new FileHandleTask(this.mContext, this.mIds).run(null, null));
        }
    }

    static class FileTaskResult {
        public long[] ids;
        public long[] results;

        public FileTaskResult(long[] jArr, long[] jArr2) {
            this.ids = jArr;
            this.results = jArr2;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("[FileTaskResult:ids:");
            sb.append(this.ids);
            sb.append(", results:");
            sb.append(this.results);
            sb.append("]");
            return sb.toString();
        }
    }

    public FileTaskExecutor(Context context, FileHandleListener fileHandleListener) {
        this.mContext = context;
        this.mListener = fileHandleListener;
        this.mWaitingQueue = new LinkedBlockingQueue<>();
        this.mPool = new ThreadPool(1, 1);
    }

    private void cancelAll() {
        synchronized (this.mLock) {
            if (this.mRunningTask != null) {
                Log.w("CloudManager.FileTaskExecutor", "Running file task isn't finished yet!");
            }
            this.mWaitingQueue.clear();
            if (this.mRunningTask != null) {
                this.mRunningTask.cancel();
            }
        }
    }

    private void reportIfCompleted() {
        if (isCompleted()) {
            Log.d("CloudManager.FileTaskExecutor", "on complete all tasks");
            this.mListener.onAllTaskExecuted();
        }
    }

    private void submitIfAllowed() {
        if (this.mPool.isShutdown()) {
            cancelAll();
            this.mListener.onCancel();
            Log.w("CloudManager.FileTaskExecutor", "Strange situation, submitting tasks when executor is shutting down!");
            return;
        }
        synchronized (this.mLock) {
            if (this.mRunningTask != null || this.mWaitingQueue.size() <= 0) {
                reportIfCompleted();
            } else {
                long[] jArr = (long[]) this.mWaitingQueue.poll();
                Log.d("CloudManager.FileTaskExecutor", "Submitting FileTaskJob of %d ids to executor [%s]", Integer.valueOf(jArr.length), this);
                this.mRunningTask = this.mPool.submit(new FileTaskJob(this.mContext, jArr), this);
            }
        }
    }

    public boolean isCompleted() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mWaitingQueue.isEmpty() && this.mRunningTask == null;
        }
        return z;
    }

    public void onFutureDone(Future<FileTaskResult> future) {
        synchronized (this.mLock) {
            if (this.mRunningTask != future) {
                Log.e("CloudManager.FileTaskExecutor", "Don't know what happened, but we expect %s instead of %s", this.mRunningTask, future);
            }
            this.mRunningTask = null;
        }
        FileTaskResult fileTaskResult = (FileTaskResult) future.get();
        if (fileTaskResult == null || fileTaskResult.ids == null || fileTaskResult.results == null) {
            Log.e("CloudManager.FileTaskExecutor", "Invalid file task result %s", (Object) fileTaskResult);
        } else {
            Log.d("CloudManager.FileTaskExecutor", "onFutureDone for %s ids", (Object) Integer.valueOf(fileTaskResult.ids.length));
            this.mListener.onRecordsHandled(fileTaskResult.ids, fileTaskResult.results);
        }
        submitIfAllowed();
    }

    public void shutdown() {
        Log.d("CloudManager.FileTaskExecutor", "Shutting down executor [%s]", (Object) this);
        cancelAll();
        this.mPool.shutdown();
        this.mContext = null;
    }

    public void submit(long[] jArr) {
        if (jArr == null || jArr.length <= 0) {
            reportIfCompleted();
            return;
        }
        synchronized (this.mLock) {
            this.mWaitingQueue.add(jArr);
        }
        submitIfAllowed();
    }
}
