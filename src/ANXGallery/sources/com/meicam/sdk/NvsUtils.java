package com.meicam.sdk;

import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;

public class NvsUtils {
    private static final String TAG = "Meicam";

    public static boolean checkFunctionInMainThread() {
        if (isMainThread()) {
            return true;
        }
        String methodName = getMethodName(4);
        if (TextUtils.isEmpty(methodName)) {
            return false;
        }
        String methodName2 = getMethodName(5);
        StringBuilder sb = new StringBuilder();
        sb.append("Main Thread Checker:\"");
        sb.append(methodName);
        sb.append("\" API called on a background thread.");
        Log.w(TAG, sb.toString());
        if (!TextUtils.isEmpty(methodName2)) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Invoking method: \"");
            sb2.append(methodName2);
            sb2.append("\".");
            Log.w(TAG, sb2.toString());
        }
        return false;
    }

    public static String getMethodName(int i) {
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        if (stackTrace.length <= i || i < 0) {
            return null;
        }
        return stackTrace[i].getMethodName();
    }

    public static boolean isMainThread() {
        return Looper.getMainLooper().getThread() == Thread.currentThread();
    }
}
