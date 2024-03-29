package com.nostra13.universalimageloader.utils;

import android.util.Log;
import com.nostra13.universalimageloader.core.ImageLoader;

public final class L {
    private static volatile boolean writeDebugLogs = false;
    private static volatile boolean writeLogs = true;

    public static void d(String str, Object... objArr) {
        if (writeDebugLogs) {
            log(3, null, str, objArr);
        }
    }

    public static void e(String str, Object... objArr) {
        log(6, null, str, objArr);
    }

    public static void e(Throwable th) {
        log(6, th, null, new Object[0]);
    }

    public static void e(Throwable th, String str, Object... objArr) {
        log(6, th, str, objArr);
    }

    public static void i(String str, Object... objArr) {
        log(4, null, str, objArr);
    }

    private static void log(int i, Throwable th, String str, Object... objArr) {
        if (writeLogs) {
            if (objArr.length > 0) {
                str = String.format(str, objArr);
            }
            if (th != null) {
                if (str == null) {
                    str = th.getMessage();
                }
                str = String.format("%1$s\n%2$s", new Object[]{str, Log.getStackTraceString(th)});
            }
            Log.println(i, ImageLoader.TAG, str);
        }
    }

    public static void w(String str, Object... objArr) {
        log(5, null, str, objArr);
    }

    public static void writeDebugLogs(boolean z) {
        writeDebugLogs = z;
    }
}
