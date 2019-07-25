package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.android.AppInfoUtils;
import com.xiaomi.channel.commonutils.android.DeviceInfo;
import com.xiaomi.channel.commonutils.android.MIUIUtils;
import com.xiaomi.channel.commonutils.android.PreferenceUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.CollectionUtils;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.push.service.PacketHelper;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.ConfigKey;
import com.xiaomi.xmpush.thrift.NotificationType;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

public class SyncInfoHelper {
    public static void doSyncInfoAsync(final Context context, final boolean z) {
        ScheduledJobManager.getInstance(context).addOneShootJob(new Runnable() {
            public void run() {
                MyLog.w("do sync info");
                XmPushActionNotification xmPushActionNotification = new XmPushActionNotification(PacketHelper.generatePacketID(), false);
                AppInfoHolder instance = AppInfoHolder.getInstance(context);
                xmPushActionNotification.setType(NotificationType.SyncInfo.value);
                xmPushActionNotification.setAppId(instance.getAppID());
                xmPushActionNotification.setPackageName(context.getPackageName());
                xmPushActionNotification.extra = new HashMap();
                PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "app_version", AppInfoUtils.getVersionName(context, context.getPackageName()));
                PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "app_version_code", Integer.toString(AppInfoUtils.getVersionCode(context, context.getPackageName())));
                PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "push_sdk_vn", "3_6_19");
                PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "push_sdk_vc", Integer.toString(30619));
                PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "token", instance.getAppToken());
                if (!MIUIUtils.isGlobalRegion()) {
                    String md5Digest = XMStringUtils.getMd5Digest(DeviceInfo.blockingGetIMEI(context));
                    String blockingGetSubIMEISMd5 = DeviceInfo.blockingGetSubIMEISMd5(context);
                    if (!TextUtils.isEmpty(blockingGetSubIMEISMd5)) {
                        StringBuilder sb = new StringBuilder();
                        sb.append(md5Digest);
                        sb.append(",");
                        sb.append(blockingGetSubIMEISMd5);
                        md5Digest = sb.toString();
                    }
                    if (!TextUtils.isEmpty(md5Digest)) {
                        PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "imei_md5", md5Digest);
                    }
                }
                PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "reg_id", instance.getRegID());
                PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "reg_secret", instance.getRegSecret());
                PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "accept_time", MiPushClient.getAcceptTime(context).replace(",", "-"));
                if (z) {
                    PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "aliases_md5", SyncInfoHelper.getMd5Summary(MiPushClient.getAllAlias(context)));
                    PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "topics_md5", SyncInfoHelper.getMd5Summary(MiPushClient.getAllTopic(context)));
                    PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "accounts_md5", SyncInfoHelper.getMd5Summary(MiPushClient.getAllUserAccount(context)));
                } else {
                    PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "aliases", SyncInfoHelper.formatList(MiPushClient.getAllAlias(context)));
                    PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "topics", SyncInfoHelper.formatList(MiPushClient.getAllTopic(context)));
                    PreferenceUtils.putNotNullExtra(xmPushActionNotification.extra, "user_accounts", SyncInfoHelper.formatList(MiPushClient.getAllUserAccount(context)));
                }
                PushServiceClient.getInstance(context).sendMessage(xmPushActionNotification, ActionType.Notification, false, null);
            }
        });
    }

    /* access modifiers changed from: private */
    public static String formatList(List<String> list) {
        if (CollectionUtils.isEmpty(list)) {
            return "";
        }
        ArrayList<String> arrayList = new ArrayList<>(list);
        Collections.sort(arrayList, Collator.getInstance(Locale.CHINA));
        String str = "";
        for (String str2 : arrayList) {
            if (!TextUtils.isEmpty(str)) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(",");
                str = sb.toString();
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append(str);
            sb2.append(str2);
            str = sb2.toString();
        }
        return str;
    }

    /* access modifiers changed from: private */
    public static String getMd5Summary(List<String> list) {
        String md5Digest = XMStringUtils.getMd5Digest(formatList(list));
        return (TextUtils.isEmpty(md5Digest) || md5Digest.length() <= 4) ? "" : md5Digest.substring(0, 4).toLowerCase();
    }

    public static void saveInfo(Context context, XmPushActionNotification xmPushActionNotification) {
        StringBuilder sb = new StringBuilder();
        sb.append("need to update local info with: ");
        sb.append(xmPushActionNotification.getExtra());
        MyLog.w(sb.toString());
        String str = (String) xmPushActionNotification.getExtra().get("accept_time");
        if (str != null) {
            MiPushClient.removeAcceptTime(context);
            String[] split = str.split("-");
            if (split.length == 2) {
                MiPushClient.addAcceptTime(context, split[0], split[1]);
                if (!"00:00".equals(split[0]) || !"00:00".equals(split[1])) {
                    AppInfoHolder.getInstance(context).setPaused(false);
                } else {
                    AppInfoHolder.getInstance(context).setPaused(true);
                }
            }
        }
        String str2 = (String) xmPushActionNotification.getExtra().get("aliases");
        if (str2 != null) {
            MiPushClient.removeAllAliases(context);
            if (!"".equals(str2)) {
                for (String addAlias : str2.split(",")) {
                    MiPushClient.addAlias(context, addAlias);
                }
            }
        }
        String str3 = (String) xmPushActionNotification.getExtra().get("topics");
        if (str3 != null) {
            MiPushClient.removeAllTopics(context);
            if (!"".equals(str3)) {
                for (String addTopic : str3.split(",")) {
                    MiPushClient.addTopic(context, addTopic);
                }
            }
        }
        String str4 = (String) xmPushActionNotification.getExtra().get("user_accounts");
        if (str4 != null) {
            MiPushClient.removeAllAccounts(context);
            if (!"".equals(str4)) {
                for (String addAccount : str4.split(",")) {
                    MiPushClient.addAccount(context, addAccount);
                }
            }
        }
    }

    public static void tryToSyncInfo(Context context) {
        SharedPreferences sharedPreferences = context.getSharedPreferences("mipush_extra", 0);
        long j = sharedPreferences.getLong("last_sync_info", -1);
        long currentTimeMillis = System.currentTimeMillis() / 1000;
        long intValue = (long) OnlineConfig.getInstance(context).getIntValue(ConfigKey.SyncInfoFrequency.getValue(), 1209600);
        if (j == -1) {
            sharedPreferences.edit().putLong("last_sync_info", currentTimeMillis).commit();
        } else if (Math.abs(currentTimeMillis - j) > intValue) {
            doSyncInfoAsync(context, true);
            sharedPreferences.edit().putLong("last_sync_info", currentTimeMillis).commit();
        }
    }
}
