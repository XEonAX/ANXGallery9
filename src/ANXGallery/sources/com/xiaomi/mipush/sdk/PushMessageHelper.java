package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.xiaomi.xmpush.thrift.PushMetaInfo;
import com.xiaomi.xmpush.thrift.XmPushActionSendMessage;
import java.util.List;

public class PushMessageHelper {
    private static int pushMode;

    public static MiPushCommandMessage generateCommandMessage(String str, List<String> list, long j, String str2, String str3) {
        MiPushCommandMessage miPushCommandMessage = new MiPushCommandMessage();
        miPushCommandMessage.setCommand(str);
        miPushCommandMessage.setCommandArguments(list);
        miPushCommandMessage.setResultCode(j);
        miPushCommandMessage.setReason(str2);
        miPushCommandMessage.setCategory(str3);
        return miPushCommandMessage;
    }

    public static MiPushMessage generateMessage(XmPushActionSendMessage xmPushActionSendMessage, PushMetaInfo pushMetaInfo, boolean z) {
        MiPushMessage miPushMessage = new MiPushMessage();
        miPushMessage.setMessageId(xmPushActionSendMessage.getId());
        if (!TextUtils.isEmpty(xmPushActionSendMessage.getAliasName())) {
            miPushMessage.setMessageType(1);
            miPushMessage.setAlias(xmPushActionSendMessage.getAliasName());
        } else if (!TextUtils.isEmpty(xmPushActionSendMessage.getTopic())) {
            miPushMessage.setMessageType(2);
            miPushMessage.setTopic(xmPushActionSendMessage.getTopic());
        } else if (!TextUtils.isEmpty(xmPushActionSendMessage.getUserAccount())) {
            miPushMessage.setMessageType(3);
            miPushMessage.setUserAccount(xmPushActionSendMessage.getUserAccount());
        } else {
            miPushMessage.setMessageType(0);
        }
        miPushMessage.setCategory(xmPushActionSendMessage.getCategory());
        if (xmPushActionSendMessage.getMessage() != null) {
            miPushMessage.setContent(xmPushActionSendMessage.getMessage().getPayload());
        }
        if (pushMetaInfo != null) {
            if (TextUtils.isEmpty(miPushMessage.getMessageId())) {
                miPushMessage.setMessageId(pushMetaInfo.getId());
            }
            if (TextUtils.isEmpty(miPushMessage.getTopic())) {
                miPushMessage.setTopic(pushMetaInfo.getTopic());
            }
            miPushMessage.setDescription(pushMetaInfo.getDescription());
            miPushMessage.setTitle(pushMetaInfo.getTitle());
            miPushMessage.setNotifyType(pushMetaInfo.getNotifyType());
            miPushMessage.setNotifyId(pushMetaInfo.getNotifyId());
            miPushMessage.setPassThrough(pushMetaInfo.getPassThrough());
            miPushMessage.setExtra(pushMetaInfo.getExtra());
        }
        miPushMessage.setNotified(z);
        return miPushMessage;
    }

    public static int getPushMode(Context context) {
        if (pushMode == 0) {
            if (isUseCallbackPushMode(context)) {
                setPushMode(1);
            } else {
                setPushMode(2);
            }
        }
        return pushMode;
    }

    private static boolean isIntentAvailable(Context context, Intent intent) {
        boolean z = true;
        try {
            List queryBroadcastReceivers = context.getPackageManager().queryBroadcastReceivers(intent, 32);
            if (queryBroadcastReceivers == null || queryBroadcastReceivers.isEmpty()) {
                z = false;
            }
            return z;
        } catch (Exception unused) {
            return true;
        }
    }

    public static boolean isUseCallbackPushMode(Context context) {
        Intent intent = new Intent("com.xiaomi.mipush.RECEIVE_MESSAGE");
        intent.setClassName(context.getPackageName(), "com.xiaomi.mipush.sdk.PushServiceReceiver");
        return isIntentAvailable(context, intent);
    }

    public static void sendCommandMessageBroadcast(Context context, MiPushCommandMessage miPushCommandMessage) {
        Intent intent = new Intent("com.xiaomi.mipush.RECEIVE_MESSAGE");
        intent.setPackage(context.getPackageName());
        intent.putExtra("message_type", 3);
        intent.putExtra("key_command", miPushCommandMessage);
        new PushServiceReceiver().onReceive(context, intent);
    }

    private static void setPushMode(int i) {
        pushMode = i;
    }
}
