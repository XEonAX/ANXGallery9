package com.xiaomi.channel.commonutils.misc;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.xiaomi.channel.commonutils.logger.MyLog;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

public class SerializedAsyncTaskProcessor {
    /* access modifiers changed from: private */
    public volatile SerializedAsyncTask mCurrentTask;
    private final boolean mIsDaemon;
    /* access modifiers changed from: private */
    public int mKeepAliveTime;
    /* access modifiers changed from: private */
    public Handler mMainThreadHandler;
    private ProcessPackageThread mProcessThread;
    /* access modifiers changed from: private */
    public volatile boolean threadQuit;

    private class ProcessPackageThread extends Thread {
        private final LinkedBlockingQueue<SerializedAsyncTask> mTasks = new LinkedBlockingQueue<>();

        public ProcessPackageThread() {
            super("PackageProcessor");
        }

        private void notifyUI(int i, SerializedAsyncTask serializedAsyncTask) {
            SerializedAsyncTaskProcessor.this.mMainThreadHandler.sendMessage(SerializedAsyncTaskProcessor.this.mMainThreadHandler.obtainMessage(i, serializedAsyncTask));
        }

        public void insertTask(SerializedAsyncTask serializedAsyncTask) {
            try {
                this.mTasks.add(serializedAsyncTask);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public void run() {
            long access$200 = SerializedAsyncTaskProcessor.this.mKeepAliveTime > 0 ? (long) SerializedAsyncTaskProcessor.this.mKeepAliveTime : Long.MAX_VALUE;
            while (!SerializedAsyncTaskProcessor.this.threadQuit) {
                try {
                    SerializedAsyncTask serializedAsyncTask = (SerializedAsyncTask) this.mTasks.poll(access$200, TimeUnit.SECONDS);
                    SerializedAsyncTaskProcessor.this.mCurrentTask = serializedAsyncTask;
                    if (serializedAsyncTask != null) {
                        notifyUI(0, serializedAsyncTask);
                        serializedAsyncTask.process();
                        notifyUI(1, serializedAsyncTask);
                    } else if (SerializedAsyncTaskProcessor.this.mKeepAliveTime > 0) {
                        SerializedAsyncTaskProcessor.this.stopTaskProcessor();
                    }
                } catch (InterruptedException e) {
                    MyLog.e((Throwable) e);
                }
            }
        }
    }

    public static abstract class SerializedAsyncTask {
        public void postProcess() {
        }

        public void preProcess() {
        }

        public abstract void process();
    }

    public SerializedAsyncTaskProcessor() {
        this(false);
    }

    public SerializedAsyncTaskProcessor(boolean z) {
        this(z, 0);
    }

    public SerializedAsyncTaskProcessor(boolean z, int i) {
        this.mMainThreadHandler = null;
        this.threadQuit = false;
        this.mKeepAliveTime = 0;
        this.mMainThreadHandler = new Handler(Looper.getMainLooper()) {
            public void handleMessage(Message message) {
                SerializedAsyncTask serializedAsyncTask = (SerializedAsyncTask) message.obj;
                if (message.what == 0) {
                    serializedAsyncTask.preProcess();
                } else if (message.what == 1) {
                    serializedAsyncTask.postProcess();
                }
                super.handleMessage(message);
            }
        };
        this.mIsDaemon = z;
        this.mKeepAliveTime = i;
    }

    /* access modifiers changed from: private */
    public synchronized void stopTaskProcessor() {
        this.mProcessThread = null;
        this.threadQuit = true;
    }

    public synchronized void addNewTask(SerializedAsyncTask serializedAsyncTask) {
        if (this.mProcessThread == null) {
            this.mProcessThread = new ProcessPackageThread();
            this.mProcessThread.setDaemon(this.mIsDaemon);
            this.threadQuit = false;
            this.mProcessThread.start();
        }
        this.mProcessThread.insertTask(serializedAsyncTask);
    }

    public void addNewTaskWithDelayed(final SerializedAsyncTask serializedAsyncTask, long j) {
        this.mMainThreadHandler.postDelayed(new Runnable() {
            public void run() {
                SerializedAsyncTaskProcessor.this.addNewTask(serializedAsyncTask);
            }
        }, j);
    }
}
