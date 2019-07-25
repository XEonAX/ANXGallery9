package com.miui.gallery.util;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Shader.TileMode;

public class CropUtil {
    public static Bitmap circleBitmap(Bitmap bitmap) {
        if (bitmap == null || bitmap.isRecycled()) {
            return null;
        }
        return circleBitmap(bitmap, Math.min(bitmap.getWidth(), bitmap.getHeight()));
    }

    public static Bitmap circleBitmap(Bitmap bitmap, int i) {
        if (bitmap == null || bitmap.isRecycled()) {
            return null;
        }
        Bitmap safeCreateBitmap = BitmapUtils.safeCreateBitmap(i, i, Config.ARGB_8888);
        if (safeCreateBitmap == null) {
            return null;
        }
        int i2 = i / 2;
        BitmapShader bitmapShader = new BitmapShader(bitmap, TileMode.REPEAT, TileMode.REPEAT);
        Canvas canvas = new Canvas(safeCreateBitmap);
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        paint.setShader(bitmapShader);
        float f = (float) i2;
        canvas.drawCircle(f, f, f, paint);
        return safeCreateBitmap;
    }

    public static Bitmap cropImage(Bitmap bitmap, int i, int i2, boolean z) {
        boolean z2;
        if (bitmap == null) {
            return null;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        Utils.assertTrue((height == 0 || i2 == 0) ? false : true, "wrong dimension", new Object[0]);
        float f = (float) i;
        float f2 = (float) i2;
        if (((float) width) / ((float) height) < f / f2) {
            height = width;
            z2 = true;
        } else {
            z2 = false;
        }
        float f3 = z2 ? f / ((float) height) : f2 / ((float) height);
        return f3 < 1.0f ? cropLargeBitmap(z2, f3, bitmap, i, i2, z) : cropSmallBitmap(z2, f3, bitmap, i, i2, z);
    }

    /* JADX WARNING: Removed duplicated region for block: B:13:0x0035  */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x0038  */
    private static Bitmap cropLargeBitmap(boolean z, float f, Bitmap bitmap, int i, int i2, boolean z2) {
        Bitmap bitmap2;
        Bitmap resizeBitmapByScale = BitmapUtils.resizeBitmapByScale(bitmap, f, z2);
        if (resizeBitmapByScale == null) {
            return bitmap;
        }
        if (z) {
            if (i2 <= resizeBitmapByScale.getHeight()) {
                bitmap2 = BitmapUtils.safeCreateBitmap(resizeBitmapByScale, 0, (resizeBitmapByScale.getHeight() - i2) / 2, resizeBitmapByScale.getWidth(), i2);
                if (bitmap2 == null) {
                    bitmap2 = resizeBitmapByScale;
                }
                if (resizeBitmapByScale != bitmap2) {
                    resizeBitmapByScale.recycle();
                }
                if (bitmap2 != bitmap && z2) {
                    bitmap.recycle();
                }
                return bitmap2;
            }
        } else if (i <= resizeBitmapByScale.getWidth()) {
            bitmap2 = BitmapUtils.safeCreateBitmap(resizeBitmapByScale, (resizeBitmapByScale.getWidth() - i) / 2, 0, i, i2);
            if (bitmap2 == null) {
            }
            if (resizeBitmapByScale != bitmap2) {
            }
            bitmap.recycle();
            return bitmap2;
        }
        bitmap2 = resizeBitmapByScale;
        if (bitmap2 == null) {
        }
        if (resizeBitmapByScale != bitmap2) {
        }
        bitmap.recycle();
        return bitmap2;
    }

    private static Bitmap cropSmallBitmap(boolean z, float f, Bitmap bitmap, int i, int i2, boolean z2) {
        Bitmap bitmap2;
        boolean z3 = true;
        if (z) {
            int i3 = (int) (((float) i2) / f);
            if (bitmap.getHeight() < i3) {
                z3 = false;
            }
            Utils.assertTrue(z3);
            bitmap2 = BitmapUtils.safeCreateBitmap(bitmap, 0, (bitmap.getHeight() - i3) / 2, bitmap.getWidth(), i3);
        } else {
            int i4 = (int) (((float) i) / f);
            if (i4 == 0) {
                i4 = 1;
            }
            bitmap2 = BitmapUtils.safeCreateBitmap(bitmap, (bitmap.getWidth() - i4) / 2, 0, i4, bitmap.getHeight());
        }
        if (bitmap2 == null) {
            return null;
        }
        Bitmap resizeBitmapByScale = BitmapUtils.resizeBitmapByScale(bitmap2, f, z2);
        if (!(bitmap2 == resizeBitmapByScale || bitmap2 == bitmap)) {
            bitmap2.recycle();
        }
        return resizeBitmapByScale;
    }
}
