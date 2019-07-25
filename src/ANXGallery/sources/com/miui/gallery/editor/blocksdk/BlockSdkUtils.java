package com.miui.gallery.editor.blocksdk;

import android.graphics.Bitmap;

public class BlockSdkUtils {
    static {
        System.loadLibrary("gallery_block_sdk");
    }

    public static native boolean bindBitmap(Bitmap bitmap);

    public static native void readPixelsAndMerge(int i, int i2, int i3, int i4, int i5);

    public static native boolean unbindBitmap(Bitmap bitmap);

    public static native void updateTextureWidthStride(int i, int i2, int i3, int i4, int i5);
}
