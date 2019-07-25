package com.xiaomi.mistatistic.sdk.controller;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.os.Process;
import android.text.TextUtils;
import android.util.Log;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* compiled from: PrefsHelper */
public class m {
    private static String a;
    private static String b;
    private static ExecutorService c = Executors.newSingleThreadExecutor();

    public static int a(Context context, String str, int i) {
        if (context == null) {
            String d = j.d("PPU");
            StringBuilder sb = new StringBuilder();
            sb.append("Context is null, so return default value: ");
            sb.append(i);
            Log.w(d, sb.toString());
            return i;
        }
        try {
            return context.getSharedPreferences(d(context), 0).getInt(str, i);
        } catch (Exception e) {
            j.a("PPU", "getInt exception", (Throwable) e);
            return i;
        }
    }

    public static long a(Context context, String str, long j) {
        if (context == null) {
            String d = j.d("PPU");
            StringBuilder sb = new StringBuilder();
            sb.append("Context is null, so return default value: ");
            sb.append(j);
            Log.w(d, sb.toString());
            return j;
        }
        try {
            return context.getSharedPreferences(d(context), 0).getLong(str, j);
        } catch (Exception e) {
            j.a("PPU", "getLong exception", (Throwable) e);
            return j;
        }
    }

    public static String a(Context context, String str, String str2) {
        if (context == null) {
            String d = j.d("PPU");
            StringBuilder sb = new StringBuilder();
            sb.append("Context is null, so return default value: ");
            sb.append(str2);
            Log.w(d, sb.toString());
            return str2;
        }
        try {
            return context.getSharedPreferences(d(context), 0).getString(str, str2);
        } catch (Exception e) {
            j.a("PPU", "getString exception", (Throwable) e);
            return str2;
        }
    }

    private static void a(final Editor editor) {
        c.execute(new Runnable() {
            public void run() {
                if (!editor.commit()) {
                    Log.w(j.d("PPU"), "The commit of SharePref failed!");
                }
            }
        });
    }

    public static boolean a(Context context, String str) {
        if (context == null) {
            Log.w(j.d("PPU"), "Context is null, so return default value: false.");
            return false;
        }
        try {
            return context.getSharedPreferences(d(context), 0).getBoolean(str, false);
        } catch (Exception e) {
            j.a("PPU", "getBoolean exception", (Throwable) e);
            return false;
        }
    }

    public static boolean a(Context context, String str, boolean z) {
        if (context == null) {
            Log.w(j.d("PPU"), "Context is null, so return default value: false.");
            return z;
        }
        try {
            return context.getSharedPreferences(d(context), 0).getBoolean(str, z);
        } catch (Exception e) {
            j.a("PPU", "getBoolean exception", (Throwable) e);
            return z;
        }
    }

    public static void b(Context context) {
        if (context == null) {
            Log.w(j.d("PPU"), "Context is null, so do nothing.");
            return;
        }
        try {
            context.getSharedPreferences(c(context), 0).edit().clear().apply();
        } catch (Exception e) {
            j.a("PPU", "clearMonitors exception", (Throwable) e);
        }
    }

    public static void b(Context context, String str, int i) {
        if (context == null) {
            Log.w(j.d("PPU"), "Context is null, so do nothing.");
            return;
        }
        try {
            Editor edit = context.getSharedPreferences(d(context), 0).edit();
            edit.putInt(str, i);
            a(edit);
        } catch (Exception e) {
            j.a("PPU", "putInt exception", (Throwable) e);
        }
    }

    public static void b(Context context, String str, long j) {
        if (context == null) {
            Log.w(j.d("PPU"), "Context is null, so do nothing.");
            return;
        }
        try {
            Editor edit = context.getSharedPreferences(d(context), 0).edit();
            edit.putLong(str, j);
            a(edit);
        } catch (Exception e) {
            j.a("PPU", "putLong exception", (Throwable) e);
        }
    }

    public static void b(Context context, String str, String str2) {
        if (context == null) {
            Log.w(j.d("PPU"), "Context is null, so do nothing.");
            return;
        }
        try {
            Editor edit = context.getSharedPreferences(d(context), 0).edit();
            edit.putString(str, str2);
            a(edit);
        } catch (Exception e) {
            j.a("PPU", "putString exception", (Throwable) e);
        }
    }

    public static void b(Context context, String str, boolean z) {
        if (context == null) {
            Log.w(j.d("PPU"), "Context is null, so do nothing.");
            return;
        }
        try {
            Editor edit = context.getSharedPreferences(d(context), 0).edit();
            edit.putBoolean(str, z);
            a(edit);
        } catch (Exception e) {
            j.a("PPU", "putBoolean exception", (Throwable) e);
        }
    }

    public static boolean b(Context context, String str) {
        if (context == null) {
            Log.w(j.d("PPU"), "Context is null, so return default value: false.");
            return false;
        }
        try {
            return context.getSharedPreferences(d(context), 0).contains(str);
        } catch (Exception e) {
            j.a("PPU", "hasKey exception", (Throwable) e);
            return false;
        }
    }

    private static String c(Context context) {
        if (!TextUtils.isEmpty(b)) {
            return b;
        }
        b = c(context, "mistat_monitor");
        return b;
    }

    private static String c(Context context, String str) {
        if (context == null) {
            Log.w(j.d("PPU"), "Context is null, so return a empty string ");
            return "";
        }
        String e = e(context);
        if (TextUtils.equals(e, context.getPackageName())) {
            return str;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(t.c(e));
        return sb.toString();
    }

    public static void c(Context context, String str, long j) {
        if (context == null) {
            Log.w(j.d("PPU"), "Context is null, so do nothing.");
            return;
        }
        try {
            Editor edit = context.getSharedPreferences(c(context), 0).edit();
            edit.putLong(str, j);
            edit.apply();
        } catch (Exception e) {
            j.a("PPU", "putLongForMonitor exception", (Throwable) e);
        }
    }

    public static long d(Context context, String str, long j) {
        if (context == null) {
            Log.w(j.d("PPU"), "Context is null, so return defaultValue");
            return j;
        }
        try {
            return context.getSharedPreferences(c(context), 0).getLong(str, j);
        } catch (Exception e) {
            j.a("PPU", "getLongForMonitor exception", (Throwable) e);
            return j;
        }
    }

    private static String d(Context context) {
        if (!TextUtils.isEmpty(a)) {
            return a;
        }
        a = c(context, "mistat");
        return a;
    }

    private static String e(Context context) {
        ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
        if (activityManager.getRunningAppProcesses() != null) {
            for (RunningAppProcessInfo runningAppProcessInfo : activityManager.getRunningAppProcesses()) {
                if (runningAppProcessInfo.pid == Process.myPid()) {
                    return runningAppProcessInfo.processName;
                }
            }
        }
        return "";
    }
}
