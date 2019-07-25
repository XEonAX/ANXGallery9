package com.miui.gallery.util;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Rect;
import android.graphics.RectF;
import android.text.TextUtils;
import android.util.Log;
import com.miui.gallery.util.face.FaceRegionRectF;
import java.io.Closeable;
import java.io.FileInputStream;
import java.io.InputStream;

public class DecodeRegionImageUtils {
    private static void closeSilently(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Throwable th) {
                Log.w("DecodeRegionImageUtils", "close fail", th);
            }
        }
    }

    private static int computeSampleSize(float f) {
        int max = Math.max(1, (int) Math.ceil((double) (1.0f / f)));
        return max <= 8 ? nextPowerOf2(max) : ((max + 7) / 8) * 8;
    }

    private static Bitmap decodeFace(RectF rectF, BitmapRegionDecoder bitmapRegionDecoder, float f, int i, int i2, ReusedBitmapCache reusedBitmapCache) {
        if (bitmapRegionDecoder == null) {
            return null;
        }
        int width = bitmapRegionDecoder.getWidth();
        int height = bitmapRegionDecoder.getHeight();
        if (rectF instanceof FaceRegionRectF) {
            int i3 = ((FaceRegionRectF) rectF).orientation;
            if (!(i3 == -1 || i3 == 1 || i3 == 0 || i3 == i2)) {
                rectF = ExifUtil.adjustRectOrientation(1, 1, rectF, i3, true);
            }
        }
        float f2 = (float) width;
        float f3 = (float) height;
        Rect rect = new Rect((int) (rectF.left * f2), (int) (rectF.top * f3), (int) (rectF.right * f2), (int) (rectF.bottom * f3));
        Options options = new Options();
        if (i > 0 && i < Math.min(rect.width(), rect.height())) {
            options.inPreferredConfig = Config.RGB_565;
            options.outHeight = i;
            options.outWidth = i;
            options.inSampleSize = computeSampleSize(((float) i) / ((float) Math.min(rect.width(), rect.height())));
            if (reusedBitmapCache != null) {
                options.inBitmap = reusedBitmapCache.get(options);
            }
        }
        return safeDecodeRegion(bitmapRegionDecoder, roundToSquareAndScale(rect, width, height, f), options);
    }

    public static Bitmap decodeFaceRegion(RectF rectF, InputStream inputStream, float f, int i, int i2) {
        if (inputStream == null) {
            return null;
        }
        BitmapRegionDecoder requestCreateBitmapRegionDecoder = requestCreateBitmapRegionDecoder(inputStream);
        try {
            Bitmap decodeFace = decodeFace(rectF, requestCreateBitmapRegionDecoder, f, i, i2, null);
            return decodeFace;
        } finally {
            if (BitmapUtils.isValidate(requestCreateBitmapRegionDecoder)) {
                requestCreateBitmapRegionDecoder.recycle();
            }
        }
    }

    public static Bitmap decodeFaceRegion(RectF rectF, String str, float f, int i, int i2, ReusedBitmapCache reusedBitmapCache) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        BitmapRegionDecoder requestCreateBitmapRegionDecoder = requestCreateBitmapRegionDecoder(str);
        try {
            Bitmap decodeFace = decodeFace(rectF, requestCreateBitmapRegionDecoder, f, i, i2, reusedBitmapCache);
            return decodeFace;
        } finally {
            if (BitmapUtils.isValidate(requestCreateBitmapRegionDecoder)) {
                requestCreateBitmapRegionDecoder.recycle();
            }
        }
    }

    private static Bitmap decodeRegion(RectF rectF, BitmapRegionDecoder bitmapRegionDecoder, int i) {
        if (bitmapRegionDecoder == null) {
            return null;
        }
        int width = bitmapRegionDecoder.getWidth();
        float f = (float) width;
        float height = (float) bitmapRegionDecoder.getHeight();
        Rect rect = new Rect((int) (rectF.left * f), (int) (rectF.top * height), (int) (rectF.right * f), (int) (rectF.bottom * height));
        Options options = new Options();
        if (i > 0 && i < Math.min(rect.width(), rect.height())) {
            options.inPreferredConfig = Config.RGB_565;
            options.inSampleSize = computeSampleSize(((float) i) / ((float) Math.min(rect.width(), rect.height())));
        }
        return safeDecodeRegion(bitmapRegionDecoder, rect, options);
    }

    public static Bitmap decodeRegion(RectF rectF, InputStream inputStream, int i) {
        if (inputStream == null) {
            return null;
        }
        BitmapRegionDecoder requestCreateBitmapRegionDecoder = requestCreateBitmapRegionDecoder(inputStream);
        try {
            Bitmap decodeRegion = decodeRegion(rectF, requestCreateBitmapRegionDecoder, i);
            return decodeRegion;
        } finally {
            if (BitmapUtils.isValidate(requestCreateBitmapRegionDecoder)) {
                requestCreateBitmapRegionDecoder.recycle();
            }
        }
    }

    private static int nextPowerOf2(int i) {
        if (i <= 0 || i > 1073741824) {
            throw new IllegalArgumentException();
        }
        int i2 = i - 1;
        int i3 = i2 | (i2 >> 16);
        int i4 = i3 | (i3 >> 8);
        int i5 = i4 | (i4 >> 4);
        int i6 = i5 | (i5 >> 2);
        return (i6 | (i6 >> 1)) + 1;
    }

    private static BitmapRegionDecoder requestCreateBitmapRegionDecoder(InputStream inputStream) {
        try {
            return BitmapRegionDecoder.newInstance(inputStream, false);
        } catch (Throwable th) {
            Log.w("DecodeRegionImageUtils", th);
            return null;
        }
    }

    private static BitmapRegionDecoder requestCreateBitmapRegionDecoder(String str) {
        FileInputStream fileInputStream;
        try {
            fileInputStream = new FileInputStream(str);
            try {
                BitmapRegionDecoder newInstance = BitmapRegionDecoder.newInstance(fileInputStream, false);
                closeSilently(fileInputStream);
                return newInstance;
            } catch (Throwable th) {
                th = th;
                try {
                    Log.w("DecodeRegionImageUtils", th);
                    closeSilently(fileInputStream);
                    return null;
                } catch (Throwable th2) {
                    th = th2;
                    closeSilently(fileInputStream);
                    throw th;
                }
            }
        } catch (Throwable th3) {
            th = th3;
            fileInputStream = null;
            closeSilently(fileInputStream);
            throw th;
        }
    }

    public static Rect roundToSquareAndScale(Rect rect, int i, int i2, float f) {
        int i3 = rect.right - rect.left;
        int i4 = rect.bottom - rect.top;
        int min = Math.min((int) (((float) Math.max(i3, i4)) * f), Math.min(Math.min(rect.centerX(), rect.centerY()), Math.min(i - rect.centerX(), i2 - rect.centerY())) * 2);
        int i5 = (min - i3) / 2;
        int i6 = (min - i4) / 2;
        rect.left -= i5;
        rect.top -= i6;
        rect.right += i5;
        rect.bottom += i6;
        return rect;
    }

    private static Bitmap safeDecodeRegion(BitmapRegionDecoder bitmapRegionDecoder, Rect rect, Options options) {
        try {
            return bitmapRegionDecoder.decodeRegion(rect, options);
        } catch (OutOfMemoryError e) {
            Log.e("DecodeRegionImageUtils", "safeDecodeRegion() failed OOM: ", e);
            return null;
        } catch (Throwable th) {
            Log.e("DecodeRegionImageUtils", "safeDecodeRegion() failed: ", th);
            return null;
        }
    }
}
