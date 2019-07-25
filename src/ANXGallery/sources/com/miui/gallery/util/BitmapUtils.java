package com.miui.gallery.util;

import android.content.ContentResolver;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.net.Uri;
import android.util.Log;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;

public class BitmapUtils extends BaseBitmapUtils {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final HashSet<String> REGION_DECODER_SUPPORTED_MIMETYPES = new HashSet<>();

    /* renamed from: com.miui.gallery.util.BitmapUtils$1 reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$android$graphics$Bitmap$Config = new int[Config.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(12:0|1|2|3|4|5|6|7|8|9|10|12) */
        /* JADX WARNING: Code restructure failed: missing block: B:13:?, code lost:
            return;
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:3:0x0014 */
        /* JADX WARNING: Missing exception handler attribute for start block: B:5:0x001f */
        /* JADX WARNING: Missing exception handler attribute for start block: B:7:0x002a */
        /* JADX WARNING: Missing exception handler attribute for start block: B:9:0x0035 */
        static {
            $SwitchMap$android$graphics$Bitmap$Config[Config.ALPHA_8.ordinal()] = 1;
            $SwitchMap$android$graphics$Bitmap$Config[Config.ARGB_4444.ordinal()] = 2;
            $SwitchMap$android$graphics$Bitmap$Config[Config.ARGB_8888.ordinal()] = 3;
            $SwitchMap$android$graphics$Bitmap$Config[Config.RGBA_F16.ordinal()] = 4;
            $SwitchMap$android$graphics$Bitmap$Config[Config.RGB_565.ordinal()] = 5;
        }
    }

    public static class BitmapDimension {
        public int height;
        public int width;
    }

    static {
        REGION_DECODER_SUPPORTED_MIMETYPES.add("image/png");
        REGION_DECODER_SUPPORTED_MIMETYPES.add("image/jpeg");
        REGION_DECODER_SUPPORTED_MIMETYPES.add("image/jpg");
    }

    private BitmapUtils() {
    }

    public static int computeThumbNailSampleSize(int i, int i2, int i3, int i4) {
        return reviseSampleSize((int) Math.floor((double) (1.0f / computeThumbNailScaleSize(i, i2, i3, i4))));
    }

    public static float computeThumbNailScaleSize(int i, int i2, int i3, int i4) {
        int min = Math.min(i, i2);
        int max = Math.max(i, i2);
        return Math.min((((float) Math.min(i3, i4)) * 1.0f) / ((float) min), (((float) Math.max(i3, i4)) * 1.0f) / ((float) max));
    }

    public static Bitmap fitBitmapToScreen(Bitmap bitmap, int i, int i2, boolean z) {
        return resizeBitmapByScale(bitmap, computeThumbNailScaleSize(bitmap.getWidth(), bitmap.getHeight(), i, i2), z);
    }

    public static Config getConfig(Bitmap bitmap) {
        Config config = bitmap.getConfig();
        return config == null ? Config.ARGB_8888 : config;
    }

    public static short getConfigSize(Config config) {
        switch (AnonymousClass1.$SwitchMap$android$graphics$Bitmap$Config[config.ordinal()]) {
            case 1:
                return 1;
            case 2:
                return 2;
            case 3:
                return 4;
            case 4:
                return 8;
            case 5:
                return 2;
            default:
                return 0;
        }
    }

    public static Bitmap getRoundedCornerBitmap(Bitmap bitmap, float f, int i, int i2) {
        Bitmap bitmap2;
        try {
            Rect rect = new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());
            RectF rectF = new RectF(0.0f, 0.0f, (float) i, (float) i2);
            Paint paint = new Paint();
            bitmap2 = Bitmap.createBitmap(i, i2, Config.ARGB_8888);
            try {
                Canvas canvas = new Canvas(bitmap2);
                canvas.drawRoundRect(rectF, f, f, paint);
                paint.setXfermode(new PorterDuffXfermode(Mode.SRC_IN));
                canvas.drawBitmap(bitmap, rect, rectF, paint);
            } catch (OutOfMemoryError e) {
                e = e;
            } catch (Exception e2) {
                e = e2;
                Log.e("BitmapUtils", "getRoundedCornerBitmap() failed %s", e);
                return bitmap2;
            }
        } catch (OutOfMemoryError e3) {
            e = e3;
            bitmap2 = null;
            Log.e("BitmapUtils", "getRoundedCornerBitmap() failed OOM %s", e);
            return bitmap2;
        } catch (Exception e4) {
            e = e4;
            bitmap2 = null;
            Log.e("BitmapUtils", "getRoundedCornerBitmap() failed %s", e);
            return bitmap2;
        }
        return bitmap2;
    }

    public static boolean isBitmapInScreen(int i, int i2, int i3, int i4) {
        return Math.min(i, i2) <= Math.min(i3, i4) && Math.max(i, i2) <= Math.max(i3, i4);
    }

    public static boolean isRotationSupported(String str) {
        boolean z = false;
        if (str == null) {
            return false;
        }
        String lowerCase = str.toLowerCase();
        if (lowerCase.equals("image/jpeg") || lowerCase.equals("image/png") || lowerCase.equals("image/bmp")) {
            z = true;
        }
        return z;
    }

    public static boolean isSupportedByRegionDecoder(String str) {
        return REGION_DECODER_SUPPORTED_MIMETYPES.contains(str);
    }

    public static boolean isValidate(Bitmap bitmap) {
        return bitmap != null && !bitmap.isRecycled();
    }

    public static boolean isValidate(BitmapRegionDecoder bitmapRegionDecoder) {
        return bitmapRegionDecoder != null && !bitmapRegionDecoder.isRecycled();
    }

    public static Bitmap resizeBitmapByScale(Bitmap bitmap, float f, boolean z) {
        int round = Math.round(((float) bitmap.getWidth()) * f);
        int round2 = Math.round(((float) bitmap.getHeight()) * f);
        if (round == bitmap.getWidth() && round2 == bitmap.getHeight()) {
            return bitmap;
        }
        Bitmap safeCreateBitmap = safeCreateBitmap(round, round2, getConfig(bitmap));
        if (safeCreateBitmap != null) {
            Canvas canvas = new Canvas(safeCreateBitmap);
            canvas.scale(f, f);
            canvas.drawBitmap(bitmap, 0.0f, 0.0f, new Paint(2));
            if (z) {
                bitmap.recycle();
            }
        }
        return safeCreateBitmap;
    }

    private static int reviseSampleSize(int i) {
        if (i <= 1) {
            i = 1;
        }
        return i <= 8 ? Utils.prevPowerOf2(i) : (i / 8) * 8;
    }

    public static Bitmap safeCreateBitmap(int i, int i2, Config config) {
        try {
            return Bitmap.createBitmap(i, i2, config);
        } catch (OutOfMemoryError e) {
            Log.e("BitmapUtils", "safeCreateBitmap() failed OOM: %s", e);
            return null;
        } catch (Exception e2) {
            Log.e("BitmapUtils", "safeCreateBitmap() failed: %s", e2);
            return null;
        }
    }

    public static Bitmap safeCreateBitmap(Bitmap bitmap, int i, int i2, int i3, int i4) {
        try {
            return Bitmap.createBitmap(bitmap, i, i2, i3, i4);
        } catch (OutOfMemoryError e) {
            Log.e("BitmapUtils", "safeCreateBitmap() failed OOM %s", e);
            return null;
        }
    }

    public static Bitmap safeCreateBitmap(Bitmap bitmap, int i, int i2, int i3, int i4, Matrix matrix, boolean z, Config config) {
        Bitmap bitmap2;
        RectF rectF;
        Paint paint;
        if (!isValidate(bitmap)) {
            return null;
        }
        if (!bitmap.isMutable() && bitmap.getConfig() == config && i == 0 && i2 == 0 && i3 == bitmap.getWidth() && i4 == bitmap.getHeight() && (matrix == null || matrix.isIdentity())) {
            return bitmap;
        }
        Rect rect = new Rect(i, i2, i + i3, i2 + i4);
        RectF rectF2 = new RectF(0.0f, 0.0f, (float) i3, (float) i4);
        boolean z2 = true;
        if (matrix == null || matrix.isIdentity()) {
            bitmap2 = Bitmap.createBitmap(i3, i4, config);
            rectF = null;
            paint = null;
        } else {
            boolean z3 = !matrix.rectStaysRect();
            rectF = new RectF();
            matrix.mapRect(rectF, rectF2);
            bitmap2 = Bitmap.createBitmap(Math.round(rectF.width()), Math.round(rectF.height()), config);
            paint = new Paint();
            paint.setFilterBitmap(z);
            if (z3) {
                paint.setAntiAlias(true);
            }
        }
        bitmap2.setDensity(bitmap.getDensity());
        if ((bitmap2.getConfig() != Config.ARGB_8888 || !bitmap2.hasAlpha()) && !bitmap.isPremultiplied()) {
            z2 = false;
        }
        bitmap2.setPremultiplied(z2);
        Canvas canvas = new Canvas(bitmap2);
        if (rectF != null) {
            canvas.translate(-rectF.left, -rectF.top);
            canvas.concat(matrix);
        }
        canvas.drawBitmap(bitmap, rect, rectF2, paint);
        canvas.setBitmap(null);
        return bitmap2;
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x002c A[SYNTHETIC, Splitter:B:21:0x002c] */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x003b A[SYNTHETIC, Splitter:B:29:0x003b] */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x004b A[SYNTHETIC, Splitter:B:35:0x004b] */
    public static BitmapRegionDecoder safeCreateBitmapRegionDecoder(String str, boolean z, byte[] bArr) {
        InputStream inputStream;
        try {
            inputStream = createInputStream(str, bArr);
            try {
                BitmapRegionDecoder newInstance = BitmapRegionDecoder.newInstance(inputStream, z);
                if (inputStream == null) {
                    return newInstance;
                }
                try {
                    inputStream.close();
                    return newInstance;
                } catch (IOException e) {
                    Log.e("BitmapUtils", "close inputStream failed %s", e);
                    return newInstance;
                }
            } catch (OutOfMemoryError e2) {
                e = e2;
                Log.e("BitmapUtils", "safeCreateBitmapRegionDecoder() failed OOM %s", e);
                if (inputStream != null) {
                    inputStream.close();
                }
                return null;
            } catch (Exception e3) {
                e = e3;
                try {
                    Log.e("BitmapUtils", "safeCreateBitmapRegionDecoder() failed %s", e);
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e4) {
                            Log.e("BitmapUtils", "close inputStream failed %s", e4);
                        }
                    }
                    return null;
                } catch (Throwable th) {
                    th = th;
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e5) {
                            Log.e("BitmapUtils", "close inputStream failed %s", e5);
                        }
                    }
                    throw th;
                }
            }
        } catch (OutOfMemoryError e6) {
            e = e6;
            inputStream = null;
            Log.e("BitmapUtils", "safeCreateBitmapRegionDecoder() failed OOM %s", e);
            if (inputStream != null) {
            }
            return null;
        } catch (Exception e7) {
            e = e7;
            inputStream = null;
            Log.e("BitmapUtils", "safeCreateBitmapRegionDecoder() failed %s", e);
            if (inputStream != null) {
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            inputStream = null;
            if (inputStream != null) {
            }
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x002c A[SYNTHETIC, Splitter:B:21:0x002c] */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x003b A[SYNTHETIC, Splitter:B:29:0x003b] */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x004b A[SYNTHETIC, Splitter:B:35:0x004b] */
    public static Bitmap safeDecodeBitmap(ContentResolver contentResolver, Uri uri) {
        InputStream inputStream;
        try {
            inputStream = contentResolver.openInputStream(uri);
            try {
                Bitmap decodeStream = BitmapFactory.decodeStream(inputStream);
                if (inputStream == null) {
                    return decodeStream;
                }
                try {
                    inputStream.close();
                    return decodeStream;
                } catch (IOException e) {
                    Log.e("BitmapUtils", "close inputStream failed %s", e);
                    return decodeStream;
                }
            } catch (OutOfMemoryError e2) {
                e = e2;
                Log.e("BitmapUtils", "safeDecodeBitmap() failed OOM %s", e);
                if (inputStream != null) {
                    inputStream.close();
                }
                return null;
            } catch (Exception e3) {
                e = e3;
                try {
                    Log.e("BitmapUtils", "safeDecodeBitmap() failed %s", e);
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e4) {
                            Log.e("BitmapUtils", "close inputStream failed %s", e4);
                        }
                    }
                    return null;
                } catch (Throwable th) {
                    th = th;
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e5) {
                            Log.e("BitmapUtils", "close inputStream failed %s", e5);
                        }
                    }
                    throw th;
                }
            }
        } catch (OutOfMemoryError e6) {
            e = e6;
            inputStream = null;
            Log.e("BitmapUtils", "safeDecodeBitmap() failed OOM %s", e);
            if (inputStream != null) {
            }
            return null;
        } catch (Exception e7) {
            e = e7;
            inputStream = null;
            Log.e("BitmapUtils", "safeDecodeBitmap() failed %s", e);
            if (inputStream != null) {
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            inputStream = null;
            if (inputStream != null) {
            }
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x002c A[SYNTHETIC, Splitter:B:21:0x002c] */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x003b A[SYNTHETIC, Splitter:B:29:0x003b] */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x004b A[SYNTHETIC, Splitter:B:35:0x004b] */
    public static Bitmap safeDecodeBitmap(String str, Options options, byte[] bArr) {
        InputStream inputStream;
        try {
            inputStream = createInputStream(str, bArr);
            try {
                Bitmap decodeStream = BitmapFactory.decodeStream(inputStream, null, options);
                if (inputStream == null) {
                    return decodeStream;
                }
                try {
                    inputStream.close();
                    return decodeStream;
                } catch (IOException e) {
                    Log.e("BitmapUtils", "close inputStream failed %s", e);
                    return decodeStream;
                }
            } catch (OutOfMemoryError e2) {
                e = e2;
                Log.e("BitmapUtils", "safeDecodeBitmap() failed OOM %s", e);
                if (inputStream != null) {
                    inputStream.close();
                }
                return null;
            } catch (Exception e3) {
                e = e3;
                try {
                    Log.e("BitmapUtils", "safeDecodeBitmap() failed %s", e);
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e4) {
                            Log.e("BitmapUtils", "close inputStream failed %s", e4);
                        }
                    }
                    return null;
                } catch (Throwable th) {
                    th = th;
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e5) {
                            Log.e("BitmapUtils", "close inputStream failed %s", e5);
                        }
                    }
                    throw th;
                }
            }
        } catch (OutOfMemoryError e6) {
            e = e6;
            inputStream = null;
            Log.e("BitmapUtils", "safeDecodeBitmap() failed OOM %s", e);
            if (inputStream != null) {
            }
            return null;
        } catch (Exception e7) {
            e = e7;
            inputStream = null;
            Log.e("BitmapUtils", "safeDecodeBitmap() failed %s", e);
            if (inputStream != null) {
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            inputStream = null;
            if (inputStream != null) {
            }
            throw th;
        }
    }

    public static Bitmap safeDecodeRegion(BitmapRegionDecoder bitmapRegionDecoder, Rect rect, Options options) {
        try {
            return bitmapRegionDecoder.decodeRegion(rect, options);
        } catch (OutOfMemoryError e) {
            Log.e("BitmapUtils", "safeDecodeRegion() failed OOM %s", e);
            return null;
        } catch (Exception e2) {
            Log.e("BitmapUtils", "safeDecodeRegion() failed %s", e2);
            return null;
        }
    }
}
