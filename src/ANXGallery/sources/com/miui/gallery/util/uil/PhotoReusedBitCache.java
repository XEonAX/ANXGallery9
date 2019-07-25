package com.miui.gallery.util.uil;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import com.miui.gallery.BaseConfig.ScreenConfig;
import com.miui.gallery.Config.BigPhotoConfig;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ReusedBitmapCache;

public class PhotoReusedBitCache extends ReusedBitmapCache {
    private static PhotoReusedBitCache sInstance;

    private PhotoReusedBitCache() {
    }

    public static synchronized PhotoReusedBitCache getInstance() {
        PhotoReusedBitCache photoReusedBitCache;
        synchronized (PhotoReusedBitCache.class) {
            if (sInstance == null) {
                sInstance = new PhotoReusedBitCache();
            }
            photoReusedBitCache = sInstance;
        }
        return photoReusedBitCache;
    }

    /* access modifiers changed from: protected */
    public Config getConfig() {
        return BigPhotoConfig.getBitmapConfig();
    }

    /* access modifiers changed from: protected */
    public int getMaxCount() {
        return 3;
    }

    public synchronized void initFirstCacheBitmap() {
        if (isInBitmapSupport()) {
            ThreadManager.getMiscPool().submit(new Job<Void>() {
                public Void run(JobContext jobContext) {
                    Log.i("PhotoReusedBitCache", "init first cache bitmap");
                    PhotoReusedBitCache.this.clear();
                    try {
                        int screenWidth = (int) (((float) ScreenConfig.getScreenWidth()) * 1.5f);
                        PhotoReusedBitCache.this.put(Bitmap.createBitmap(screenWidth, (screenWidth * 4) / 3, PhotoReusedBitCache.this.getConfig()));
                    } catch (OutOfMemoryError unused) {
                        Log.e("PhotoReusedBitCache", "create first cache bitmap oom");
                    }
                    return null;
                }
            });
        }
    }
}
