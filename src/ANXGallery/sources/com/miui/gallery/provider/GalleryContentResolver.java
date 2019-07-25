package com.miui.gallery.provider;

import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.util.SparseArray;
import com.miui.gallery.util.Log;

public abstract class GalleryContentResolver implements Callback {
    private SparseArray<Integer> mDelayNums;
    private Handler mHandler;

    private class NotifyParams {
        public ContentObserver observer;
        public long syncReason;
        public Uri uri;

        private NotifyParams() {
        }
    }

    public GalleryContentResolver() {
        if (Looper.myLooper() != null) {
            this.mHandler = new Handler(Looper.myLooper(), this);
        } else {
            this.mHandler = new Handler(Looper.getMainLooper(), this);
        }
        this.mDelayNums = new SparseArray<>();
    }

    public boolean handleMessage(Message message) {
        NotifyParams notifyParams = (NotifyParams) message.obj;
        notifyChange(notifyParams.uri, notifyParams.observer, notifyParams.syncReason);
        this.mDelayNums.put(message.what, Integer.valueOf(0));
        Log.i("GalleryContentResolver", "delay notify %s %s", Thread.currentThread(), notifyParams.uri);
        return false;
    }

    /* access modifiers changed from: protected */
    public abstract Object matchUri(Uri uri);

    public final void notifyChange(Uri uri, ContentObserver contentObserver, long j) {
        notifyInternal(uri, contentObserver, j);
    }

    public final void notifyChangeDelay(Uri uri, ContentObserver contentObserver, long j) {
        int hashCode = matchUri(uri).hashCode();
        this.mHandler.removeMessages(hashCode);
        NotifyParams notifyParams = new NotifyParams();
        notifyParams.uri = uri;
        notifyParams.observer = contentObserver;
        notifyParams.syncReason = j;
        Message obtainMessage = this.mHandler.obtainMessage(hashCode, notifyParams);
        int intValue = ((Integer) this.mDelayNums.get(hashCode, Integer.valueOf(0))).intValue() + 1;
        if (intValue > 100) {
            this.mHandler.sendMessage(obtainMessage);
            intValue = 0;
        } else {
            this.mHandler.sendMessageDelayed(obtainMessage, 1000);
        }
        this.mDelayNums.put(hashCode, Integer.valueOf(intValue));
    }

    /* access modifiers changed from: protected */
    public abstract void notifyInternal(Uri uri, ContentObserver contentObserver, long j);
}
