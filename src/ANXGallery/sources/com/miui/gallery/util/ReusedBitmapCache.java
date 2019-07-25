package com.miui.gallery.util;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.os.Build.VERSION;
import java.lang.ref.SoftReference;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public abstract class ReusedBitmapCache {
    private Set<SoftReference<Bitmap>> mReuseBits = new HashSet();

    public static int getBytesPerPixel(Config config) {
        if (config == Config.ARGB_8888) {
            return 4;
        }
        if (config == Config.RGB_565 || config == Config.ARGB_4444) {
            return 2;
        }
        return config == Config.ALPHA_8 ? 1 : 1;
    }

    protected static boolean isInBitmapSupport() {
        return VERSION.SDK_INT >= 11;
    }

    private void recycle(Bitmap bitmap) {
        if (needRecycle() && bitmap != null && !bitmap.isRecycled()) {
            bitmap.recycle();
        }
    }

    private void trim(Bitmap bitmap) {
        Iterator it = this.mReuseBits.iterator();
        while (it.hasNext()) {
            Bitmap bitmap2 = (Bitmap) ((SoftReference) it.next()).get();
            if (bitmap2 == null || bitmap2.isRecycled()) {
                it.remove();
            } else if (bitmap2.getAllocationByteCount() < bitmap.getAllocationByteCount()) {
                it.remove();
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean canUseForInBitmap(Bitmap bitmap, Options options) {
        boolean z = false;
        if (isSupportBytesCount()) {
            int convertToPowerOf2 = convertToPowerOf2(options.inSampleSize);
            if ((options.outWidth / convertToPowerOf2) * (options.outHeight / convertToPowerOf2) * getBytesPerPixel(bitmap.getConfig()) <= bitmap.getAllocationByteCount()) {
                z = true;
            }
            return z;
        }
        if (bitmap.getWidth() == options.outWidth && bitmap.getHeight() == options.outHeight && options.inSampleSize == 1) {
            z = true;
        }
        return z;
    }

    public synchronized void clear() {
        Log.i("ReusedBitmapCache", "clear");
        for (SoftReference softReference : this.mReuseBits) {
            recycle((Bitmap) softReference.get());
        }
        this.mReuseBits.clear();
    }

    /* access modifiers changed from: protected */
    public int convertToPowerOf2(int i) {
        int i2 = 1;
        while (i2 <= i) {
            int i3 = i2 * 2;
            if (i3 > i) {
                return i2;
            }
            i2 = i3;
        }
        return i2;
    }

    public synchronized Bitmap get(Options options) {
        if (!isInBitmapSupport()) {
            return null;
        }
        Iterator it = this.mReuseBits.iterator();
        SoftReference softReference = null;
        int i = Integer.MAX_VALUE;
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            SoftReference softReference2 = (SoftReference) it.next();
            Bitmap bitmap = (Bitmap) softReference2.get();
            if (bitmap == null || bitmap.isRecycled()) {
                Log.i("ReusedBitmapCache", "soft reference is recycled");
                it.remove();
            } else if (canUseForInBitmap(bitmap, options)) {
                int allocationByteCount = bitmap.getAllocationByteCount();
                if (!isSupportBytesCount()) {
                    softReference = softReference2;
                    break;
                }
                Log.i("ReusedBitmapCache", "can reused bitmap %s, size %d", Integer.toHexString(System.identityHashCode(bitmap)), Integer.valueOf(allocationByteCount));
                if (allocationByteCount < i) {
                    softReference = softReference2;
                    i = allocationByteCount;
                }
            } else {
                continue;
            }
        }
        Bitmap bitmap2 = softReference != null ? (Bitmap) softReference.get() : null;
        if (BaseBitmapUtils.isValidate(bitmap2)) {
            Log.i("ReusedBitmapCache", "get reused bitmap %s, size %d", Integer.toHexString(System.identityHashCode(bitmap2)), Integer.valueOf(bitmap2.getAllocationByteCount()));
            this.mReuseBits.remove(softReference);
            return bitmap2;
        }
        Log.i("ReusedBitmapCache", "no can used bitmap, count %d", (Object) Integer.valueOf(this.mReuseBits.size()));
        return null;
    }

    /* access modifiers changed from: protected */
    public abstract Config getConfig();

    /* access modifiers changed from: protected */
    public abstract int getMaxCount();

    /* access modifiers changed from: protected */
    public boolean isSupportBytesCount() {
        return VERSION.SDK_INT >= 19;
    }

    /* access modifiers changed from: protected */
    public boolean needMutable() {
        return true;
    }

    /* access modifiers changed from: protected */
    public boolean needRecycle() {
        return false;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:25:0x005d, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x0062, code lost:
        return;
     */
    public synchronized void put(Bitmap bitmap) {
        if (bitmap != null) {
            if (!bitmap.isRecycled()) {
                if (!isInBitmapSupport()) {
                    recycle(bitmap);
                } else if (!needMutable() || bitmap.isMutable()) {
                    trim(bitmap);
                    if (this.mReuseBits.size() >= getMaxCount()) {
                        recycle(bitmap);
                    } else {
                        this.mReuseBits.add(new SoftReference(bitmap));
                        Log.i("ReusedBitmapCache", "put reused bitmap %s  %d", Integer.toHexString(System.identityHashCode(bitmap)), Integer.valueOf(this.mReuseBits.size()));
                    }
                } else {
                    recycle(bitmap);
                }
            }
        }
    }
}
