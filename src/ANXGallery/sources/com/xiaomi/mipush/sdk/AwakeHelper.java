package com.xiaomi.mipush.sdk;

import android.app.Activity;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.xiaomi.channel.commonutils.android.MIUIUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager.Job;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.push.service.OnlineConfig.OCUpdateCallback;
import com.xiaomi.push.service.PacketHelper;
import com.xiaomi.push.service.awake.module.AwakeManager;
import com.xiaomi.push.service.awake.module.HelpType;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.ConfigKey;
import com.xiaomi.xmpush.thrift.NotificationType;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.util.HashMap;
import org.apache.thrift.TBase;

public class AwakeHelper {
    public static void doAWork(final Context context, Intent intent, Uri uri) {
        if (context != null) {
            PushServiceClient.getInstance(context).awakePushService();
            if (AwakeManager.getInstance(context.getApplicationContext()).getSendDataIml() == null) {
                AwakeManager.getInstance(context.getApplicationContext()).setPackageInfo(AppInfoHolder.getInstance(context.getApplicationContext()).getAppID(), context.getPackageName(), OnlineConfig.getInstance(context.getApplicationContext()).getIntValue(ConfigKey.AwakeInfoUploadWaySwitch.getValue(), 0), new AppLayerProcessDataIml());
                OnlineConfig.getInstance(context).addOCUpdateCallbacks(new OCUpdateCallback(BaiduSceneResult.TAEKWONDO, "awake online config") {
                    /* access modifiers changed from: protected */
                    public void onCallback() {
                        AwakeManager.getInstance(context).setOnLineCmd(OnlineConfig.getInstance(context).getIntValue(ConfigKey.AwakeInfoUploadWaySwitch.getValue(), 0));
                    }
                });
            }
            if ((context instanceof Activity) && intent != null) {
                AwakeManager.getInstance(context.getApplicationContext()).sendResult(HelpType.ACTIVITY, context, intent, null);
            } else if (!(context instanceof Service) || intent == null) {
                if (uri != null && !TextUtils.isEmpty(uri.toString())) {
                    AwakeManager.getInstance(context.getApplicationContext()).sendResult(HelpType.PROVIDER, context, null, uri.toString());
                }
            } else if ("com.xiaomi.mipush.sdk.WAKEUP".equals(intent.getAction())) {
                AwakeManager.getInstance(context.getApplicationContext()).sendResult(HelpType.SERVICE_COMPONENT, context, intent, null);
            } else {
                AwakeManager.getInstance(context.getApplicationContext()).sendResult(HelpType.SERVICE_ACTION, context, intent, null);
            }
        }
    }

    public static void doAwAppLogic(Context context, String str, int i, String str2) {
        XmPushActionNotification xmPushActionNotification = new XmPushActionNotification();
        xmPushActionNotification.setAppId(str);
        xmPushActionNotification.setExtra(new HashMap());
        xmPushActionNotification.getExtra().put("extra_aw_app_online_cmd", String.valueOf(i));
        xmPushActionNotification.getExtra().put("extra_help_aw_info", str2);
        xmPushActionNotification.setId(PacketHelper.generatePacketID());
        byte[] convertThriftObjectToBytes = XmPushThriftSerializeUtils.convertThriftObjectToBytes(xmPushActionNotification);
        if (convertThriftObjectToBytes == null) {
            MyLog.w("send message fail, because msgBytes is null.");
            return;
        }
        Intent intent = new Intent();
        intent.setAction("action_aw_app_logic");
        intent.putExtra("mipush_payload", convertThriftObjectToBytes);
        PushServiceClient.getInstance(context).sendDataCommon(intent);
    }

    private static void doSendPingByWakedUpApp(final Context context, final XmPushActionNotification xmPushActionNotification) {
        boolean booleanValue = OnlineConfig.getInstance(context).getBooleanValue(ConfigKey.AwakeAppPingSwitch.getValue(), false);
        int intValue = OnlineConfig.getInstance(context).getIntValue(ConfigKey.AwakeAppPingFrequency.getValue(), 0);
        if (intValue >= 0 && intValue < 30) {
            MyLog.v("aw_ping: frquency need > 30s.");
            intValue = 30;
        }
        if (intValue < 0) {
            booleanValue = false;
        }
        if (!MIUIUtils.isMIUI()) {
            sendAwakeAppPingMessage(context, xmPushActionNotification, booleanValue, intValue);
        } else if (booleanValue) {
            ScheduledJobManager.getInstance(context.getApplicationContext()).addRepeatJob(new Job() {
                public int getJobId() {
                    return 22;
                }

                public void run() {
                    if (xmPushActionNotification != null) {
                        xmPushActionNotification.setId(PacketHelper.generatePacketID());
                        PushServiceClient.getInstance(context.getApplicationContext()).sendMessage(xmPushActionNotification, ActionType.Notification, true, null, true);
                    }
                }
            }, intValue);
        }
    }

    public static final <T extends TBase<T, ?>> void sendAwakeAppPingMessage(Context context, T t, boolean z, int i) {
        byte[] convertThriftObjectToBytes = XmPushThriftSerializeUtils.convertThriftObjectToBytes(t);
        if (convertThriftObjectToBytes == null) {
            MyLog.w("send message fail, because msgBytes is null.");
            return;
        }
        Intent intent = new Intent();
        intent.setAction("action_help_ping");
        intent.putExtra("extra_help_ping_switch", z);
        intent.putExtra("extra_help_ping_frequency", i);
        intent.putExtra("mipush_payload", convertThriftObjectToBytes);
        intent.putExtra("com.xiaomi.mipush.MESSAGE_CACHE", true);
        PushServiceClient.getInstance(context).sendDataCommon(intent);
    }

    public static void sendPingByWakeUpApp(Context context, String str) {
        MyLog.w("aw_ping : send aw_ping cmd and content to push service from 3rd app");
        HashMap hashMap = new HashMap();
        hashMap.put("awake_info", str);
        hashMap.put("event_type", String.valueOf(9999));
        hashMap.put("description", "ping message");
        XmPushActionNotification xmPushActionNotification = new XmPushActionNotification();
        xmPushActionNotification.setAppId(AppInfoHolder.getInstance(context).getAppID());
        xmPushActionNotification.setPackageName(context.getPackageName());
        xmPushActionNotification.setType(NotificationType.AwakeAppResponse.value);
        xmPushActionNotification.setId(PacketHelper.generatePacketID());
        xmPushActionNotification.extra = hashMap;
        doSendPingByWakedUpApp(context, xmPushActionNotification);
    }
}
