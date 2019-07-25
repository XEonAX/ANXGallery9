package com.nexstreaming.app.common.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Build.VERSION;
import android.preference.PreferenceManager;
import android.provider.Settings.Secure;
import android.util.Log;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;
import org.keyczar.Keyczar;

/* compiled from: UserInfo */
public class o {
    public static int a() {
        return VERSION.SDK_INT;
    }

    public static String a(Context context) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        String string = defaultSharedPreferences.getString("nex_tl_app_id", null);
        if (string != null) {
            return string;
        }
        String string2 = a() >= 9 ? Secure.getString(context.getContentResolver(), "android_id") : UUID.randomUUID().toString();
        String c = c(context);
        StringBuilder sb = new StringBuilder();
        sb.append(string2);
        sb.append(c);
        String a = a(sb.toString());
        if (a != null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("deviceId length : ");
            sb2.append(a.length());
            Log.d("[UserInfo]", sb2.toString());
            StringBuilder sb3 = new StringBuilder();
            sb3.append("deviceId : ");
            sb3.append(a);
            Log.d("[UserInfo]", sb3.toString());
            defaultSharedPreferences.edit().putString("nex_tl_app_id", a).commit();
        }
        return a;
    }

    private static String a(String str) {
        try {
            MessageDigest instance = MessageDigest.getInstance("MD5");
            instance.update(str.getBytes());
            byte[] digest = instance.digest();
            StringBuffer stringBuffer = new StringBuffer();
            for (byte b : digest) {
                stringBuffer.append(Integer.toString((b & 255) + Keyczar.FORMAT_VERSION, 16).substring(1));
            }
            return stringBuffer.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String b() {
        String b = NexEditor.b("ro.board.platform");
        if (b != null && b.trim().equalsIgnoreCase("msm8960")) {
            String b2 = NexEditor.b("ro.product.board");
            if (b2 != null && b2.trim().equalsIgnoreCase("8x30")) {
                b = "MSM8x30n";
            }
        }
        if (b != null && b.equalsIgnoreCase("exynos5")) {
            String b3 = NexEditor.b("ro.product.board");
            if (b3 != null && b3.equalsIgnoreCase("universal7420")) {
                b = b3;
            }
        }
        if (b == null || b.trim().length() < 1) {
            b = NexEditor.b("ro.mediatek.platform");
        }
        if (b == null || b.trim().length() < 1) {
            b = NexEditor.b("ro.hardware");
        }
        return (b == null || b.trim().length() < 1) ? "unknown" : b;
    }

    public static String b(Context context) {
        ApplicationInfo applicationInfo;
        PackageManager packageManager = context.getPackageManager();
        try {
            applicationInfo = packageManager.getApplicationInfo(context.getPackageName(), 0);
        } catch (NameNotFoundException unused) {
            applicationInfo = null;
        }
        String str = (String) (applicationInfo != null ? packageManager.getApplicationLabel(applicationInfo) : "(unknown)");
        StringBuilder sb = new StringBuilder();
        sb.append("appName : ");
        sb.append(str);
        Log.d("[UserInfo]", sb.toString());
        return str;
    }

    public static String c(Context context) {
        String str;
        String str2 = "";
        try {
            str = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).packageName;
        } catch (NameNotFoundException e) {
            e.printStackTrace();
            str = str2;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("package : ");
        sb.append(str);
        Log.d("[UserInfo]", sb.toString());
        return str;
    }

    public static String d(Context context) {
        String str;
        String str2 = "";
        try {
            str = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (NameNotFoundException e) {
            e.printStackTrace();
            str = str2;
        }
        Log.e("[UserInfo]", "Version Information ===== ");
        StringBuilder sb = new StringBuilder();
        sb.append("version name : ");
        sb.append(str);
        Log.e("[UserInfo]", sb.toString());
        return str;
    }
}
