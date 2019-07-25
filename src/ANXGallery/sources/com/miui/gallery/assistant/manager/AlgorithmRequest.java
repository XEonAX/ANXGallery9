package com.miui.gallery.assistant.manager;

import android.os.Build;
import android.os.Looper;
import com.miui.gallery.assistant.manager.request.param.RequestParams;
import com.miui.gallery.assistant.manager.result.AlgorithmResult;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import java.util.HashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicLong;

public abstract class AlgorithmRequest<I, P extends RequestParams<I>, R extends AlgorithmResult> implements Comparable<AlgorithmRequest>, Runnable {
    static final AtomicLong seq = new AtomicLong(0);
    protected final String TAG = getClass().getSimpleName();
    private R mAlgorithmResult;
    private volatile Listener<R> mAsyncThreadListener;
    private volatile boolean mIsCanceled = false;
    /* access modifiers changed from: private */
    public volatile Listener<R> mMainThreadListener;
    private final Priority mPriority;
    protected P mRequestParams;
    private volatile State mState;
    private CountDownLatch mSyncExecuteLock = null;
    long seqNum;

    public interface Listener<R extends AlgorithmResult> {
        void onCancel();

        void onComputeComplete(R r);

        void onSaveComplete(R r);

        void onStart();
    }

    public enum Priority {
        PRIORITY_IMMEDIATELY,
        PRIORITY_HIGH,
        PRIORITY_NORMAL,
        PRIORITY_LOW
    }

    public enum State {
        STATE_INIT,
        STATE_QUEUING,
        STATE_START,
        STATE_FINISHED
    }

    public AlgorithmRequest(Priority priority, P p) {
        this.mRequestParams = p;
        this.mPriority = priority;
        this.mState = State.STATE_INIT;
    }

    private void notifySaveComplete(final R r) {
        if (this.mAsyncThreadListener != null) {
            this.mAsyncThreadListener.onSaveComplete(r);
        }
        if (this.mMainThreadListener != null) {
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    if (AlgorithmRequest.this.mMainThreadListener != null) {
                        AlgorithmRequest.this.mMainThreadListener.onSaveComplete(r);
                    }
                }
            });
        }
    }

    private void onStart() {
        if (this.mAsyncThreadListener != null) {
            this.mAsyncThreadListener.onStart();
        }
        if (this.mMainThreadListener != null) {
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    if (AlgorithmRequest.this.mMainThreadListener != null) {
                        AlgorithmRequest.this.mMainThreadListener.onStart();
                    }
                }
            });
        }
    }

    private void recordAlgorithmProcessTime(long j) {
        long currentTimeMillis = System.currentTimeMillis() - j;
        Log.d(this.TAG, "%s AlgorithmRequest process using time %d ms", this.TAG, Long.valueOf(currentTimeMillis));
        HashMap hashMap = new HashMap();
        StringBuilder sb = new StringBuilder();
        sb.append("model_");
        sb.append(Build.MODEL);
        hashMap.put(sb.toString(), String.valueOf((currentTimeMillis / 50) * 50));
        StringBuilder sb2 = new StringBuilder();
        sb2.append("assistant_algorithm_process_time_");
        sb2.append(this.TAG);
        GallerySamplingStatHelper.recordCountEvent("assistant", sb2.toString(), hashMap);
        StringBuilder sb3 = new StringBuilder();
        sb3.append("assistant_algorithm_process_time_distribution_");
        sb3.append(this.TAG);
        GallerySamplingStatHelper.recordNumericPropertyEvent("assistant", sb3.toString(), currentTimeMillis);
    }

    private void releaseSyncExecuteLock() {
        if (this.mSyncExecuteLock != null) {
            this.mSyncExecuteLock.countDown();
        }
    }

    public int compareTo(AlgorithmRequest algorithmRequest) {
        int ordinal = this.mPriority.ordinal() - algorithmRequest.getPriority().ordinal();
        return ordinal == 0 ? this.seqNum < algorithmRequest.seqNum ? -1 : 1 : ordinal;
    }

    /* access modifiers changed from: protected */
    public void deliverResponse(final R r) {
        this.mAlgorithmResult = r;
        releaseSyncExecuteLock();
        if (this.mAsyncThreadListener != null) {
            this.mAsyncThreadListener.onComputeComplete(r);
        }
        if (this.mMainThreadListener != null) {
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    if (AlgorithmRequest.this.mMainThreadListener != null) {
                        AlgorithmRequest.this.mMainThreadListener.onComputeComplete(r);
                    }
                }
            });
        }
    }

    public void execute() {
        refreshSequence();
        AlgorithmExecuteManager.getInstance().enqueue(this);
        this.mState = State.STATE_QUEUING;
    }

    public R executeSync() {
        if (Looper.myLooper() == Looper.getMainLooper() || Looper.myLooper() == ThreadManager.getRequestThreadLooper()) {
            throw new RuntimeException("executeSync could not call on main thread or request thread.");
        } else if (this.mPriority == Priority.PRIORITY_IMMEDIATELY) {
            run();
            return this.mAlgorithmResult;
        } else {
            this.mSyncExecuteLock = new CountDownLatch(1);
            execute();
            try {
                this.mSyncExecuteLock.await();
            } catch (InterruptedException unused) {
            }
            return this.mAlgorithmResult;
        }
    }

    public Priority getPriority() {
        return this.mPriority;
    }

    /* access modifiers changed from: protected */
    public abstract void onSaveResult(R r);

    /* access modifiers changed from: protected */
    public abstract R process(I i);

    /* access modifiers changed from: protected */
    public void refreshSequence() {
        this.seqNum = seq.getAndIncrement();
    }

    public void run() {
        if (this.mIsCanceled) {
            if (this.mAsyncThreadListener != null) {
                this.mAsyncThreadListener.onCancel();
            }
            if (this.mMainThreadListener != null) {
                ThreadManager.getMainHandler().post(new Runnable() {
                    public void run() {
                        if (AlgorithmRequest.this.mMainThreadListener != null) {
                            AlgorithmRequest.this.mMainThreadListener.onCancel();
                        }
                    }
                });
            }
        } else {
            this.mState = State.STATE_START;
            onStart();
            try {
                long currentTimeMillis = System.currentTimeMillis();
                AlgorithmResult process = process(this.mRequestParams.getAlgorithmRequestInputs());
                recordAlgorithmProcessTime(currentTimeMillis);
                if (process == null || process.getResultCode() != 6) {
                    deliverResponse(process);
                    this.mState = State.STATE_FINISHED;
                    Log.d(this.TAG, "%s AlgorithmRequest save result!", (Object) this.TAG);
                    onSaveResult(process);
                    notifySaveComplete(process);
                }
            } catch (Exception e) {
                Log.e(this.TAG, (Throwable) e);
            }
        }
    }

    public void setMainThreadListener(Listener<R> listener) {
        this.mMainThreadListener = listener;
    }
}
