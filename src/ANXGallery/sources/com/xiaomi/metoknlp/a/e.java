package com.xiaomi.metoknlp.a;

import com.miui.gallery.movie.utils.MovieStatUtils;
import com.xiaomi.metoknlp.MetokApplication;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;

/* compiled from: Utils */
public final class e {
    private static String ag;
    private static String ah;
    private static String ai;

    public static String V() {
        if (ai != null && !ai.isEmpty()) {
            return ai;
        }
        ai = c.get("ro.build.version.incremental", "");
        return ai;
    }

    public static String W() {
        return !a.q() ? a.r() : !c.get("ro.product.locale.region", "CN").equals("CN") ? "global" : a.s() ? "alpha" : a.t() ? "dev" : a.u() ? "stable" : "alpha";
    }

    public static String X() {
        String str = "";
        try {
            return MetokApplication.get().getPackageManager().getPackageInfo(MetokApplication.get().getPackageName(), 0).versionName;
        } catch (Exception e) {
            e.printStackTrace();
            return str;
        }
    }

    public static String Y() {
        return new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }

    public static boolean a(int i) {
        return i == 1;
    }

    public static String getDeviceModel() {
        if (ah != null && !ah.isEmpty()) {
            return ah;
        }
        ah = c.get("ro.product.model", "");
        ah = ah.replaceAll(" ", "");
        return ah;
    }

    public static String getImei() {
        if (ag != null) {
            return ag;
        }
        String o = o(d.getImei());
        if (o == null) {
            return o(c.get("ro.ril.miui.imei", ""));
        }
        ag = o;
        return ag;
    }

    public static int getMcc() {
        String networkOperator = d.getNetworkOperator();
        if (networkOperator == null) {
            return -1;
        }
        int length = networkOperator.length();
        if (!networkOperator.isEmpty() && length > 1) {
            try {
                return Integer.parseInt(networkOperator.substring(0, 3));
            } catch (Exception unused) {
            }
        }
        return -1;
    }

    public static int getMnc() {
        String networkOperator = d.getNetworkOperator();
        if (networkOperator == null) {
            return -1;
        }
        int length = networkOperator.length();
        if (!networkOperator.isEmpty() && length > 1) {
            try {
                return Integer.parseInt(networkOperator.substring(3));
            } catch (Exception unused) {
            }
        }
        return -1;
    }

    private static String o(String str) {
        if (str == null || str.isEmpty()) {
            return null;
        }
        if (str.startsWith(",") || str.endsWith(",")) {
            str = str.replace(",", "");
        }
        if (str.startsWith(MovieStatUtils.DOWNLOAD_SUCCESS)) {
            try {
                if (Long.parseLong(str) == 0) {
                    return null;
                }
            } catch (Exception unused) {
                return null;
            }
        }
        return str;
    }

    public static String p(String str) {
        byte[] digest;
        char[] cArr = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            byte[] bytes = str.getBytes();
            MessageDigest instance = MessageDigest.getInstance("MD5");
            instance.update(bytes);
            char[] cArr2 = new char[(r1 * 2)];
            int i = 0;
            for (byte b : instance.digest()) {
                int i2 = i + 1;
                cArr2[i] = cArr[(b >>> 4) & 15];
                i = i2 + 1;
                cArr2[i2] = cArr[b & 15];
            }
            return new String(cArr2);
        } catch (Exception unused) {
            return null;
        }
    }
}
