package com.miui.gallery.editor.photo.app.crop;

import android.graphics.Bitmap;
import com.miui.gallery.util.Log;

public class AutoCropUtils {
    public static void getAutoCropData(Bitmap bitmap, AutoCropData autoCropData) {
        Log.d("AutoCropUtils", "autoCrop start");
        if (bitmap == null || !AutoCropJni.isAvailable()) {
            autoCropData.rotationResult = -1;
            return;
        }
        if (bitmap != null) {
            bitmap = bitmap.getWidth() > bitmap.getHeight() ? Bitmap.createScaledBitmap(bitmap, 640, (bitmap.getHeight() * 640) / bitmap.getWidth(), true) : Bitmap.createScaledBitmap(bitmap, (bitmap.getWidth() * 640) / bitmap.getHeight(), 640, true);
        }
        autoCropData.rotationResult = AutoCropJni.autoRotation(getGrayBytes(bitmap), bitmap.getWidth(), bitmap.getHeight(), autoCropData);
        Log.d("AutoCropUtils", "autoCrop result: %f: %d", Double.valueOf(autoCropData.angle), Integer.valueOf(autoCropData.rotationResult));
    }

    private static byte[] getGrayBytes(Bitmap bitmap) {
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        int i = width * height;
        int[] iArr = new int[i];
        byte[] bArr = new byte[i];
        bitmap.getPixels(iArr, 0, width, 0, 0, width, height);
        for (int i2 = 0; i2 < height; i2++) {
            for (int i3 = 0; i3 < width; i3++) {
                int i4 = (width * i2) + i3;
                int i5 = iArr[i4];
                int i6 = (65280 & i5) >> 8;
                int i7 = i5 & 255;
                double d = (double) ((float) ((16711680 & i5) >> 16));
                Double.isNaN(d);
                double d2 = d * 0.3d;
                double d3 = (double) ((float) i6);
                Double.isNaN(d3);
                double d4 = d2 + (d3 * 0.59d);
                double d5 = (double) ((float) i7);
                Double.isNaN(d5);
                bArr[i4] = (byte) ((int) (d4 + (d5 * 0.11d)));
            }
        }
        return bArr;
    }
}
