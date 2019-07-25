package com.miui.os;

import com.miui.core.SdkHelper;
import miui.os.Build;

public interface Rom {
    public static final boolean IS_ALPHA = (SdkHelper.IS_MIUI && Build.IS_ALPHA_BUILD);
    public static final boolean IS_DEBUGGABLE;
    public static final boolean IS_DEV = (SdkHelper.IS_MIUI && Build.IS_DEVELOPMENT_VERSION);
    public static final boolean IS_INTERNATIONAL = Build.IS_INTERNATIONAL_BUILD;
    public static final boolean IS_MIUI = SdkHelper.IS_MIUI;
    public static final boolean IS_STABLE = (!SdkHelper.IS_MIUI || Build.IS_STABLE_VERSION);

    static {
        boolean z = true;
        if (!SdkHelper.IS_MIUI || !Build.IS_DEBUGGABLE) {
            z = false;
        }
        IS_DEBUGGABLE = z;
    }
}
