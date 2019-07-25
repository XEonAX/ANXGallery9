package com.miui.internal;

import android.os.Build;
import android.os.Build.VERSION;
import miui.hardware.display.DisplayFeatureManager;

public class GalleryDisplayFeatureManager {
    private static boolean isDeviceSupportSetEffect() {
        return Build.DEVICE.equalsIgnoreCase("vela") && VERSION.SDK_INT >= 24;
    }

    public static void setScreenEffect(boolean z) {
        if (isDeviceSupportSetEffect()) {
            try {
                DisplayFeatureManager.getInstance().setScreenEffect(14, z ? 1 : 0);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
