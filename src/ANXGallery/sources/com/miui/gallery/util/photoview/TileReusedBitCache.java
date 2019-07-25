package com.miui.gallery.util.photoview;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import com.miui.gallery.Config.TileConfig;
import com.miui.gallery.util.ReusedBitmapCache;

public class TileReusedBitCache extends ReusedBitmapCache {
    private static TileReusedBitCache sInstance;

    private TileReusedBitCache() {
    }

    public static synchronized TileReusedBitCache getInstance() {
        TileReusedBitCache tileReusedBitCache;
        synchronized (TileReusedBitCache.class) {
            if (sInstance == null) {
                sInstance = new TileReusedBitCache();
            }
            tileReusedBitCache = sInstance;
        }
        return tileReusedBitCache;
    }

    /* access modifiers changed from: protected */
    public boolean canUseForInBitmap(Bitmap bitmap, Options options) {
        boolean z = false;
        if (isSupportBytesCount()) {
            int convertToPowerOf2 = convertToPowerOf2(options.inSampleSize);
            int i = options.outWidth / convertToPowerOf2;
            int i2 = options.outHeight / convertToPowerOf2;
            int bytesPerPixel = i * i2 * getBytesPerPixel(bitmap.getConfig());
            if (bitmap.getWidth() == i && bitmap.getHeight() == i2 && bytesPerPixel == bitmap.getAllocationByteCount()) {
                z = true;
            }
            return z;
        }
        if (bitmap.getWidth() == options.outWidth && bitmap.getHeight() == options.outHeight && options.inSampleSize == 1) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: protected */
    public Config getConfig() {
        return TileConfig.getBitmapConfig();
    }

    /* access modifiers changed from: protected */
    public int getMaxCount() {
        return TileConfig.getMaxCacheCount();
    }

    /* access modifiers changed from: protected */
    public boolean needMutable() {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean needRecycle() {
        return true;
    }
}
