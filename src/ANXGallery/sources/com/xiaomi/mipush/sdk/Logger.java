package com.xiaomi.mipush.sdk;

import android.content.Context;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.LoggerInterface;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.push.log.MIPushDebugLog;
import com.xiaomi.push.log.MIPushLog2File;
import java.io.File;
import java.util.HashMap;

public class Logger {
    private static boolean sDisablePushLog;
    private static LoggerInterface sUserLogger;

    public static File getLogFile(String str) {
        try {
            File file = new File(str);
            if (file.exists()) {
                if (file.isDirectory()) {
                    File[] listFiles = file.listFiles();
                    for (int i = 0; i < listFiles.length; i++) {
                        if (listFiles[i].isFile() && !listFiles[i].getName().contains("lock") && listFiles[i].getName().contains("log")) {
                            return listFiles[i];
                        }
                    }
                    return null;
                }
            }
            return null;
        } catch (NullPointerException unused) {
            MyLog.e("null pointer exception while retrieve file.");
        }
    }

    protected static LoggerInterface getUserLogger() {
        return sUserLogger;
    }

    private static boolean hasWritePermission(Context context) {
        try {
            String[] strArr = context.getPackageManager().getPackageInfo(context.getPackageName(), 4096).requestedPermissions;
            if (strArr != null) {
                for (String equals : strArr) {
                    if ("android.permission.WRITE_EXTERNAL_STORAGE".equals(equals)) {
                        return true;
                    }
                }
            }
        } catch (Exception unused) {
        }
        return false;
    }

    public static void setLogger(Context context, LoggerInterface loggerInterface) {
        sUserLogger = loggerInterface;
        setPushLog(context);
    }

    public static void setPushLog(Context context) {
        boolean z = sUserLogger != null;
        MIPushLog2File mIPushLog2File = new MIPushLog2File(context);
        if (!sDisablePushLog && hasWritePermission(context) && z) {
            MyLog.setLogger(new MIPushDebugLog(sUserLogger, mIPushLog2File));
        } else if (!sDisablePushLog && hasWritePermission(context)) {
            MyLog.setLogger(mIPushLog2File);
        } else if (z) {
            MyLog.setLogger(sUserLogger);
        } else {
            MyLog.setLogger(new MIPushDebugLog(null, null));
        }
    }

    public static void uploadLogFile(final Context context, final boolean z) {
        ScheduledJobManager.getInstance(context).addOneShootJob(new Runnable() {
            public void run() {
                File file;
                String str;
                try {
                    HashMap collectDeviceInfo = MiPushUtils.collectDeviceInfo(context, "");
                    if (z) {
                        str = context.getFilesDir().getAbsolutePath();
                    } else {
                        StringBuilder sb = new StringBuilder();
                        sb.append(context.getExternalFilesDir(null).getAbsolutePath());
                        sb.append(MIPushLog2File.MIPUSH_LOG_PATH);
                        str = sb.toString();
                    }
                    File logFile = Logger.getLogFile(str);
                    if (logFile == null) {
                        MyLog.w("log file null");
                        return;
                    }
                    String packageName = context.getPackageName();
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(packageName);
                    sb2.append(".zip");
                    file = new File(str, sb2.toString());
                    try {
                        IOUtils.zip(file, logFile);
                        if (file.exists()) {
                            String str2 = z ? "https://api.xmpush.xiaomi.com/upload/xmsf_log?file=" : "https://api.xmpush.xiaomi.com/upload/app_log?file=";
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append(str2);
                            sb3.append(file.getName());
                            Network.uploadFile(sb3.toString(), collectDeviceInfo, file, "file");
                        } else {
                            MyLog.w("zip log file failed");
                        }
                    } catch (Throwable th) {
                        th = th;
                        MyLog.e(th);
                        file.delete();
                    }
                    if (file != null && file.exists()) {
                        file.delete();
                    }
                } catch (Throwable th2) {
                    th = th2;
                    file = null;
                    MyLog.e(th);
                    file.delete();
                }
            }
        });
    }
}
