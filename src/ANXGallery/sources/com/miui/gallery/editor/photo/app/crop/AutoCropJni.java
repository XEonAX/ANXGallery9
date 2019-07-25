package com.miui.gallery.editor.photo.app.crop;

import com.miui.gallery.util.Log;

public class AutoCropJni {
    private static boolean sLoaded = true;

    static {
        try {
            System.loadLibrary("autocrop");
        } catch (Error e) {
            Log.w("AutoCropJni", "library load failed.\n", e);
        }
    }

    public static native int autoRotation(byte[] bArr, int i, int i2, AutoCropData autoCropData);

    public static boolean isAvailable() {
        return sLoaded;
    }
}
