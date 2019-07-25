package com.xiaomi.push.service;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.os.Message;
import android.os.RemoteException;
import android.text.TextUtils;
import com.nexstreaming.nexeditorsdk.nexEngine;
import com.xiaomi.channel.commonutils.android.MIUIUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.PushClientsManager.ClientLoginInfo;
import com.xiaomi.slim.Blob;
import com.xiaomi.smack.packet.IQ;
import com.xiaomi.smack.packet.Packet;
import com.xiaomi.smack.packet.Presence;
import java.util.Collection;
import java.util.Iterator;

public class ClientEventDispatcher {
    private MIPushEventProcessor mPushEventProcessor = new MIPushEventProcessor();

    public static String getReceiverPermission(ClientLoginInfo clientLoginInfo) {
        if (!"9".equals(clientLoginInfo.chid)) {
            StringBuilder sb = new StringBuilder();
            sb.append(clientLoginInfo.pkgName);
            sb.append(".permission.MIPUSH_RECEIVE");
            return sb.toString();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(clientLoginInfo.pkgName);
        sb2.append(".permission.MIMC_RECEIVE");
        return sb2.toString();
    }

    private static void sendBroadcast(Context context, Intent intent, ClientLoginInfo clientLoginInfo) {
        if ("com.xiaomi.xmsf".equals(context.getPackageName())) {
            context.sendBroadcast(intent);
        } else {
            context.sendBroadcast(intent, getReceiverPermission(clientLoginInfo));
        }
    }

    /* access modifiers changed from: 0000 */
    public ClientLoginInfo getClientLoginInfo(Blob blob) {
        Collection allClientLoginInfoByChid = PushClientsManager.getInstance().getAllClientLoginInfoByChid(Integer.toString(blob.getChannelId()));
        if (allClientLoginInfoByChid.isEmpty()) {
            return null;
        }
        Iterator it = allClientLoginInfoByChid.iterator();
        if (allClientLoginInfoByChid.size() == 1) {
            return (ClientLoginInfo) it.next();
        }
        String fullUserName = blob.getFullUserName();
        while (it.hasNext()) {
            ClientLoginInfo clientLoginInfo = (ClientLoginInfo) it.next();
            if (TextUtils.equals(fullUserName, clientLoginInfo.userId)) {
                return clientLoginInfo;
            }
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public ClientLoginInfo getClientLoginInfo(Packet packet) {
        Collection allClientLoginInfoByChid = PushClientsManager.getInstance().getAllClientLoginInfoByChid(packet.getChannelId());
        if (allClientLoginInfoByChid.isEmpty()) {
            return null;
        }
        Iterator it = allClientLoginInfoByChid.iterator();
        if (allClientLoginInfoByChid.size() == 1) {
            return (ClientLoginInfo) it.next();
        }
        String from = packet.getFrom();
        String to = packet.getTo();
        while (it.hasNext()) {
            ClientLoginInfo clientLoginInfo = (ClientLoginInfo) it.next();
            if (!TextUtils.equals(from, clientLoginInfo.userId)) {
                if (TextUtils.equals(to, clientLoginInfo.userId)) {
                }
            }
            return clientLoginInfo;
        }
        return null;
    }

    public void notifyChannelClosed(Context context, ClientLoginInfo clientLoginInfo, int i) {
        if (!"5".equalsIgnoreCase(clientLoginInfo.chid)) {
            Intent intent = new Intent();
            intent.setAction("com.xiaomi.push.channel_closed");
            intent.setPackage(clientLoginInfo.pkgName);
            intent.putExtra(PushConstants.EXTRA_CHANNEL_ID, clientLoginInfo.chid);
            intent.putExtra("ext_reason", i);
            intent.putExtra(PushConstants.EXTRA_USER_ID, clientLoginInfo.userId);
            intent.putExtra(PushConstants.EXTRA_SESSION, clientLoginInfo.session);
            if (clientLoginInfo.peer == null || !"9".equals(clientLoginInfo.chid)) {
                sendBroadcast(context, intent, clientLoginInfo);
            } else {
                try {
                    clientLoginInfo.peer.send(Message.obtain(null, 17, intent));
                } catch (RemoteException unused) {
                    clientLoginInfo.peer = null;
                    StringBuilder sb = new StringBuilder();
                    sb.append("peer may died: ");
                    sb.append(clientLoginInfo.userId.substring(clientLoginInfo.userId.lastIndexOf(64)));
                    MyLog.w(sb.toString());
                }
            }
        }
    }

    public void notifyChannelOpenResult(Context context, ClientLoginInfo clientLoginInfo, boolean z, int i, String str) {
        if ("5".equalsIgnoreCase(clientLoginInfo.chid)) {
            this.mPushEventProcessor.processChannelOpenResult(context, clientLoginInfo, z, i, str);
            return;
        }
        Intent intent = new Intent();
        intent.setAction("com.xiaomi.push.channel_opened");
        intent.setPackage(clientLoginInfo.pkgName);
        intent.putExtra("ext_succeeded", z);
        if (!z) {
            intent.putExtra("ext_reason", i);
        }
        if (!TextUtils.isEmpty(str)) {
            intent.putExtra("ext_reason_msg", str);
        }
        intent.putExtra("ext_chid", clientLoginInfo.chid);
        intent.putExtra(PushConstants.EXTRA_USER_ID, clientLoginInfo.userId);
        intent.putExtra(PushConstants.EXTRA_SESSION, clientLoginInfo.session);
        sendBroadcast(context, intent, clientLoginInfo);
    }

    public void notifyKickedByServer(Context context, ClientLoginInfo clientLoginInfo, String str, String str2) {
        if ("5".equalsIgnoreCase(clientLoginInfo.chid)) {
            MyLog.e("mipush kicked by server");
            return;
        }
        Intent intent = new Intent();
        intent.setAction("com.xiaomi.push.kicked");
        intent.setPackage(clientLoginInfo.pkgName);
        intent.putExtra("ext_kick_type", str);
        intent.putExtra("ext_kick_reason", str2);
        intent.putExtra("ext_chid", clientLoginInfo.chid);
        intent.putExtra(PushConstants.EXTRA_USER_ID, clientLoginInfo.userId);
        intent.putExtra(PushConstants.EXTRA_SESSION, clientLoginInfo.session);
        sendBroadcast(context, intent, clientLoginInfo);
    }

    public void notifyPacketArrival(XMPushService xMPushService, String str, Blob blob) {
        ClientLoginInfo clientLoginInfo = getClientLoginInfo(blob);
        if (clientLoginInfo == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("error while notify channel closed! channel ");
            sb.append(str);
            sb.append(" not registered");
            MyLog.e(sb.toString());
            return;
        }
        if ("5".equalsIgnoreCase(str)) {
            this.mPushEventProcessor.processNewPacket(xMPushService, blob, clientLoginInfo);
        } else {
            String str2 = clientLoginInfo.pkgName;
            Intent intent = new Intent();
            intent.setAction("com.xiaomi.push.new_msg");
            intent.setPackage(str2);
            intent.putExtra("ext_chid", str);
            intent.putExtra("ext_raw_packet", blob.getDecryptedPayload(clientLoginInfo.security));
            intent.putExtra(PushConstants.EXTRA_SESSION, clientLoginInfo.session);
            intent.putExtra(PushConstants.EXTRA_SECURITY, clientLoginInfo.security);
            if (clientLoginInfo.peer != null) {
                try {
                    clientLoginInfo.peer.send(Message.obtain(null, 17, intent));
                    return;
                } catch (RemoteException unused) {
                    clientLoginInfo.peer = null;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("peer may died: ");
                    sb2.append(clientLoginInfo.userId.substring(clientLoginInfo.userId.lastIndexOf(64)));
                    MyLog.w(sb2.toString());
                }
            }
            if (!"com.xiaomi.xmsf".equals(str2)) {
                sendBroadcast(xMPushService, intent, clientLoginInfo);
            }
        }
    }

    public void notifyPacketArrival(XMPushService xMPushService, String str, Packet packet) {
        String str2;
        ClientLoginInfo clientLoginInfo = getClientLoginInfo(packet);
        if (clientLoginInfo == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("error while notify channel closed! channel ");
            sb.append(str);
            sb.append(" not registered");
            MyLog.e(sb.toString());
            return;
        }
        if ("5".equalsIgnoreCase(str)) {
            this.mPushEventProcessor.processNewPacket(xMPushService, packet, clientLoginInfo);
        } else {
            String str3 = clientLoginInfo.pkgName;
            if (packet instanceof com.xiaomi.smack.packet.Message) {
                str2 = "com.xiaomi.push.new_msg";
            } else if (packet instanceof IQ) {
                str2 = "com.xiaomi.push.new_iq";
            } else if (packet instanceof Presence) {
                str2 = "com.xiaomi.push.new_pres";
            } else {
                MyLog.e("unknown packet type, drop it");
                return;
            }
            Intent intent = new Intent();
            intent.setAction(str2);
            intent.setPackage(str3);
            intent.putExtra("ext_chid", str);
            intent.putExtra("ext_packet", packet.toBundle());
            intent.putExtra(PushConstants.EXTRA_SESSION, clientLoginInfo.session);
            intent.putExtra(PushConstants.EXTRA_SECURITY, clientLoginInfo.security);
            sendBroadcast(xMPushService, intent, clientLoginInfo);
        }
    }

    @SuppressLint({"WrongConstant"})
    public void notifyServiceStarted(Context context) {
        Intent intent = new Intent();
        intent.setAction("com.xiaomi.push.service_started");
        if (MIUIUtils.isXMS()) {
            intent.addFlags(nexEngine.ExportHEVCMainTierLevel62);
        }
        context.sendBroadcast(intent);
    }
}
