package com.xiaomi.mipush.sdk;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.content.pm.ServiceInfo;
import android.net.Uri;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.android.DeviceInfo;
import com.xiaomi.channel.commonutils.android.SharedPrefsCompat;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import com.xiaomi.mipush.sdk.stat.PushStatClientManager;
import com.xiaomi.push.clientreport.PerfMessageHelper;
import com.xiaomi.push.service.MIPushNotificationHelper;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.push.service.OnlineConfigHelper;
import com.xiaomi.push.service.PushConstants;
import com.xiaomi.push.service.clientReport.PushClientReportHelper;
import com.xiaomi.push.service.clientReport.PushClientReportManager;
import com.xiaomi.push.service.xmpush.Command;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.ConfigKey;
import com.xiaomi.xmpush.thrift.NotificationType;
import com.xiaomi.xmpush.thrift.PushMessage;
import com.xiaomi.xmpush.thrift.PushMetaInfo;
import com.xiaomi.xmpush.thrift.RegistrationReason;
import com.xiaomi.xmpush.thrift.XmPushActionAckMessage;
import com.xiaomi.xmpush.thrift.XmPushActionAckNotification;
import com.xiaomi.xmpush.thrift.XmPushActionCommandResult;
import com.xiaomi.xmpush.thrift.XmPushActionContainer;
import com.xiaomi.xmpush.thrift.XmPushActionCustomConfig;
import com.xiaomi.xmpush.thrift.XmPushActionNormalConfig;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import com.xiaomi.xmpush.thrift.XmPushActionRegistrationResult;
import com.xiaomi.xmpush.thrift.XmPushActionSendMessage;
import com.xiaomi.xmpush.thrift.XmPushActionSubscriptionResult;
import com.xiaomi.xmpush.thrift.XmPushActionUnRegistrationResult;
import com.xiaomi.xmpush.thrift.XmPushActionUnSubscriptionResult;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.TimeZone;
import org.apache.thrift.TBase;
import org.apache.thrift.TException;

public class PushMessageProcessor {
    private static Object lock = new Object();
    private static Queue<String> mCachedMsgIds;
    private static PushMessageProcessor sInstance;
    private Context sAppContext;

    private PushMessageProcessor(Context context) {
        this.sAppContext = context.getApplicationContext();
        if (this.sAppContext == null) {
            this.sAppContext = context;
        }
    }

    private void ackMessage(XmPushActionContainer xmPushActionContainer) {
        PushMetaInfo metaInfo = xmPushActionContainer.getMetaInfo();
        XmPushActionAckMessage xmPushActionAckMessage = new XmPushActionAckMessage();
        xmPushActionAckMessage.setAppId(xmPushActionContainer.getAppid());
        xmPushActionAckMessage.setId(metaInfo.getId());
        xmPushActionAckMessage.setMessageTs(metaInfo.getMessageTs());
        if (!TextUtils.isEmpty(metaInfo.getTopic())) {
            xmPushActionAckMessage.setTopic(metaInfo.getTopic());
        }
        xmPushActionAckMessage.setDeviceStatus(XmPushThriftSerializeUtils.getDeviceStatus(this.sAppContext, xmPushActionContainer));
        PushServiceClient.getInstance(this.sAppContext).sendMessage(xmPushActionAckMessage, ActionType.AckMessage, false, xmPushActionContainer.getMetaInfo());
    }

    private void ackMessage(XmPushActionSendMessage xmPushActionSendMessage, XmPushActionContainer xmPushActionContainer) {
        PushMetaInfo metaInfo = xmPushActionContainer.getMetaInfo();
        XmPushActionAckMessage xmPushActionAckMessage = new XmPushActionAckMessage();
        xmPushActionAckMessage.setAppId(xmPushActionSendMessage.getAppId());
        xmPushActionAckMessage.setId(xmPushActionSendMessage.getId());
        xmPushActionAckMessage.setMessageTs(xmPushActionSendMessage.getMessage().getCreateAt());
        if (!TextUtils.isEmpty(xmPushActionSendMessage.getTopic())) {
            xmPushActionAckMessage.setTopic(xmPushActionSendMessage.getTopic());
        }
        if (!TextUtils.isEmpty(xmPushActionSendMessage.getAliasName())) {
            xmPushActionAckMessage.setAliasName(xmPushActionSendMessage.getAliasName());
        }
        xmPushActionAckMessage.setDeviceStatus(XmPushThriftSerializeUtils.getDeviceStatus(this.sAppContext, xmPushActionContainer));
        PushServiceClient.getInstance(this.sAppContext).sendMessage(xmPushActionAckMessage, ActionType.AckMessage, metaInfo);
    }

    public static PushMessageProcessor getInstance(Context context) {
        if (sInstance == null) {
            sInstance = new PushMessageProcessor(context);
        }
        return sInstance;
    }

    /* JADX WARNING: Removed duplicated region for block: B:60:0x0152  */
    public static Intent getNotificationMessageIntent(Context context, String str, Map<String, String> map) {
        Intent intent;
        if (map == null || !map.containsKey("notify_effect")) {
            return null;
        }
        String str2 = (String) map.get("notify_effect");
        int i = -1;
        String str3 = (String) map.get("intent_flag");
        try {
            if (!TextUtils.isEmpty(str3)) {
                i = Integer.parseInt(str3);
            }
        } catch (NumberFormatException e) {
            StringBuilder sb = new StringBuilder();
            sb.append("Cause by intent_flag: ");
            sb.append(e.getMessage());
            MyLog.e(sb.toString());
        }
        if (PushConstants.NOTIFICATION_CLICK_DEFAULT.equals(str2)) {
            try {
                intent = context.getPackageManager().getLaunchIntentForPackage(str);
            } catch (Exception e2) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Cause: ");
                sb2.append(e2.getMessage());
                MyLog.e(sb2.toString());
            }
        } else if (!PushConstants.NOTIFICATION_CLICK_INTENT.equals(str2)) {
            if (PushConstants.NOTIFICATION_CLICK_WEB_PAGE.equals(str2)) {
                String str4 = (String) map.get("web_uri");
                if (str4 != null) {
                    String trim = str4.trim();
                    if (!trim.startsWith("http://") && !trim.startsWith("https://")) {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("http://");
                        sb3.append(trim);
                        trim = sb3.toString();
                    }
                    try {
                        String protocol = new URL(trim).getProtocol();
                        if ("http".equals(protocol) || "https".equals(protocol)) {
                            intent = new Intent("android.intent.action.VIEW");
                            try {
                                intent.setData(Uri.parse(trim));
                            } catch (MalformedURLException e3) {
                                e = e3;
                            }
                        }
                    } catch (MalformedURLException e4) {
                        e = e4;
                        intent = null;
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("Cause: ");
                        sb4.append(e.getMessage());
                        MyLog.e(sb4.toString());
                        if (intent != null) {
                        }
                        return null;
                    }
                }
            }
            intent = null;
        } else if (map.containsKey("intent_uri")) {
            String str5 = (String) map.get("intent_uri");
            if (str5 != null) {
                try {
                    intent = Intent.parseUri(str5, 1);
                    try {
                        intent.setPackage(str);
                    } catch (URISyntaxException e5) {
                        e = e5;
                    }
                } catch (URISyntaxException e6) {
                    e = e6;
                    intent = null;
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("Cause: ");
                    sb5.append(e.getMessage());
                    MyLog.e(sb5.toString());
                    if (intent != null) {
                    }
                    return null;
                }
            }
            intent = null;
        } else {
            if (map.containsKey("class_name")) {
                String str6 = (String) map.get("class_name");
                Intent intent2 = new Intent();
                intent2.setComponent(new ComponentName(str, str6));
                intent = intent2;
            }
            intent = null;
        }
        if (intent != null) {
            if (i >= 0) {
                intent.setFlags(i);
            }
            intent.addFlags(268435456);
            try {
                if (context.getPackageManager().resolveActivity(intent, 65536) != null) {
                    return intent;
                }
            } catch (Exception e7) {
                StringBuilder sb6 = new StringBuilder();
                sb6.append("Cause: ");
                sb6.append(e7.getMessage());
                MyLog.e(sb6.toString());
            }
        }
        return null;
    }

    private static boolean isDuplicateMessage(Context context, String str) {
        synchronized (lock) {
            AppInfoHolder.getInstance(context);
            SharedPreferences sharedPreferences = AppInfoHolder.getSharedPreferences(context);
            if (mCachedMsgIds == null) {
                String[] split = sharedPreferences.getString("pref_msg_ids", "").split(",");
                mCachedMsgIds = new LinkedList();
                for (String add : split) {
                    mCachedMsgIds.add(add);
                }
            }
            if (mCachedMsgIds.contains(str)) {
                return true;
            }
            mCachedMsgIds.add(str);
            if (mCachedMsgIds.size() > 25) {
                mCachedMsgIds.poll();
            }
            String join = XMStringUtils.join((Collection<?>) mCachedMsgIds, ",");
            Editor edit = sharedPreferences.edit();
            edit.putString("pref_msg_ids", join);
            SharedPrefsCompat.apply(edit);
            return false;
        }
    }

    private boolean isHybridMsg(XmPushActionContainer xmPushActionContainer) {
        if (!TextUtils.equals("com.miui.hybrid", xmPushActionContainer.getPackageName()) && !TextUtils.equals("com.miui.hybrid.loader", xmPushActionContainer.getPackageName())) {
            return false;
        }
        Map extra = xmPushActionContainer.getMetaInfo() == null ? null : xmPushActionContainer.getMetaInfo().getExtra();
        if (extra == null) {
            return false;
        }
        String str = (String) extra.get("push_server_action");
        return TextUtils.equals(str, "hybrid_message") || TextUtils.equals(str, "platform_message");
    }

    /* JADX WARNING: type inference failed for: r10v0 */
    /* JADX WARNING: type inference failed for: r10v1, types: [com.xiaomi.mipush.sdk.PushMessageHandler$PushMessageInterface] */
    /* JADX WARNING: type inference failed for: r7v4, types: [com.xiaomi.mipush.sdk.MiPushMessage, java.io.Serializable] */
    /* JADX WARNING: type inference failed for: r10v2 */
    /* JADX WARNING: type inference failed for: r10v3 */
    /* JADX WARNING: type inference failed for: r4v14, types: [java.util.List] */
    /* JADX WARNING: type inference failed for: r10v4, types: [java.util.List, java.util.ArrayList] */
    /* JADX WARNING: type inference failed for: r10v5 */
    /* JADX WARNING: type inference failed for: r12v0, types: [java.util.List] */
    /* JADX WARNING: type inference failed for: r10v6, types: [java.util.List, java.util.ArrayList] */
    /* JADX WARNING: type inference failed for: r10v7 */
    /* JADX WARNING: type inference failed for: r12v1, types: [java.util.List] */
    /* JADX WARNING: type inference failed for: r10v8, types: [java.util.List, java.util.ArrayList] */
    /* JADX WARNING: type inference failed for: r10v9 */
    /* JADX WARNING: type inference failed for: r10v10 */
    /* JADX WARNING: type inference failed for: r10v11 */
    /* JADX WARNING: type inference failed for: r10v12 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r10v0
  assigns: [?[int, float, boolean, short, byte, char, OBJECT, ARRAY], java.util.ArrayList, ?[OBJECT, ARRAY]]
  uses: [?[OBJECT, ARRAY], java.util.List, com.xiaomi.mipush.sdk.PushMessageHandler$PushMessageInterface]
  mth insns count: 910
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 9 */
    private PushMessageInterface processMessage(XmPushActionContainer xmPushActionContainer, boolean z, byte[] bArr, String str, int i) {
        ? r10;
        XmPushActionContainer xmPushActionContainer2 = xmPushActionContainer;
        boolean z2 = z;
        byte[] bArr2 = bArr;
        String str2 = str;
        int i2 = i;
        ? r102 = 0;
        try {
            TBase responseMessageBodyFromContainer = PushContainerHelper.getResponseMessageBodyFromContainer(this.sAppContext, xmPushActionContainer2);
            if (responseMessageBodyFromContainer == null) {
                StringBuilder sb = new StringBuilder();
                sb.append("receiving an un-recognized message. ");
                sb.append(xmPushActionContainer2.action);
                MyLog.e(sb.toString());
                PushClientReportManager.getInstance(this.sAppContext).reportEvent4ERROR(this.sAppContext.getPackageName(), PushClientReportHelper.getInterfaceIdByType(i), str2, "receiving an un-recognized message.");
                return null;
            }
            ActionType action = xmPushActionContainer.getAction();
            StringBuilder sb2 = new StringBuilder();
            sb2.append("processing a message, action=");
            sb2.append(action);
            MyLog.w(sb2.toString());
            switch (action) {
                case SendMessage:
                    if (!AppInfoHolder.getInstance(this.sAppContext).isPaused() || z2) {
                        XmPushActionSendMessage xmPushActionSendMessage = (XmPushActionSendMessage) responseMessageBodyFromContainer;
                        PushMessage message = xmPushActionSendMessage.getMessage();
                        if (message == null) {
                            MyLog.e("receive an empty message without push content, drop it");
                            PushClientReportManager.getInstance(this.sAppContext).reportEvent4ERROR(this.sAppContext.getPackageName(), PushClientReportHelper.getInterfaceIdByType(i), str2, "receive an empty message without push content, drop it");
                            return null;
                        }
                        if (z2) {
                            if (MIPushNotificationHelper.isBusinessMessage(xmPushActionContainer)) {
                                MiPushClient.reportIgnoreRegMessageClicked(this.sAppContext, message.getId(), xmPushActionContainer.getMetaInfo(), xmPushActionContainer2.packageName, message.getAppId());
                            } else {
                                MiPushClient.reportMessageClicked(this.sAppContext, message.getId(), xmPushActionContainer.getMetaInfo(), message.getAppId());
                            }
                        }
                        if (!z2) {
                            if (!TextUtils.isEmpty(xmPushActionSendMessage.getAliasName()) && MiPushClient.aliasSetTime(this.sAppContext, xmPushActionSendMessage.getAliasName()) < 0) {
                                MiPushClient.addAlias(this.sAppContext, xmPushActionSendMessage.getAliasName());
                            } else if (!TextUtils.isEmpty(xmPushActionSendMessage.getTopic()) && MiPushClient.topicSubscribedTime(this.sAppContext, xmPushActionSendMessage.getTopic()) < 0) {
                                MiPushClient.addTopic(this.sAppContext, xmPushActionSendMessage.getTopic());
                            }
                        }
                        String str3 = (xmPushActionContainer2.metaInfo == null || xmPushActionContainer2.metaInfo.getExtra() == null) ? null : (String) xmPushActionContainer2.metaInfo.extra.get("jobkey");
                        if (TextUtils.isEmpty(str3)) {
                            str3 = message.getId();
                        }
                        if (z2 || !isDuplicateMessage(this.sAppContext, str3)) {
                            ? generateMessage = PushMessageHelper.generateMessage(xmPushActionSendMessage, xmPushActionContainer.getMetaInfo(), z2);
                            if (generateMessage.getPassThrough() != 0 || z2 || !MIPushNotificationHelper.isNotifyForeground(generateMessage.getExtra())) {
                                StringBuilder sb3 = new StringBuilder();
                                sb3.append("receive a message, msgid=");
                                sb3.append(message.getId());
                                sb3.append(", jobkey=");
                                sb3.append(str3);
                                MyLog.w(sb3.toString());
                                if (!z2 || generateMessage.getExtra() == null || !generateMessage.getExtra().containsKey("notify_effect")) {
                                    r10 = generateMessage;
                                } else {
                                    Map extra = generateMessage.getExtra();
                                    String str4 = (String) extra.get("notify_effect");
                                    if (MIPushNotificationHelper.isBusinessMessage(xmPushActionContainer)) {
                                        Intent notificationMessageIntent = getNotificationMessageIntent(this.sAppContext, xmPushActionContainer2.packageName, extra);
                                        notificationMessageIntent.putExtra("eventMessageType", i2);
                                        notificationMessageIntent.putExtra("messageId", str2);
                                        if (notificationMessageIntent == null) {
                                            MyLog.w("Getting Intent fail from ignore reg message. ");
                                            PushClientReportManager.getInstance(this.sAppContext).reportEvent4ERROR(this.sAppContext.getPackageName(), PushClientReportHelper.getInterfaceIdByType(i), str2, "Getting Intent fail from ignore reg message.");
                                            return null;
                                        }
                                        String payload = message.getPayload();
                                        if (!TextUtils.isEmpty(payload)) {
                                            notificationMessageIntent.putExtra("payload", payload);
                                        }
                                        this.sAppContext.startActivity(notificationMessageIntent);
                                        PushClientReportManager instance = PushClientReportManager.getInstance(this.sAppContext);
                                        String packageName = this.sAppContext.getPackageName();
                                        String interfaceIdByType = PushClientReportHelper.getInterfaceIdByType(i);
                                        StringBuilder sb4 = new StringBuilder();
                                        sb4.append("business message is clicked typeId ");
                                        sb4.append(str4);
                                        instance.reportEvent(packageName, interfaceIdByType, str, 3006, sb4.toString());
                                    } else {
                                        Intent notificationMessageIntent2 = getNotificationMessageIntent(this.sAppContext, this.sAppContext.getPackageName(), extra);
                                        if (notificationMessageIntent2 != null) {
                                            if (!str4.equals(PushConstants.NOTIFICATION_CLICK_WEB_PAGE)) {
                                                notificationMessageIntent2.putExtra("key_message", generateMessage);
                                                notificationMessageIntent2.putExtra("eventMessageType", i2);
                                                notificationMessageIntent2.putExtra("messageId", str2);
                                            }
                                            this.sAppContext.startActivity(notificationMessageIntent2);
                                            PushClientReportManager instance2 = PushClientReportManager.getInstance(this.sAppContext);
                                            String packageName2 = this.sAppContext.getPackageName();
                                            String interfaceIdByType2 = PushClientReportHelper.getInterfaceIdByType(i);
                                            StringBuilder sb5 = new StringBuilder();
                                            sb5.append("notification message is clicked typeId ");
                                            sb5.append(str4);
                                            instance2.reportEvent(packageName2, interfaceIdByType2, str, 1006, sb5.toString());
                                            if (str4.equals(PushConstants.NOTIFICATION_CLICK_WEB_PAGE)) {
                                                PushClientReportManager instance3 = PushClientReportManager.getInstance(this.sAppContext);
                                                String packageName3 = this.sAppContext.getPackageName();
                                                String interfaceIdByType3 = PushClientReportHelper.getInterfaceIdByType(i);
                                                StringBuilder sb6 = new StringBuilder();
                                                sb6.append("try open web page typeId ");
                                                sb6.append(str4);
                                                instance3.reportEvent4NeedDrop(packageName3, interfaceIdByType3, str2, sb6.toString());
                                            }
                                        }
                                    }
                                    return null;
                                }
                            } else {
                                MIPushNotificationHelper.notifyPushMessage(this.sAppContext, xmPushActionContainer2, bArr2);
                                return null;
                            }
                        } else {
                            StringBuilder sb7 = new StringBuilder();
                            sb7.append("drop a duplicate message, key=");
                            sb7.append(str3);
                            MyLog.w(sb7.toString());
                            PushClientReportManager instance4 = PushClientReportManager.getInstance(this.sAppContext);
                            String packageName4 = this.sAppContext.getPackageName();
                            String interfaceIdByType4 = PushClientReportHelper.getInterfaceIdByType(i);
                            StringBuilder sb8 = new StringBuilder();
                            sb8.append("drop a duplicate message, key=");
                            sb8.append(str3);
                            instance4.reportEvent4DUPMD(packageName4, interfaceIdByType4, str2, sb8.toString());
                            r10 = r102;
                        }
                        if (xmPushActionContainer.getMetaInfo() == null && !z2) {
                            ackMessage(xmPushActionSendMessage, xmPushActionContainer2);
                        }
                        return r10;
                    }
                    MyLog.w("receive a message in pause state. drop it");
                    PushClientReportManager.getInstance(this.sAppContext).reportEvent4NeedDrop(this.sAppContext.getPackageName(), PushClientReportHelper.getInterfaceIdByType(i), str2, "receive a message in pause state. drop it");
                    return null;
                case Registration:
                    XmPushActionRegistrationResult xmPushActionRegistrationResult = (XmPushActionRegistrationResult) responseMessageBodyFromContainer;
                    String str5 = AppInfoHolder.getInstance(this.sAppContext).appRegRequestId;
                    if (TextUtils.isEmpty(str5) || !TextUtils.equals(str5, xmPushActionRegistrationResult.getId())) {
                        MyLog.w("bad Registration result:");
                        PushClientReportManager.getInstance(this.sAppContext).reportEvent4ERROR(this.sAppContext.getPackageName(), PushClientReportHelper.getInterfaceIdByType(i), str2, "bad Registration result:");
                        return null;
                    }
                    AppInfoHolder.getInstance(this.sAppContext).appRegRequestId = null;
                    if (xmPushActionRegistrationResult.errorCode == 0) {
                        AppInfoHolder.getInstance(this.sAppContext).putRegIDAndSecret(xmPushActionRegistrationResult.regId, xmPushActionRegistrationResult.regSecret, xmPushActionRegistrationResult.region);
                        PushClientReportManager.getInstance(this.sAppContext).reportEvent(this.sAppContext.getPackageName(), PushClientReportHelper.getInterfaceIdByType(i), str, 6006, "receive register result success");
                    } else {
                        PushClientReportManager.getInstance(this.sAppContext).reportEvent(this.sAppContext.getPackageName(), PushClientReportHelper.getInterfaceIdByType(i), str, 6006, "receive register result fail");
                    }
                    if (!TextUtils.isEmpty(xmPushActionRegistrationResult.regId)) {
                        ? arrayList = new ArrayList();
                        arrayList.add(xmPushActionRegistrationResult.regId);
                        r102 = arrayList;
                    }
                    MiPushCommandMessage generateCommandMessage = PushMessageHelper.generateCommandMessage(Command.COMMAND_REGISTER.value, r102, xmPushActionRegistrationResult.errorCode, xmPushActionRegistrationResult.reason, null);
                    PushServiceClient.getInstance(this.sAppContext).processPendRequest();
                    return generateCommandMessage;
                case UnRegistration:
                    if (((XmPushActionUnRegistrationResult) responseMessageBodyFromContainer).errorCode == 0) {
                        AppInfoHolder.getInstance(this.sAppContext).clear();
                        MiPushClient.clearExtras(this.sAppContext);
                    }
                    PushMessageHandler.removeAllPushCallbackClass();
                    break;
                case Subscription:
                    XmPushActionSubscriptionResult xmPushActionSubscriptionResult = (XmPushActionSubscriptionResult) responseMessageBodyFromContainer;
                    if (xmPushActionSubscriptionResult.errorCode == 0) {
                        MiPushClient.addTopic(this.sAppContext, xmPushActionSubscriptionResult.getTopic());
                    }
                    if (!TextUtils.isEmpty(xmPushActionSubscriptionResult.getTopic())) {
                        ? arrayList2 = new ArrayList();
                        arrayList2.add(xmPushActionSubscriptionResult.getTopic());
                        r102 = arrayList2;
                    }
                    return PushMessageHelper.generateCommandMessage(Command.COMMAND_SUBSCRIBE_TOPIC.value, r102, xmPushActionSubscriptionResult.errorCode, xmPushActionSubscriptionResult.reason, xmPushActionSubscriptionResult.getCategory());
                case UnSubscription:
                    XmPushActionUnSubscriptionResult xmPushActionUnSubscriptionResult = (XmPushActionUnSubscriptionResult) responseMessageBodyFromContainer;
                    if (xmPushActionUnSubscriptionResult.errorCode == 0) {
                        MiPushClient.removeTopic(this.sAppContext, xmPushActionUnSubscriptionResult.getTopic());
                    }
                    if (!TextUtils.isEmpty(xmPushActionUnSubscriptionResult.getTopic())) {
                        ? arrayList3 = new ArrayList();
                        arrayList3.add(xmPushActionUnSubscriptionResult.getTopic());
                        r102 = arrayList3;
                    }
                    return PushMessageHelper.generateCommandMessage(Command.COMMAND_UNSUBSCRIBE_TOPIC.value, r102, xmPushActionUnSubscriptionResult.errorCode, xmPushActionUnSubscriptionResult.reason, xmPushActionUnSubscriptionResult.getCategory());
                case Command:
                    PerfMessageHelper.collectPerfData(this.sAppContext.getPackageName(), this.sAppContext, responseMessageBodyFromContainer, ActionType.Command, bArr2.length);
                    XmPushActionCommandResult xmPushActionCommandResult = (XmPushActionCommandResult) responseMessageBodyFromContainer;
                    String cmdName = xmPushActionCommandResult.getCmdName();
                    List cmdArgs = xmPushActionCommandResult.getCmdArgs();
                    if (xmPushActionCommandResult.errorCode == 0) {
                        if (TextUtils.equals(cmdName, Command.COMMAND_SET_ACCEPT_TIME.value) && cmdArgs != null && cmdArgs.size() > 1) {
                            MiPushClient.addAcceptTime(this.sAppContext, (String) cmdArgs.get(0), (String) cmdArgs.get(1));
                            if (!"00:00".equals(cmdArgs.get(0)) || !"00:00".equals(cmdArgs.get(1))) {
                                AppInfoHolder.getInstance(this.sAppContext).setPaused(false);
                            } else {
                                AppInfoHolder.getInstance(this.sAppContext).setPaused(true);
                            }
                            cmdArgs = getTimeForTimeZone(TimeZone.getTimeZone("GMT+08"), TimeZone.getDefault(), cmdArgs);
                        } else if (TextUtils.equals(cmdName, Command.COMMAND_SET_ALIAS.value) && cmdArgs != null && cmdArgs.size() > 0) {
                            MiPushClient.addAlias(this.sAppContext, (String) cmdArgs.get(0));
                        } else if (TextUtils.equals(cmdName, Command.COMMAND_UNSET_ALIAS.value) && cmdArgs != null && cmdArgs.size() > 0) {
                            MiPushClient.removeAlias(this.sAppContext, (String) cmdArgs.get(0));
                        } else if (TextUtils.equals(cmdName, Command.COMMAND_SET_ACCOUNT.value) && cmdArgs != null && cmdArgs.size() > 0) {
                            MiPushClient.addAccount(this.sAppContext, (String) cmdArgs.get(0));
                        } else if (TextUtils.equals(cmdName, Command.COMMAND_UNSET_ACCOUNT.value) && cmdArgs != null && cmdArgs.size() > 0) {
                            MiPushClient.removeAccount(this.sAppContext, (String) cmdArgs.get(0));
                        } else if (TextUtils.equals(cmdName, Command.COMMAND_CHK_VDEVID.value)) {
                            if (cmdArgs != null && cmdArgs.size() > 0) {
                                DeviceInfo.updateVirtDevId(this.sAppContext, (String) cmdArgs.get(0));
                            }
                            return null;
                        }
                    }
                    return PushMessageHelper.generateCommandMessage(cmdName, cmdArgs, xmPushActionCommandResult.errorCode, xmPushActionCommandResult.reason, xmPushActionCommandResult.getCategory());
                case Notification:
                    PerfMessageHelper.collectPerfData(this.sAppContext.getPackageName(), this.sAppContext, responseMessageBodyFromContainer, ActionType.Notification, bArr2.length);
                    if (!(responseMessageBodyFromContainer instanceof XmPushActionAckNotification)) {
                        if (responseMessageBodyFromContainer instanceof XmPushActionNotification) {
                            XmPushActionNotification xmPushActionNotification = (XmPushActionNotification) responseMessageBodyFromContainer;
                            if (!"registration id expired".equalsIgnoreCase(xmPushActionNotification.type)) {
                                if (!"client_info_update_ok".equalsIgnoreCase(xmPushActionNotification.type)) {
                                    if (!NotificationType.AwakeApp.value.equalsIgnoreCase(xmPushActionNotification.type)) {
                                        if (!NotificationType.NormalClientConfigUpdate.value.equalsIgnoreCase(xmPushActionNotification.type)) {
                                            if (!NotificationType.CustomClientConfigUpdate.value.equalsIgnoreCase(xmPushActionNotification.type)) {
                                                if (!NotificationType.SyncInfoResult.value.equalsIgnoreCase(xmPushActionNotification.type)) {
                                                    if (!NotificationType.ForceSync.value.equalsIgnoreCase(xmPushActionNotification.type)) {
                                                        if (!NotificationType.CancelPushMessage.value.equals(xmPushActionNotification.type)) {
                                                            if (!NotificationType.HybridRegisterResult.value.equals(xmPushActionNotification.type)) {
                                                                if (!NotificationType.HybridUnregisterResult.value.equals(xmPushActionNotification.type)) {
                                                                    if (NotificationType.PushLogUpload.value.equals(xmPushActionNotification.type) && xmPushActionNotification.getExtra() != null && xmPushActionNotification.getExtra().containsKey("packages")) {
                                                                        String[] split = ((String) xmPushActionNotification.getExtra().get("packages")).split(",");
                                                                        if (!TextUtils.equals(this.sAppContext.getPackageName(), "com.xiaomi.xmsf")) {
                                                                            Logger.uploadLogFile(this.sAppContext, false);
                                                                            break;
                                                                        } else {
                                                                            Logger.uploadLogFile(this.sAppContext, true);
                                                                            uploadAppLog(this.sAppContext, split);
                                                                            break;
                                                                        }
                                                                    }
                                                                } else {
                                                                    try {
                                                                        XmPushActionUnRegistrationResult xmPushActionUnRegistrationResult = new XmPushActionUnRegistrationResult();
                                                                        XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionUnRegistrationResult, xmPushActionNotification.getBinaryExtra());
                                                                        MiPushClient4Hybrid.onReceiveUnregisterResult(this.sAppContext, xmPushActionUnRegistrationResult);
                                                                        break;
                                                                    } catch (TException e) {
                                                                        MyLog.e((Throwable) e);
                                                                        break;
                                                                    }
                                                                }
                                                            } else {
                                                                try {
                                                                    XmPushActionRegistrationResult xmPushActionRegistrationResult2 = new XmPushActionRegistrationResult();
                                                                    XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionRegistrationResult2, xmPushActionNotification.getBinaryExtra());
                                                                    MiPushClient4Hybrid.onReceiveRegisterResult(this.sAppContext, xmPushActionRegistrationResult2);
                                                                    break;
                                                                } catch (TException e2) {
                                                                    MyLog.e((Throwable) e2);
                                                                    break;
                                                                }
                                                            }
                                                        } else if (xmPushActionNotification.getExtra() != null) {
                                                            int i3 = -2;
                                                            if (xmPushActionNotification.getExtra().containsKey(PushConstants.PUSH_NOTIFY_ID)) {
                                                                String str6 = (String) xmPushActionNotification.getExtra().get(PushConstants.PUSH_NOTIFY_ID);
                                                                if (!TextUtils.isEmpty(str6)) {
                                                                    try {
                                                                        i3 = Integer.parseInt(str6);
                                                                    } catch (NumberFormatException e3) {
                                                                        e3.printStackTrace();
                                                                    }
                                                                }
                                                            }
                                                            if (i3 < -1) {
                                                                String str7 = "";
                                                                String str8 = "";
                                                                if (xmPushActionNotification.getExtra().containsKey(PushConstants.PUSH_TITLE)) {
                                                                    str7 = (String) xmPushActionNotification.getExtra().get(PushConstants.PUSH_TITLE);
                                                                }
                                                                if (xmPushActionNotification.getExtra().containsKey(PushConstants.PUSH_DESCRIPTION)) {
                                                                    str8 = (String) xmPushActionNotification.getExtra().get(PushConstants.PUSH_DESCRIPTION);
                                                                }
                                                                MiPushClient.clearNotification(this.sAppContext, str7, str8);
                                                                break;
                                                            } else {
                                                                MiPushClient.clearNotification(this.sAppContext, i3);
                                                                break;
                                                            }
                                                        }
                                                    } else {
                                                        MyLog.w("receive force sync notification");
                                                        SyncInfoHelper.doSyncInfoAsync(this.sAppContext, false);
                                                        break;
                                                    }
                                                } else {
                                                    SyncInfoHelper.saveInfo(this.sAppContext, xmPushActionNotification);
                                                    break;
                                                }
                                            } else {
                                                XmPushActionCustomConfig xmPushActionCustomConfig = new XmPushActionCustomConfig();
                                                try {
                                                    XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionCustomConfig, xmPushActionNotification.getBinaryExtra());
                                                    OnlineConfigHelper.updateCustomConfigs(OnlineConfig.getInstance(this.sAppContext), xmPushActionCustomConfig);
                                                    break;
                                                } catch (TException e4) {
                                                    MyLog.e((Throwable) e4);
                                                    break;
                                                }
                                            }
                                        } else {
                                            XmPushActionNormalConfig xmPushActionNormalConfig = new XmPushActionNormalConfig();
                                            try {
                                                XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionNormalConfig, xmPushActionNotification.getBinaryExtra());
                                                OnlineConfigHelper.updateNormalConfigs(OnlineConfig.getInstance(this.sAppContext), xmPushActionNormalConfig);
                                                break;
                                            } catch (TException e5) {
                                                MyLog.e((Throwable) e5);
                                                break;
                                            }
                                        }
                                    } else if (xmPushActionContainer.isEncryptAction() && xmPushActionNotification.getExtra() != null && xmPushActionNotification.getExtra().containsKey("awake_info")) {
                                        AwakeHelper.doAwAppLogic(this.sAppContext, AppInfoHolder.getInstance(this.sAppContext).getAppID(), OnlineConfig.getInstance(this.sAppContext).getIntValue(ConfigKey.AwakeInfoUploadWaySwitch.getValue(), 0), (String) xmPushActionNotification.getExtra().get("awake_info"));
                                        break;
                                    }
                                } else if (xmPushActionNotification.getExtra() != null && xmPushActionNotification.getExtra().containsKey("app_version")) {
                                    AppInfoHolder.getInstance(this.sAppContext).updateVersionName((String) xmPushActionNotification.getExtra().get("app_version"));
                                    break;
                                }
                            } else {
                                List<String> allAlias = MiPushClient.getAllAlias(this.sAppContext);
                                List<String> allTopic = MiPushClient.getAllTopic(this.sAppContext);
                                List<String> allUserAccount = MiPushClient.getAllUserAccount(this.sAppContext);
                                String acceptTime = MiPushClient.getAcceptTime(this.sAppContext);
                                MiPushClient.reInitialize(this.sAppContext, RegistrationReason.RegIdExpired);
                                for (String str9 : allAlias) {
                                    MiPushClient.removeAlias(this.sAppContext, str9);
                                    MiPushClient.setAlias(this.sAppContext, str9, null);
                                }
                                for (String str10 : allTopic) {
                                    MiPushClient.removeTopic(this.sAppContext, str10);
                                    MiPushClient.subscribe(this.sAppContext, str10, null);
                                }
                                for (String str11 : allUserAccount) {
                                    MiPushClient.removeAccount(this.sAppContext, str11);
                                    MiPushClient.setUserAccount(this.sAppContext, str11, null);
                                }
                                String[] split2 = acceptTime.split(",");
                                if (split2.length == 2) {
                                    MiPushClient.removeAcceptTime(this.sAppContext);
                                    MiPushClient.addAcceptTime(this.sAppContext, split2[0], split2[1]);
                                    break;
                                }
                            }
                        }
                    } else {
                        XmPushActionAckNotification xmPushActionAckNotification = (XmPushActionAckNotification) responseMessageBodyFromContainer;
                        String id = xmPushActionAckNotification.getId();
                        if (!NotificationType.DisablePushMessage.value.equalsIgnoreCase(xmPushActionAckNotification.type)) {
                            if (!NotificationType.EnablePushMessage.value.equalsIgnoreCase(xmPushActionAckNotification.type)) {
                                if (!NotificationType.ThirdPartyRegUpdate.value.equalsIgnoreCase(xmPushActionAckNotification.type)) {
                                    if (NotificationType.UploadTinyData.value.equalsIgnoreCase(xmPushActionAckNotification.type)) {
                                        processStatDataACK(xmPushActionAckNotification);
                                        break;
                                    }
                                } else {
                                    processSendTokenAckNotification(xmPushActionAckNotification);
                                    break;
                                }
                            } else if (xmPushActionAckNotification.errorCode != 0) {
                                if (!"syncing".equals(OperatePushHelper.getInstance(this.sAppContext).getSyncStatus(RetryType.ENABLE_PUSH))) {
                                    OperatePushHelper.getInstance(this.sAppContext).removeOperateMessage(id);
                                    break;
                                } else {
                                    synchronized (OperatePushHelper.class) {
                                        if (OperatePushHelper.getInstance(this.sAppContext).isMessageOperating(id)) {
                                            if (OperatePushHelper.getInstance(this.sAppContext).getRetryCount(id) < 10) {
                                                OperatePushHelper.getInstance(this.sAppContext).increaseRetryCount(id);
                                                PushServiceClient.getInstance(this.sAppContext).sendPushEnableDisableMessage(false, id);
                                            } else {
                                                OperatePushHelper.getInstance(this.sAppContext).removeOperateMessage(id);
                                            }
                                        }
                                    }
                                    break;
                                }
                            } else {
                                synchronized (OperatePushHelper.class) {
                                    if (OperatePushHelper.getInstance(this.sAppContext).isMessageOperating(id)) {
                                        OperatePushHelper.getInstance(this.sAppContext).removeOperateMessage(id);
                                        if ("syncing".equals(OperatePushHelper.getInstance(this.sAppContext).getSyncStatus(RetryType.ENABLE_PUSH))) {
                                            OperatePushHelper.getInstance(this.sAppContext).putSyncStatus(RetryType.ENABLE_PUSH, "synced");
                                        }
                                    }
                                }
                                break;
                            }
                        } else if (xmPushActionAckNotification.errorCode != 0) {
                            if (!"syncing".equals(OperatePushHelper.getInstance(this.sAppContext).getSyncStatus(RetryType.DISABLE_PUSH))) {
                                OperatePushHelper.getInstance(this.sAppContext).removeOperateMessage(id);
                                break;
                            } else {
                                synchronized (OperatePushHelper.class) {
                                    if (OperatePushHelper.getInstance(this.sAppContext).isMessageOperating(id)) {
                                        if (OperatePushHelper.getInstance(this.sAppContext).getRetryCount(id) < 10) {
                                            OperatePushHelper.getInstance(this.sAppContext).increaseRetryCount(id);
                                            PushServiceClient.getInstance(this.sAppContext).sendPushEnableDisableMessage(true, id);
                                        } else {
                                            OperatePushHelper.getInstance(this.sAppContext).removeOperateMessage(id);
                                        }
                                    }
                                }
                                break;
                            }
                        } else {
                            synchronized (OperatePushHelper.class) {
                                if (OperatePushHelper.getInstance(this.sAppContext).isMessageOperating(id)) {
                                    OperatePushHelper.getInstance(this.sAppContext).removeOperateMessage(id);
                                    if ("syncing".equals(OperatePushHelper.getInstance(this.sAppContext).getSyncStatus(RetryType.DISABLE_PUSH))) {
                                        OperatePushHelper.getInstance(this.sAppContext).putSyncStatus(RetryType.DISABLE_PUSH, "synced");
                                        MiPushClient.clearNotification(this.sAppContext);
                                        MiPushClient.clearLocalNotificationType(this.sAppContext);
                                        PushMessageHandler.removeAllPushCallbackClass();
                                        PushServiceClient.getInstance(this.sAppContext).closePush();
                                    }
                                }
                            }
                            break;
                        }
                    }
                    break;
            }
            return null;
        } catch (DecryptException e6) {
            MyLog.e((Throwable) e6);
            reportDecryptFail(xmPushActionContainer);
            PushClientReportManager.getInstance(this.sAppContext).reportEvent4ERROR(this.sAppContext.getPackageName(), PushClientReportHelper.getInterfaceIdByType(i), str2, (Throwable) e6);
            return null;
        } catch (TException e7) {
            MyLog.e((Throwable) e7);
            MyLog.e("receive a message which action string is not valid. is the reg expired?");
            PushClientReportManager.getInstance(this.sAppContext).reportEvent4ERROR(this.sAppContext.getPackageName(), PushClientReportHelper.getInterfaceIdByType(i), str2, (Throwable) e7);
            return null;
        }
    }

    private PushMessageInterface processMessage(XmPushActionContainer xmPushActionContainer, byte[] bArr) {
        String str = null;
        try {
            TBase responseMessageBodyFromContainer = PushContainerHelper.getResponseMessageBodyFromContainer(this.sAppContext, xmPushActionContainer);
            if (responseMessageBodyFromContainer == null) {
                StringBuilder sb = new StringBuilder();
                sb.append("message arrived: receiving an un-recognized message. ");
                sb.append(xmPushActionContainer.action);
                MyLog.e(sb.toString());
                return null;
            }
            ActionType action = xmPushActionContainer.getAction();
            StringBuilder sb2 = new StringBuilder();
            sb2.append("message arrived: processing an arrived message, action=");
            sb2.append(action);
            MyLog.w(sb2.toString());
            if (AnonymousClass2.$SwitchMap$com$xiaomi$xmpush$thrift$ActionType[action.ordinal()] != 1) {
                return null;
            }
            XmPushActionSendMessage xmPushActionSendMessage = (XmPushActionSendMessage) responseMessageBodyFromContainer;
            PushMessage message = xmPushActionSendMessage.getMessage();
            if (message == null) {
                MyLog.e("message arrived: receive an empty message without push content, drop it");
                return null;
            }
            if (!(xmPushActionContainer.metaInfo == null || xmPushActionContainer.metaInfo.getExtra() == null)) {
                str = (String) xmPushActionContainer.metaInfo.extra.get("jobkey");
            }
            MiPushMessage generateMessage = PushMessageHelper.generateMessage(xmPushActionSendMessage, xmPushActionContainer.getMetaInfo(), false);
            generateMessage.setArrivedMessage(true);
            StringBuilder sb3 = new StringBuilder();
            sb3.append("message arrived: receive a message, msgid=");
            sb3.append(message.getId());
            sb3.append(", jobkey=");
            sb3.append(str);
            MyLog.w(sb3.toString());
            return generateMessage;
        } catch (DecryptException e) {
            MyLog.e((Throwable) e);
            MyLog.e("message arrived: receive a message but decrypt failed. report when click.");
            return null;
        } catch (TException e2) {
            MyLog.e((Throwable) e2);
            MyLog.e("message arrived: receive a message which action string is not valid. is the reg expired?");
            return null;
        }
    }

    private void processSendTokenAckNotification(XmPushActionAckNotification xmPushActionAckNotification) {
        StringBuilder sb = new StringBuilder();
        sb.append("ASSEMBLE_PUSH : ");
        sb.append(xmPushActionAckNotification.toString());
        MyLog.v(sb.toString());
        String id = xmPushActionAckNotification.getId();
        Map extra = xmPushActionAckNotification.getExtra();
        if (extra != null) {
            String str = (String) extra.get("RegInfo");
            if (!TextUtils.isEmpty(str)) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("brand:");
                sb2.append(PhoneBrand.FCM.name());
                if (str.contains(sb2.toString())) {
                    MyLog.w("ASSEMBLE_PUSH : receive fcm token sync ack");
                    AssemblePushHelper.saveAssemblePushTokenAfterAck(this.sAppContext, AssemblePush.ASSEMBLE_PUSH_FCM, str);
                    processSingleTokenACK(id, xmPushActionAckNotification.errorCode, AssemblePush.ASSEMBLE_PUSH_FCM);
                    return;
                }
                StringBuilder sb3 = new StringBuilder();
                sb3.append("brand:");
                sb3.append(PhoneBrand.HUAWEI.name());
                if (str.contains(sb3.toString())) {
                    MyLog.w("ASSEMBLE_PUSH : receive hw token sync ack");
                    AssemblePushHelper.saveAssemblePushTokenAfterAck(this.sAppContext, AssemblePush.ASSEMBLE_PUSH_HUAWEI, str);
                    processSingleTokenACK(id, xmPushActionAckNotification.errorCode, AssemblePush.ASSEMBLE_PUSH_HUAWEI);
                    return;
                }
                StringBuilder sb4 = new StringBuilder();
                sb4.append("brand:");
                sb4.append(PhoneBrand.OPPO.name());
                if (str.contains(sb4.toString())) {
                    MyLog.w("ASSEMBLE_PUSH : receive COS token sync ack");
                    AssemblePushHelper.saveAssemblePushTokenAfterAck(this.sAppContext, AssemblePush.ASSEMBLE_PUSH_COS, str);
                    processSingleTokenACK(id, xmPushActionAckNotification.errorCode, AssemblePush.ASSEMBLE_PUSH_COS);
                    return;
                }
                StringBuilder sb5 = new StringBuilder();
                sb5.append("brand:");
                sb5.append(PhoneBrand.VIVO.name());
                if (str.contains(sb5.toString())) {
                    MyLog.w("ASSEMBLE_PUSH : receive FTOS token sync ack");
                    AssemblePushHelper.saveAssemblePushTokenAfterAck(this.sAppContext, AssemblePush.ASSEMBLE_PUSH_FTOS, str);
                    processSingleTokenACK(id, xmPushActionAckNotification.errorCode, AssemblePush.ASSEMBLE_PUSH_FTOS);
                }
            }
        }
    }

    private void processSingleTokenACK(String str, long j, AssemblePush assemblePush) {
        RetryType retryType = AssemblePushInfoHelper.getRetryType(assemblePush);
        if (retryType != null) {
            if (j == 0) {
                synchronized (OperatePushHelper.class) {
                    if (OperatePushHelper.getInstance(this.sAppContext).isMessageOperating(str)) {
                        OperatePushHelper.getInstance(this.sAppContext).removeOperateMessage(str);
                        if ("syncing".equals(OperatePushHelper.getInstance(this.sAppContext).getSyncStatus(retryType))) {
                            OperatePushHelper.getInstance(this.sAppContext).putSyncStatus(retryType, "synced");
                        }
                    }
                }
            } else if ("syncing".equals(OperatePushHelper.getInstance(this.sAppContext).getSyncStatus(retryType))) {
                synchronized (OperatePushHelper.class) {
                    if (OperatePushHelper.getInstance(this.sAppContext).isMessageOperating(str)) {
                        if (OperatePushHelper.getInstance(this.sAppContext).getRetryCount(str) < 10) {
                            OperatePushHelper.getInstance(this.sAppContext).increaseRetryCount(str);
                            PushServiceClient.getInstance(this.sAppContext).sendAssemblePushTokenCommon(str, retryType, assemblePush);
                        } else {
                            OperatePushHelper.getInstance(this.sAppContext).removeOperateMessage(str);
                        }
                    }
                }
            } else {
                OperatePushHelper.getInstance(this.sAppContext).removeOperateMessage(str);
            }
        }
    }

    private void processStatDataACK(XmPushActionAckNotification xmPushActionAckNotification) {
        String id = xmPushActionAckNotification.getId();
        StringBuilder sb = new StringBuilder();
        sb.append("receive ack ");
        sb.append(id);
        MyLog.i(sb.toString());
        Map extra = xmPushActionAckNotification.getExtra();
        if (extra != null) {
            String str = (String) extra.get("real_source");
            if (!TextUtils.isEmpty(str)) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("receive ack : messageId = ");
                sb2.append(id);
                sb2.append("  realSource = ");
                sb2.append(str);
                MyLog.i(sb2.toString());
                PushStatClientManager.getInstance(this.sAppContext).onResult(id, str, Boolean.valueOf(xmPushActionAckNotification.errorCode == 0));
            }
        }
    }

    private void reportDecryptFail(XmPushActionContainer xmPushActionContainer) {
        MyLog.w("receive a message but decrypt failed. report now.");
        XmPushActionNotification xmPushActionNotification = new XmPushActionNotification(xmPushActionContainer.getMetaInfo().id, false);
        xmPushActionNotification.setType(NotificationType.DecryptMessageFail.value);
        xmPushActionNotification.setAppId(xmPushActionContainer.getAppid());
        xmPushActionNotification.setPackageName(xmPushActionContainer.packageName);
        xmPushActionNotification.extra = new HashMap();
        xmPushActionNotification.extra.put("regid", MiPushClient.getRegId(this.sAppContext));
        PushServiceClient.getInstance(this.sAppContext).sendMessage(xmPushActionNotification, ActionType.Notification, false, null);
    }

    /* access modifiers changed from: private */
    public void sendUploadLogIntent(Context context, PackageInfo packageInfo) {
        ServiceInfo[] serviceInfoArr = packageInfo.services;
        if (serviceInfoArr != null) {
            int length = serviceInfoArr.length;
            int i = 0;
            while (i < length) {
                ServiceInfo serviceInfo = serviceInfoArr[i];
                if (!serviceInfo.exported || !serviceInfo.enabled || !"com.xiaomi.mipush.sdk.PushMessageHandler".equals(serviceInfo.name) || context.getPackageName().equals(serviceInfo.packageName)) {
                    i++;
                } else {
                    try {
                        Intent intent = new Intent();
                        intent.setClassName(serviceInfo.packageName, serviceInfo.name);
                        intent.setAction("com.xiaomi.mipush.sdk.SYNC_LOG");
                        PushMessageHandler.addJob(context, intent);
                        return;
                    } catch (Throwable unused) {
                        return;
                    }
                }
            }
        }
    }

    private void tryToReinitialize() {
        SharedPreferences sharedPreferences = this.sAppContext.getSharedPreferences("mipush_extra", 0);
        long currentTimeMillis = System.currentTimeMillis();
        if (Math.abs(currentTimeMillis - sharedPreferences.getLong("last_reinitialize", 0)) > 1800000) {
            MiPushClient.reInitialize(this.sAppContext, RegistrationReason.PackageUnregistered);
            sharedPreferences.edit().putLong("last_reinitialize", currentTimeMillis).commit();
        }
    }

    private void uploadAppLog(final Context context, final String[] strArr) {
        ScheduledJobManager.getInstance(context).addOneShootJob(new Runnable() {
            public void run() {
                int i = 0;
                while (i < strArr.length) {
                    try {
                        if (!TextUtils.isEmpty(strArr[i])) {
                            if (i > 0) {
                                Thread.sleep(((long) ((Math.random() * 2.0d) + 1.0d)) * 1000);
                            }
                            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(strArr[i], 4);
                            if (packageInfo != null) {
                                PushMessageProcessor.this.sendUploadLogIntent(context, packageInfo);
                            }
                        }
                        i++;
                    } catch (Throwable th) {
                        MyLog.e(th);
                        return;
                    }
                }
            }
        });
    }

    public List<String> getTimeForTimeZone(TimeZone timeZone, TimeZone timeZone2, List<String> list) {
        List<String> list2 = list;
        if (timeZone.equals(timeZone2)) {
            return list2;
        }
        long rawOffset = (long) (((timeZone.getRawOffset() - timeZone2.getRawOffset()) / 1000) / 60);
        long parseLong = Long.parseLong(((String) list2.get(0)).split(":")[0]);
        long parseLong2 = Long.parseLong(((String) list2.get(0)).split(":")[1]);
        long j = ((((parseLong * 60) + parseLong2) - rawOffset) + 1440) % 1440;
        long parseLong3 = ((((Long.parseLong(((String) list2.get(1)).split(":")[0]) * 60) + Long.parseLong(((String) list2.get(1)).split(":")[1])) - rawOffset) + 1440) % 1440;
        ArrayList arrayList = new ArrayList();
        arrayList.add(String.format("%1$02d:%2$02d", new Object[]{Long.valueOf(j / 60), Long.valueOf(j % 60)}));
        arrayList.add(String.format("%1$02d:%2$02d", new Object[]{Long.valueOf(parseLong3 / 60), Long.valueOf(parseLong3 % 60)}));
        return arrayList;
    }

    public PushMessageInterface processIntent(Intent intent) {
        String action = intent.getAction();
        StringBuilder sb = new StringBuilder();
        sb.append("receive an intent from server, action=");
        sb.append(action);
        MyLog.w(sb.toString());
        String stringExtra = intent.getStringExtra("mrt");
        if (stringExtra == null) {
            stringExtra = Long.toString(System.currentTimeMillis());
        }
        String stringExtra2 = intent.getStringExtra("messageId");
        int intExtra = intent.getIntExtra("eventMessageType", -1);
        if ("com.xiaomi.mipush.RECEIVE_MESSAGE".equals(action)) {
            byte[] byteArrayExtra = intent.getByteArrayExtra("mipush_payload");
            boolean booleanExtra = intent.getBooleanExtra("mipush_notified", false);
            if (byteArrayExtra == null) {
                MyLog.e("receiving an empty message, drop");
                PushClientReportManager.getInstance(this.sAppContext).reportEvent4ERROR(this.sAppContext.getPackageName(), intent, "receiving an empty message, drop");
                return null;
            }
            XmPushActionContainer xmPushActionContainer = new XmPushActionContainer();
            try {
                XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionContainer, byteArrayExtra);
                AppInfoHolder instance = AppInfoHolder.getInstance(this.sAppContext);
                PushMetaInfo metaInfo = xmPushActionContainer.getMetaInfo();
                if (xmPushActionContainer.getAction() == ActionType.SendMessage && metaInfo != null && !instance.isPaused() && !booleanExtra) {
                    metaInfo.putToExtra("mrt", stringExtra);
                    metaInfo.putToExtra("mat", Long.toString(System.currentTimeMillis()));
                    if (!isHybridMsg(xmPushActionContainer)) {
                        ackMessage(xmPushActionContainer);
                    } else {
                        MyLog.i("this is a mina's message, ack later");
                        metaInfo.putToExtra("__hybrid_message_ts", String.valueOf(metaInfo.getMessageTs()));
                        metaInfo.putToExtra("__hybrid_device_status", String.valueOf(XmPushThriftSerializeUtils.getDeviceStatus(this.sAppContext, xmPushActionContainer)));
                    }
                }
                if (xmPushActionContainer.getAction() == ActionType.SendMessage && !xmPushActionContainer.isEncryptAction()) {
                    if (!MIPushNotificationHelper.isBusinessMessage(xmPushActionContainer)) {
                        String str = "drop an un-encrypted messages. %1$s, %2$s";
                        Object[] objArr = new Object[2];
                        objArr[0] = xmPushActionContainer.getPackageName();
                        objArr[1] = metaInfo != null ? metaInfo.getId() : "";
                        MyLog.w(String.format(str, objArr));
                        PushClientReportManager instance2 = PushClientReportManager.getInstance(this.sAppContext);
                        String packageName = this.sAppContext.getPackageName();
                        String str2 = "drop an un-encrypted messages. %1$s, %2$s";
                        Object[] objArr2 = new Object[2];
                        objArr2[0] = xmPushActionContainer.getPackageName();
                        objArr2[1] = metaInfo != null ? metaInfo.getId() : "";
                        instance2.reportEvent4ERROR(packageName, intent, String.format(str2, objArr2));
                        return null;
                    } else if (!booleanExtra || metaInfo.getExtra() == null || !metaInfo.getExtra().containsKey("notify_effect")) {
                        MyLog.w(String.format("drop an un-encrypted messages. %1$s, %2$s", new Object[]{xmPushActionContainer.getPackageName(), metaInfo.getId()}));
                        PushClientReportManager instance3 = PushClientReportManager.getInstance(this.sAppContext);
                        String packageName2 = this.sAppContext.getPackageName();
                        String str3 = "drop an un-encrypted messages. %1$s, %2$s";
                        Object[] objArr3 = new Object[2];
                        objArr3[0] = xmPushActionContainer.getPackageName();
                        objArr3[1] = metaInfo != null ? metaInfo.getId() : "";
                        instance3.reportEvent4ERROR(packageName2, intent, String.format(str3, objArr3));
                        return null;
                    }
                }
                if (instance.appRegistered() || xmPushActionContainer.action == ActionType.Registration) {
                    if (!instance.appRegistered() || !instance.invalidated()) {
                        return processMessage(xmPushActionContainer, booleanExtra, byteArrayExtra, stringExtra2, intExtra);
                    }
                    if (xmPushActionContainer.action == ActionType.UnRegistration) {
                        instance.clear();
                        MiPushClient.clearExtras(this.sAppContext);
                        PushMessageHandler.removeAllPushCallbackClass();
                    } else {
                        MiPushClient.unregisterPush(this.sAppContext);
                    }
                } else if (MIPushNotificationHelper.isBusinessMessage(xmPushActionContainer)) {
                    return processMessage(xmPushActionContainer, booleanExtra, byteArrayExtra, stringExtra2, intExtra);
                } else {
                    MyLog.e("receive message without registration. need re-register!");
                    PushClientReportManager.getInstance(this.sAppContext).reportEvent4ERROR(this.sAppContext.getPackageName(), intent, "receive message without registration. need re-register!");
                    tryToReinitialize();
                }
            } catch (TException e) {
                PushClientReportManager.getInstance(this.sAppContext).reportEvent4ERROR(this.sAppContext.getPackageName(), intent, (Throwable) e);
                MyLog.e((Throwable) e);
            } catch (Exception e2) {
                PushClientReportManager.getInstance(this.sAppContext).reportEvent4ERROR(this.sAppContext.getPackageName(), intent, (Throwable) e2);
                MyLog.e((Throwable) e2);
            }
        } else if ("com.xiaomi.mipush.ERROR".equals(action)) {
            MiPushCommandMessage miPushCommandMessage = new MiPushCommandMessage();
            XmPushActionContainer xmPushActionContainer2 = new XmPushActionContainer();
            try {
                byte[] byteArrayExtra2 = intent.getByteArrayExtra("mipush_payload");
                if (byteArrayExtra2 != null) {
                    XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionContainer2, byteArrayExtra2);
                }
            } catch (TException unused) {
            }
            miPushCommandMessage.setCommand(String.valueOf(xmPushActionContainer2.getAction()));
            miPushCommandMessage.setResultCode((long) intent.getIntExtra("mipush_error_code", 0));
            miPushCommandMessage.setReason(intent.getStringExtra("mipush_error_msg"));
            StringBuilder sb2 = new StringBuilder();
            sb2.append("receive a error message. code = ");
            sb2.append(intent.getIntExtra("mipush_error_code", 0));
            sb2.append(", msg= ");
            sb2.append(intent.getStringExtra("mipush_error_msg"));
            MyLog.e(sb2.toString());
            return miPushCommandMessage;
        } else if ("com.xiaomi.mipush.MESSAGE_ARRIVED".equals(action)) {
            byte[] byteArrayExtra3 = intent.getByteArrayExtra("mipush_payload");
            if (byteArrayExtra3 == null) {
                MyLog.e("message arrived: receiving an empty message, drop");
                return null;
            }
            XmPushActionContainer xmPushActionContainer3 = new XmPushActionContainer();
            try {
                XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionContainer3, byteArrayExtra3);
                AppInfoHolder instance4 = AppInfoHolder.getInstance(this.sAppContext);
                if (MIPushNotificationHelper.isBusinessMessage(xmPushActionContainer3)) {
                    MyLog.e("message arrived: receive ignore reg message, ignore!");
                } else if (!instance4.appRegistered()) {
                    MyLog.e("message arrived: receive message without registration. need unregister or re-register!");
                } else if (!instance4.appRegistered() || !instance4.invalidated()) {
                    return processMessage(xmPushActionContainer3, byteArrayExtra3);
                } else {
                    MyLog.e("message arrived: app info is invalidated");
                }
            } catch (TException e3) {
                MyLog.e((Throwable) e3);
            } catch (Exception e4) {
                MyLog.e((Throwable) e4);
            }
        }
        return null;
    }
}
