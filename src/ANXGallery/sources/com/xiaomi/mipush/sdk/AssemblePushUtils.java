package com.xiaomi.mipush.sdk;

import android.content.ComponentName;
import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.reflect.JavaCalls;

public class AssemblePushUtils {
    private static int isGoogleServiceSatisfied = -1;

    public static PhoneBrand getPhoneBrand(Context context) {
        try {
            return (context.getPackageManager().getServiceInfo(new ComponentName("com.huawei.hwid", "com.huawei.hms.core.service.HMSCoreService"), 128) == null || !isAvailableEMUI()) ? PhoneBrand.OTHER : PhoneBrand.HUAWEI;
        } catch (Exception unused) {
            return PhoneBrand.OTHER;
        }
    }

    private static boolean isAvailableEMUI() {
        try {
            String str = (String) JavaCalls.callStaticMethod("android.os.SystemProperties", "get", "ro.build.hw_emui_api_level", "");
            return !TextUtils.isEmpty(str) && Integer.parseInt(str) >= 9;
        } catch (Exception e) {
            MyLog.e((Throwable) e);
        }
    }

    public static boolean isColorOSPushSupport(Context context) {
        boolean z = false;
        Object callStaticMethod = JavaCalls.callStaticMethod("com.xiaomi.assemble.control.COSPushManager", "isSupportPush", context);
        if (callStaticMethod != null && (callStaticMethod instanceof Boolean)) {
            z = ((Boolean) Boolean.class.cast(callStaticMethod)).booleanValue();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("color os push  is avaliable ? :");
        sb.append(z);
        MyLog.v(sb.toString());
        return z;
    }

    public static boolean isFunTouchOSPushSupport(Context context) {
        boolean z = false;
        Object callStaticMethod = JavaCalls.callStaticMethod("com.xiaomi.assemble.control.FTOSPushManager", "isSupportPush", context);
        if (callStaticMethod != null && (callStaticMethod instanceof Boolean)) {
            z = ((Boolean) Boolean.class.cast(callStaticMethod)).booleanValue();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("fun touch os push  is avaliable ? :");
        sb.append(z);
        MyLog.v(sb.toString());
        return z;
    }

    public static boolean isGoogleServiceSatisfied(Context context) {
        boolean z = false;
        Object callMethod = JavaCalls.callMethod(JavaCalls.callStaticMethod("com.google.android.gms.common.GoogleApiAvailability", "getInstance", new Object[0]), "isGooglePlayServicesAvailable", context);
        Object staticField = JavaCalls.getStaticField("com.google.android.gms.common.ConnectionResult", "SUCCESS");
        if (staticField == null || !(staticField instanceof Integer)) {
            MyLog.v("google service is not avaliable");
            isGoogleServiceSatisfied = 0;
            return false;
        }
        int intValue = ((Integer) Integer.class.cast(staticField)).intValue();
        if (callMethod != null) {
            if (callMethod instanceof Integer) {
                isGoogleServiceSatisfied = ((Integer) Integer.class.cast(callMethod)).intValue() == intValue ? 1 : 0;
            } else {
                isGoogleServiceSatisfied = 0;
                MyLog.v("google service is not avaliable");
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append("is google service can be used");
        sb.append(isGoogleServiceSatisfied > 0);
        MyLog.v(sb.toString());
        if (isGoogleServiceSatisfied > 0) {
            z = true;
        }
        return z;
    }
}
