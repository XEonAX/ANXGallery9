package com.miui.gallery.sdk.download.executor;

import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.cloud.AccountCache.AccountInfo;
import com.miui.gallery.sdk.download.downloader.IDownloader;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadPool;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class ThreadPoolExecutor extends AbsDownloadExecutor implements FutureListener {
    private final int mCoreSize;
    private Object mExecutorLock;
    private Future[] mFutures;
    private ThreadPool mPool;

    private class Job implements com.miui.gallery.threadpool.ThreadPool.Job {
        private Job() {
        }

        private boolean needContinue(JobContext jobContext) {
            Log.i("ThreadPoolExecutor", "pendingSize %d, interrupted %s, canceled %s", Integer.valueOf(ThreadPoolExecutor.this.mQueue.getPendingSize()), Boolean.valueOf(Thread.currentThread().isInterrupted()), Boolean.valueOf(jobContext.isCancelled()));
            return ThreadPoolExecutor.this.mQueue.getPendingSize() > 0 && !Thread.currentThread().isInterrupted() && !jobContext.isCancelled();
        }

        public Object run(JobContext jobContext) {
            while (needContinue(jobContext)) {
                List pollToExecute = ThreadPoolExecutor.this.mQueue.pollToExecute();
                if (pollToExecute.size() > 0) {
                    Map classifyCommand = AbsDownloadExecutor.classifyCommand(pollToExecute);
                    if (classifyCommand != null) {
                        ArrayList arrayList = new ArrayList();
                        for (Entry entry : classifyCommand.entrySet()) {
                            List<DownloadCommand> list = (List) entry.getValue();
                            arrayList.clear();
                            for (DownloadCommand downloadCommand : list) {
                                if (DownloadCommand.checkValid(downloadCommand)) {
                                    arrayList.add(downloadCommand.getItem());
                                }
                            }
                            AccountInfo accountInfo = AccountCache.getAccountInfo();
                            if (accountInfo != null) {
                                Log.i("ThreadPoolExecutor", "%s execute size %d", this, Integer.valueOf(arrayList.size()));
                                try {
                                    ((IDownloader) entry.getKey()).download(accountInfo.mAccount, accountInfo.mToken, arrayList);
                                } finally {
                                    for (DownloadCommand key : list) {
                                        ThreadPoolExecutor.this.mQueue.removeFromExecuting(key.getKey());
                                    }
                                }
                            } else {
                                Log.e("ThreadPoolExecutor", "execute: account is null");
                            }
                        }
                    }
                }
            }
            Log.d("ThreadPoolExecutor", "runnable end %s", (Object) this);
            return null;
        }
    }

    public ThreadPoolExecutor(int i, int i2) {
        this(2, i, i2);
    }

    public ThreadPoolExecutor(int i, int i2, int i3) {
        super(i2, i3);
        this.mExecutorLock = new Object();
        this.mCoreSize = i;
        this.mFutures = new Future[this.mCoreSize];
    }

    /* JADX WARNING: type inference failed for: r2v0 */
    /* JADX WARNING: type inference failed for: r2v1, types: [boolean] */
    /* JADX WARNING: type inference failed for: r3v0 */
    /* JADX WARNING: type inference failed for: r3v1 */
    /* JADX WARNING: type inference failed for: r2v2, types: [int] */
    /* JADX WARNING: type inference failed for: r2v3 */
    /* JADX WARNING: type inference failed for: r3v2 */
    /* JADX WARNING: type inference failed for: r2v4, types: [int] */
    /* JADX WARNING: type inference failed for: r3v7 */
    /* JADX WARNING: type inference failed for: r3v8 */
    /* JADX WARNING: type inference failed for: r3v9 */
    /* JADX WARNING: type inference failed for: r3v10 */
    /* JADX WARNING: type inference failed for: r2v5 */
    /* JADX WARNING: type inference failed for: r3v11 */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x0056, code lost:
        return r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0058, code lost:
        return false;
     */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v0
  assigns: [?[int, float, boolean, short, byte, char, OBJECT, ARRAY], int]
  uses: [boolean, ?[int, byte, short, char], ?[int, short, byte, char], int]
  mth insns count: 49
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 6 */
    private boolean dispatchJobs() {
        ? r3;
        synchronized (this.mExecutorLock) {
            ? r2 = 0;
            if (this.mPool != null) {
                if (!this.mPool.isShutdown()) {
                    int pendingSize = this.mQueue.getPendingSize();
                    if (pendingSize > 0) {
                        ? r32 = 0;
                        while (r2 < this.mCoreSize && pendingSize > 0) {
                            Future future = this.mFutures[r2];
                            if (future == null || future.isCancelled() || future.isDone()) {
                                Job job = new Job();
                                Log.i("ThreadPoolExecutor", "submit runnable %s", (Object) job);
                                this.mFutures[r2] = this.mPool.submit(job, this);
                                pendingSize -= this.mQueue.getBatchSize();
                                r3 = 1;
                            } else {
                                r3 = r32;
                            }
                            r32 = r3;
                            r2++;
                        }
                        r2 = r32;
                    }
                }
            }
        }
    }

    private void initExecutorIfNeed() {
        synchronized (this.mExecutorLock) {
            if (this.mPool == null || this.mPool.isShutdown()) {
                this.mPool = new ThreadPool(this.mCoreSize, this.mCoreSize);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void dispatch() {
        synchronized (this.mExecutorLock) {
            initExecutorIfNeed();
            dispatchJobs();
        }
    }

    /* access modifiers changed from: protected */
    public String getTag() {
        return "ThreadPoolExecutor";
    }

    public void interrupt() {
        synchronized (this.mExecutorLock) {
            int i = 0;
            while (i < this.mCoreSize) {
                try {
                    if (this.mFutures[i] != null) {
                        this.mFutures[i].cancel(0);
                        this.mFutures[i] = null;
                    }
                    i++;
                } catch (Exception e) {
                    Log.e("ThreadPoolExecutor", (Throwable) e);
                }
            }
            if (this.mPool != null) {
                this.mPool.shutdownNow();
            }
        }
        this.mQueue.interrupt();
    }

    public void onFutureDone(Future future) {
        if (!future.isCancelled()) {
            Log.i("ThreadPoolExecutor", "onFutureDone dispatch %s", (Object) Boolean.valueOf(dispatchJobs()));
        }
    }
}
