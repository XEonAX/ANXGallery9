package com.xiaomi.mistatistic.sdk;

import android.content.ContentResolver;
import android.content.Context;
import android.os.Build.VERSION;
import android.provider.Settings.Global;
import android.util.Log;
import com.xiaomi.mistatistic.sdk.controller.d;
import com.xiaomi.mistatistic.sdk.controller.j;
import com.xiaomi.mistatistic.sdk.controller.t;
import java.lang.reflect.Method;

public class BuildSetting {
    private static boolean a = false;
    private static boolean b = false;
    private static Boolean c = null;
    private static boolean d = true;
    private static long e = 60000;
    private static long f;

    private static boolean a() {
        try {
            Object obj = Class.forName("miui.os.Build").getField("IS_ALPHA_BUILD").get(null);
            if (obj instanceof Boolean) {
                return ((Boolean) obj).booleanValue();
            }
        } catch (Exception e2) {
            j.a("BS", "isAlphaBuild exception:", (Throwable) e2);
        }
        return false;
    }

    private static boolean b() {
        try {
            Object obj = Class.forName("miui.os.Build").getField("IS_DEVELOPMENT_VERSION").get(null);
            if (obj instanceof Boolean) {
                return ((Boolean) obj).booleanValue();
            }
        } catch (Exception e2) {
            j.a("BS", "isDevBuild exception:", (Throwable) e2);
        }
        return false;
    }

    private static boolean c() {
        try {
            Object obj = Class.forName("miui.os.Build").getField("IS_STABLE_VERSION").get(null);
            if (obj instanceof Boolean) {
                return ((Boolean) obj).booleanValue();
            }
        } catch (Exception e2) {
            j.a("BS", "isStableBuild exception:", (Throwable) e2);
        }
        return false;
    }

    public static String getMiuiBuildCode() {
        return !t.d(d.a()) ? "" : c() ? "S" : b() ? "D" : a() ? "A" : "";
    }

    public static boolean isCTABuild() {
        try {
            if (t.d(d.a())) {
                return ((Boolean) Class.forName("miui.os.Build").getField("IS_CTA_BUILD").get(null)).booleanValue();
            }
            return false;
        } catch (Exception e2) {
            j.a("BS", "isCTABuild exception:", (Throwable) e2);
            return false;
        }
    }

    public static boolean isDisabled(Context context) {
        if (!d) {
            StringBuilder sb = new StringBuilder();
            sb.append("uploading is disabled? false, sRespectUEP ");
            sb.append(d);
            j.b(sb.toString());
            return false;
        }
        if (c == null || t.a(f, e)) {
            if (!t.d(context) || !t.e(context)) {
                c = Boolean.valueOf(false);
            } else {
                c = Boolean.valueOf(!isUserExperienceProgramEnabled(context));
            }
            f = System.currentTimeMillis();
        }
        return c.booleanValue();
    }

    public static boolean isInternationalBuild() {
        try {
            if (!t.d(d.a())) {
                return false;
            }
            return ((Boolean) Class.forName("miui.os.Build").getField("IS_INTERNATIONAL_BUILD").get(null)).booleanValue();
        } catch (Exception e2) {
            j.a("BS", "isInternationalBuild exception:", (Throwable) e2);
            return false;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:? A[RETURN, SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:9:0x001e  */
    public static boolean isMiTvExperienceUploadGrantedByUser(Context context) {
        int i;
        try {
            if (VERSION.SDK_INT >= 17) {
                i = Global.getInt(context.getContentResolver(), "user_experience_enabled", 1);
                return i != 1;
            }
        } catch (Exception e2) {
            j.a("BS", "isMiTvExperienceUploadGrantedByUser exception:", (Throwable) e2);
        }
        i = 1;
        if (i != 1) {
        }
    }

    public static boolean isRespectUEP() {
        return d;
    }

    public static boolean isSelfStats() {
        return b;
    }

    public static boolean isTestNetworkEnabled() {
        return a;
    }

    public static boolean isUploadDebugLogEnable(Context context) {
        boolean z;
        if (!t.b()) {
            Log.w("MI_STAT", "The statistics is disabled.");
            return true;
        } else if (context == null) {
            Log.e(j.b(), "isUploadDebugLogEnable: context is null.");
            return true;
        } else if (!t.d(context)) {
            return true;
        } else {
            try {
                Method declaredMethod = Class.forName("android.provider.MiuiSettings$Secure").getDeclaredMethod("isUploadDebugLogEnable", new Class[]{ContentResolver.class});
                declaredMethod.setAccessible(true);
                z = ((Boolean) declaredMethod.invoke(null, new Object[]{context.getContentResolver()})).booleanValue();
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("isUploadDebugLogEnable: ");
                    sb.append(z);
                    j.a(sb.toString());
                } catch (Exception e2) {
                    e = e2;
                }
            } catch (Exception e3) {
                e = e3;
                z = true;
                j.a("BS", "isUploadDebugLogEnable exception:", (Throwable) e);
                return z;
            }
            return z;
        }
    }

    public static boolean isUserExperienceProgramEnabled(Context context) {
        boolean booleanValue;
        boolean z = true;
        if (!t.d(context) && !t.g(context)) {
            return true;
        }
        try {
            if (t.g(context)) {
                booleanValue = isMiTvExperienceUploadGrantedByUser(context);
            } else {
                Method declaredMethod = Class.forName("android.provider.MiuiSettings$Secure").getDeclaredMethod("isUserExperienceProgramEnable", new Class[]{ContentResolver.class});
                declaredMethod.setAccessible(true);
                booleanValue = ((Boolean) declaredMethod.invoke(null, new Object[]{context.getContentResolver()})).booleanValue();
            }
            z = booleanValue;
        } catch (Exception e2) {
            j.a("BS", "isUserExperienceProgramEnabled exception:", (Throwable) e2);
        }
        return z;
    }
}
