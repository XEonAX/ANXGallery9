package com.miui.gallery.share;

import android.content.Context;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import com.google.common.collect.Maps;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.share.AlbumShareUIManager.OnCompletionListener;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

public abstract class DBCache<K, V> {
    private final Map<K, V> mCache = Maps.newHashMap();
    private final ContentObserver mContentObserver = new ContentObserver(this.mHandler) {
        public void onChange(boolean z) {
            DBCache.this.mDirty = true;
            DBCache.this.reloadIfNeeded(false);
        }
    };
    /* access modifiers changed from: private */
    public boolean mDirty = true;
    private final Handler mHandler = new Handler(Looper.getMainLooper());
    private final List<OnDBCacheChangedListener<K, V>> mListeners = new CopyOnWriteArrayList();
    private final Runnable mReloadRunnable = new Runnable() {
        public void run() {
            AlbumShareUIManager.submit(new Job<AsyncResult<Map<K, V>>>() {
                public AsyncResult<Map<K, V>> run(JobContext jobContext) {
                    SystemClock.uptimeMillis();
                    return AsyncResult.create(0, DBCache.this.loadInBackground());
                }
            }, new OnCompletionListener<Void, Map<K, V>>() {
                public void onCompletion(Void voidR, Map<K, V> map, int i, boolean z) {
                    if (i == 0 && map != null) {
                        DBCache.this.onReloadSuccess(map);
                        DBCache.this.reloadIfNeeded(false);
                    }
                }
            });
        }
    };

    public interface OnDBCacheChangedListener<K, V> {
        void onDBCacheChanged(DBCache<K, V> dBCache);
    }

    private void notifyShareUserChanged() {
        for (OnDBCacheChangedListener onDBCacheChanged : this.mListeners) {
            onDBCacheChanged.onDBCacheChanged(this);
        }
    }

    /* access modifiers changed from: private */
    public void onReloadSuccess(Map<K, V> map) {
        this.mCache.clear();
        this.mCache.putAll(map);
        notifyShareUserChanged();
    }

    /* access modifiers changed from: private */
    public boolean reloadIfNeeded(boolean z) {
        if (this.mListeners.isEmpty() || !this.mDirty) {
            return false;
        }
        this.mDirty = false;
        this.mHandler.removeCallbacks(this.mReloadRunnable);
        if (z) {
            this.mHandler.post(this.mReloadRunnable);
        } else {
            this.mHandler.postDelayed(this.mReloadRunnable, 1000);
        }
        return true;
    }

    public void addListener(OnDBCacheChangedListener<K, V> onDBCacheChangedListener) {
        if (onDBCacheChangedListener != null) {
            this.mListeners.add(onDBCacheChangedListener);
            if (this.mListeners.size() == 1) {
                Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
                this.mDirty = true;
                sGetAndroidContext.getContentResolver().registerContentObserver(getUri(), true, this.mContentObserver);
                reloadIfNeeded(true);
            }
        }
    }

    public Map<K, V> getCache() {
        return Collections.unmodifiableMap(this.mCache);
    }

    public abstract Uri getUri();

    public V getValue(K k) {
        return this.mCache.get(k);
    }

    /* access modifiers changed from: protected */
    public Map<K, V> loadInBackground() {
        HashMap newHashMap = Maps.newHashMap();
        Cursor queryInBackground = queryInBackground();
        if (queryInBackground != null) {
            while (queryInBackground.moveToNext()) {
                try {
                    Object newKey = newKey(queryInBackground);
                    if (newKey != null) {
                        newHashMap.put(newKey, newValue(queryInBackground));
                    }
                } finally {
                    queryInBackground.close();
                }
            }
        }
        return newHashMap;
    }

    /* access modifiers changed from: protected */
    public abstract K newKey(Cursor cursor);

    /* access modifiers changed from: protected */
    public abstract V newValue(Cursor cursor);

    /* access modifiers changed from: protected */
    public Cursor queryInBackground() {
        return GalleryApp.sGetAndroidContext().getContentResolver().query(getUri(), CloudUtils.getProjectionAll(), null, null, null);
    }

    public void removeListener(OnDBCacheChangedListener<K, V> onDBCacheChangedListener) {
        if (onDBCacheChangedListener != null) {
            this.mListeners.remove(onDBCacheChangedListener);
            if (this.mListeners.isEmpty()) {
                GalleryApp.sGetAndroidContext().getContentResolver().unregisterContentObserver(this.mContentObserver);
            }
        }
    }
}
