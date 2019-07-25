package com.miui.gallery.search.core.source.local;

import android.database.ContentObserver;
import android.os.Handler;
import com.android.internal.CompatHandler;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.threadpool.ThreadManager;
import java.lang.ref.WeakReference;

public class ContentCache<T> {
    private final int mCacheHoldTime;
    private Runnable mCacheRecycleRunnable;
    /* access modifiers changed from: private */
    public WeakReference<T> mCacheRef;
    /* access modifiers changed from: private */
    public ContentObserver mContentObserver;
    /* access modifiers changed from: private */
    public final ContentCacheProvider<T> mContentProvider;
    private final Object mLock;

    private class MyContentObserver extends ContentObserver {
        public MyContentObserver(Handler handler) {
            super(handler);
        }

        public void onChange(boolean z) {
            if (ContentCache.this.mContentObserver != null) {
                Object loadContent = ContentCache.this.mContentProvider.loadContent();
                if (loadContent != null && ContentCache.this.mContentObserver != null) {
                    if (ContentCache.this.mCacheRef != null) {
                        ContentCache.this.mCacheRef.clear();
                    }
                    ContentCache.this.mCacheRef = new WeakReference(loadContent);
                }
            }
        }
    }

    public ContentCache(ContentCacheProvider<T> contentCacheProvider) {
        this(contentCacheProvider, 300000);
    }

    public ContentCache(ContentCacheProvider<T> contentCacheProvider, int i) {
        this.mLock = new Object();
        this.mCacheRef = null;
        this.mContentObserver = null;
        this.mCacheRecycleRunnable = new Runnable() {
            public void run() {
                ContentCache.this.releaseCache();
            }
        };
        if (contentCacheProvider != null) {
            this.mContentProvider = contentCacheProvider;
            this.mCacheHoldTime = i;
            return;
        }
        throw new IllegalArgumentException("Cannot accept null content cache provider");
    }

    private void hangOn() {
        CompatHandler workHandler = ThreadManager.getWorkHandler();
        workHandler.removeCallbacks(this.mCacheRecycleRunnable);
        workHandler.postDelayed(this.mCacheRecycleRunnable, (long) this.mCacheHoldTime);
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        super.finalize();
        releaseCache();
    }

    public T getCache() {
        T t;
        Throwable e;
        T t2 = this.mCacheRef == null ? null : this.mCacheRef.get();
        if (t2 == null) {
            try {
                t = this.mContentProvider.loadContent();
                if (t != null) {
                    try {
                        this.mCacheRef = new WeakReference<>(t);
                        synchronized (this.mLock) {
                            if (this.mContentObserver == null) {
                                this.mContentObserver = new MyContentObserver(ThreadManager.getWorkHandler());
                                this.mContentProvider.registerContentObserver(this.mContentProvider.getContentUri(), true, this.mContentObserver);
                            }
                        }
                    } catch (Exception e2) {
                        e = e2;
                    }
                }
            } catch (Exception e3) {
                Throwable th = e3;
                t = t2;
                e = th;
                try {
                    SearchLog.e("ContentCache", e);
                    hangOn();
                    return t;
                } catch (Throwable th2) {
                    hangOn();
                    throw th2;
                }
            }
        } else {
            t = t2;
        }
        hangOn();
        return t;
    }

    public void releaseCache() {
        CompatHandler workHandler = ThreadManager.getWorkHandler();
        synchronized (this.mLock) {
            if (this.mContentObserver != null) {
                this.mContentProvider.unregisterContentObserver(this.mContentObserver);
                this.mContentObserver = null;
            }
        }
        if (this.mCacheRef != null) {
            this.mCacheRef.clear();
            this.mCacheRef = null;
        }
        workHandler.removeCallbacks(this.mCacheRecycleRunnable);
    }
}
