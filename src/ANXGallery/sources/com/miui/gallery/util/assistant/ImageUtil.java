package com.miui.gallery.util.assistant;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.text.TextUtils;
import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.util.Log;
import java.nio.ByteBuffer;

public class ImageUtil {
    public static int calculateInSampleSize(Options options, int i, int i2) {
        int i3 = options.outHeight;
        int i4 = options.outWidth;
        int i5 = 1;
        while (true) {
            i4 >>= 1;
            if (i4 < i) {
                break;
            }
            i3 >>= 1;
            if (i3 < i2) {
                break;
            }
            i5 <<= 1;
        }
        return i5;
    }

    public static byte[] getPixelsBGR(Bitmap bitmap) {
        ByteBuffer allocate = ByteBuffer.allocate(bitmap.getByteCount());
        bitmap.copyPixelsToBuffer(allocate);
        byte[] array = allocate.array();
        byte[] bArr = new byte[((array.length / 4) * 3)];
        for (int i = 0; i < array.length / 4; i++) {
            int i2 = i * 3;
            int i3 = i * 4;
            bArr[i2] = array[i3 + 2];
            bArr[i2 + 1] = array[i3 + 1];
            bArr[i2 + 2] = array[i3];
        }
        return bArr;
    }

    public static Bitmap getScaledBitmap(String str) {
        Bitmap bitmap;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        Options options = new Options();
        options.inPreferredConfig = Config.ARGB_8888;
        options.inJustDecodeBounds = true;
        try {
            BitmapFactory.decodeFile(str, options);
            if (options.outWidth >= 224) {
                if (options.outHeight >= 224) {
                    options.inSampleSize = calculateInSampleSize(options, 400, 400);
                    options.inJustDecodeBounds = false;
                    options.inBitmap = ImageFeatureManager.getInstance().getReusedBitMap(options);
                    bitmap = BitmapFactory.decodeFile(str, options);
                    return bitmap;
                }
            }
            return null;
        } catch (Exception e) {
            Log.e("ImageUtil", (Throwable) e);
            bitmap = null;
        }
    }
}
