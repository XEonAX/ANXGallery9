package com.miui.gallery.loader;

import android.content.AsyncTaskLoader;
import android.content.Context;
import android.content.Loader.ForceLoadContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.CancellationSignal;
import android.os.OperationCanceledException;
import com.miui.gallery.util.MiscUtil;
import java.io.Closeable;

public class AsyncContentLoader<T extends Closeable> extends AsyncTaskLoader<T> {
    private CancellationSignal mCancellationSignal;
    private CursorConvertCallback<T> mCursorConvertCallback;
    private T mData;
    private boolean mIsObserversRegistered;
    private final ForceLoadContentObserver mObserver = new ForceLoadContentObserver<>(this);
    private String[] mProjection;
    private String mSelection;
    private String[] mSelectionArgs;
    private String mSortOrder;
    private Uri mUri;

    public AsyncContentLoader(Context context, CursorConvertCallback<T> cursorConvertCallback) {
        super(context);
        this.mCursorConvertCallback = cursorConvertCallback;
    }

    private void registerContentObservers() {
        if (!this.mIsObserversRegistered) {
            this.mIsObserversRegistered = true;
            getContext().getContentResolver().registerContentObserver(this.mUri, true, this.mObserver);
        }
    }

    private void unregisterContentObservers() {
        if (this.mIsObserversRegistered) {
            this.mIsObserversRegistered = false;
            getContext().getContentResolver().unregisterContentObserver(this.mObserver);
        }
    }

    public void cancelLoadInBackground() {
        super.cancelLoadInBackground();
        synchronized (this) {
            if (this.mCancellationSignal != null) {
                this.mCancellationSignal.cancel();
            }
        }
    }

    public void deliverResult(T t) {
        if (isReset()) {
            if (t != null) {
                MiscUtil.closeSilently(t);
            }
            return;
        }
        T t2 = this.mData;
        this.mData = t;
        if (isStarted()) {
            super.deliverResult(t);
        }
        if (!(t2 == null || t2 == t)) {
            MiscUtil.closeSilently(t2);
        }
    }

    public final T loadInBackground() {
        Cursor cursor;
        T t;
        synchronized (this) {
            if (!isLoadInBackgroundCanceled()) {
                this.mCancellationSignal = new CancellationSignal();
            } else {
                throw new OperationCanceledException();
            }
        }
        try {
            cursor = getContext().getContentResolver().query(this.mUri, this.mProjection, this.mSelection, this.mSelectionArgs, this.mSortOrder, this.mCancellationSignal);
            if (cursor != null) {
                try {
                    t = (Closeable) this.mCursorConvertCallback.convert(cursor);
                } catch (Throwable th) {
                    th = th;
                }
            } else {
                t = null;
            }
            MiscUtil.closeSilently(cursor);
            synchronized (this) {
                this.mCancellationSignal = null;
            }
            return t;
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
            MiscUtil.closeSilently(cursor);
            synchronized (this) {
                this.mCancellationSignal = null;
            }
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public void onAbandon() {
        super.onAbandon();
        unregisterContentObservers();
    }

    public void onCanceled(T t) {
        if (t != null) {
            MiscUtil.closeSilently(t);
        }
    }

    /* access modifiers changed from: protected */
    public void onReset() {
        super.onReset();
        onStopLoading();
        unregisterContentObservers();
        if (this.mData != null) {
            MiscUtil.closeSilently(this.mData);
        }
        this.mData = null;
    }

    /* access modifiers changed from: protected */
    public void onStartLoading() {
        if (this.mData != null) {
            deliverResult(this.mData);
        }
        if (takeContentChanged() || this.mData == null) {
            forceLoad();
        }
        registerContentObservers();
    }

    /* access modifiers changed from: protected */
    public void onStopLoading() {
        cancelLoad();
    }

    public void setProjection(String[] strArr) {
        this.mProjection = strArr;
    }

    public void setSelection(String str) {
        this.mSelection = str;
    }

    public void setSortOrder(String str) {
        this.mSortOrder = str;
    }

    public void setUri(Uri uri) {
        this.mUri = uri;
    }
}
