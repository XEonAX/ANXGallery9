package com.xiaomi.channel.commonutils.android;

import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.reflect.JavaCalls;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class MIUIUtils {
    private static int isInXMS = -1;
    private static int isMIUI;
    private static Map<String, Region> locale2RegionMap;

    private static Region findServerRegionByLocale(String str) {
        initLocale2RegionMap();
        return (Region) locale2RegionMap.get(str.toUpperCase());
    }

    public static String getCountryCode() {
        String str = SystemProperties.get("ro.miui.region", "");
        if (TextUtils.isEmpty(str)) {
            str = SystemProperties.get("ro.product.locale.region", "");
        }
        if (TextUtils.isEmpty(str)) {
            str = SystemProperties.get("persist.sys.country", "");
        }
        return TextUtils.isEmpty(str) ? Locale.getDefault().getCountry() : str;
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0027 A[Catch:{ Throwable -> 0x002c }] */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0028 A[Catch:{ Throwable -> 0x002c }] */
    public static synchronized int getIsMIUI() {
        int i;
        boolean z;
        synchronized (MIUIUtils.class) {
            if (isMIUI == 0) {
                try {
                    int i2 = 1;
                    if (TextUtils.isEmpty(getProperty("ro.miui.ui.version.code"))) {
                        if (TextUtils.isEmpty(getProperty("ro.miui.ui.version.name"))) {
                            z = false;
                            if (z) {
                                i2 = 2;
                            }
                            isMIUI = i2;
                            StringBuilder sb = new StringBuilder();
                            sb.append("isMIUI's value is: ");
                            sb.append(isMIUI);
                            MyLog.i(sb.toString());
                        }
                    }
                    z = true;
                    if (z) {
                    }
                    isMIUI = i2;
                } catch (Throwable th) {
                    MyLog.e("get isMIUI failed", th);
                    isMIUI = 0;
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append("isMIUI's value is: ");
                sb2.append(isMIUI);
                MyLog.i(sb2.toString());
            }
            i = isMIUI;
        }
        return i;
    }

    public static synchronized String getMIUIType() {
        synchronized (MIUIUtils.class) {
            int mIUIType = SystemUtils.getMIUIType();
            if (!isMIUI() || mIUIType <= 0) {
                String str = "";
                return str;
            } else if (mIUIType < 2) {
                String str2 = "alpha";
                return str2;
            } else if (mIUIType < 3) {
                String str3 = "development";
                return str3;
            } else {
                String str4 = "stable";
                return str4;
            }
        }
    }

    public static String getProperty(String str) {
        try {
            return (String) JavaCalls.callStaticMethod("android.os.SystemProperties", "get", str, "");
        } catch (Exception e) {
            MyLog.e((Throwable) e);
        } catch (Throwable unused) {
        }
        return null;
    }

    public static Region getRegion(String str) {
        Region findServerRegionByLocale = findServerRegionByLocale(str);
        return findServerRegionByLocale == null ? Region.Global : findServerRegionByLocale;
    }

    private static void initLocale2RegionMap() {
        if (locale2RegionMap == null) {
            locale2RegionMap = new HashMap();
            locale2RegionMap.put("CN", Region.China);
            locale2RegionMap.put("FI", Region.Europe);
            locale2RegionMap.put("SE", Region.Europe);
            locale2RegionMap.put("NO", Region.Europe);
            locale2RegionMap.put("FO", Region.Europe);
            locale2RegionMap.put("EE", Region.Europe);
            locale2RegionMap.put("LV", Region.Europe);
            locale2RegionMap.put("LT", Region.Europe);
            locale2RegionMap.put("BY", Region.Europe);
            locale2RegionMap.put("MD", Region.Europe);
            locale2RegionMap.put("UA", Region.Europe);
            locale2RegionMap.put("PL", Region.Europe);
            locale2RegionMap.put("CZ", Region.Europe);
            locale2RegionMap.put("SK", Region.Europe);
            locale2RegionMap.put("HU", Region.Europe);
            locale2RegionMap.put("DE", Region.Europe);
            locale2RegionMap.put("AT", Region.Europe);
            locale2RegionMap.put("CH", Region.Europe);
            locale2RegionMap.put("LI", Region.Europe);
            locale2RegionMap.put("GB", Region.Europe);
            locale2RegionMap.put("IE", Region.Europe);
            locale2RegionMap.put("NL", Region.Europe);
            locale2RegionMap.put("BE", Region.Europe);
            locale2RegionMap.put("LU", Region.Europe);
            locale2RegionMap.put("FR", Region.Europe);
            locale2RegionMap.put("RO", Region.Europe);
            locale2RegionMap.put("BG", Region.Europe);
            locale2RegionMap.put("RS", Region.Europe);
            locale2RegionMap.put("MK", Region.Europe);
            locale2RegionMap.put("AL", Region.Europe);
            locale2RegionMap.put("GR", Region.Europe);
            locale2RegionMap.put("SI", Region.Europe);
            locale2RegionMap.put("HR", Region.Europe);
            locale2RegionMap.put("IT", Region.Europe);
            locale2RegionMap.put("SM", Region.Europe);
            locale2RegionMap.put("MT", Region.Europe);
            locale2RegionMap.put("ES", Region.Europe);
            locale2RegionMap.put("PT", Region.Europe);
            locale2RegionMap.put("AD", Region.Europe);
            locale2RegionMap.put("CY", Region.Europe);
            locale2RegionMap.put("DK", Region.Europe);
            locale2RegionMap.put("RU", Region.Russia);
            locale2RegionMap.put("IN", Region.India);
        }
    }

    public static boolean isGlobalRegion() {
        return !Region.China.name().equalsIgnoreCase(getRegion(getCountryCode()).name());
    }

    public static synchronized boolean isMIUI() {
        boolean z;
        synchronized (MIUIUtils.class) {
            z = true;
            if (getIsMIUI() != 1) {
                z = false;
            }
        }
        return z;
    }

    public static synchronized boolean isNotMIUI() {
        boolean z;
        synchronized (MIUIUtils.class) {
            z = getIsMIUI() == 2;
        }
        return z;
    }

    public static boolean isXMS() {
        if (isInXMS < 0) {
            Object callStaticMethod = JavaCalls.callStaticMethod("miui.external.SdkHelper", "isMiuiSystem", new Object[0]);
            isInXMS = 0;
            if (callStaticMethod != null && (callStaticMethod instanceof Boolean) && !((Boolean) Boolean.class.cast(callStaticMethod)).booleanValue()) {
                isInXMS = 1;
            }
        }
        return isInXMS > 0;
    }
}
