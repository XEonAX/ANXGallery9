package com.nostra13.universalimageloader.cache.memory.impl;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.cache.memory.LimitedMemoryCache;
import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

public class LRULimitedMemoryCache extends LimitedMemoryCache {
    private final Map<String, Bitmap> lruCache = Collections.synchronizedMap(new LinkedHashMap(10, 1.1f, true));

    public LRULimitedMemoryCache(int i) {
        super(i);
    }

    /* access modifiers changed from: protected */
    public Reference<Bitmap> createReference(Bitmap bitmap) {
        return new WeakReference(bitmap);
    }

    public Bitmap get(String str) {
        this.lruCache.get(str);
        return super.get(str);
    }

    /* access modifiers changed from: protected */
    public int getSize(Bitmap bitmap) {
        return bitmap.getRowBytes() * bitmap.getHeight();
    }

    public void onClear() {
        this.lruCache.clear();
        super.onClear();
    }

    public boolean put(String str, Bitmap bitmap) {
        if (!super.put(str, bitmap)) {
            return false;
        }
        this.lruCache.put(str, bitmap);
        return true;
    }

    public Bitmap remove(String str) {
        this.lruCache.remove(str);
        return super.remove(str);
    }

    /* access modifiers changed from: protected */
    public Bitmap removeNext() {
        Bitmap bitmap;
        synchronized (this.lruCache) {
            Iterator it = this.lruCache.entrySet().iterator();
            if (it.hasNext()) {
                bitmap = (Bitmap) ((Entry) it.next()).getValue();
                it.remove();
            } else {
                bitmap = null;
            }
        }
        return bitmap;
    }
}
