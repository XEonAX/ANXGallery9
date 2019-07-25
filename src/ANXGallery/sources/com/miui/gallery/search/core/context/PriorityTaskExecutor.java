package com.miui.gallery.search.core.context;

import com.miui.gallery.search.core.context.PriorityTaskExecutor.PriorityTask;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadPool;
import com.miui.gallery.threadpool.ThreadPool.Job;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.PriorityQueue;

public class PriorityTaskExecutor<E extends PriorityTask> implements TaskExecutor<E>, FutureListener<Void> {
    private int mLimit;
    private final Object mLock = new Object();
    private final ThreadPool mPool;
    private LinkedList<Future<Void>> mRunningQueue = new LinkedList<>();
    private final PriorityQueue<E> mWaitQueue = new PriorityQueue<>();

    public static abstract class PriorityTask implements Job<Void>, Comparable<PriorityTask> {
        private long mExcuteTime;
        private long mFinishTime;
        private final long mNewTime = System.currentTimeMillis();
        protected int mPriority;
        private long mSubmitTime;

        public int compareTo(PriorityTask priorityTask) {
            if (priorityTask == null) {
                return -1;
            }
            if (this == priorityTask) {
                return 0;
            }
            int priority = this.mPriority - priorityTask.getPriority();
            if (priority == 0) {
                priority = Long.valueOf(priorityTask.getNewTime()).compareTo(Long.valueOf(this.mNewTime));
            }
            return priority;
        }

        public long getExcuteTime() {
            return this.mExcuteTime;
        }

        public long getFinishTime() {
            return this.mFinishTime;
        }

        public long getNewTime() {
            return this.mNewTime;
        }

        public int getPriority() {
            return this.mPriority;
        }

        public long getSubmitTime() {
            return this.mSubmitTime;
        }

        public void setExcuteTime(long j) {
            this.mExcuteTime = j;
        }

        public void setFinishTime(long j) {
            this.mFinishTime = j;
        }

        public void setSubmitTime(long j) {
            this.mSubmitTime = j;
        }
    }

    public PriorityTaskExecutor(int i) {
        this.mPool = new ThreadPool(i, i);
        this.mLimit = i;
    }

    private boolean contains(E e) {
        Iterator it = this.mRunningQueue.iterator();
        while (it.hasNext()) {
            Future future = (Future) it.next();
            if (!future.isCancelled() && e.equals((PriorityTask) future.getJob())) {
                return true;
            }
        }
        return this.mWaitQueue.contains(e);
    }

    private void submitIfAllowed() {
        if (this.mPool.isShutdown()) {
            cancelAll();
            return;
        }
        while (this.mLimit > 0 && !this.mWaitQueue.isEmpty()) {
            PriorityTask priorityTask = (PriorityTask) this.mWaitQueue.poll();
            this.mLimit--;
            priorityTask.setSubmitTime(System.currentTimeMillis());
            this.mRunningQueue.add(this.mPool.submit(priorityTask, this));
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:15:0x003b, code lost:
        return;
     */
    public void cancel(E e) {
        synchronized (this.mLock) {
            Iterator it = this.mRunningQueue.iterator();
            while (it.hasNext()) {
                Future future = (Future) it.next();
                if (isSameTask(future.getJob(), e)) {
                    SearchLog.d("PriorityTaskExecutor", "Cancel running task [%s]", e);
                    future.cancel();
                    return;
                }
            }
            if (this.mWaitQueue.remove(e)) {
                SearchLog.d("PriorityTaskExecutor", "Remove task from waiting queue [%s]", e);
            }
        }
    }

    public void cancelAll() {
        synchronized (this.mLock) {
            this.mWaitQueue.clear();
            Iterator it = this.mRunningQueue.iterator();
            while (it.hasNext()) {
                ((Future) it.next()).cancel();
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean isSameTask(Job job, Job job2) {
        return job.equals(job2);
    }

    public void onFutureDone(Future<Void> future) {
        synchronized (this.mLock) {
            if (future != null) {
                try {
                    if (future.getCancelType() == 1) {
                        PriorityTask priorityTask = (PriorityTask) future.getJob();
                        if (priorityTask != null) {
                            SearchLog.i("PriorityTaskExecutor", "CANCEL_INTERRUPT %d", Integer.valueOf(priorityTask.getPriority()));
                            this.mWaitQueue.offer(priorityTask);
                        }
                    }
                } finally {
                }
            }
            this.mRunningQueue.remove(future);
            this.mLimit++;
            submitIfAllowed();
        }
    }

    public void submit(E e) {
        if (e != null) {
            synchronized (this.mLock) {
                if (contains(e)) {
                    SearchLog.i("PriorityTaskExecutor", "contains task %s, priority: %d", e, Integer.valueOf(e.getPriority()));
                } else {
                    this.mWaitQueue.offer(e);
                    submitIfAllowed();
                }
            }
        }
    }
}
