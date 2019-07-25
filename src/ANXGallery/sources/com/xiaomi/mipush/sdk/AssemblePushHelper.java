package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.android.SharedPrefsCompat;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.push.service.OnlineConfig;
import java.util.HashMap;

public class AssemblePushHelper {
    private static HashMap<String, String> mTokens = new HashMap<>();

    static void checkAssemblePushStatus(Context context) {
        boolean z = false;
        SharedPreferences sharedPreferences = context.getSharedPreferences("mipush_extra", 0);
        String tokenKey = getTokenKey(AssemblePush.ASSEMBLE_PUSH_HUAWEI);
        String tokenKey2 = getTokenKey(AssemblePush.ASSEMBLE_PUSH_FCM);
        if (!TextUtils.isEmpty(sharedPreferences.getString(tokenKey, "")) && TextUtils.isEmpty(sharedPreferences.getString(tokenKey2, ""))) {
            z = true;
        }
        if (z) {
            PushServiceClient.getInstance(context).send3rdPushHint(2, tokenKey);
        }
    }

    public static HashMap<String, String> getAssemblePushExtra(Context context, AssemblePush assemblePush) {
        ApplicationInfo applicationInfo;
        HashMap<String, String> hashMap = new HashMap<>();
        String tokenKey = getTokenKey(assemblePush);
        if (TextUtils.isEmpty(tokenKey)) {
            return hashMap;
        }
        String str = null;
        switch (assemblePush) {
            case ASSEMBLE_PUSH_HUAWEI:
                try {
                    applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
                } catch (Exception e) {
                    MyLog.e(e.toString());
                    applicationInfo = null;
                }
                int i = -1;
                if (applicationInfo != null) {
                    i = applicationInfo.metaData.getInt("com.huawei.hms.client.appid");
                }
                StringBuilder sb = new StringBuilder();
                sb.append("brand:");
                sb.append(AssemblePushUtils.getPhoneBrand(context).name());
                sb.append("~");
                sb.append("token");
                sb.append(":");
                sb.append(getAssemblePushToken(context, tokenKey));
                sb.append("~");
                sb.append("package_name");
                sb.append(":");
                sb.append(context.getPackageName());
                sb.append("~");
                sb.append("app_id");
                sb.append(":");
                sb.append(i);
                str = sb.toString();
                break;
            case ASSEMBLE_PUSH_FCM:
                StringBuilder sb2 = new StringBuilder();
                sb2.append("brand:");
                sb2.append(PhoneBrand.FCM.name());
                sb2.append("~");
                sb2.append("token");
                sb2.append(":");
                sb2.append(getAssemblePushToken(context, tokenKey));
                sb2.append("~");
                sb2.append("package_name");
                sb2.append(":");
                sb2.append(context.getPackageName());
                str = sb2.toString();
                break;
            case ASSEMBLE_PUSH_COS:
                StringBuilder sb3 = new StringBuilder();
                sb3.append("brand:");
                sb3.append(PhoneBrand.OPPO.name());
                sb3.append("~");
                sb3.append("token");
                sb3.append(":");
                sb3.append(getAssemblePushToken(context, tokenKey));
                sb3.append("~");
                sb3.append("package_name");
                sb3.append(":");
                sb3.append(context.getPackageName());
                str = sb3.toString();
                break;
            case ASSEMBLE_PUSH_FTOS:
                StringBuilder sb4 = new StringBuilder();
                sb4.append("brand:");
                sb4.append(PhoneBrand.VIVO.name());
                sb4.append("~");
                sb4.append("token");
                sb4.append(":");
                sb4.append(getAssemblePushToken(context, tokenKey));
                sb4.append("~");
                sb4.append("package_name");
                sb4.append(":");
                sb4.append(context.getPackageName());
                str = sb4.toString();
                break;
        }
        hashMap.put("RegInfo", str);
        return hashMap;
    }

    protected static synchronized String getAssemblePushToken(Context context, String str) {
        String str2;
        synchronized (AssemblePushHelper.class) {
            str2 = (String) mTokens.get(str);
            if (TextUtils.isEmpty(str2)) {
                str2 = "";
            }
        }
        return str2;
    }

    public static String getTokenKey(AssemblePush assemblePush) {
        switch (assemblePush) {
            case ASSEMBLE_PUSH_HUAWEI:
                return "hms_push_token";
            case ASSEMBLE_PUSH_FCM:
                return "fcm_push_token";
            case ASSEMBLE_PUSH_COS:
                return "cos_push_token";
            case ASSEMBLE_PUSH_FTOS:
                return "ftos_push_token";
            default:
                return null;
        }
    }

    public static boolean isOpenAssemblePushOnlineSwitch(Context context, AssemblePush assemblePush) {
        if (AssemblePushInfoHelper.getConfigKeyByType(assemblePush) != null) {
            return OnlineConfig.getInstance(context).getBooleanValue(AssemblePushInfoHelper.getConfigKeyByType(assemblePush).getValue(), true);
        }
        return false;
    }

    public static void registerAssemblePush(Context context) {
        AssemblePushCollectionsManager.getInstance(context).register();
    }

    /* access modifiers changed from: private */
    public static synchronized void saveAssemblePushToken(Context context, AssemblePush assemblePush, String str) {
        synchronized (AssemblePushHelper.class) {
            String tokenKey = getTokenKey(assemblePush);
            if (TextUtils.isEmpty(tokenKey)) {
                MyLog.w("ASSEMBLE_PUSH : can not find the key of token used in sp file");
                return;
            }
            SharedPrefsCompat.apply(context.getSharedPreferences("mipush_extra", 0).edit().putString(tokenKey, str));
            StringBuilder sb = new StringBuilder();
            sb.append("ASSEMBLE_PUSH : update sp file success!  ");
            sb.append(str);
            MyLog.w(sb.toString());
        }
    }

    public static void saveAssemblePushTokenAfterAck(final Context context, final AssemblePush assemblePush, final String str) {
        ScheduledJobManager.getInstance(context).addOneShootJob(new Runnable() {
            public void run() {
                if (!TextUtils.isEmpty(str)) {
                    String str = "";
                    String[] split = str.split("~");
                    int length = split.length;
                    int i = 0;
                    while (true) {
                        if (i >= length) {
                            break;
                        }
                        String str2 = split[i];
                        if (!TextUtils.isEmpty(str2) && str2.startsWith("token:")) {
                            str = str2.substring(str2.indexOf(":") + 1);
                            break;
                        }
                        i++;
                    }
                    if (!TextUtils.isEmpty(str)) {
                        MyLog.w("ASSEMBLE_PUSH : receive correct token");
                        AssemblePushHelper.saveAssemblePushToken(context, assemblePush, str);
                        AssemblePushHelper.checkAssemblePushStatus(context);
                        return;
                    }
                    MyLog.w("ASSEMBLE_PUSH : receive incorrect token");
                }
            }
        });
    }

    public static void unregisterAssemblePush(Context context) {
        AssemblePushCollectionsManager.getInstance(context).unregister();
    }
}
