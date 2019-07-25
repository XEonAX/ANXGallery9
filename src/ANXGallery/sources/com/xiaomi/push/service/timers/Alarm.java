package com.xiaomi.push.service.timers;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.ServiceInfo;
import android.os.Build.VERSION;
import com.xiaomi.channel.commonutils.android.SystemUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.XMJobService;

public final class Alarm {
    private static final String XMSERVICE = XMJobService.class.getCanonicalName();
    private static IAlarm sAlarmInstance;
    private static int sLevel = 0;

    interface IAlarm {
        boolean isAlive();

        void registerPing(boolean z);

        void stop();
    }

    public static synchronized void changePolicy(Context context, int i) {
        synchronized (Alarm.class) {
            int i2 = sLevel;
            if (!"com.xiaomi.xmsf".equals(context.getPackageName())) {
                if (i == 2) {
                    sLevel = 2;
                } else {
                    sLevel = 0;
                }
            }
            if (i2 != sLevel && sLevel == 2) {
                stop();
                sAlarmInstance = new HybridTimer(context);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:18:0x005e, code lost:
        if (XMSERVICE.equals(java.lang.Class.forName(r5.name).getSuperclass().getCanonicalName()) != false) goto L_0x0048;
     */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x009d  */
    public static void initialize(Context context) {
        boolean z;
        Context applicationContext = context.getApplicationContext();
        if ("com.xiaomi.xmsf".equals(applicationContext.getPackageName())) {
            sAlarmInstance = new AlarmManagerTimer(applicationContext);
            return;
        }
        int i = 0;
        try {
            PackageInfo packageInfo = applicationContext.getPackageManager().getPackageInfo(applicationContext.getPackageName(), 4);
            if (packageInfo.services != null) {
                ServiceInfo[] serviceInfoArr = packageInfo.services;
                int length = serviceInfoArr.length;
                z = false;
                while (true) {
                    if (i >= length) {
                        break;
                    }
                    try {
                        ServiceInfo serviceInfo = serviceInfoArr[i];
                        if ("android.permission.BIND_JOB_SERVICE".equals(serviceInfo.permission)) {
                            if (!XMSERVICE.equals(serviceInfo.name)) {
                                try {
                                } catch (Exception unused) {
                                }
                            }
                            z = true;
                            if (z) {
                                break;
                            }
                        }
                        if (XMSERVICE.equals(serviceInfo.name) && "android.permission.BIND_JOB_SERVICE".equals(serviceInfo.permission)) {
                            z = true;
                            break;
                        }
                        i++;
                    } catch (Exception e) {
                        e = e;
                        StringBuilder sb = new StringBuilder();
                        sb.append("check service err : ");
                        sb.append(e.getMessage());
                        MyLog.w(sb.toString());
                        if (!z) {
                        }
                        int i2 = VERSION.SDK_INT;
                        sAlarmInstance = new AlarmManagerTimer(applicationContext);
                        return;
                    }
                }
            } else {
                z = false;
            }
        } catch (Exception e2) {
            e = e2;
            z = false;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("check service err : ");
            sb2.append(e.getMessage());
            MyLog.w(sb2.toString());
            if (!z) {
            }
            int i22 = VERSION.SDK_INT;
            sAlarmInstance = new AlarmManagerTimer(applicationContext);
            return;
        }
        if (!z || !SystemUtils.isDebuggable(applicationContext)) {
            int i222 = VERSION.SDK_INT;
            sAlarmInstance = new AlarmManagerTimer(applicationContext);
            return;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append("Should export service: ");
        sb3.append(XMSERVICE);
        sb3.append(" with permission ");
        sb3.append("android.permission.BIND_JOB_SERVICE");
        sb3.append(" in AndroidManifest.xml file");
        throw new RuntimeException(sb3.toString());
    }

    public static synchronized boolean isAlive() {
        synchronized (Alarm.class) {
            if (sAlarmInstance == null) {
                return false;
            }
            boolean isAlive = sAlarmInstance.isAlive();
            return isAlive;
        }
    }

    public static synchronized void registerPing(boolean z) {
        synchronized (Alarm.class) {
            if (sAlarmInstance == null) {
                MyLog.w("timer is not initialized");
            } else {
                sAlarmInstance.registerPing(z);
            }
        }
    }

    public static synchronized void stop() {
        synchronized (Alarm.class) {
            if (sAlarmInstance != null) {
                sAlarmInstance.stop();
            }
        }
    }
}
