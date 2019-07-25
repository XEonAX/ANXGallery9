package com.xiaomi.push.service;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageManager;
import android.text.TextUtils;
import com.nexstreaming.nexeditorsdk.nexProject;
import com.xiaomi.channel.commonutils.android.AppInfoUtils;
import com.xiaomi.channel.commonutils.android.SystemUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.clientreport.PerfMessageHelper;
import com.xiaomi.push.service.MIPushNotificationHelper.NotifyPushMessageInfo;
import com.xiaomi.push.service.PushClientsManager.ClientLoginInfo;
import com.xiaomi.push.service.XMPushService.Job;
import com.xiaomi.push.service.clientReport.PushClientReportManager;
import com.xiaomi.slim.Blob;
import com.xiaomi.smack.XMPPException;
import com.xiaomi.smack.packet.CommonPacketExtension;
import com.xiaomi.smack.packet.Message;
import com.xiaomi.smack.packet.Packet;
import com.xiaomi.smack.util.TrafficUtils;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.NotificationType;
import com.xiaomi.xmpush.thrift.PushMetaInfo;
import com.xiaomi.xmpush.thrift.XmPushActionAckMessage;
import com.xiaomi.xmpush.thrift.XmPushActionContainer;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONException;

public class MIPushEventProcessor {
    public static XmPushActionContainer buildContainer(byte[] bArr) {
        XmPushActionContainer xmPushActionContainer = new XmPushActionContainer();
        try {
            XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionContainer, bArr);
            return xmPushActionContainer;
        } catch (Throwable th) {
            MyLog.e(th);
            return null;
        }
    }

    public static Intent buildIntent(byte[] bArr, long j) {
        XmPushActionContainer buildContainer = buildContainer(bArr);
        if (buildContainer == null) {
            return null;
        }
        Intent intent = new Intent("com.xiaomi.mipush.RECEIVE_MESSAGE");
        intent.putExtra("mipush_payload", bArr);
        intent.putExtra("mrt", Long.toString(j));
        intent.setPackage(buildContainer.packageName);
        return intent;
    }

    public static XmPushActionContainer constructAckMessage(Context context, XmPushActionContainer xmPushActionContainer) {
        XmPushActionAckMessage xmPushActionAckMessage = new XmPushActionAckMessage();
        xmPushActionAckMessage.setAppId(xmPushActionContainer.getAppid());
        PushMetaInfo metaInfo = xmPushActionContainer.getMetaInfo();
        if (metaInfo != null) {
            xmPushActionAckMessage.setId(metaInfo.getId());
            xmPushActionAckMessage.setMessageTs(metaInfo.getMessageTs());
            if (!TextUtils.isEmpty(metaInfo.getTopic())) {
                xmPushActionAckMessage.setTopic(metaInfo.getTopic());
            }
        }
        xmPushActionAckMessage.setDeviceStatus(XmPushThriftSerializeUtils.getDeviceStatus(context, xmPushActionContainer));
        XmPushActionContainer generateRequestContainer = MIPushHelper.generateRequestContainer(xmPushActionContainer.getPackageName(), xmPushActionContainer.getAppid(), xmPushActionAckMessage, ActionType.AckMessage);
        PushMetaInfo deepCopy = xmPushActionContainer.getMetaInfo().deepCopy();
        deepCopy.putToExtra("mat", Long.toString(System.currentTimeMillis()));
        generateRequestContainer.setMetaInfo(deepCopy);
        return generateRequestContainer;
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

    private static boolean isMIUIOldAdsSDKMessage(XmPushActionContainer xmPushActionContainer) {
        if (xmPushActionContainer.getMetaInfo() == null || xmPushActionContainer.getMetaInfo().getExtra() == null) {
            return false;
        }
        return "1".equals(xmPushActionContainer.getMetaInfo().getExtra().get("obslete_ads_message"));
    }

    private static boolean isMIUIPushMessage(XmPushActionContainer xmPushActionContainer) {
        return "com.xiaomi.xmsf".equals(xmPushActionContainer.packageName) && xmPushActionContainer.getMetaInfo() != null && xmPushActionContainer.getMetaInfo().getExtra() != null && xmPushActionContainer.getMetaInfo().getExtra().containsKey("miui_package_name");
    }

    private static boolean isMIUIPushSupported(Context context, String str) {
        Intent intent = new Intent("com.xiaomi.mipush.miui.CLICK_MESSAGE");
        intent.setPackage(str);
        Intent intent2 = new Intent("com.xiaomi.mipush.miui.RECEIVE_MESSAGE");
        intent2.setPackage(str);
        PackageManager packageManager = context.getPackageManager();
        boolean z = false;
        try {
            List queryBroadcastReceivers = packageManager.queryBroadcastReceivers(intent2, 32);
            List queryIntentServices = packageManager.queryIntentServices(intent, 32);
            if (!queryBroadcastReceivers.isEmpty() || !queryIntentServices.isEmpty()) {
                z = true;
            }
            return z;
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            return false;
        }
    }

    public static void postProcessMIPushMessage(XMPushService xMPushService, String str, byte[] bArr, Intent intent) {
        boolean z;
        XMPushService xMPushService2 = xMPushService;
        byte[] bArr2 = bArr;
        Intent intent2 = intent;
        XmPushActionContainer buildContainer = buildContainer(bArr);
        PushMetaInfo metaInfo = buildContainer.getMetaInfo();
        String str2 = null;
        if (bArr2 != null) {
            PerfMessageHelper.collectPerfData(buildContainer.getPackageName(), xMPushService.getApplicationContext(), null, buildContainer.getAction(), bArr2.length);
        }
        if (isMIUIOldAdsSDKMessage(buildContainer) && isMIUIPushSupported(xMPushService, str)) {
            if (MIPushNotificationHelper.isNPBMessage(buildContainer)) {
                PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4NeedDrop(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), "old message received by new SDK.");
            }
            sendMIUIOldAdsAckMessage(xMPushService2, buildContainer);
        } else if (isMIUIPushMessage(buildContainer) && !isMIUIPushSupported(xMPushService, str) && !predefinedNotification(buildContainer)) {
            if (MIPushNotificationHelper.isNPBMessage(buildContainer)) {
                PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4NeedDrop(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), "new message received by old SDK.");
            }
            sendMIUINewAdsAckMessage(xMPushService2, buildContainer);
        } else if ((MIPushNotificationHelper.isBusinessMessage(buildContainer) && AppInfoUtils.isPkgInstalled(xMPushService2, buildContainer.packageName)) || isIntentAvailable(xMPushService2, intent2)) {
            if (ActionType.Registration == buildContainer.getAction()) {
                String packageName = buildContainer.getPackageName();
                Editor edit = xMPushService2.getSharedPreferences("pref_registered_pkg_names", 0).edit();
                edit.putString(packageName, buildContainer.appid);
                edit.commit();
                PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent(packageName, "E100003", metaInfo.getId(), 6003, "receive a register message");
                if (!TextUtils.isEmpty(metaInfo.getId())) {
                    intent2.putExtra("messageId", metaInfo.getId());
                    intent2.putExtra("eventMessageType", nexProject.kAutoThemeClipDuration);
                }
            }
            if (MIPushNotificationHelper.isNormalNotificationMessage(buildContainer)) {
                PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), 1001, System.currentTimeMillis(), "receive notification message ");
                if (!TextUtils.isEmpty(metaInfo.getId())) {
                    intent2.putExtra("messageId", metaInfo.getId());
                    intent2.putExtra("eventMessageType", 1000);
                }
            }
            if (MIPushNotificationHelper.isPassThoughMessage(buildContainer)) {
                PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), 2001, System.currentTimeMillis(), "receive passThrough message");
                if (!TextUtils.isEmpty(metaInfo.getId())) {
                    intent2.putExtra("messageId", metaInfo.getId());
                    intent2.putExtra("eventMessageType", nexProject.kAutoThemeTransitionDuration);
                }
            }
            if (MIPushNotificationHelper.isBusinessMessage(buildContainer)) {
                PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), 3001, System.currentTimeMillis(), "receive business message");
                if (!TextUtils.isEmpty(metaInfo.getId())) {
                    intent2.putExtra("messageId", metaInfo.getId());
                    intent2.putExtra("eventMessageType", 3000);
                }
            }
            if (metaInfo != null && !TextUtils.isEmpty(metaInfo.getTitle()) && !TextUtils.isEmpty(metaInfo.getDescription()) && metaInfo.passThrough != 1 && (MIPushNotificationHelper.isNotifyForeground(metaInfo.getExtra()) || !MIPushNotificationHelper.isApplicationForeground(xMPushService2, buildContainer.packageName))) {
                if (metaInfo != null) {
                    if (metaInfo.extra != null) {
                        str2 = (String) metaInfo.extra.get("jobkey");
                    }
                    if (TextUtils.isEmpty(str2)) {
                        str2 = metaInfo.getId();
                    }
                    z = MiPushMessageDuplicate.isDuplicateMessage(xMPushService2, buildContainer.packageName, str2);
                } else {
                    z = false;
                }
                if (z) {
                    PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4DUPMD(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), "drop a duplicate message");
                    StringBuilder sb = new StringBuilder();
                    sb.append("drop a duplicate message, key=");
                    sb.append(str2);
                    MyLog.w(sb.toString());
                } else {
                    NotifyPushMessageInfo notifyPushMessage = MIPushNotificationHelper.notifyPushMessage(xMPushService2, buildContainer, bArr2);
                    if (notifyPushMessage.traffic > 0 && !TextUtils.isEmpty(notifyPushMessage.targetPkgName)) {
                        TrafficUtils.distributionTraffic(xMPushService, notifyPushMessage.targetPkgName, notifyPushMessage.traffic, true, false, System.currentTimeMillis());
                    }
                    if (!MIPushNotificationHelper.isBusinessMessage(buildContainer)) {
                        Intent intent3 = new Intent("com.xiaomi.mipush.MESSAGE_ARRIVED");
                        intent3.putExtra("mipush_payload", bArr2);
                        intent3.setPackage(buildContainer.packageName);
                        try {
                            List queryBroadcastReceivers = xMPushService.getPackageManager().queryBroadcastReceivers(intent3, 0);
                            if (queryBroadcastReceivers != null && !queryBroadcastReceivers.isEmpty()) {
                                xMPushService2.sendBroadcast(intent3, MIPushHelper.getReceiverPermission(buildContainer.packageName));
                            }
                        } catch (Exception e) {
                            xMPushService2.sendBroadcast(intent3, MIPushHelper.getReceiverPermission(buildContainer.packageName));
                            PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4ERROR(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), e.getMessage());
                        }
                    }
                }
                sendAckMessage(xMPushService2, buildContainer);
            } else if ("com.xiaomi.xmsf".contains(buildContainer.packageName) && !buildContainer.isEncryptAction() && metaInfo != null && metaInfo.getExtra() != null && metaInfo.getExtra().containsKey("ab")) {
                sendAckMessage(xMPushService2, buildContainer);
                StringBuilder sb2 = new StringBuilder();
                sb2.append("receive abtest message. ack it.");
                sb2.append(metaInfo.getId());
                MyLog.v(sb2.toString());
            } else if (shouldSendBroadcast(xMPushService2, str, buildContainer, metaInfo)) {
                if (metaInfo != null && !TextUtils.isEmpty(metaInfo.getId())) {
                    if (MIPushNotificationHelper.isPassThoughMessage(buildContainer)) {
                        PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), 2002, "try send passThrough message Broadcast");
                    } else if (MIPushNotificationHelper.isBusinessMessage(buildContainer)) {
                        PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4NeedDrop(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), "try show awake message , but it don't show in foreground");
                    } else if (MIPushNotificationHelper.isNormalNotificationMessage(buildContainer)) {
                        PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4NeedDrop(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), "try show notification message , but it don't show in foreground");
                    } else if (MIPushNotificationHelper.isRegisterMessage(buildContainer)) {
                        PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent(buildContainer.getPackageName(), "E100003", metaInfo.getId(), 6004, "try send register broadcast");
                    }
                }
                xMPushService2.sendBroadcast(intent2, MIPushHelper.getReceiverPermission(buildContainer.packageName));
            } else {
                PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4NeedDrop(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), "passThough message: not permit to send broadcast ");
            }
            if (buildContainer.getAction() == ActionType.UnRegistration && !"com.xiaomi.xmsf".equals(xMPushService.getPackageName())) {
                xMPushService.stopSelf();
            }
        } else if (!AppInfoUtils.isPkgInstalled(xMPushService2, buildContainer.packageName)) {
            if (MIPushNotificationHelper.isNPBMessage(buildContainer)) {
                PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4ERROR(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), "receive a message, but the package is removed.");
            }
            sendAppNotInstallNotification(xMPushService2, buildContainer);
        } else {
            MyLog.w("receive a mipush message, we can see the app, but we can't see the receiver.");
            if (MIPushNotificationHelper.isNPBMessage(buildContainer)) {
                PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4ERROR(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), "receive a mipush message, we can see the app, but we can't see the receiver.");
            }
        }
    }

    private static boolean predefinedNotification(XmPushActionContainer xmPushActionContainer) {
        Map extra = xmPushActionContainer.getMetaInfo().getExtra();
        return extra != null && extra.containsKey("notify_effect");
    }

    private static void processMIPushMessage(XMPushService xMPushService, byte[] bArr, long j) {
        XmPushActionContainer buildContainer = buildContainer(bArr);
        if (buildContainer != null) {
            if (TextUtils.isEmpty(buildContainer.packageName)) {
                MyLog.w("receive a mipush message without package name");
                return;
            }
            Long valueOf = Long.valueOf(System.currentTimeMillis());
            Intent buildIntent = buildIntent(bArr, valueOf.longValue());
            String targetPackage = MIPushNotificationHelper.getTargetPackage(buildContainer);
            TrafficUtils.distributionTraffic(xMPushService, targetPackage, j, true, true, System.currentTimeMillis());
            PushMetaInfo metaInfo = buildContainer.getMetaInfo();
            if (metaInfo != null) {
                metaInfo.putToExtra("mrt", Long.toString(valueOf.longValue()));
            }
            if (ActionType.SendMessage == buildContainer.getAction() && MIPushAppInfo.getInstance(xMPushService).isUnRegistered(buildContainer.packageName) && !MIPushNotificationHelper.isBusinessMessage(buildContainer)) {
                String str = "";
                if (metaInfo != null) {
                    str = metaInfo.getId();
                    if (MIPushNotificationHelper.isNPBMessage(buildContainer)) {
                        PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4NeedDrop(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), str, "Drop a message for unregistered");
                    }
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Drop a message for unregistered, msgid=");
                sb.append(str);
                MyLog.w(sb.toString());
                sendAppAbsentAck(xMPushService, buildContainer, buildContainer.packageName);
            } else if (ActionType.SendMessage == buildContainer.getAction() && MIPushAppInfo.getInstance(xMPushService).isPushDisabled4User(buildContainer.packageName) && !MIPushNotificationHelper.isBusinessMessage(buildContainer)) {
                String str2 = "";
                if (metaInfo != null) {
                    str2 = metaInfo.getId();
                    if (MIPushNotificationHelper.isNPBMessage(buildContainer)) {
                        PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4NeedDrop(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), str2, "Drop a message for push closed");
                    }
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Drop a message for push closed, msgid=");
                sb2.append(str2);
                MyLog.w(sb2.toString());
                sendAppAbsentAck(xMPushService, buildContainer, buildContainer.packageName);
            } else if (ActionType.SendMessage != buildContainer.getAction() || TextUtils.equals(xMPushService.getPackageName(), "com.xiaomi.xmsf") || TextUtils.equals(xMPushService.getPackageName(), buildContainer.packageName)) {
                if (!(metaInfo == null || metaInfo.getId() == null)) {
                    MyLog.w(String.format("receive a message, appid=%1$s, msgid= %2$s", new Object[]{buildContainer.getAppid(), metaInfo.getId()}));
                }
                if (metaInfo != null) {
                    Map extra = metaInfo.getExtra();
                    if (extra != null && extra.containsKey("hide") && "true".equalsIgnoreCase((String) extra.get("hide"))) {
                        sendAckMessage(xMPushService, buildContainer);
                        return;
                    }
                }
                if (!(metaInfo == null || metaInfo.getExtra() == null || !metaInfo.getExtra().containsKey("__miid"))) {
                    String str3 = (String) metaInfo.getExtra().get("__miid");
                    String miid = SystemUtils.getMIID(xMPushService.getApplicationContext());
                    if (TextUtils.isEmpty(miid) || !TextUtils.equals(str3, miid)) {
                        if (MIPushNotificationHelper.isNPBMessage(buildContainer)) {
                            PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4NeedDrop(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), "miid already logout or anther already login");
                        }
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append(str3);
                        sb3.append(" should be login, but got ");
                        sb3.append(miid);
                        MyLog.w(sb3.toString());
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append(str3);
                        sb4.append(" should be login, but got ");
                        sb4.append(miid);
                        sendErrorAck(xMPushService, buildContainer, "miid already logout or anther already login", sb4.toString());
                        return;
                    }
                }
                postProcessMIPushMessage(xMPushService, targetPackage, bArr, buildIntent);
            } else {
                StringBuilder sb5 = new StringBuilder();
                sb5.append("Receive a message with wrong package name, expect ");
                sb5.append(xMPushService.getPackageName());
                sb5.append(", received ");
                sb5.append(buildContainer.packageName);
                MyLog.w(sb5.toString());
                StringBuilder sb6 = new StringBuilder();
                sb6.append("package should be ");
                sb6.append(xMPushService.getPackageName());
                sb6.append(", but got ");
                sb6.append(buildContainer.packageName);
                sendErrorAck(xMPushService, buildContainer, "unmatched_package", sb6.toString());
                if (metaInfo != null && MIPushNotificationHelper.isNPBMessage(buildContainer)) {
                    PushClientReportManager.getInstance(xMPushService.getApplicationContext()).reportEvent4NeedDrop(buildContainer.getPackageName(), MIPushNotificationHelper.getInterfaceId(buildContainer), metaInfo.getId(), "Receive a message with wrong package name");
                }
            }
        }
    }

    private static void sendAckMessage(final XMPushService xMPushService, final XmPushActionContainer xmPushActionContainer) {
        xMPushService.executeJob(new Job(4) {
            public String getDesc() {
                return "send ack message for message.";
            }

            public void process() {
                try {
                    MIPushHelper.sendPacket(xMPushService, MIPushEventProcessor.constructAckMessage(xMPushService, xmPushActionContainer));
                } catch (XMPPException e) {
                    MyLog.e((Throwable) e);
                    xMPushService.disconnect(10, e);
                }
            }
        });
    }

    private static void sendAppAbsentAck(final XMPushService xMPushService, final XmPushActionContainer xmPushActionContainer, final String str) {
        xMPushService.executeJob(new Job(4) {
            public String getDesc() {
                return "send app absent ack message for message.";
            }

            public void process() {
                try {
                    XmPushActionContainer constructAckMessage = MIPushEventProcessor.constructAckMessage(xMPushService, xmPushActionContainer);
                    constructAckMessage.getMetaInfo().putToExtra("absent_target_package", str);
                    MIPushHelper.sendPacket(xMPushService, constructAckMessage);
                } catch (XMPPException e) {
                    MyLog.e((Throwable) e);
                    xMPushService.disconnect(10, e);
                }
            }
        });
    }

    private static void sendAppNotInstallNotification(final XMPushService xMPushService, final XmPushActionContainer xmPushActionContainer) {
        xMPushService.executeJob(new Job(4) {
            public String getDesc() {
                return "send app absent message.";
            }

            public void process() {
                try {
                    MIPushHelper.sendPacket(xMPushService, MIPushHelper.contructAppAbsentMessage(xmPushActionContainer.getPackageName(), xmPushActionContainer.getAppid()));
                } catch (XMPPException e) {
                    MyLog.e((Throwable) e);
                    xMPushService.disconnect(10, e);
                }
            }
        });
    }

    private static void sendErrorAck(XMPushService xMPushService, XmPushActionContainer xmPushActionContainer, String str, String str2) {
        final XMPushService xMPushService2 = xMPushService;
        final XmPushActionContainer xmPushActionContainer2 = xmPushActionContainer;
        final String str3 = str;
        final String str4 = str2;
        AnonymousClass6 r0 = new Job(4) {
            public String getDesc() {
                return "send wrong message ack for message.";
            }

            public void process() {
                try {
                    XmPushActionContainer constructAckMessage = MIPushEventProcessor.constructAckMessage(xMPushService2, xmPushActionContainer2);
                    constructAckMessage.metaInfo.putToExtra("error", str3);
                    constructAckMessage.metaInfo.putToExtra("reason", str4);
                    MIPushHelper.sendPacket(xMPushService2, constructAckMessage);
                } catch (XMPPException e) {
                    MyLog.e((Throwable) e);
                    xMPushService2.disconnect(10, e);
                }
            }
        };
        xMPushService.executeJob(r0);
    }

    private static void sendMIUINewAdsAckMessage(final XMPushService xMPushService, final XmPushActionContainer xmPushActionContainer) {
        xMPushService.executeJob(new Job(4) {
            public String getDesc() {
                return "send ack message for unrecognized new miui message.";
            }

            public void process() {
                try {
                    XmPushActionContainer constructAckMessage = MIPushEventProcessor.constructAckMessage(xMPushService, xmPushActionContainer);
                    constructAckMessage.getMetaInfo().putToExtra("miui_message_unrecognized", "1");
                    MIPushHelper.sendPacket(xMPushService, constructAckMessage);
                } catch (XMPPException e) {
                    MyLog.e((Throwable) e);
                    xMPushService.disconnect(10, e);
                }
            }
        });
    }

    private static void sendMIUIOldAdsAckMessage(final XMPushService xMPushService, final XmPushActionContainer xmPushActionContainer) {
        xMPushService.executeJob(new Job(4) {
            public String getDesc() {
                return "send ack message for obsleted message.";
            }

            public void process() {
                try {
                    XmPushActionContainer constructAckMessage = MIPushEventProcessor.constructAckMessage(xMPushService, xmPushActionContainer);
                    constructAckMessage.getMetaInfo().putToExtra("message_obsleted", "1");
                    MIPushHelper.sendPacket(xMPushService, constructAckMessage);
                } catch (XMPPException e) {
                    MyLog.e((Throwable) e);
                    xMPushService.disconnect(10, e);
                }
            }
        });
    }

    private static boolean shouldSendBroadcast(XMPushService xMPushService, String str, XmPushActionContainer xmPushActionContainer, PushMetaInfo pushMetaInfo) {
        boolean z = true;
        if (pushMetaInfo != null && pushMetaInfo.getExtra() != null && pushMetaInfo.getExtra().containsKey("__check_alive") && pushMetaInfo.getExtra().containsKey("__awake")) {
            XmPushActionNotification xmPushActionNotification = new XmPushActionNotification();
            xmPushActionNotification.setAppId(xmPushActionContainer.getAppid());
            xmPushActionNotification.setPackageName(str);
            xmPushActionNotification.setType(NotificationType.AwakeSystemApp.value);
            xmPushActionNotification.setId(pushMetaInfo.getId());
            xmPushActionNotification.extra = new HashMap();
            boolean isAppRunning = AppInfoUtils.isAppRunning(xMPushService.getApplicationContext(), str);
            xmPushActionNotification.extra.put("app_running", Boolean.toString(isAppRunning));
            if (!isAppRunning) {
                boolean parseBoolean = Boolean.parseBoolean((String) pushMetaInfo.getExtra().get("__awake"));
                xmPushActionNotification.extra.put("awaked", Boolean.toString(parseBoolean));
                if (!parseBoolean) {
                    z = false;
                }
            }
            try {
                MIPushHelper.sendPacket(xMPushService, MIPushHelper.generateRequestContainer(xmPushActionContainer.getPackageName(), xmPushActionContainer.getAppid(), xmPushActionNotification, ActionType.Notification));
            } catch (XMPPException e) {
                MyLog.e((Throwable) e);
            }
        }
        return z;
    }

    public void processChannelOpenResult(Context context, ClientLoginInfo clientLoginInfo, boolean z, int i, String str) {
        if (!z) {
            MIPushAccount mIPushAccount = MIPushAccountUtils.getMIPushAccount(context);
            if (mIPushAccount != null && "token-expired".equals(str)) {
                try {
                    MIPushAccountUtils.register(context, mIPushAccount.packageName, mIPushAccount.appId, mIPushAccount.appToken);
                } catch (IOException e) {
                    MyLog.e((Throwable) e);
                } catch (JSONException e2) {
                    MyLog.e((Throwable) e2);
                }
            }
        }
    }

    public void processNewPacket(XMPushService xMPushService, Blob blob, ClientLoginInfo clientLoginInfo) {
        try {
            processMIPushMessage(xMPushService, blob.getDecryptedPayload(clientLoginInfo.security), (long) blob.getSerializedSize());
        } catch (IllegalArgumentException e) {
            MyLog.e((Throwable) e);
        }
    }

    public void processNewPacket(XMPushService xMPushService, Packet packet, ClientLoginInfo clientLoginInfo) {
        if (packet instanceof Message) {
            Message message = (Message) packet;
            CommonPacketExtension extension = message.getExtension("s");
            if (extension != null) {
                try {
                    processMIPushMessage(xMPushService, RC4Cryption.decrypt(RC4Cryption.generateKeyForRC4(clientLoginInfo.security, message.getPacketID()), extension.getText()), (long) TrafficUtils.getTrafficFlow(packet.toXML()));
                } catch (IllegalArgumentException e) {
                    MyLog.e((Throwable) e);
                }
            }
        } else {
            MyLog.w("not a mipush message");
        }
    }
}
