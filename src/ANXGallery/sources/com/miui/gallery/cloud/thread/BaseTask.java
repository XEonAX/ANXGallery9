package com.miui.gallery.cloud.thread;

import android.accounts.Account;
import android.content.Context;
import android.os.SystemClock;
import com.google.common.collect.Lists;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.cloud.AccountCache.AccountInfo;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.cloud.SyncConditionManager;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.cloud.thread.RequestCommandQueue.OnItemChangedListener;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

public abstract class BaseTask<T> implements Runnable {
    protected final String TAG;
    private volatile boolean isRunning = false;
    private final RequestCommandQueue mCommandQueue;
    private AtomicBoolean mHasInterruptted = new AtomicBoolean(false);

    public BaseTask(int i, int i2, int i3, int i4, OnItemChangedListener onItemChangedListener) {
        this.TAG = String.format(Locale.US, "%s#%s", new Object[]{getClass().getSimpleName(), Integer.valueOf(i)});
        RequestCommandQueue requestCommandQueue = new RequestCommandQueue(i2, i3, i4, onItemChangedListener, this.TAG);
        this.mCommandQueue = requestCommandQueue;
    }

    public void cancelAll(int i, boolean z) {
        this.mCommandQueue.cancelAll(i, z);
    }

    public int getPendingSize() {
        return this.mCommandQueue.getPengdingSize();
    }

    /* access modifiers changed from: protected */
    public abstract GallerySyncResult<T> handle(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, List<RequestCloudItem> list) throws Exception;

    public boolean hasDelayedItem() {
        return this.mCommandQueue.hasDelayedItem();
    }

    public int[] invoke(List<RequestCloudItem> list, boolean z, boolean z2) {
        int i;
        int i2;
        Account account = AccountCache.getAccount();
        if (account == null) {
            Log.e(this.TAG, "invoke: no account");
            return new int[]{0, 0};
        }
        if (!list.isEmpty()) {
            ArrayList newArrayList = Lists.newArrayList();
            for (RequestCloudItem requestCommand : list) {
                newArrayList.add(new RequestCommand(account, requestCommand));
            }
            i2 = this.mCommandQueue.put(newArrayList, z2);
            if (z) {
                List interruptIfNotExecuting = this.mCommandQueue.interruptIfNotExecuting(newArrayList);
                i = interruptIfNotExecuting != null ? interruptIfNotExecuting.size() : 0;
                this.mHasInterruptted.compareAndSet(false, i > 0);
                return new int[]{i2, i};
            }
        } else {
            i2 = 0;
        }
        i = 0;
        return new int[]{i2, i};
    }

    /* access modifiers changed from: protected */
    public boolean needContinue(GallerySyncResult<T> gallerySyncResult) {
        boolean z = false;
        if (Thread.currentThread().isInterrupted()) {
            return false;
        }
        if (gallerySyncResult.code == GallerySyncCode.CONDITION_INTERRUPTED || gallerySyncResult.code == GallerySyncCode.NOT_CONTINUE_ERROR || gallerySyncResult.code == GallerySyncCode.CANCEL) {
            this.mCommandQueue.cancelAll(true);
            return false;
        } else if (this.mCommandQueue.getPengdingSize() > 0) {
            return true;
        } else {
            if (!this.mHasInterruptted.compareAndSet(true, false)) {
                return false;
            }
            if (resumeInterruptted() > 0) {
                z = true;
            }
            return z;
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Exception block dominator not found, dom blocks: [] */
    /* JADX WARNING: Missing exception handler attribute for start block: B:11:0x004b */
    public GallerySyncResult<T> onPerformSync() throws Throwable {
        ArrayList<RequestCommand> newArrayList = Lists.newArrayList();
        ArrayList<RequestCloudItem> newArrayList2 = Lists.newArrayList();
        Builder builder = new Builder();
        try {
            long pollToExecute = this.mCommandQueue.pollToExecute(newArrayList);
            if (newArrayList.isEmpty()) {
                if (pollToExecute > 0) {
                    synchronized (Thread.currentThread()) {
                        String str = this.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("wait for ");
                        sb.append(pollToExecute);
                        Log.i(str, sb.toString());
                        Thread.currentThread().wait(pollToExecute);
                        Log.i(this.TAG, "wait time out or notified");
                        Log.i(this.TAG, "resume from waiting by interuptted");
                    }
                }
                GallerySyncResult<T> build = builder.setCode(GallerySyncCode.OK).build();
                for (RequestCloudItem key : newArrayList2) {
                    this.mCommandQueue.removeFromExecuting(RequestCommand.getKey(key));
                }
                for (RequestCommand requestCommand : newArrayList) {
                    Log.d(this.TAG, "execute: %s, invoke~finish cost=%s", requestCommand.getKey(), Long.valueOf(SystemClock.uptimeMillis() - requestCommand.mInvokeTime));
                }
                return build;
            }
            for (RequestCommand requestCommand2 : newArrayList) {
                newArrayList2.add(requestCommand2.mRequestItem);
            }
            RequestCommand requestCommand3 = (RequestCommand) newArrayList.get(0);
            if (SyncConditionManager.checkForItem(requestCommand3.mRequestItem) == 2) {
                GallerySyncResult<T> build2 = builder.setCode(GallerySyncCode.CONDITION_INTERRUPTED).build();
                for (RequestCloudItem key2 : newArrayList2) {
                    this.mCommandQueue.removeFromExecuting(RequestCommand.getKey(key2));
                }
                for (RequestCommand requestCommand4 : newArrayList) {
                    Log.d(this.TAG, "execute: %s, invoke~finish cost=%s", requestCommand4.getKey(), Long.valueOf(SystemClock.uptimeMillis() - requestCommand4.mInvokeTime));
                }
                return build2;
            }
            Account account = requestCommand3.mAccount;
            AccountInfo accountInfo = AccountCache.getAccountInfo();
            if (accountInfo == null || !accountInfo.mAccount.equals(account)) {
                if (accountInfo != null) {
                    String str2 = this.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("execute: account is changed. old=");
                    sb2.append(account);
                    sb2.append(", current=");
                    sb2.append(accountInfo.mAccount);
                    Log.e(str2, sb2.toString());
                } else {
                    Log.e(this.TAG, "execute: account is null");
                }
                for (RequestCloudItem key3 : newArrayList2) {
                    this.mCommandQueue.removeFromExecuting(RequestCommand.getKey(key3));
                }
                for (RequestCommand requestCommand5 : newArrayList) {
                    Log.d(this.TAG, "execute: %s, invoke~finish cost=%s", requestCommand5.getKey(), Long.valueOf(SystemClock.uptimeMillis() - requestCommand5.mInvokeTime));
                }
                return builder.setCode(GallerySyncCode.UNKNOWN).build();
            }
            GallerySyncResult<T> handle = handle(GalleryApp.sGetAndroidContext(), accountInfo.mAccount, accountInfo.mToken, newArrayList2);
            for (RequestCloudItem key4 : newArrayList2) {
                this.mCommandQueue.removeFromExecuting(RequestCommand.getKey(key4));
            }
            for (RequestCommand requestCommand6 : newArrayList) {
                Log.d(this.TAG, "execute: %s, invoke~finish cost=%s", requestCommand6.getKey(), Long.valueOf(SystemClock.uptimeMillis() - requestCommand6.mInvokeTime));
            }
            return handle;
        } catch (InterruptedException e) {
            try {
                Log.d(this.TAG, "interruptted", (Object) e);
                GallerySyncResult<T> build3 = builder.setCode(GallerySyncCode.CANCEL).setException(e).build();
                for (RequestCommand requestCommand7 : newArrayList) {
                    Log.d(this.TAG, "execute: %s, invoke~finish cost=%s", requestCommand7.getKey(), Long.valueOf(SystemClock.uptimeMillis() - requestCommand7.mInvokeTime));
                }
                return build3;
            } finally {
                for (RequestCloudItem requestCloudItem : newArrayList2) {
                    this.mCommandQueue.removeFromExecuting(RequestCommand.getKey(requestCloudItem));
                }
                for (RequestCommand requestCommand8 : newArrayList) {
                    Log.d(this.TAG, "execute: %s, invoke~finish cost=%s", requestCommand8.getKey(), Long.valueOf(SystemClock.uptimeMillis() - requestCommand8.mInvokeTime));
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public abstract void onPostExecute();

    /* access modifiers changed from: protected */
    public abstract void onPreExecute();

    /* access modifiers changed from: protected */
    public int resumeInterruptted() {
        return 0;
    }

    public void run() {
        GallerySyncResult gallerySyncResult;
        Log.i(this.TAG, "thread start %s", (Object) Integer.valueOf(System.identityHashCode(Thread.currentThread())));
        this.isRunning = true;
        onPreExecute();
        do {
            try {
                if (Thread.currentThread().isInterrupted()) {
                    break;
                }
                gallerySyncResult = null;
                gallerySyncResult = onPerformSync();
                if (gallerySyncResult == null) {
                    break;
                }
            } catch (Throwable th) {
                onPostExecute();
                Log.i(this.TAG, "thread end %s", (Object) Integer.valueOf(System.identityHashCode(Thread.currentThread())));
                this.isRunning = false;
                throw th;
            }
        } while (needContinue(gallerySyncResult));
        onPostExecute();
        Log.i(this.TAG, "thread end %s", (Object) Integer.valueOf(System.identityHashCode(Thread.currentThread())));
        this.isRunning = false;
    }
}
