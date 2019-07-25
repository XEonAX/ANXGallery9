package com.nexstreaming.kminternal.kinemaster.config;

import android.os.Build;
import android.os.Environment;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor;
import com.nexstreaming.nexeditorsdk.BuildConfig;
import java.io.File;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.TimeZone;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

public final class EditorGlobal {
    public static final String[] a = {".jpg", ".jpeg", ".png", ".webp"};
    public static final String[] b = {".mp4", ".3gp", ".3gpp", ".mov", ".k3g", ".acc", ".avi", ".wmv"};
    public static final String[] c = {".aac", ".mp3", ".3gp", ".3gpp"};
    public static final String d = null;
    public static final boolean e = (m != Edition.DeviceLock);
    public static final VersionType f = VersionType.RC;
    public static final DataUsage g = (m == Edition.PlayStore ? DataUsage.WIFI_AND_MOBILE : DataUsage.ASK_WIFI_MOBILE_NEVER);
    public static final boolean h = (m == Edition.DeviceLock);
    public static final String i = null;
    public static final boolean j = (m == Edition.PlayStore);
    public static final boolean k;
    public static final Executor l = Executors.newCachedThreadPool();
    private static final Edition m = BuildConfig.KM_EDITION;
    private static final Date n = a(0, 0, 0);
    private static String o = "KineMaster";

    public enum DataUsage {
        WIFI_AND_MOBILE,
        WIFI_ONLY,
        NEVER,
        ASK_WIFI_OR_MOBILE,
        ASK_WIFI_MOBILE_NEVER
    }

    public enum Edition {
        DeviceLock,
        TimeLock,
        PlayStore
    }

    public enum VersionType {
        Alpha,
        Beta,
        Dev,
        RC,
        Release
    }

    static {
        boolean z = false;
        if (m == Edition.PlayStore) {
            z = true;
        }
        k = z;
    }

    public static NexEditor a() {
        if (a.a() != null) {
            return a.a().c();
        }
        return null;
    }

    private static Date a(int i2, int i3, int i4) {
        return a(i2, i3, i4, 0, 0, 0);
    }

    private static Date a(int i2, int i3, int i4, int i5, int i6, int i7) {
        GregorianCalendar gregorianCalendar = new GregorianCalendar(TimeZone.getTimeZone("GMT"));
        gregorianCalendar.set(i2, i3 - 1, i4, i5, i6, i7);
        return gregorianCalendar.getTime();
    }

    public static void a(String str) {
        o = str;
    }

    public static final boolean a(int i2) {
        return i2 > 0;
    }

    public static String b() {
        return "keepfileFG2HJ6D4";
    }

    public static String b(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("com.nexstreaming.kinemaster.builtin.watermark.");
        sb.append(str);
        return c(sb.toString());
    }

    public static int c() {
        int i2;
        int i3 = 0;
        if (m == Edition.DeviceLock) {
            i2 = 0;
            while (i3 < 4) {
                i2 = (i2 << 8) | 32;
                i3++;
            }
        } else if (m == Edition.TimeLock || m == Edition.PlayStore) {
            int i4 = 33878;
            while (i3 < 1) {
                i4 = (i2 << 16) | 10309;
                i3++;
            }
        } else {
            i2 = 0;
        }
        return (i2 ^ 323616768) ^ 38286;
    }

    private static String c(String str) {
        if (str == null) {
            return null;
        }
        String str2 = "Ax/VXn_zsAiwFi[CITPC;y2c}*0B'S0-7&QznQlMa6U9gmSoighZeC&@$-hAaXiN";
        StringBuilder sb = new StringBuilder();
        int length = str.length();
        Random random = new Random();
        char[] cArr = new char[8];
        for (int i2 = 0; i2 < cArr.length; i2++) {
            cArr[i2] = (char) (((random.nextInt() & 268435455) % 94) + 32);
        }
        char c2 = cArr[0] ^ '?';
        char c3 = cArr[1] ^ 129;
        sb.append(cArr);
        for (int i3 = 0; i3 < length; i3++) {
            char charAt = str2.charAt((c2 + i3) % 64);
            sb.append((char) ((((((str.charAt(i3) - ' ') + charAt) - cArr[(c3 + i3) % 8]) + 188) % 94) + 32));
        }
        return sb.toString();
    }

    public static String d() {
        return Build.MODEL;
    }

    public static File e() {
        return Environment.getExternalStorageDirectory();
    }

    public static File f() {
        StringBuilder sb = new StringBuilder();
        sb.append(e().getAbsolutePath());
        sb.append(File.separator);
        sb.append(o);
        return new File(sb.toString());
    }

    public static File g() {
        StringBuilder sb = new StringBuilder();
        sb.append(e().getAbsolutePath());
        sb.append(File.separator);
        sb.append(o);
        sb.append(File.separator);
        sb.append("Plugins");
        return new File(sb.toString());
    }

    public static File h() {
        StringBuilder sb = new StringBuilder();
        sb.append(e().getAbsolutePath());
        sb.append(File.separator);
        sb.append(o);
        sb.append(File.separator);
        sb.append("AssetPlugins");
        return new File(sb.toString());
    }

    public static File i() {
        StringBuilder sb = new StringBuilder();
        sb.append(e().getAbsolutePath());
        sb.append(File.separator);
        sb.append(o);
        sb.append(File.separator);
        sb.append("Projects");
        sb.append(File.separator);
        sb.append("Overlays");
        return new File(sb.toString());
    }
}
