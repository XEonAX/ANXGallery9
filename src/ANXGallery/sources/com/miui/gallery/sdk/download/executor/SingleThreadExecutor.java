package com.miui.gallery.sdk.download.executor;

import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.cloud.AccountCache.AccountInfo;
import com.miui.gallery.sdk.download.assist.DownloadItem;
import com.miui.gallery.sdk.download.downloader.IDownloader;
import com.miui.gallery.util.Log;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class SingleThreadExecutor extends AbsDownloadExecutor {
    private boolean mPendingDispatch = false;
    private Object mWorkLock = new Object();
    private Thread mWorker;

    private class Job implements Runnable {
        private Job() {
        }

        private boolean needContinue() {
            boolean z = false;
            if (Thread.currentThread().isInterrupted()) {
                return false;
            }
            if (SingleThreadExecutor.this.mQueue.getPendingSize() > 0) {
                z = true;
            }
            return z;
        }

        private void runInner() {
            while (needContinue()) {
                List pollToExecute = SingleThreadExecutor.this.mQueue.pollToExecute();
                if (pollToExecute.size() > 0) {
                    Map classifyCommand = AbsDownloadExecutor.classifyCommand(pollToExecute);
                    if (classifyCommand != null) {
                        LinkedList linkedList = new LinkedList();
                        for (Entry entry : classifyCommand.entrySet()) {
                            List<DownloadCommand> list = (List) entry.getValue();
                            linkedList.clear();
                            for (DownloadCommand downloadCommand : list) {
                                if (DownloadCommand.checkValid(downloadCommand)) {
                                    linkedList.add(downloadCommand.getItem());
                                }
                            }
                            AccountInfo accountInfo = AccountCache.getAccountInfo();
                            if (accountInfo != null) {
                                Log.i("SingleThreadExecutor", "%s execute size %d", this, Integer.valueOf(linkedList.size()));
                                try {
                                    ((IDownloader) entry.getKey()).download(accountInfo.mAccount, accountInfo.mToken, linkedList);
                                } finally {
                                    for (DownloadCommand key : list) {
                                        SingleThreadExecutor.this.mQueue.removeFromExecuting(key.getKey());
                                    }
                                }
                            } else {
                                Log.e("SingleThreadExecutor", "execute: account is null");
                            }
                        }
                    }
                }
            }
        }

        public void run() {
            try {
                runInner();
            } finally {
                SingleThreadExecutor.this.onTaskEnd();
            }
        }
    }

    public SingleThreadExecutor(int i, int i2) {
        super(i, i2);
    }

    private void ensureWork() {
        synchronized (this.mWorkLock) {
            if (this.mWorker == null) {
                this.mWorker = new Thread(new Job(), getTag());
                this.mWorker.setPriority(4);
                this.mWorker.start();
            } else if (this.mWorker.isInterrupted() || !this.mWorker.isAlive()) {
                this.mPendingDispatch = true;
            }
        }
    }

    /* access modifiers changed from: private */
    public void onTaskEnd() {
        synchronized (this.mWorkLock) {
            if (this.mWorker != null) {
                this.mWorker = null;
            }
            if (this.mPendingDispatch && this.mQueue.getPendingSize() > 0) {
                Log.d("SingleThreadExecutor", "onTaskEnd need dispatch");
                this.mPendingDispatch = false;
                dispatch();
            }
        }
    }

    public boolean cancel(DownloadItem downloadItem) {
        int cancel = this.mQueue.cancel(downloadItem.getKey());
        if (cancel == 1) {
            interrupt();
        }
        return cancel != -1;
    }

    /* access modifiers changed from: protected */
    public void dispatch() {
        ensureWork();
    }

    /* access modifiers changed from: protected */
    public String getTag() {
        return "SingleThreadExecutor";
    }

    public void interrupt() {
        synchronized (this.mWorkLock) {
            if (this.mWorker != null) {
                this.mWorker.interrupt();
            }
        }
        this.mQueue.interrupt();
    }
}
