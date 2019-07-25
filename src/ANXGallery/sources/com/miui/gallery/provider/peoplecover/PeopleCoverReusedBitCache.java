package com.miui.gallery.provider.peoplecover;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import com.miui.gallery.util.ReusedBitmapCache;

public class PeopleCoverReusedBitCache extends ReusedBitmapCache {
    /* access modifiers changed from: protected */
    public boolean canUseForInBitmap(Bitmap bitmap, Options options) {
        if (!isSupportBytesCount()) {
            return super.canUseForInBitmap(bitmap, options);
        }
        int convertToPowerOf2 = convertToPowerOf2(options.inSampleSize);
        int i = options.outWidth / convertToPowerOf2;
        int i2 = options.outHeight / convertToPowerOf2;
        return bitmap.getWidth() >= i && bitmap.getHeight() >= i2 && (i * i2) * getBytesPerPixel(bitmap.getConfig()) <= bitmap.getAllocationByteCount();
    }

    /* access modifiers changed from: protected */
    public Config getConfig() {
        return Config.RGB_565;
    }

    /* access modifiers changed from: protected */
    public int getMaxCount() {
        return 3;
    }

    /* access modifiers changed from: protected */
    public boolean needMutable() {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean needRecycle() {
        return false;
    }
}
