package com.miui.gallery.assistant.manager;

import com.miui.gallery.util.Log;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class AlgorithmExecuteManager {
    private final BlockingQueue<Runnable> mBlockingQueue;
    private final ThreadPoolExecutor mExecutor;
    private final ThreadFactory mThreadFactory;

    private static final class AlgorithmManagerHolder {
        /* access modifiers changed from: private */
        public static final AlgorithmExecuteManager INSTANCE = new AlgorithmExecuteManager();
    }

    private AlgorithmExecuteManager() {
        this.mBlockingQueue = new PriorityBlockingQueue();
        this.mThreadFactory = new ThreadFactory() {
            private final AtomicInteger mCount = new AtomicInteger();

            public Thread newThread(Runnable runnable) {
                StringBuilder sb = new StringBuilder();
                sb.append("Algorithm Execute Task#");
                sb.append(this.mCount.getAndIncrement());
                return new Thread(runnable, sb.toString());
            }
        };
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 3, 30, TimeUnit.SECONDS, this.mBlockingQueue, this.mThreadFactory);
        this.mExecutor = threadPoolExecutor;
        this.mExecutor.allowCoreThreadTimeOut(true);
    }

    static AlgorithmExecuteManager getInstance() {
        return AlgorithmManagerHolder.INSTANCE;
    }

    public void enqueue(AlgorithmRequest algorithmRequest) {
        if (algorithmRequest != null) {
            this.mExecutor.execute(algorithmRequest);
            Log.d("AlgorithmExecuteManager", "Execute Queue size: %d", (Object) Integer.valueOf(this.mBlockingQueue.size()));
        }
    }
}
