package com.nexstreaming.kminternal.nexvideoeditor;

import android.graphics.Bitmap;
import android.util.Log;
import android.util.LruCache;

/* compiled from: NexCache */
public class b {
    private static b a;
    private LruCache b;

    private b(int i) {
        a(i);
    }

    public static b a() {
        if (a == null) {
            a = new b(((int) (Runtime.getRuntime().maxMemory() / 1024)) / 8);
        }
        return a;
    }

    private void a(int i) {
        this.b = new LruCache<Object, Bitmap>(i) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public int sizeOf(Object obj, Bitmap bitmap) {
                StringBuilder sb = new StringBuilder();
                sb.append("returns the size of the entry: <key, value>:");
                sb.append(obj);
                sb.append(",");
                sb.append(bitmap.getByteCount() / 1024);
                Log.d("NexCache", sb.toString());
                return bitmap.getByteCount() / 1024;
            }

            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void entryRemoved(boolean z, Object obj, Bitmap bitmap, Bitmap bitmap2) {
                if (z) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("the entry is being removed to make space / key:");
                    sb.append(obj);
                    Log.d("NexCache", sb.toString());
                } else {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("the removal was caused by a put(K, V) or remove(K) / key:");
                    sb2.append(obj);
                    Log.d("NexCache", sb2.toString());
                }
                if (bitmap != null) {
                    bitmap.recycle();
                }
            }
        };
        StringBuilder sb = new StringBuilder();
        sb.append("cache create (size, isUsedToEntryCnt)=");
        sb.append(i);
        Log.d("NexCache", sb.toString());
    }

    public Bitmap a(Object obj) throws NullPointerException {
        return (Bitmap) this.b.get(obj);
    }

    public void a(Object obj, Bitmap bitmap) throws NullPointerException {
        if (a(obj) == null) {
            this.b.put(obj, bitmap);
        }
    }

    public void b() {
        Log.d("NexCache", "releaseCache()");
        this.b.evictAll();
    }

    public void b(Object obj) {
        StringBuilder sb = new StringBuilder();
        sb.append("remove id:");
        sb.append(obj.toString());
        Log.d("NexCache", sb.toString());
        if (this.b.remove(obj) == null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(obj.toString());
            sb2.append(" isn't in the cache.");
            Log.d("NexCache", sb2.toString());
            return;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append(obj.toString());
        sb3.append(" removes in the cache.");
        Log.d("NexCache", sb3.toString());
    }
}
