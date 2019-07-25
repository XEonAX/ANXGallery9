package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PermissionInfo;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.text.TextUtils;
import android.util.Log;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.PushConstants;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;

public class ManifestChecker {

    public static class IllegalManifestException extends RuntimeException {
        private static final long serialVersionUID = 1;

        public IllegalManifestException(String str) {
            super(str);
        }
    }

    public static class ServiceCheckInfo {
        public boolean enabled;
        public boolean exported;
        public String permission;
        public String serviceName;

        public ServiceCheckInfo(String str, boolean z, boolean z2, String str2) {
            this.serviceName = str;
            this.enabled = z;
            this.exported = z2;
            this.permission = str2;
        }
    }

    public static void asynCheckManifest(final Context context) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 4612);
                    ManifestChecker.checkReceivers(context);
                    ManifestChecker.checkServices(context, packageInfo);
                    ManifestChecker.checkPermissions(context, packageInfo);
                } catch (Throwable th) {
                    Log.e("ManifestChecker", "", th);
                }
            }
        }).start();
    }

    private static void checkAssembleReceiver(Context context, String str, String str2) {
        PackageManager packageManager = context.getPackageManager();
        String packageName = context.getPackageName();
        Intent intent = new Intent(str);
        intent.setPackage(packageName);
        boolean z = false;
        for (ResolveInfo resolveInfo : packageManager.queryBroadcastReceivers(intent, 16384)) {
            ActivityInfo activityInfo = resolveInfo.activityInfo;
            if (activityInfo == null || TextUtils.isEmpty(activityInfo.name) || !activityInfo.name.equals(str2)) {
                z = false;
                continue;
            } else {
                z = true;
                continue;
            }
            if (z) {
                break;
            }
        }
        if (!z) {
            throw new IllegalManifestException(String.format("<receiver android:name=\"%1$s\" .../> is missing or disabled in AndroidManifest.", new Object[]{str2}));
        }
    }

    /* access modifiers changed from: private */
    public static void checkPermissions(Context context, PackageInfo packageInfo) {
        boolean z;
        String[] strArr;
        HashSet hashSet = new HashSet();
        StringBuilder sb = new StringBuilder();
        sb.append(context.getPackageName());
        sb.append(".permission.MIPUSH_RECEIVE");
        String sb2 = sb.toString();
        hashSet.addAll(Arrays.asList(new String[]{"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE", sb2, "android.permission.ACCESS_WIFI_STATE", "android.permission.READ_PHONE_STATE", "android.permission.GET_TASKS", "android.permission.VIBRATE"}));
        if (packageInfo.permissions != null) {
            PermissionInfo[] permissionInfoArr = packageInfo.permissions;
            int length = permissionInfoArr.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                } else if (sb2.equals(permissionInfoArr[i].name)) {
                    z = true;
                    break;
                } else {
                    i++;
                }
            }
        }
        z = false;
        if (z) {
            if (packageInfo.requestedPermissions != null) {
                for (String str : packageInfo.requestedPermissions) {
                    if (!TextUtils.isEmpty(str) && hashSet.contains(str)) {
                        hashSet.remove(str);
                        if (hashSet.isEmpty()) {
                            break;
                        }
                    }
                }
            }
            if (!hashSet.isEmpty()) {
                throw new IllegalManifestException(String.format("<uses-permission android:name=\"%1$s\"/> is missing in AndroidManifest.", new Object[]{hashSet.iterator().next()}));
            }
            return;
        }
        throw new IllegalManifestException(String.format("<permission android:name=\"%1$s\" .../> is undefined in AndroidManifest.", new Object[]{sb2}));
    }

    private static void checkReceiverInfo(ActivityInfo activityInfo, Boolean[] boolArr) {
        if (boolArr[0].booleanValue() != activityInfo.enabled) {
            throw new IllegalManifestException(String.format("<receiver android:name=\"%1$s\" .../> in AndroidManifest had the wrong enabled attribute, which should be android:enabled=%2$b.", new Object[]{activityInfo.name, boolArr[0]}));
        } else if (boolArr[1].booleanValue() != activityInfo.exported) {
            throw new IllegalManifestException(String.format("<receiver android:name=\"%1$s\" .../> in AndroidManifest had the wrong exported attribute, which should be android:exported=%2$b.", new Object[]{activityInfo.name, boolArr[1]}));
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x00ac A[EDGE_INSN: B:39:0x00ac->B:29:0x00ac ?: BREAK  , SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x0078 A[SYNTHETIC] */
    public static void checkReceivers(Context context) {
        PackageManager packageManager = context.getPackageManager();
        String packageName = context.getPackageName();
        Intent intent = new Intent(PushConstants.ACTION_PING_TIMER);
        intent.setPackage(packageName);
        try {
            ActivityInfo findReceiverInfo = findReceiverInfo(packageManager, intent, Class.forName("com.xiaomi.push.service.receivers.PingReceiver"));
            if (!MiPushClient.shouldUseMIUIPush(context)) {
                if (findReceiverInfo != null) {
                    checkReceiverInfo(findReceiverInfo, new Boolean[]{Boolean.valueOf(true), Boolean.valueOf(false)});
                } else {
                    throw new IllegalManifestException(String.format("<receiver android:name=\"%1$s\" .../> is missing or disabled in AndroidManifest.", new Object[]{"com.xiaomi.push.service.receivers.PingReceiver"}));
                }
            } else if (findReceiverInfo != null) {
                checkReceiverInfo(findReceiverInfo, new Boolean[]{Boolean.valueOf(true), Boolean.valueOf(false)});
            }
        } catch (ClassNotFoundException e) {
            MyLog.e((Throwable) e);
        }
        Intent intent2 = new Intent("com.xiaomi.mipush.RECEIVE_MESSAGE");
        intent2.setPackage(packageName);
        boolean z = false;
        for (ResolveInfo resolveInfo : packageManager.queryBroadcastReceivers(intent2, 16384)) {
            ActivityInfo activityInfo = resolveInfo.activityInfo;
            if (activityInfo != null) {
                try {
                    if (!TextUtils.isEmpty(activityInfo.name) && PushMessageReceiver.class.isAssignableFrom(Class.forName(activityInfo.name)) && activityInfo.enabled) {
                        z = true;
                        if (!z) {
                            break;
                        }
                    }
                } catch (ClassNotFoundException e2) {
                    MyLog.e((Throwable) e2);
                }
            }
            z = false;
            if (!z) {
            }
        }
        if (z) {
            if (MiPushClient.getOpenHmsPush(context)) {
                checkAssembleReceiver(context, "com.huawei.android.push.intent.RECEIVE", "com.xiaomi.assemble.control.HmsPushReceiver");
                checkAssembleReceiver(context, "com.huawei.intent.action.PUSH", "com.huawei.hms.support.api.push.PushEventReceiver");
            }
            if (MiPushClient.getOpenVIVOPush(context)) {
                checkAssembleReceiver(context, "com.vivo.pushclient.action.RECEIVE", "com.xiaomi.assemble.control.FTOSPushMessageReceiver");
                return;
            }
            return;
        }
        throw new IllegalManifestException("Receiver: none of the subclasses of PushMessageReceiver is enabled or defined.");
    }

    /* access modifiers changed from: private */
    public static void checkServices(Context context, PackageInfo packageInfo) {
        ServiceInfo[] serviceInfoArr;
        HashMap hashMap = new HashMap();
        HashMap hashMap2 = new HashMap();
        hashMap2.put(PushMessageHandler.class.getCanonicalName(), new ServiceCheckInfo(PushMessageHandler.class.getCanonicalName(), true, true, ""));
        hashMap2.put(MessageHandleService.class.getCanonicalName(), new ServiceCheckInfo(MessageHandleService.class.getCanonicalName(), true, false, ""));
        if (!MiPushClient.shouldUseMIUIPush(context) || containAnyService(packageInfo, new String[]{"com.xiaomi.push.service.XMJobService", "com.xiaomi.push.service.XMPushService"})) {
            hashMap2.put("com.xiaomi.push.service.XMJobService", new ServiceCheckInfo("com.xiaomi.push.service.XMJobService", true, false, "android.permission.BIND_JOB_SERVICE"));
            hashMap2.put("com.xiaomi.push.service.XMPushService", new ServiceCheckInfo("com.xiaomi.push.service.XMPushService", true, false, ""));
        }
        if (MiPushClient.getOpenFCMPush(context)) {
            hashMap2.put("com.xiaomi.assemble.control.MiFireBaseInstanceIdService", new ServiceCheckInfo("com.xiaomi.assemble.control.MiFireBaseInstanceIdService", true, false, ""));
            hashMap2.put("com.xiaomi.assemble.control.MiFirebaseMessagingService", new ServiceCheckInfo("com.xiaomi.assemble.control.MiFirebaseMessagingService", true, false, ""));
        }
        if (MiPushClient.getOpenOPPOPush(context)) {
            hashMap2.put("com.xiaomi.assemble.control.COSPushMessageService", new ServiceCheckInfo("com.xiaomi.assemble.control.COSPushMessageService", true, true, "com.coloros.mcs.permission.SEND_MCS_MESSAGE"));
        }
        if (packageInfo.services != null) {
            for (ServiceInfo serviceInfo : packageInfo.services) {
                if (!TextUtils.isEmpty(serviceInfo.name) && hashMap2.containsKey(serviceInfo.name)) {
                    ServiceCheckInfo serviceCheckInfo = (ServiceCheckInfo) hashMap2.remove(serviceInfo.name);
                    boolean z = serviceCheckInfo.enabled;
                    boolean z2 = serviceCheckInfo.exported;
                    String str = serviceCheckInfo.permission;
                    if (z != serviceInfo.enabled) {
                        throw new IllegalManifestException(String.format("<service android:name=\"%1$s\" .../> in AndroidManifest had the wrong enabled attribute, which should be android:enabled=%2$b.", new Object[]{serviceInfo.name, Boolean.valueOf(z)}));
                    } else if (z2 != serviceInfo.exported) {
                        throw new IllegalManifestException(String.format("<service android:name=\"%1$s\" .../> in AndroidManifest had the wrong exported attribute, which should be android:exported=%2$b.", new Object[]{serviceInfo.name, Boolean.valueOf(z2)}));
                    } else if (TextUtils.isEmpty(str) || TextUtils.equals(str, serviceInfo.permission)) {
                        hashMap.put(serviceInfo.name, serviceInfo.processName);
                        if (hashMap2.isEmpty()) {
                            break;
                        }
                    } else {
                        throw new IllegalManifestException(String.format("<service android:name=\"%1$s\" .../> in AndroidManifest had the wrong permission attribute, which should be android:permission=\"%2$s\".", new Object[]{serviceInfo.name, str}));
                    }
                }
            }
        }
        if (!hashMap2.isEmpty()) {
            throw new IllegalManifestException(String.format("<service android:name=\"%1$s\" .../> is missing or disabled in AndroidManifest.", new Object[]{hashMap2.keySet().iterator().next()}));
        } else if (!TextUtils.equals((CharSequence) hashMap.get(PushMessageHandler.class.getCanonicalName()), (CharSequence) hashMap.get(MessageHandleService.class.getCanonicalName()))) {
            throw new IllegalManifestException(String.format("\"%1$s\" and \"%2$s\" must be running in the same process.", new Object[]{PushMessageHandler.class.getCanonicalName(), MessageHandleService.class.getCanonicalName()}));
        } else if (hashMap.containsKey("com.xiaomi.push.service.XMJobService") && hashMap.containsKey("com.xiaomi.push.service.XMPushService") && !TextUtils.equals((CharSequence) hashMap.get("com.xiaomi.push.service.XMJobService"), (CharSequence) hashMap.get("com.xiaomi.push.service.XMPushService"))) {
            throw new IllegalManifestException(String.format("\"%1$s\" and \"%2$s\" must be running in the same process.", new Object[]{"com.xiaomi.push.service.XMJobService", "com.xiaomi.push.service.XMPushService"}));
        }
    }

    private static boolean containAnyService(PackageInfo packageInfo, String[] strArr) {
        for (ServiceInfo serviceInfo : packageInfo.services) {
            if (containString(strArr, serviceInfo.name)) {
                return true;
            }
        }
        return false;
    }

    private static boolean containString(String[] strArr, String str) {
        if (strArr == null || str == null) {
            return false;
        }
        for (String equals : strArr) {
            if (TextUtils.equals(equals, str)) {
                return true;
            }
        }
        return false;
    }

    private static ActivityInfo findReceiverInfo(PackageManager packageManager, Intent intent, Class<?> cls) {
        for (ResolveInfo resolveInfo : packageManager.queryBroadcastReceivers(intent, 16384)) {
            ActivityInfo activityInfo = resolveInfo.activityInfo;
            if (activityInfo != null && cls.getCanonicalName().equals(activityInfo.name)) {
                return activityInfo;
            }
        }
        return null;
    }
}
