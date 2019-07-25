package com.miui.gallery.threadpool;

import com.miui.gallery.util.Log;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ThreadPool {
    public static final JobContext JOB_CONTEXT_STUB = new JobContextStub();
    ResourceCounter mCpuCounter;
    private final ThreadPoolExecutor mExecutor;
    ResourceCounter mNetworkCounter;

    public interface CancelListener {
        void onCancel();
    }

    public interface Job<T> {
        T run(JobContext jobContext);
    }

    public interface JobContext {
        boolean isCancelled();

        void setCancelListener(CancelListener cancelListener);
    }

    private static class JobContextStub implements JobContext {
        private JobContextStub() {
        }

        public boolean isCancelled() {
            return false;
        }

        public void setCancelListener(CancelListener cancelListener) {
        }
    }

    private static class ResourceCounter {
        public int value;

        public ResourceCounter(int i) {
            this.value = i;
        }
    }

    private class Worker<T> implements Future<T>, JobContext, Runnable {
        private CancelListener mCancelListener;
        private int mCancelType = 0;
        private volatile boolean mIsCancelled;
        private boolean mIsDone;
        private Job<T> mJob;
        private FutureListener<T> mListener;
        private int mMode;
        private T mResult;
        private ResourceCounter mWaitOnResource;

        public Worker(Job<T> job, FutureListener<T> futureListener) {
            this.mJob = job;
            this.mListener = futureListener;
        }

        /* JADX WARNING: Can't wrap try/catch for region: R(3:25|26|27) */
        /* JADX WARNING: Code restructure failed: missing block: B:12:0x0011, code lost:
            if (r4.value <= 0) goto L_0x0022;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:13:0x0013, code lost:
            r4.value--;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:14:0x0019, code lost:
            monitor-exit(r4);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:15:0x001a, code lost:
            monitor-enter(r3);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:17:?, code lost:
            r3.mWaitOnResource = null;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:18:0x001d, code lost:
            monitor-exit(r3);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:19:0x001e, code lost:
            return true;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:24:?, code lost:
            r4.wait();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:26:?, code lost:
            monitor-exit(r4);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:9:0x000e, code lost:
            monitor-enter(r4);
         */
        /* JADX WARNING: Missing exception handler attribute for start block: B:25:0x0025 */
        private boolean acquireResource(ResourceCounter resourceCounter) {
            while (true) {
                synchronized (this) {
                    if (this.mIsCancelled) {
                        this.mWaitOnResource = null;
                        return false;
                    }
                    this.mWaitOnResource = resourceCounter;
                }
            }
            while (true) {
            }
        }

        private ResourceCounter modeToCounter(int i) {
            if (i == 1) {
                return ThreadPool.this.mCpuCounter;
            }
            if (i == 2) {
                return ThreadPool.this.mNetworkCounter;
            }
            return null;
        }

        private void releaseResource(ResourceCounter resourceCounter) {
            synchronized (resourceCounter) {
                resourceCounter.value++;
                resourceCounter.notifyAll();
            }
        }

        /* JADX WARNING: Code restructure failed: missing block: B:24:0x0025, code lost:
            return;
         */
        public synchronized void cancel() {
            if (!this.mIsCancelled) {
                this.mIsCancelled = true;
                if (this.mWaitOnResource != null) {
                    synchronized (this.mWaitOnResource) {
                        this.mWaitOnResource.notifyAll();
                    }
                }
                if (this.mCancelListener != null) {
                    this.mCancelListener.onCancel();
                }
            }
        }

        public synchronized void cancel(int i) {
            this.mCancelType = i;
            cancel();
        }

        public synchronized T get() {
            while (!this.mIsDone) {
                try {
                    wait();
                } catch (Exception e) {
                    Log.w("Worker", "ingore exception", e);
                }
            }
            return this.mResult;
        }

        public int getCancelType() {
            return this.mCancelType;
        }

        public Job<T> getJob() {
            return this.mJob;
        }

        public boolean isCancelled() {
            return this.mIsCancelled;
        }

        public synchronized boolean isDone() {
            return this.mIsDone;
        }

        /* JADX WARNING: Removed duplicated region for block: B:14:0x0028  */
        /* JADX WARNING: Removed duplicated region for block: B:23:? A[RETURN, SYNTHETIC] */
        /* JADX WARNING: Removed duplicated region for block: B:8:0x0018  */
        public void run() {
            T t;
            if (setMode(1)) {
                try {
                    t = this.mJob.run(this);
                } catch (Throwable th) {
                    Log.w("Worker", "Exception in running a job", th);
                }
                synchronized (this) {
                    setMode(0);
                    this.mResult = t;
                    this.mIsDone = true;
                    notifyAll();
                }
                if (this.mListener == null) {
                    this.mListener.onFutureDone(this);
                    return;
                }
                return;
            }
            t = null;
            synchronized (this) {
            }
            if (this.mListener == null) {
            }
        }

        public synchronized void setCancelListener(CancelListener cancelListener) {
            this.mCancelListener = cancelListener;
            if (this.mIsCancelled && this.mCancelListener != null) {
                this.mCancelListener.onCancel();
            }
        }

        public boolean setMode(int i) {
            ResourceCounter modeToCounter = modeToCounter(this.mMode);
            if (modeToCounter != null) {
                releaseResource(modeToCounter);
            }
            this.mMode = 0;
            ResourceCounter modeToCounter2 = modeToCounter(i);
            if (modeToCounter2 != null) {
                if (!acquireResource(modeToCounter2)) {
                    return false;
                }
                this.mMode = i;
            }
            return true;
        }
    }

    public ThreadPool() {
        this(4, 8);
    }

    public ThreadPool(int i, int i2) {
        this.mCpuCounter = new ResourceCounter(4);
        this.mNetworkCounter = new ResourceCounter(2);
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(i, i2, 10, TimeUnit.SECONDS, new LinkedBlockingQueue(), new PriorityThreadFactory("thread-pool", 10));
        this.mExecutor = threadPoolExecutor;
    }

    public ExecutorService asExecutorService() {
        return this.mExecutor;
    }

    public boolean isShutdown() {
        return this.mExecutor.isShutdown();
    }

    public void shutdown() {
        try {
            this.mExecutor.shutdown();
        } catch (Throwable th) {
            Log.w("ThreadPool", th);
        }
    }

    public void shutdownNow() {
        try {
            this.mExecutor.shutdownNow();
        } catch (Throwable th) {
            Log.w("ThreadPool", th);
        }
    }

    public <T> Future<T> submit(Job<T> job) {
        return submit(job, null);
    }

    public <T> Future<T> submit(Job<T> job, FutureListener<T> futureListener) {
        Worker worker = new Worker(job, futureListener);
        this.mExecutor.execute(worker);
        return worker;
    }
}
