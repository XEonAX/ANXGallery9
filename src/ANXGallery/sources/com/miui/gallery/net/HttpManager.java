package com.miui.gallery.net;

import com.android.volley.ExecutorDelivery;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.StorageUtils;

public class HttpManager {
    private static HttpManager instance;
    private GalleryCache mRequestCache;
    private RequestQueue mRequestQueue = initRequestQueue();

    private HttpManager() {
    }

    public static synchronized HttpManager getInstance() {
        HttpManager httpManager;
        synchronized (HttpManager.class) {
            if (instance == null) {
                instance = new HttpManager();
            }
            httpManager = instance;
        }
        return httpManager;
    }

    private RequestQueue initRequestQueue() {
        this.mRequestCache = new GalleryCache(StorageUtils.getNetworkCacheDirectory(), 5242880);
        RequestQueue requestQueue = new RequestQueue(this.mRequestCache, new GalleryNetwork(), 2, new ExecutorDelivery(ThreadManager.getRequestThreadHandler()));
        requestQueue.start();
        return requestQueue;
    }

    public <T> void addToRequestQueue(Request<T> request) {
        this.mRequestQueue.add(request);
    }

    public void cancelAll(String str) {
        this.mRequestQueue.cancelAll((Object) str);
    }

    public void putToCache(String str, byte[] bArr, long j, long j2) {
        this.mRequestCache.put(str, bArr, j, j2);
    }
}
