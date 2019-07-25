package com.xiaomi.channel.commonutils.android;

import android.content.Context;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.reflect.JavaCalls;

public class SystemUtils {
    private static String cachedMOSVersion;
    private static Context sContext;

    private static String getCOSVersion() {
        String str = SystemProperties.get("ro.build.version.opporom", "");
        if (!TextUtils.isEmpty(str) && !str.startsWith("ColorOS_")) {
            StringBuilder sb = new StringBuilder();
            sb.append("ColorOS_");
            sb.append(str);
            cachedMOSVersion = sb.toString();
        }
        return cachedMOSVersion;
    }

    public static Context getContext() {
        return sContext;
    }

    private static String getEMUIVersion() {
        cachedMOSVersion = SystemProperties.get("ro.build.version.emui", "");
        return cachedMOSVersion;
    }

    private static String getFOSVersion() {
        String str = SystemProperties.get("ro.vivo.os.version", "");
        if (!TextUtils.isEmpty(str) && !str.startsWith("FuntouchOS_")) {
            StringBuilder sb = new StringBuilder();
            sb.append("FuntouchOS_");
            sb.append(str);
            cachedMOSVersion = sb.toString();
        }
        return cachedMOSVersion;
    }

    public static String getMIID(Context context) {
        if (MIUIUtils.isNotMIUI()) {
            return "";
        }
        String str = (String) JavaCalls.callStaticMethod("com.xiaomi.xmsf.helper.MIIDAccountHelper", "getMIID", context);
        return TextUtils.isEmpty(str) ? MovieStatUtils.DOWNLOAD_SUCCESS : str;
    }

    public static int getMIUIType() {
        try {
            Class cls = Class.forName("miui.os.Build");
            if (cls.getField("IS_STABLE_VERSION").getBoolean(null)) {
                return 3;
            }
            return cls.getField("IS_DEVELOPMENT_VERSION").getBoolean(null) ? 2 : 1;
        } catch (Exception unused) {
            return 0;
        }
    }

    public static synchronized String getManufacturerOSVersion() {
        String str;
        synchronized (SystemUtils.class) {
            if (cachedMOSVersion != null) {
                String str2 = cachedMOSVersion;
                return str2;
            }
            String str3 = VERSION.INCREMENTAL;
            if (getMIUIType() <= 0) {
                str = getEMUIVersion();
                if (TextUtils.isEmpty(str)) {
                    str = getCOSVersion();
                    if (TextUtils.isEmpty(str)) {
                        str = getFOSVersion();
                        if (TextUtils.isEmpty(str)) {
                            StringBuilder sb = new StringBuilder();
                            sb.append(SystemProperties.get("ro.product.brand", "Android"));
                            sb.append("_");
                            sb.append(str3);
                            str3 = String.valueOf(sb.toString());
                        }
                    }
                }
                cachedMOSVersion = str;
                return str;
            }
            str = str3;
            cachedMOSVersion = str;
            return str;
        }
    }

    public static void initialize(Context context) {
        sContext = context.getApplicationContext();
    }

    public static boolean isBootCompleted() {
        return TextUtils.equals((String) JavaCalls.callStaticMethod("android.os.SystemProperties", "get", "sys.boot_completed"), "1");
    }

    public static boolean isDebuggable(Context context) {
        boolean z = false;
        try {
            if ((context.getApplicationInfo().flags & 2) != 0) {
                z = true;
            }
            return z;
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            return false;
        }
    }

    public static boolean isGlobalVersion() {
        try {
            return Class.forName("miui.os.Build").getField("IS_GLOBAL_BUILD").getBoolean(Boolean.valueOf(false));
        } catch (ClassNotFoundException unused) {
            MyLog.e("miui.os.Build ClassNotFound");
            return false;
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            return false;
        }
    }
}
