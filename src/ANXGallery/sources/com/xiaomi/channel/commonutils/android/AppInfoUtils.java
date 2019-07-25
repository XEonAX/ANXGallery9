package com.xiaomi.channel.commonutils.android;

import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.AppOpsManager;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Build.VERSION;
import android.os.Process;
import android.text.TextUtils;
import com.meicam.themehelper.BuildConfig;
import com.nexstreaming.nexeditorsdk.nexCrop;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.reflect.JavaCalls;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AppInfoUtils {

    public enum AppNotificationOp {
        UNKNOWN(0),
        ALLOWED(1),
        NOT_ALLOWED(2);
        
        private final int value;

        private AppNotificationOp(int i) {
            this.value = i;
        }

        public int getValue() {
            return this.value;
        }
    }

    public static boolean checkSelfPermission(Context context, String str) {
        return context.getPackageManager().checkPermission(str, context.getPackageName()) == 0;
    }

    public static String getAppLabel(Context context, String str) {
        try {
            PackageManager packageManager = context.getPackageManager();
            PackageInfo packageInfo = packageManager.getPackageInfo(str, 0);
            if (packageInfo == null) {
                return str;
            }
            ApplicationInfo applicationInfo = packageInfo.applicationInfo;
            return applicationInfo != null ? packageManager.getApplicationLabel(applicationInfo).toString() : str;
        } catch (NameNotFoundException e) {
            MyLog.e((Throwable) e);
            return str;
        }
    }

    @TargetApi(19)
    public static AppNotificationOp getAppNotificationOp(Context context, String str) {
        if (context == null || TextUtils.isEmpty(str) || VERSION.SDK_INT < 19) {
            return AppNotificationOp.UNKNOWN;
        }
        try {
            Integer num = (Integer) JavaCalls.getStaticField(AppOpsManager.class, "OP_POST_NOTIFICATION");
            if (num == null) {
                return AppNotificationOp.UNKNOWN;
            }
            Integer num2 = (Integer) JavaCalls.callMethod((AppOpsManager) context.getSystemService("appops"), "checkOpNoThrow", num, Integer.valueOf(context.getPackageManager().getApplicationInfo(str, 0).uid), str);
            return (num2 == null || num2.intValue() != 0) ? AppNotificationOp.NOT_ALLOWED : AppNotificationOp.ALLOWED;
        } catch (Throwable unused) {
            return AppNotificationOp.UNKNOWN;
        }
    }

    public static String getProcessName(Context context) {
        if (context == null) {
            return null;
        }
        List<RunningAppProcessInfo> runningAppProcesses = ((ActivityManager) context.getSystemService("activity")).getRunningAppProcesses();
        if (runningAppProcesses == null) {
            return null;
        }
        int myPid = Process.myPid();
        for (RunningAppProcessInfo runningAppProcessInfo : runningAppProcesses) {
            if (runningAppProcessInfo.pid == myPid) {
                return runningAppProcessInfo.processName;
            }
        }
        return null;
    }

    public static String getRunningAppPkgNames(Context context) {
        List<RunningAppProcessInfo> runningAppProcesses = ((ActivityManager) context.getSystemService("activity")).getRunningAppProcesses();
        ArrayList arrayList = new ArrayList();
        StringBuilder sb = new StringBuilder();
        if (runningAppProcesses != null && runningAppProcesses.size() > 0) {
            for (RunningAppProcessInfo runningAppProcessInfo : runningAppProcesses) {
                String[] strArr = runningAppProcessInfo.pkgList;
                int i = 0;
                while (strArr != null && i < strArr.length) {
                    if (!arrayList.contains(strArr[i])) {
                        arrayList.add(strArr[i]);
                        if (arrayList.size() == 1) {
                            sb.append(((String) arrayList.get(0)).hashCode() % nexCrop.ABSTRACT_DIMENSION);
                        } else {
                            sb.append("#");
                            sb.append(strArr[i].hashCode() % nexCrop.ABSTRACT_DIMENSION);
                        }
                    }
                    i++;
                }
            }
        }
        return sb.toString();
    }

    public static int getVersionCode(Context context, String str) {
        PackageInfo packageInfo;
        try {
            packageInfo = context.getPackageManager().getPackageInfo(str, 16384);
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            packageInfo = null;
        }
        if (packageInfo != null) {
            return packageInfo.versionCode;
        }
        return 0;
    }

    public static String getVersionName(Context context, String str) {
        PackageInfo packageInfo;
        try {
            packageInfo = context.getPackageManager().getPackageInfo(str, 16384);
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            packageInfo = null;
        }
        return packageInfo != null ? packageInfo.versionName : BuildConfig.VERSION_NAME;
    }

    public static boolean isAppMainProc(Context context) {
        List<RunningAppProcessInfo> runningAppProcesses = ((ActivityManager) context.getSystemService("activity")).getRunningAppProcesses();
        if (runningAppProcesses == null || runningAppProcesses.size() < 1) {
            return false;
        }
        for (RunningAppProcessInfo runningAppProcessInfo : runningAppProcesses) {
            if (runningAppProcessInfo.pid == Process.myPid() && runningAppProcessInfo.processName.equals(context.getPackageName())) {
                return true;
            }
        }
        return false;
    }

    public static boolean isAppRunning(Context context, String str) {
        List<RunningAppProcessInfo> runningAppProcesses = ((ActivityManager) context.getSystemService("activity")).getRunningAppProcesses();
        if (runningAppProcesses != null) {
            for (RunningAppProcessInfo runningAppProcessInfo : runningAppProcesses) {
                if (Arrays.asList(runningAppProcessInfo.pkgList).contains(str)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean isPkgInstalled(Context context, String str) {
        PackageInfo packageInfo;
        try {
            packageInfo = context.getPackageManager().getPackageInfo(str, 0);
        } catch (NameNotFoundException unused) {
            packageInfo = null;
        }
        return packageInfo != null;
    }
}
