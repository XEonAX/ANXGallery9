package com.xiaomi.mipush.sdk;

import android.content.Context;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.PacketHelper;
import com.xiaomi.push.service.awake.AwakeDataHelper;
import com.xiaomi.push.service.awake.module.AwakeManager;
import com.xiaomi.push.service.awake.module.IProcessData;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.NotificationType;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import java.util.HashMap;

public class AppLayerProcessDataIml implements IProcessData {
    public void sendByTinyData(Context context, HashMap<String, String> hashMap) {
        MiTinyDataClient.upload("category_awake_app", "wake_up_app", 1, AwakeDataHelper.getString(hashMap));
        MyLog.w("MoleInfo：　send data in app layer");
    }

    public void sendDirectly(Context context, HashMap<String, String> hashMap) {
        XmPushActionNotification xmPushActionNotification = new XmPushActionNotification();
        xmPushActionNotification.setAppId(AwakeManager.getInstance(context).getAppId());
        xmPushActionNotification.setPackageName(AwakeManager.getInstance(context).getPackageName());
        xmPushActionNotification.setType(NotificationType.AwakeAppResponse.value);
        xmPushActionNotification.setId(PacketHelper.generatePacketID());
        xmPushActionNotification.extra = hashMap;
        PushServiceClient.getInstance(context).sendMessage(xmPushActionNotification, ActionType.Notification, true, null, true);
        MyLog.w("MoleInfo：　send data in app layer");
    }

    public void shouldDoLast(Context context, HashMap<String, String> hashMap) {
        StringBuilder sb = new StringBuilder();
        sb.append("MoleInfo：　");
        sb.append(AwakeDataHelper.obfuscateLogContent(hashMap));
        MyLog.w(sb.toString());
        String str = (String) hashMap.get("event_type");
        String str2 = (String) hashMap.get("awake_info");
        if (String.valueOf(1007).equals(str)) {
            AwakeHelper.sendPingByWakeUpApp(context, str2);
        }
    }
}
