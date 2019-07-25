package com.miui.gallery.search.core.context;

import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadPool;
import com.miui.gallery.threadpool.ThreadPool.Job;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.concurrent.LinkedBlockingQueue;

public class SimpleTaskExecutor implements TaskExecutor<Job>, FutureListener {
    private int mLimit;
    private final Object mLock = new Object();
    private final ThreadPool mPool;
    private LinkedList<Future> mRunningQueue = new LinkedList<>();
    private final LinkedBlockingQueue<Job> mWaitQueue = new LinkedBlockingQueue<>();

    public SimpleTaskExecutor(int i) {
        this.mPool = new ThreadPool(i, i);
        this.mLimit = i;
    }

    private boolean contains(Job job) {
        Iterator it = this.mRunningQueue.iterator();
        while (it.hasNext()) {
            Future future = (Future) it.next();
            if (!future.isCancelled() && job.equals(future.getJob())) {
                return true;
            }
        }
        return this.mWaitQueue.contains(job);
    }

    private void submitIfAllowed() {
        while (this.mLimit > 0 && !this.mWaitQueue.isEmpty()) {
            try {
                Job job = (Job) this.mWaitQueue.take();
                this.mLimit--;
                Future submit = this.mPool.submit(job, this);
                SearchLog.i("SimpleTaskExecutor", "submit task %s, running %s", job, submit);
                this.mRunningQueue.add(submit);
            } catch (InterruptedException e) {
                SearchLog.w("SimpleTaskExecutor", (Throwable) e);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:15:0x003e, code lost:
        return;
     */
    public void cancel(Job job) {
        synchronized (this.mLock) {
            Iterator it = this.mRunningQueue.iterator();
            while (it.hasNext()) {
                Future future = (Future) it.next();
                if (isSameTask(future.getJob(), job)) {
                    SearchLog.d("SimpleTaskExecutor", "Cancel running task [%s]", job);
                    future.cancel();
                    onFutureDone(future);
                    return;
                }
            }
            if (this.mWaitQueue.remove(job)) {
                SearchLog.d("SimpleTaskExecutor", "Remove task from waiting queue [%s]", job);
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean isSameTask(Job job, Job job2) {
        return job.equals(job2);
    }

    public void onFutureDone(Future future) {
        synchronized (this.mLock) {
            if (this.mRunningQueue.remove(future)) {
                this.mLimit++;
            }
            submitIfAllowed();
        }
    }

    public void submit(Job job) {
        if (job != null) {
            synchronized (this.mLock) {
                if (contains(job)) {
                    SearchLog.i("SimpleTaskExecutor", "contain task %d", job);
                } else {
                    this.mWaitQueue.add(job);
                    submitIfAllowed();
                }
            }
        }
    }
}
