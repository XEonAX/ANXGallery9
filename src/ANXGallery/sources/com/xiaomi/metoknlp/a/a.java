package com.xiaomi.metoknlp.a;

import android.os.Build;
import android.util.Log;
import java.lang.reflect.Field;

/* compiled from: NLPBuild */
public class a {
    private static boolean DEBUG = false;
    private static String TAG = "NLPBuild";
    private static String k = Build.BRAND;
    private static String l = Build.TYPE;
    private static Class m;
    private static Field n;
    private static Field o;
    private static Field p;
    private static Field q;

    static {
        boolean z = true;
        try {
            m = Class.forName("miui.os.Build");
            n = m.getField("IS_CTA_BUILD");
            o = m.getField("IS_ALPHA_BUILD");
            p = m.getField("IS_DEVELOPMENT_VERSION");
            q = m.getField("IS_STABLE_VERSION");
            z = false;
        } catch (ClassNotFoundException | Exception | NoSuchFieldException unused) {
        }
        if (z) {
            m = null;
            n = null;
            o = null;
            p = null;
            q = null;
        }
    }

    public static boolean q() {
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("brand=");
            sb.append(k);
            Log.d(str, sb.toString());
        }
        return k != null && k.equalsIgnoreCase("xiaomi");
    }

    public static String r() {
        StringBuilder sb = new StringBuilder();
        sb.append("3rdROM-");
        sb.append(l);
        return sb.toString();
    }

    public static boolean s() {
        if (!(!q() || m == null || o == null)) {
            try {
                boolean z = o.getBoolean(m);
                if (DEBUG) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("is alpha version=");
                    sb.append(z);
                    Log.d(str, sb.toString());
                }
                return z;
            } catch (IllegalAccessException unused) {
            }
        }
        return false;
    }

    public static boolean t() {
        if (!(!q() || m == null || p == null)) {
            try {
                boolean z = p.getBoolean(m);
                if (DEBUG) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("is dev version=");
                    sb.append(z);
                    Log.d(str, sb.toString());
                }
                return z;
            } catch (IllegalAccessException unused) {
            }
        }
        return false;
    }

    public static boolean u() {
        if (!(!q() || m == null || q == null)) {
            try {
                boolean z = q.getBoolean(m);
                if (DEBUG) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("is stable version=");
                    sb.append(z);
                    Log.d(str, sb.toString());
                }
                return z;
            } catch (IllegalAccessException unused) {
            }
        }
        return false;
    }
}
