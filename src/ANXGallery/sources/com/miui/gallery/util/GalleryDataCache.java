package com.miui.gallery.util;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class GalleryDataCache {
    private Map<String, Object> mCacheMap;

    private static class SingletonHolder {
        static final GalleryDataCache INSTANCE = new GalleryDataCache();
    }

    private GalleryDataCache() {
        this.mCacheMap = Collections.synchronizedMap(new HashMap());
    }

    public static GalleryDataCache getInstance() {
        return SingletonHolder.INSTANCE;
    }

    public void put(String str, Object obj) {
        this.mCacheMap.put(str, obj);
    }

    public <V> V remove(String str) {
        V remove = this.mCacheMap.remove(str);
        if (remove != null) {
            return remove;
        }
        return null;
    }
}
