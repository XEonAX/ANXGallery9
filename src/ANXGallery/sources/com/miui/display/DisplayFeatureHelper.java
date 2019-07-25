package com.miui.display;

import com.miui.core.SdkHelper;
import com.miui.internal.GalleryDisplayFeatureManager;

public class DisplayFeatureHelper {
    public static void setScreenEffect(boolean z) {
        if (SdkHelper.IS_MIUI) {
            GalleryDisplayFeatureManager.setScreenEffect(z);
        }
    }
}
