package com.xiaomi.channel.commonutils.android;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Environment;
import android.provider.Settings.Secure;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.file.FileLocker;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.reflect.JavaCalls;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import java.io.File;
import java.io.IOException;

public class DeviceInfo {
    private static String sCachedDeviceId = null;
    private static String sCachedIMEI = null;
    private static String sCachedSimpleDeviceId = null;
    private static String sCachedSubIMEIS = "";
    private static volatile boolean sVirtDevIDChecked;
    private static String sVirtDevId;

    public static String blockingGetIMEI(Context context) {
        String quicklyGetIMEI = quicklyGetIMEI(context);
        int i = 10;
        while (quicklyGetIMEI == null) {
            int i2 = i - 1;
            if (i <= 0) {
                break;
            }
            try {
                Thread.sleep(500);
            } catch (InterruptedException unused) {
            }
            quicklyGetIMEI = quicklyGetIMEI(context);
            i = i2;
        }
        return quicklyGetIMEI;
    }

    private static String blockingGetIMEIWhenDeviceRegister(Context context) {
        String quicklyGetIMEI = quicklyGetIMEI(context);
        int i = 10;
        while (TextUtils.isEmpty(quicklyGetIMEI)) {
            int i2 = i - 1;
            if (i <= 0) {
                break;
            }
            try {
                Thread.sleep(500);
            } catch (InterruptedException unused) {
            }
            quicklyGetIMEI = quicklyGetIMEI(context);
            i = i2;
        }
        return quicklyGetIMEI;
    }

    public static String blockingGetSubIMEISMd5(Context context) {
        String quicklyGetSubIMEISMd5 = quicklyGetSubIMEISMd5(context);
        int i = 10;
        while (quicklyGetSubIMEISMd5 == null) {
            int i2 = i - 1;
            if (i <= 0) {
                break;
            }
            try {
                Thread.sleep(500);
            } catch (InterruptedException unused) {
            }
            quicklyGetSubIMEISMd5 = quicklyGetSubIMEISMd5(context);
            i = i2;
        }
        return quicklyGetSubIMEISMd5;
    }

    private static boolean canReadPhoneState(Context context) {
        return context.getPackageManager().checkPermission("android.permission.READ_PHONE_STATE", context.getPackageName()) == 0;
    }

    /* JADX WARNING: Removed duplicated region for block: B:19:0x0061  */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x006b  */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x00be  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00c9  */
    public static String checkVirtDevId(Context context) {
        FileLocker fileLocker;
        String str;
        if (!isSupportVDevid(context) || sVirtDevIDChecked) {
            return null;
        }
        sVirtDevIDChecked = true;
        String fileToStr = IOUtils.fileToStr(new File(context.getFilesDir(), ".vdevid"));
        try {
            File file = new File(new File(Environment.getExternalStorageDirectory(), "/Xiaomi/"), ".vdevid");
            fileLocker = FileLocker.lock(context, file);
            try {
                str = IOUtils.fileToStr(file);
                if (fileLocker != null) {
                    fileLocker.unlock();
                }
            } catch (IOException e) {
                e = e;
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("check id failure :");
                    sb.append(e.getMessage());
                    MyLog.w(sb.toString());
                    if (fileLocker != null) {
                        fileLocker.unlock();
                    }
                    str = null;
                    if (!TextUtils.isEmpty(fileToStr)) {
                    }
                } catch (Throwable th) {
                    th = th;
                    if (fileLocker != null) {
                        fileLocker.unlock();
                    }
                    throw th;
                }
            }
        } catch (IOException e2) {
            e = e2;
            fileLocker = null;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("check id failure :");
            sb2.append(e.getMessage());
            MyLog.w(sb2.toString());
            if (fileLocker != null) {
            }
            str = null;
            if (!TextUtils.isEmpty(fileToStr)) {
            }
        } catch (Throwable th2) {
            th = th2;
            fileLocker = null;
            if (fileLocker != null) {
            }
            throw th;
        }
        if (!TextUtils.isEmpty(fileToStr)) {
            sVirtDevId = fileToStr;
            if (TextUtils.isEmpty(str) || str.length() > 128) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("recover vid :");
                sb3.append(str);
                MyLog.w(sb3.toString());
                updateVirtDevId(context, fileToStr);
            } else if (!TextUtils.equals(fileToStr, str)) {
                MyLog.w("vid changed, need sync");
                return str;
            }
            StringBuilder sb4 = new StringBuilder();
            sb4.append("vdevid = ");
            sb4.append(sVirtDevId);
            sb4.append(" ");
            sb4.append(str);
            MyLog.v(sb4.toString());
            return null;
        }
        MyLog.w("empty local vid");
        return "F*";
    }

    public static String getAndroidId(Context context) {
        try {
            return Secure.getString(context.getContentResolver(), "android_id");
        } catch (Throwable th) {
            MyLog.e(th);
            return null;
        }
    }

    public static String getDeviceId(Context context, boolean z) {
        if (sCachedDeviceId == null) {
            String str = "";
            if (!MIUIUtils.isGlobalRegion()) {
                str = z ? blockingGetIMEI(context) : blockingGetIMEIWhenDeviceRegister(context);
            }
            String androidId = getAndroidId(context);
            String serialNum = getSerialNum();
            StringBuilder sb = new StringBuilder();
            sb.append("a-");
            StringBuilder sb2 = new StringBuilder();
            sb2.append(str);
            sb2.append(androidId);
            sb2.append(serialNum);
            sb.append(XMStringUtils.getSHA1Digest(sb2.toString()));
            sCachedDeviceId = sb.toString();
        }
        return sCachedDeviceId;
    }

    public static String getDeviceId1(Context context) {
        String androidId = getAndroidId(context);
        StringBuilder sb = new StringBuilder();
        sb.append("a-");
        StringBuilder sb2 = new StringBuilder();
        sb2.append(null);
        sb2.append(androidId);
        sb2.append(null);
        sb.append(XMStringUtils.getSHA1Digest(sb2.toString()));
        return sb.toString();
    }

    public static String getGaid(Context context) {
        try {
            return GoogleAdvertisingClient.getAdvertisingIdInfo(context).getId();
        } catch (Exception e) {
            StringBuilder sb = new StringBuilder();
            sb.append("failure to get gaid:");
            sb.append(e.getMessage());
            MyLog.w(sb.toString());
            return null;
        }
    }

    public static synchronized String getInstanceId(Context context) {
        String sHA1Digest;
        synchronized (DeviceInfo.class) {
            String androidId = getAndroidId(context);
            StringBuilder sb = new StringBuilder();
            sb.append(androidId);
            sb.append(null);
            sHA1Digest = XMStringUtils.getSHA1Digest(sb.toString());
        }
        return sHA1Digest;
    }

    public static String getMacAddress(Context context) {
        return "";
    }

    public static String getSerialNum() {
        if (VERSION.SDK_INT > 8 && VERSION.SDK_INT < 26) {
            return Build.SERIAL;
        }
        if (VERSION.SDK_INT >= 26) {
            return (String) JavaCalls.callStaticMethod("android.os.Build", "getSerial", null);
        }
        return null;
    }

    public static String getSimOperatorName(Context context) {
        return ((TelephonyManager) context.getSystemService("phone")).getSimOperatorName();
    }

    public static synchronized String getSimpleDeviceId(Context context) {
        synchronized (DeviceInfo.class) {
            if (sCachedSimpleDeviceId != null) {
                String str = sCachedSimpleDeviceId;
                return str;
            }
            String androidId = getAndroidId(context);
            String serialNum = getSerialNum();
            StringBuilder sb = new StringBuilder();
            sb.append(androidId);
            sb.append(serialNum);
            sCachedSimpleDeviceId = XMStringUtils.getSHA1Digest(sb.toString());
            String str2 = sCachedSimpleDeviceId;
            return str2;
        }
    }

    @TargetApi(17)
    public static int getSpaceId() {
        if (VERSION.SDK_INT < 17) {
            return -1;
        }
        Object callStaticMethod = JavaCalls.callStaticMethod("android.os.UserHandle", "myUserId", new Object[0]);
        if (callStaticMethod == null) {
            return -1;
        }
        return ((Integer) Integer.class.cast(callStaticMethod)).intValue();
    }

    /* JADX WARNING: Removed duplicated region for block: B:31:0x007c  */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x0084  */
    public static String getVirtDevId(Context context) {
        FileLocker fileLocker = null;
        if (!isSupportVDevid(context)) {
            return null;
        }
        if (!TextUtils.isEmpty(sVirtDevId)) {
            return sVirtDevId;
        }
        sVirtDevId = IOUtils.fileToStr(new File(context.getFilesDir(), ".vdevid"));
        if (!TextUtils.isEmpty(sVirtDevId)) {
            return sVirtDevId;
        }
        try {
            File file = new File(new File(Environment.getExternalStorageDirectory(), "/Xiaomi/"), ".vdevid");
            FileLocker lock = FileLocker.lock(context, file);
            try {
                sVirtDevId = "";
                String fileToStr = IOUtils.fileToStr(file);
                if (fileToStr != null) {
                    sVirtDevId = fileToStr;
                }
                String str = sVirtDevId;
                if (lock != null) {
                    lock.unlock();
                }
                return str;
            } catch (IOException e) {
                e = e;
                fileLocker = lock;
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("getVDevID failure :");
                    sb.append(e.getMessage());
                    MyLog.w(sb.toString());
                    if (fileLocker != null) {
                    }
                    return sVirtDevId;
                } catch (Throwable th) {
                    th = th;
                    if (fileLocker != null) {
                        fileLocker.unlock();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileLocker = lock;
                if (fileLocker != null) {
                }
                throw th;
            }
        } catch (IOException e2) {
            e = e2;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("getVDevID failure :");
            sb2.append(e.getMessage());
            MyLog.w(sb2.toString());
            if (fileLocker != null) {
                fileLocker.unlock();
            }
            return sVirtDevId;
        }
    }

    private static boolean isSupportVDevid(Context context) {
        boolean z = false;
        if (!PermissionUtils.checkSelfPermission(context, "android.permission.WRITE_EXTERNAL_STORAGE") || MIUIUtils.isMIUI()) {
            return false;
        }
        if (VERSION.SDK_INT >= 26) {
            z = true;
        }
        return !z ? SystemUtils.isDebuggable(context) : z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:25:0x0052 A[Catch:{ Throwable -> 0x008a }] */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0057 A[Catch:{ Throwable -> 0x008a }] */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x0084 A[Catch:{ Throwable -> 0x008a }] */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x0087 A[Catch:{ Throwable -> 0x008a }] */
    public static String quicklyGetIMEI(Context context) {
        String str;
        if (MIUIUtils.isGlobalRegion()) {
            return "";
        }
        if (sCachedIMEI != null) {
            return sCachedIMEI;
        }
        try {
            if (MIUIUtils.isMIUI()) {
                Object callStaticMethod = JavaCalls.callStaticMethod("miui.telephony.TelephonyManager", "getDefault", new Object[0]);
                if (callStaticMethod != null) {
                    Object callMethod = JavaCalls.callMethod(callStaticMethod, "getMiuiDeviceId", new Object[0]);
                    if (callMethod != null && (callMethod instanceof String)) {
                        str = (String) String.class.cast(callMethod);
                        if (str == null && canReadPhoneState(context)) {
                            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
                            if (VERSION.SDK_INT >= 26) {
                                str = telephonyManager.getDeviceId();
                            } else if (1 == telephonyManager.getPhoneType()) {
                                str = (String) JavaCalls.callMethod(telephonyManager, "getImei", null);
                            } else if (2 == telephonyManager.getPhoneType()) {
                                str = (String) JavaCalls.callMethod(telephonyManager, "getMeid", null);
                            }
                        }
                        if (verifyImei(str)) {
                            return "";
                        }
                        sCachedIMEI = str;
                        return str;
                    }
                }
            }
            str = null;
            TelephonyManager telephonyManager2 = (TelephonyManager) context.getSystemService("phone");
            if (VERSION.SDK_INT >= 26) {
            }
            if (verifyImei(str)) {
            }
        } catch (Throwable th) {
            MyLog.e(th);
            return null;
        }
    }

    public static String quicklyGetSubIMEIS(Context context) {
        if (MIUIUtils.isGlobalRegion()) {
            return "";
        }
        if (VERSION.SDK_INT < 22) {
            return "";
        }
        if (!TextUtils.isEmpty(sCachedSubIMEIS)) {
            return sCachedSubIMEIS;
        }
        if (!canReadPhoneState(context)) {
            return "";
        }
        quicklyGetIMEI(context);
        if (TextUtils.isEmpty(sCachedIMEI)) {
            return "";
        }
        try {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
            Integer num = (Integer) JavaCalls.callMethod(telephonyManager, "getPhoneCount", new Object[0]);
            if (num == null || num.intValue() <= 1) {
                return "";
            }
            String str = null;
            for (int i = 0; i < num.intValue(); i++) {
                if (VERSION.SDK_INT < 26) {
                    str = (String) JavaCalls.callMethod(telephonyManager, "getDeviceId", Integer.valueOf(i));
                } else if (1 == telephonyManager.getPhoneType()) {
                    str = (String) JavaCalls.callMethod(telephonyManager, "getImei", Integer.valueOf(i));
                } else if (2 == telephonyManager.getPhoneType()) {
                    str = (String) JavaCalls.callMethod(telephonyManager, "getMeid", Integer.valueOf(i));
                }
                if (!TextUtils.isEmpty(str) && !TextUtils.equals(sCachedIMEI, str) && verifyImei(str)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(sCachedSubIMEIS);
                    sb.append(str);
                    sb.append(",");
                    sCachedSubIMEIS = sb.toString();
                }
            }
            int length = sCachedSubIMEIS.length();
            if (length > 0) {
                sCachedSubIMEIS = sCachedSubIMEIS.substring(0, length - 1);
            }
            return sCachedSubIMEIS;
        } catch (Exception e) {
            MyLog.e(e.toString());
            return "";
        }
    }

    public static String quicklyGetSubIMEISMd5(Context context) {
        String[] split;
        quicklyGetSubIMEIS(context);
        if (TextUtils.isEmpty(sCachedSubIMEIS)) {
            return "";
        }
        String str = "";
        for (String str2 : sCachedSubIMEIS.split(",")) {
            if (verifyImei(str2)) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(XMStringUtils.getMd5Digest(str2));
                sb.append(",");
                str = sb.toString();
            }
        }
        int length = str.length();
        if (length > 0) {
            str = str.substring(0, length - 1);
        }
        return str;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0069, code lost:
        if (r4 != null) goto L_0x006b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x006b, code lost:
        r4.unlock();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x008a, code lost:
        if (r4 != null) goto L_0x006b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:0x008d, code lost:
        return;
     */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x0090  */
    public static void updateVirtDevId(Context context, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("update vdevid = ");
        sb.append(str);
        MyLog.v(sb.toString());
        if (!TextUtils.isEmpty(str)) {
            sVirtDevId = str;
            FileLocker fileLocker = null;
            try {
                if (isSupportVDevid(context)) {
                    File file = new File(Environment.getExternalStorageDirectory(), "/Xiaomi/");
                    if (file.exists() && file.isFile()) {
                        file.delete();
                    }
                    File file2 = new File(file, ".vdevid");
                    FileLocker lock = FileLocker.lock(context, file2);
                    try {
                        IOUtils.remove(file2);
                        IOUtils.strToFile(file2, sVirtDevId);
                        fileLocker = lock;
                    } catch (IOException e) {
                        e = e;
                        fileLocker = lock;
                        try {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("update vdevid failure :");
                            sb2.append(e.getMessage());
                            MyLog.w(sb2.toString());
                        } catch (Throwable th) {
                            th = th;
                            if (fileLocker != null) {
                                fileLocker.unlock();
                            }
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        fileLocker = lock;
                        if (fileLocker != null) {
                        }
                        throw th;
                    }
                }
                IOUtils.strToFile(new File(context.getFilesDir(), ".vdevid"), sVirtDevId);
            } catch (IOException e2) {
                e = e2;
                StringBuilder sb22 = new StringBuilder();
                sb22.append("update vdevid failure :");
                sb22.append(e.getMessage());
                MyLog.w(sb22.toString());
            }
        }
    }

    private static boolean verifyImei(String str) {
        return !TextUtils.isEmpty(str) && str.length() <= 15 && str.length() >= 14 && XMStringUtils.isNumberAndLetter(str) && !XMStringUtils.isTheSameChars(str);
    }
}
