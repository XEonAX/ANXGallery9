package com.xiaomi.mipush.sdk;

import com.nexstreaming.nexeditorsdk.nexProject;
import com.xiaomi.channel.commonutils.misc.BuildSettings;

public class Constants {
    public static final int[] ASSEMBLE_PUSH_RETRY_DELAY = {nexProject.kAutoThemeTransitionDuration, 4000, 8000};

    protected static int getEnvType() {
        return BuildSettings.getEnvType();
    }
}
