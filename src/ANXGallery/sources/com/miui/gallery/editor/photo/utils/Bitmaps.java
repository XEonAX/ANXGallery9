package com.miui.gallery.editor.photo.utils;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.net.Uri;
import android.os.Build;
import android.support.media.ExifInterface;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.nexstreaming.nexeditorsdk.nexClip;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.HashMap;

public final class Bitmaps {
    public static Bitmap copyBitmap(Bitmap bitmap) {
        Bitmap bitmap2 = null;
        if (bitmap == null) {
            return null;
        }
        try {
            Bitmap copy = bitmap.copy(Config.ARGB_8888, true);
            if (bitmap != null) {
                bitmap.recycle();
            }
            bitmap2 = copy;
        } catch (OutOfMemoryError e) {
            String str = "Graphics";
            StringBuilder sb = new StringBuilder();
            sb.append("ensureBitmapSize error:");
            sb.append(e.toString());
            Log.e(str, sb.toString());
            HashMap hashMap = new HashMap();
            hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, "copy");
            hashMap.put("model", Build.MODEL);
            GallerySamplingStatHelper.recordCountEvent("photo_editor", "memory_error", hashMap);
            if (bitmap != null) {
                bitmap.recycle();
            }
        } catch (Throwable th) {
            if (bitmap != null) {
                bitmap.recycle();
            }
            throw th;
        }
        return bitmap2;
    }

    public static Bitmap copyBitmapInCaseOfRecycle(Bitmap bitmap) {
        try {
            return bitmap.copy(Config.ARGB_8888, true);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Bitmap decodeStream(InputStream inputStream, Options options) {
        try {
            return BitmapFactory.decodeStream(inputStream, null, options);
        } finally {
            IoUtils.close(inputStream);
        }
    }

    public static Bitmap decodeUri(Context context, Uri uri, Options options) throws FileNotFoundException {
        InputStream inputStream;
        try {
            inputStream = IoUtils.openInputStream(context, uri);
            try {
                Bitmap decodeStream = BitmapFactory.decodeStream(inputStream, null, options);
                IoUtils.close(inputStream);
                return decodeStream;
            } catch (Throwable th) {
                th = th;
                IoUtils.close(inputStream);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            inputStream = null;
            IoUtils.close(inputStream);
            throw th;
        }
    }

    public static Bitmap joinExif(Bitmap bitmap, int i, Options options) {
        Bitmap bitmap2;
        if (i == 0) {
            return bitmap;
        }
        if (bitmap != null) {
            Matrix matrix = new Matrix();
            matrix.preRotate((float) i);
            bitmap2 = Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
            bitmap.recycle();
        } else {
            bitmap2 = null;
        }
        if (!(options == null || i % nexClip.kClip_Rotate_180 == 0)) {
            int i2 = options.outWidth;
            options.outWidth = options.outHeight;
            options.outHeight = i2;
        }
        return bitmap2;
    }

    public static ExifInterface readExif(Context context, Uri uri) {
        InputStream openInputStream = IoUtils.openInputStream("Graphics", context, uri);
        if (openInputStream == null) {
            return null;
        }
        try {
            return (ExifInterface) ExifUtil.sSupportExifCreator.create(openInputStream);
        } finally {
            IoUtils.close("Graphics", openInputStream);
        }
    }

    public static Bitmap setConfig(Bitmap bitmap) {
        if (bitmap == null || bitmap.getConfig() != null) {
            return bitmap;
        }
        Bitmap copy = bitmap.copy(Config.ARGB_8888, true);
        bitmap.recycle();
        return copy;
    }
}
