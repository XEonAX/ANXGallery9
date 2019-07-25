package com.miui.internal;

import android.security.ChooseLockSettingsHelper;

public class LockSettingsCompat {
    public static void setPrivateGalleryEnabled(ChooseLockSettingsHelper chooseLockSettingsHelper, boolean z) {
        chooseLockSettingsHelper.setPrivateGalleryEnabled(z);
    }
}
