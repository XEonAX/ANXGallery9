package com.miui.gallery.sdk.editor;

import miui.external.SdkHelper;

public interface Constants {
    public static final String EXTRA_IS_LONG_SCREENSHOT = "IsLongScreenshot";
    public static final String EXTRA_IS_SCREENSHOT = "IsScreenshot";

    static {
        boolean isMiuiSystem = SdkHelper.isMiuiSystem();
        boolean isMiuiSystem2 = SdkHelper.isMiuiSystem();
    }
}
