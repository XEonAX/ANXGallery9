package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Process;
import android.text.TextUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.xiaomi.channel.commonutils.android.SharedPrefsCompat;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.xmpush.thrift.ConfigKey;
import java.io.File;
import java.io.IOException;
import java.lang.Thread.UncaughtExceptionHandler;
import java.util.ArrayList;
import java.util.HashMap;

class MIPushCrashHandler implements UncaughtExceptionHandler {
    private static final String[] crashFilterByPkgName = {"com.xiaomi.channel.commonutils", "com.xiaomi.common.logger", "com.xiaomi.measite.smack", "com.xiaomi.metoknlp", "com.xiaomi.mipush.sdk", "com.xiaomi.network", "com.xiaomi.push", "com.xiaomi.slim", "com.xiaomi.smack", "com.xiaomi.stats", "com.xiaomi.tinyData", "com.xiaomi.xmpush.thrift", "com.xiaomi.clientreport"};
    /* access modifiers changed from: private */
    public static final Object mObject = new Object();
    /* access modifiers changed from: private */
    public Context mContext;
    private UncaughtExceptionHandler mDefaultCrashHandler;
    private SharedPreferences mSharedPreference;

    public MIPushCrashHandler(Context context) {
        this(context, Thread.getDefaultUncaughtExceptionHandler());
    }

    public MIPushCrashHandler(Context context, UncaughtExceptionHandler uncaughtExceptionHandler) {
        this.mContext = context;
        this.mDefaultCrashHandler = uncaughtExceptionHandler;
    }

    private boolean canUploadCrash() {
        this.mSharedPreference = this.mContext.getSharedPreferences("mipush_extra", 4);
        boolean z = false;
        if (Network.isUsingMobileDataConnection(this.mContext)) {
            if (!OnlineConfig.getInstance(this.mContext).getBooleanValue(ConfigKey.Crash4GUploadSwitch.getValue(), true)) {
                return false;
            }
            if (((float) Math.abs((System.currentTimeMillis() / 1000) - this.mSharedPreference.getLong("last_crash_upload_time_stamp", 0))) >= ((float) Math.max(3600, OnlineConfig.getInstance(this.mContext).getIntValue(ConfigKey.Crash4GUploadFrequency.getValue(), 3600))) * 0.9f) {
                z = true;
            }
            return z;
        } else if (!Network.isWIFIConnected(this.mContext)) {
            return true;
        } else {
            if (Math.abs((System.currentTimeMillis() / 1000) - this.mSharedPreference.getLong("last_crash_upload_time_stamp", 0)) >= ((long) Math.max(60, OnlineConfig.getInstance(this.mContext).getIntValue(ConfigKey.CrashWIFIUploadFrequency.getValue(), 1800)))) {
                z = true;
            }
            return z;
        }
    }

    private boolean filterCrashByPkgName(boolean z, String str) {
        for (String contains : crashFilterByPkgName) {
            if (str.contains(contains)) {
                return true;
            }
        }
        return z;
    }

    private String getCrashContent(Throwable th) {
        StackTraceElement[] stackTrace = th.getStackTrace();
        StringBuilder sb = new StringBuilder(th.toString());
        sb.append("\r\n");
        boolean z = false;
        for (StackTraceElement stackTraceElement : stackTrace) {
            String stackTraceElement2 = stackTraceElement.toString();
            z = filterCrashByPkgName(z, stackTraceElement2);
            sb.append(stackTraceElement2);
            sb.append("\r\n");
        }
        return z ? sb.toString() : "";
    }

    private String getCrashSummary(Throwable th) {
        StackTraceElement[] stackTrace = th.getStackTrace();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < Math.min(3, stackTrace.length); i++) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(stackTrace[i].toString());
            sb2.append("\r\n");
            sb.append(sb2.toString());
        }
        String sb3 = sb.toString();
        return TextUtils.isEmpty(sb3) ? "" : XMStringUtils.getMd5Digest(sb3);
    }

    private void handleCrash(Throwable th) {
        String crashContent = getCrashContent(th);
        if (!TextUtils.isEmpty(crashContent)) {
            String crashSummary = getCrashSummary(th);
            if (!TextUtils.isEmpty(crashSummary)) {
                CrashStorage.getInstance(this.mContext).writeCrash2File(crashContent, crashSummary);
                if (canUploadCrash()) {
                    uploadCrash();
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void updateUploadTimeStamp() {
        this.mSharedPreference = this.mContext.getSharedPreferences("mipush_extra", 4);
        Editor edit = this.mSharedPreference.edit();
        edit.putLong("last_crash_upload_time_stamp", System.currentTimeMillis() / 1000);
        SharedPrefsCompat.apply(edit);
    }

    private void uploadCrash() {
        ScheduledJobManager.getInstance(this.mContext).addOneShootJob(new Runnable() {
            /* JADX WARNING: Removed duplicated region for block: B:36:0x0105 A[SYNTHETIC] */
            public void run() {
                File file;
                IOException e;
                File file2 = null;
                try {
                    ArrayList allCrashFile = CrashStorage.getInstance(MIPushCrashHandler.this.mContext).getAllCrashFile();
                    if (allCrashFile != null) {
                        if (allCrashFile.size() >= 1) {
                            HashMap collectDeviceInfo = MiPushUtils.collectDeviceInfo(MIPushCrashHandler.this.mContext, "C100000");
                            int i = 0;
                            while (i < allCrashFile.size()) {
                                File file3 = (File) allCrashFile.get(i);
                                String crashSummary = CrashStorage.getInstance(MIPushCrashHandler.this.mContext).getCrashSummary(file3);
                                StringBuilder sb = new StringBuilder();
                                sb.append(MIPushCrashHandler.this.mContext.getFilesDir());
                                sb.append("/crash");
                                sb.append("/");
                                sb.append(file3.getName());
                                sb.append(".zip");
                                file = new File(sb.toString());
                                try {
                                    IOUtils.zip(file, file3);
                                    if (file.exists()) {
                                        StringBuilder sb2 = new StringBuilder();
                                        sb2.append("https://api.xmpush.xiaomi.com/upload/crash_log?file=");
                                        sb2.append(file.getName());
                                        Network.uploadFile(sb2.toString(), collectDeviceInfo, file, "file");
                                        StringBuilder sb3 = new StringBuilder();
                                        sb3.append(MIPushCrashHandler.this.mContext.getFilesDir());
                                        sb3.append("/crash");
                                        String sb4 = sb3.toString();
                                        StringBuilder sb5 = new StringBuilder();
                                        sb5.append(crashSummary);
                                        sb5.append(":");
                                        sb5.append(MovieStatUtils.DOWNLOAD_SUCCESS);
                                        file3.renameTo(new File(sb4, sb5.toString()));
                                        MIPushCrashHandler.this.updateUploadTimeStamp();
                                    } else {
                                        MyLog.w("zip crash file failed");
                                    }
                                    i++;
                                    file2 = file;
                                } catch (IOException e2) {
                                    e = e2;
                                    MyLog.e((Throwable) e);
                                    file2 = file;
                                    MyLog.w("delete zip crash file failed");
                                    synchronized (MIPushCrashHandler.mObject) {
                                    }
                                    return;
                                } catch (Throwable unused) {
                                    file2 = file;
                                    MyLog.w("delete zip crash file failed");
                                    synchronized (MIPushCrashHandler.mObject) {
                                    }
                                    return;
                                }
                            }
                            if (file2 != null && file2.exists() && !file2.delete()) {
                                MyLog.w("delete zip crash file failed");
                            }
                            synchronized (MIPushCrashHandler.mObject) {
                                MIPushCrashHandler.mObject.notifyAll();
                            }
                            return;
                        }
                    }
                    MyLog.w("no crash file to upload");
                } catch (IOException e3) {
                    file = null;
                    e = e3;
                    MyLog.e((Throwable) e);
                    file2 = file;
                } catch (Throwable unused2) {
                }
            }
        });
    }

    public void uncaughtException(Thread thread, Throwable th) {
        handleCrash(th);
        synchronized (mObject) {
            try {
                mObject.wait(3000);
            } catch (InterruptedException e) {
                MyLog.e((Throwable) e);
            }
        }
        if (this.mDefaultCrashHandler != null) {
            this.mDefaultCrashHandler.uncaughtException(thread, th);
            return;
        }
        Process.killProcess(Process.myPid());
        System.exit(1);
    }
}
