package com.miui.gallery.net;

import com.android.volley.Cache.Entry;
import com.android.volley.toolbox.DiskBasedCache;
import com.miui.gallery.util.Log;
import java.io.File;
import java.util.HashMap;

class GalleryCache extends DiskBasedCache {
    public GalleryCache(File file, int i) {
        super(file, i);
        Log.d("GalleryCache", "Network cache path: %s", (Object) file.getAbsolutePath());
    }

    public synchronized Entry get(String str) {
        Entry entry;
        entry = super.get(str);
        if (entry != null) {
            HashMap hashMap = new HashMap();
            hashMap.put("From-Cache", String.valueOf(true));
            entry.responseHeaders = hashMap;
            Log.d("GalleryCache", "get cache: key %s, isExpired: %s", Integer.valueOf(str.hashCode()), Boolean.valueOf(entry.isExpired()));
            if (!entry.isExpired()) {
                Log.d("GalleryCache", "cache hit.");
            }
        }
        return entry;
    }

    @Deprecated
    public synchronized void put(String str, Entry entry) {
    }

    public synchronized void put(String str, byte[] bArr, long j, long j2) {
        Entry entry = new Entry();
        entry.data = bArr;
        entry.ttl = System.currentTimeMillis() + j;
        entry.softTtl = j2;
        super.put(str, entry);
        String str2 = "GalleryCache";
        String str3 = "put cache. key %s size %s expires %s softTtl:%s";
        Object[] objArr = new Object[4];
        int i = 0;
        objArr[0] = Integer.valueOf(str.hashCode());
        if (bArr != null) {
            i = bArr.length;
        }
        objArr[1] = Integer.valueOf(i);
        objArr[2] = Long.valueOf(j);
        objArr[3] = Long.valueOf(j2);
        Log.d(str2, String.format(str3, objArr));
    }
}
