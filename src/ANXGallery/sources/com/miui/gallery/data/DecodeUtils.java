package com.miui.gallery.data;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.net.Uri;
import android.opengl.GLUtils;
import android.os.ParcelFileDescriptor;
import android.util.DisplayMetrics;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.util.BitmapUtils;
import com.miui.gallery.util.BitmapUtils.BitmapDimension;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.ExifUtil.ExifInfo;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ScreenUtils;
import com.miui.gallery.util.Utils;
import java.io.Closeable;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class DecodeUtils {
    private static final GifCvtJpegCache GIF_CVT_JPEG_CACHE = new GifCvtJpegCache(GalleryUtils.getInternalCacheDir(), 5);
    public static final Object LOCK = new Object();

    public static class GalleryOptions extends Options {
        public Uri uri;

        public ParcelFileDescriptor getFD() {
            try {
                return GalleryApp.sGetAndroidContext().getContentResolver().openFileDescriptor(this.uri, "r");
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return null;
            }
        }
    }

    public static Bitmap considerOrientation(Bitmap bitmap, ExifInfo exifInfo) {
        if (bitmap == null || bitmap.isRecycled() || exifInfo == null) {
            return bitmap;
        }
        boolean z = false;
        Matrix matrix = new Matrix();
        if (exifInfo.flip) {
            matrix.postScale(-1.0f, 1.0f);
            z = true;
        }
        if (exifInfo.rotation != 0) {
            matrix.postRotate((float) exifInfo.rotation);
            z = true;
        }
        if (!z) {
            return bitmap;
        }
        Bitmap safeCreateBitmap = BitmapUtils.safeCreateBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true, bitmap.getConfig());
        if (safeCreateBitmap != bitmap) {
            bitmap.recycle();
        }
        return safeCreateBitmap;
    }

    public static Bitmap ensureGLCompatibleBitmap(Bitmap bitmap) {
        if (bitmap == null || bitmap.getConfig() != null) {
            return bitmap;
        }
        Bitmap copy = bitmap.copy(Config.ARGB_8888, false);
        bitmap.recycle();
        return copy;
    }

    public static Bitmap requestDecodeThumbNail(FileDescriptor fileDescriptor, GalleryOptions galleryOptions, BitmapDimension bitmapDimension, String str) {
        Bitmap tryDecodeAndFit;
        if (galleryOptions == null) {
            galleryOptions = new GalleryOptions();
        }
        galleryOptions.inJustDecodeBounds = true;
        GalleryUtils.safeDecodeFileDescriptor(fileDescriptor, null, galleryOptions);
        int i = galleryOptions.outWidth;
        int i2 = galleryOptions.outHeight;
        if (bitmapDimension != null) {
            bitmapDimension.width = i;
            bitmapDimension.height = i2;
        }
        DisplayMetrics displayMetrics = GalleryApp.sGetAndroidContext().getResources().getDisplayMetrics();
        int i3 = displayMetrics.widthPixels;
        int i4 = displayMetrics.heightPixels;
        galleryOptions.inSampleSize = BitmapUtils.computeThumbNailSampleSize(i, i2, i3, i4);
        galleryOptions.inJustDecodeBounds = false;
        galleryOptions.inPurgeable = false;
        galleryOptions.inInputShareable = false;
        if (!ScreenUtils.needOptimizeForLowMemory()) {
            return tryDecodeAndFit(galleryOptions, i3, i4, str);
        }
        synchronized (LOCK) {
            tryDecodeAndFit = tryDecodeAndFit(galleryOptions, i3, i4, str);
        }
        return tryDecodeAndFit;
    }

    public static Bitmap requestDecodeThumbNail(String str, GalleryOptions galleryOptions) {
        return requestDecodeThumbNail(str, galleryOptions, null);
    }

    public static Bitmap requestDecodeThumbNail(String str, GalleryOptions galleryOptions, BitmapDimension bitmapDimension) {
        FileInputStream fileInputStream;
        try {
            fileInputStream = new FileInputStream(str);
            try {
                Bitmap requestDecodeThumbNail = requestDecodeThumbNail(fileInputStream.getFD(), galleryOptions, bitmapDimension, str);
                Utils.closeSilently((Closeable) fileInputStream);
                return requestDecodeThumbNail;
            } catch (FileNotFoundException e) {
                e = e;
                e.printStackTrace();
                Utils.closeSilently((Closeable) fileInputStream);
                return null;
            } catch (IOException e2) {
                e = e2;
                e.printStackTrace();
                Utils.closeSilently((Closeable) fileInputStream);
                return null;
            }
        } catch (FileNotFoundException e3) {
            e = e3;
            fileInputStream = null;
            e.printStackTrace();
            Utils.closeSilently((Closeable) fileInputStream);
            return null;
        } catch (IOException e4) {
            e = e4;
            fileInputStream = null;
            e.printStackTrace();
            Utils.closeSilently((Closeable) fileInputStream);
            return null;
        } catch (Throwable th) {
            th = th;
            Utils.closeSilently((Closeable) fileInputStream);
            throw th;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0018, code lost:
        r3 = r5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x00a1, code lost:
        if (r2 != null) goto L_0x00a4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0017, code lost:
        r11 = th;
     */
    /* JADX WARNING: Removed duplicated region for block: B:9:0x0017 A[ExcHandler: all (th java.lang.Throwable), PHI: r4 r5 
  PHI: (r4v20 android.os.ParcelFileDescriptor) = (r4v7 android.os.ParcelFileDescriptor), (r4v7 android.os.ParcelFileDescriptor), (r4v7 android.os.ParcelFileDescriptor), (r4v1 android.os.ParcelFileDescriptor) binds: [B:35:0x005c, B:51:0x00a4, B:48:0x0080, B:7:0x0011] A[DONT_GENERATE, DONT_INLINE]
  PHI: (r5v22 java.io.FileInputStream) = (r5v4 java.io.FileInputStream), (r5v4 java.io.FileInputStream), (r5v4 java.io.FileInputStream), (r5v23 java.io.FileInputStream) binds: [B:35:0x005c, B:51:0x00a4, B:48:0x0080, B:7:0x0011] A[DONT_GENERATE, DONT_INLINE], Splitter:B:51:0x00a4] */
    private static Bitmap tryDecodeAndFit(GalleryOptions galleryOptions, int i, int i2, String str) {
        Bitmap bitmap;
        FileInputStream fileInputStream;
        FileDescriptor fileDescriptor;
        FileInputStream fileInputStream2;
        Bitmap bitmap2;
        FileInputStream fileInputStream3;
        Bitmap bitmap3 = null;
        FileInputStream fileInputStream4 = null;
        ParcelFileDescriptor parcelFileDescriptor = null;
        for (int i3 = 0; i3 < 3 && bitmap3 == null; i3++) {
            if (str != null) {
                try {
                    fileInputStream = new FileInputStream(str);
                } catch (OutOfMemoryError e) {
                    OutOfMemoryError outOfMemoryError = e;
                    bitmap2 = bitmap3;
                    e = outOfMemoryError;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Decode and fit is out of memory: ");
                    sb.append(e.toString());
                    Log.e("DecodeService", sb.toString());
                    galleryOptions.inSampleSize *= 2;
                    GalleryUtils.closeStream(fileInputStream4);
                    Utils.closeSilently(parcelFileDescriptor);
                    bitmap3 = bitmap;
                } catch (Throwable th) {
                    Throwable th2 = th;
                    bitmap = bitmap3;
                    th = th2;
                    String str2 = "DecodeService";
                    try {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("unkown exception in decode and fit:");
                        sb2.append(th.toString());
                        Log.e(str2, sb2.toString());
                        galleryOptions.inSampleSize *= 2;
                        GalleryUtils.closeStream(fileInputStream4);
                        Utils.closeSilently(parcelFileDescriptor);
                        bitmap3 = bitmap;
                    } catch (Throwable th3) {
                        th = th3;
                        galleryOptions.inSampleSize *= 2;
                        GalleryUtils.closeStream(fileInputStream4);
                        Utils.closeSilently(parcelFileDescriptor);
                        throw th;
                    }
                }
                try {
                    fileDescriptor = fileInputStream.getFD();
                } catch (OutOfMemoryError e2) {
                    fileInputStream2 = fileInputStream;
                    bitmap2 = bitmap3;
                    e = e2;
                    fileInputStream4 = fileInputStream2;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("Decode and fit is out of memory: ");
                    sb3.append(e.toString());
                    Log.e("DecodeService", sb3.toString());
                    galleryOptions.inSampleSize *= 2;
                    GalleryUtils.closeStream(fileInputStream4);
                    Utils.closeSilently(parcelFileDescriptor);
                    bitmap3 = bitmap;
                } catch (Throwable th4) {
                }
            } else {
                ParcelFileDescriptor fd = galleryOptions.getFD();
                if (fd != null) {
                    try {
                        FileDescriptor fileDescriptor2 = fd.getFileDescriptor();
                        ParcelFileDescriptor parcelFileDescriptor2 = fd;
                        fileInputStream = fileInputStream4;
                        fileDescriptor = fileDescriptor2;
                        parcelFileDescriptor = parcelFileDescriptor2;
                    } catch (OutOfMemoryError e3) {
                        ParcelFileDescriptor parcelFileDescriptor3 = fd;
                        bitmap2 = bitmap3;
                        e = e3;
                        parcelFileDescriptor = parcelFileDescriptor3;
                        StringBuilder sb32 = new StringBuilder();
                        sb32.append("Decode and fit is out of memory: ");
                        sb32.append(e.toString());
                        Log.e("DecodeService", sb32.toString());
                        galleryOptions.inSampleSize *= 2;
                        GalleryUtils.closeStream(fileInputStream4);
                        Utils.closeSilently(parcelFileDescriptor);
                        bitmap3 = bitmap;
                    } catch (Throwable th5) {
                        th = th5;
                        parcelFileDescriptor = fd;
                        galleryOptions.inSampleSize *= 2;
                        GalleryUtils.closeStream(fileInputStream4);
                        Utils.closeSilently(parcelFileDescriptor);
                        throw th;
                    }
                } else {
                    parcelFileDescriptor = fd;
                    fileInputStream = fileInputStream4;
                    fileDescriptor = null;
                }
            }
            Bitmap safeDecodeFileDescriptor = GalleryUtils.safeDecodeFileDescriptor(fileDescriptor, null, galleryOptions);
            if (safeDecodeFileDescriptor == null) {
                galleryOptions.inSampleSize *= 2;
                GalleryUtils.closeStream(fileInputStream);
                Utils.closeSilently(parcelFileDescriptor);
                bitmap3 = safeDecodeFileDescriptor;
            } else {
                try {
                    GLUtils.getType(safeDecodeFileDescriptor);
                    bitmap3 = safeDecodeFileDescriptor;
                } catch (IllegalArgumentException e4) {
                    try {
                        e4.printStackTrace();
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("decoded bitmap type error, IllegalArgumentException:");
                        sb4.append(e4.getMessage());
                        Log.w("DecodeService", sb4.toString());
                        bitmap3 = ensureGLCompatibleBitmap(safeDecodeFileDescriptor);
                    } catch (OutOfMemoryError e5) {
                        e = e5;
                        fileInputStream2 = fileInputStream;
                        bitmap2 = safeDecodeFileDescriptor;
                        fileInputStream4 = fileInputStream2;
                        StringBuilder sb322 = new StringBuilder();
                        sb322.append("Decode and fit is out of memory: ");
                        sb322.append(e.toString());
                        Log.e("DecodeService", sb322.toString());
                        galleryOptions.inSampleSize *= 2;
                        GalleryUtils.closeStream(fileInputStream4);
                        Utils.closeSilently(parcelFileDescriptor);
                        bitmap3 = bitmap;
                    } catch (Throwable th42) {
                    }
                }
                if (!BitmapUtils.isBitmapInScreen(bitmap3.getWidth(), bitmap3.getHeight(), i, i2)) {
                    bitmap3 = BitmapUtils.fitBitmapToScreen(bitmap3, i, i2, true);
                }
                galleryOptions.inSampleSize *= 2;
                GalleryUtils.closeStream(fileInputStream);
                Utils.closeSilently(parcelFileDescriptor);
            }
            fileInputStream4 = fileInputStream;
        }
        return considerOrientation(bitmap3, ExifUtil.parseRotationInfo(str, null));
    }
}
