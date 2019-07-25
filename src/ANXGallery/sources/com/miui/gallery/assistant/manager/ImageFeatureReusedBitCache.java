package com.miui.gallery.assistant.manager;

import android.graphics.Bitmap.Config;
import com.miui.gallery.util.ReusedBitmapCache;

public class ImageFeatureReusedBitCache extends ReusedBitmapCache {
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
