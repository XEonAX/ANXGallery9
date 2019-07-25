package com.miui.security.net;

import android.content.Context;
import com.miui.core.SdkHelper;
import miui.provider.ExtraNetwork;

public class NetworkRestrict {
    public static boolean isMobileRestrict(Context context, String str) {
        return SdkHelper.IS_MIUI && ExtraNetwork.isMobileRestrict(context, str);
    }

    public static boolean isWifiRestrict(Context context, String str) {
        return SdkHelper.IS_MIUI && ExtraNetwork.isWifiRestrict(context, str);
    }
}
