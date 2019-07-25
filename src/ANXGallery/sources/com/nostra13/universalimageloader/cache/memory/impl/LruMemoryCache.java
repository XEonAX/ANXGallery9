package com.nostra13.universalimageloader.cache.memory.impl;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.cache.memory.MemoryCache;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map.Entry;

public class LruMemoryCache implements MemoryCache {
    private final LinkedHashMap<String, Bitmap> map;
    private final int maxSize;
    private int size;

    public LruMemoryCache(int i) {
        if (i > 0) {
            this.maxSize = i;
            this.map = new LinkedHashMap<>(0, 0.75f, true);
            return;
        }
        throw new IllegalArgumentException("maxSize <= 0");
    }

    private int sizeOf(String str, Bitmap bitmap) {
        return bitmap.getRowBytes() * bitmap.getHeight();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:22:0x006e, code lost:
        throw new java.lang.IllegalStateException(r0.toString());
     */
    private void trimToSize(int i) {
        while (true) {
            synchronized (this) {
                if (this.size < 0 || (this.map.isEmpty() && this.size != 0)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(getClass().getName());
                    sb.append(".sizeOf() is reporting inconsistent results!");
                } else if (this.size <= i) {
                    break;
                } else if (this.map.isEmpty()) {
                    break;
                } else {
                    Entry entry = (Entry) this.map.entrySet().iterator().next();
                    if (entry != null) {
                        String str = (String) entry.getKey();
                        Bitmap bitmap = (Bitmap) entry.getValue();
                        this.map.remove(str);
                        this.size -= sizeOf(str, bitmap);
                    } else {
                        return;
                    }
                }
            }
        }
    }

    public void clear() {
        trimToSize(-1);
    }

    public final Bitmap get(String str) {
        Bitmap bitmap;
        if (str != null) {
            synchronized (this) {
                bitmap = (Bitmap) this.map.get(str);
            }
            return bitmap;
        }
        throw new NullPointerException("key == null");
    }

    public Collection<String> keys() {
        HashSet hashSet;
        synchronized (this) {
            hashSet = new HashSet(this.map.keySet());
        }
        return hashSet;
    }

    public final boolean put(String str, Bitmap bitmap) {
        if (str == null || bitmap == null) {
            throw new NullPointerException("key == null || value == null");
        }
        synchronized (this) {
            this.size += sizeOf(str, bitmap);
            Bitmap bitmap2 = (Bitmap) this.map.put(str, bitmap);
            if (bitmap2 != null) {
                this.size -= sizeOf(str, bitmap2);
            }
        }
        trimToSize(this.maxSize);
        return true;
    }

    public final Bitmap remove(String str) {
        Bitmap bitmap;
        if (str != null) {
            synchronized (this) {
                bitmap = (Bitmap) this.map.remove(str);
                if (bitmap != null) {
                    this.size -= sizeOf(str, bitmap);
                }
            }
            return bitmap;
        }
        throw new NullPointerException("key == null");
    }

    public final synchronized String toString() {
        return String.format("LruCache[maxSize=%d]", new Object[]{Integer.valueOf(this.maxSize)});
    }
}
