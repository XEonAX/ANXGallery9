package com.xiaomi.push.service;

import android.text.TextUtils;
import com.google.protobuf.micro.InvalidProtocolBufferMicroException;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.network.Fallback;
import com.xiaomi.network.HostManager;
import com.xiaomi.push.log.LogUploader;
import com.xiaomi.push.protobuf.ChannelMessage.PushServiceConfigMsg;
import com.xiaomi.push.protobuf.ChannelMessage.XMMsgBindResp;
import com.xiaomi.push.protobuf.ChannelMessage.XMMsgKick;
import com.xiaomi.push.protobuf.ChannelMessage.XMMsgNotify;
import com.xiaomi.push.protobuf.ChannelMessage.XMMsgP;
import com.xiaomi.push.protobuf.ChannelMessage.XMMsgPing;
import com.xiaomi.push.protobuf.ChannelMessage.XMMsgU;
import com.xiaomi.push.service.PushClientsManager.ClientLoginInfo;
import com.xiaomi.push.service.PushClientsManager.ClientStatus;
import com.xiaomi.push.thrift.ChannelStatsType;
import com.xiaomi.slim.Blob;
import com.xiaomi.smack.ConnectionConfiguration;
import com.xiaomi.smack.packet.CommonPacketExtension;
import com.xiaomi.smack.packet.IQ;
import com.xiaomi.smack.packet.Message;
import com.xiaomi.smack.packet.Packet;
import com.xiaomi.smack.util.TrafficUtils;
import com.xiaomi.stats.StatsHelper;
import java.util.Date;

public class PacketSync {
    private XMPushService mService;

    PacketSync(XMPushService xMPushService) {
        this.mService = xMPushService;
    }

    private void dispatchNetFlow(Blob blob) {
        String fullUserName = blob.getFullUserName();
        String num = Integer.toString(blob.getChannelId());
        if (!TextUtils.isEmpty(fullUserName) && !TextUtils.isEmpty(num)) {
            ClientLoginInfo clientLoginInfoByChidAndUserId = PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(num, fullUserName);
            if (clientLoginInfoByChidAndUserId != null) {
                TrafficUtils.distributionTraffic(this.mService, clientLoginInfoByChidAndUserId.pkgName, (long) blob.getSerializedSize(), true, true, System.currentTimeMillis());
            }
        }
    }

    private void dispatchNetFlow(Packet packet) {
        String to = packet.getTo();
        String channelId = packet.getChannelId();
        if (!TextUtils.isEmpty(to) && !TextUtils.isEmpty(channelId)) {
            ClientLoginInfo clientLoginInfoByChidAndUserId = PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(channelId, to);
            if (clientLoginInfoByChidAndUserId != null) {
                TrafficUtils.distributionTraffic(this.mService, clientLoginInfoByChidAndUserId.pkgName, (long) TrafficUtils.getTrafficFlow(packet.toXML()), true, true, System.currentTimeMillis());
            }
        }
    }

    private void processRedirectMessage(CommonPacketExtension commonPacketExtension) {
        String text = commonPacketExtension.getText();
        if (!TextUtils.isEmpty(text)) {
            String[] split = text.split(";");
            Fallback fallbacksByHost = HostManager.getInstance().getFallbacksByHost(ConnectionConfiguration.getXmppServerHost(), false);
            if (fallbacksByHost != null && split.length > 0) {
                fallbacksByHost.addPreferredHost(split);
                this.mService.disconnect(20, null);
                this.mService.scheduleConnect(true);
            }
        }
    }

    public void handleBlob(Blob blob) throws InvalidProtocolBufferMicroException {
        String cmd = blob.getCmd();
        if (blob.getChannelId() != 0) {
            String num = Integer.toString(blob.getChannelId());
            if ("SECMSG".equals(blob.getCmd())) {
                if (!blob.hasErr()) {
                    this.mService.getClientEventDispatcher().notifyPacketArrival(this.mService, num, blob);
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Recv SECMSG errCode = ");
                    sb.append(blob.getErrCode());
                    sb.append(" errStr = ");
                    sb.append(blob.getErrStr());
                    MyLog.w(sb.toString());
                }
            } else if ("BIND".equals(cmd)) {
                XMMsgBindResp parseFrom = XMMsgBindResp.parseFrom(blob.getPayload());
                String fullUserName = blob.getFullUserName();
                ClientLoginInfo clientLoginInfoByChidAndUserId = PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(num, fullUserName);
                if (clientLoginInfoByChidAndUserId != null) {
                    if (parseFrom.getResult()) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("SMACK: channel bind succeeded, chid=");
                        sb2.append(blob.getChannelId());
                        MyLog.w(sb2.toString());
                        clientLoginInfoByChidAndUserId.setStatus(ClientStatus.binded, 1, 0, null, null);
                    } else {
                        String errorType = parseFrom.getErrorType();
                        if ("auth".equals(errorType)) {
                            if ("invalid-sig".equals(parseFrom.getErrorReason())) {
                                StringBuilder sb3 = new StringBuilder();
                                sb3.append("SMACK: bind error invalid-sig token = ");
                                sb3.append(clientLoginInfoByChidAndUserId.token);
                                sb3.append(" sec = ");
                                sb3.append(clientLoginInfoByChidAndUserId.security);
                                MyLog.w(sb3.toString());
                                StatsHelper.stats(0, ChannelStatsType.BIND_INVALID_SIG.getValue(), 1, null, 0);
                            }
                            clientLoginInfoByChidAndUserId.setStatus(ClientStatus.unbind, 1, 5, parseFrom.getErrorReason(), errorType);
                            PushClientsManager.getInstance().deactivateClient(num, fullUserName);
                        } else if ("cancel".equals(errorType)) {
                            clientLoginInfoByChidAndUserId.setStatus(ClientStatus.unbind, 1, 7, parseFrom.getErrorReason(), errorType);
                            PushClientsManager.getInstance().deactivateClient(num, fullUserName);
                        } else if ("wait".equals(errorType)) {
                            this.mService.scheduleRebindChannel(clientLoginInfoByChidAndUserId);
                            clientLoginInfoByChidAndUserId.setStatus(ClientStatus.unbind, 1, 7, parseFrom.getErrorReason(), errorType);
                        }
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("SMACK: channel bind failed, chid=");
                        sb4.append(num);
                        sb4.append(" reason=");
                        sb4.append(parseFrom.getErrorReason());
                        MyLog.w(sb4.toString());
                    }
                }
            } else if ("KICK".equals(cmd)) {
                XMMsgKick parseFrom2 = XMMsgKick.parseFrom(blob.getPayload());
                String fullUserName2 = blob.getFullUserName();
                String type = parseFrom2.getType();
                String reason = parseFrom2.getReason();
                StringBuilder sb5 = new StringBuilder();
                sb5.append("kicked by server, chid=");
                sb5.append(num);
                sb5.append(" res= ");
                sb5.append(ClientLoginInfo.getResource(fullUserName2));
                sb5.append(" type=");
                sb5.append(type);
                sb5.append(" reason=");
                sb5.append(reason);
                MyLog.w(sb5.toString());
                if ("wait".equals(type)) {
                    ClientLoginInfo clientLoginInfoByChidAndUserId2 = PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(num, fullUserName2);
                    if (clientLoginInfoByChidAndUserId2 != null) {
                        this.mService.scheduleRebindChannel(clientLoginInfoByChidAndUserId2);
                        clientLoginInfoByChidAndUserId2.setStatus(ClientStatus.unbind, 3, 0, reason, type);
                    }
                } else {
                    this.mService.closeChannel(num, fullUserName2, 3, reason, type);
                    PushClientsManager.getInstance().deactivateClient(num, fullUserName2);
                }
            }
        } else if ("PING".equals(cmd)) {
            byte[] payload = blob.getPayload();
            if (payload != null && payload.length > 0) {
                XMMsgPing parseFrom3 = XMMsgPing.parseFrom(payload);
                if (parseFrom3.hasPsc()) {
                    ServiceConfig.getInstance().handle(parseFrom3.getPsc());
                }
            }
            if (!"com.xiaomi.xmsf".equals(this.mService.getPackageName())) {
                this.mService.sendPongIfNeed();
            }
            if ("1".equals(blob.getPacketID())) {
                MyLog.w("received a server ping");
            } else {
                StatsHelper.pingEnded();
            }
            this.mService.onPong();
        } else if ("SYNC".equals(cmd)) {
            if ("CONF".equals(blob.getSubcmd())) {
                ServiceConfig.getInstance().handle(PushServiceConfigMsg.parseFrom(blob.getPayload()));
            } else if (TextUtils.equals("U", blob.getSubcmd())) {
                XMMsgU parseFrom4 = XMMsgU.parseFrom(blob.getPayload());
                LogUploader.getInstance(this.mService).upload(parseFrom4.getUrl(), parseFrom4.getToken(), new Date(parseFrom4.getStart()), new Date(parseFrom4.getEnd()), parseFrom4.getMaxlen() * 1024, parseFrom4.getForce());
                Blob blob2 = new Blob();
                blob2.setChannelId(0);
                blob2.setCmd(blob.getCmd(), "UCA");
                blob2.setPacketID(blob.getPacketID());
                this.mService.executeJob(new SendMessageJob(this.mService, blob2));
            } else if (TextUtils.equals("P", blob.getSubcmd())) {
                XMMsgP parseFrom5 = XMMsgP.parseFrom(blob.getPayload());
                Blob blob3 = new Blob();
                blob3.setChannelId(0);
                blob3.setCmd(blob.getCmd(), "PCA");
                blob3.setPacketID(blob.getPacketID());
                XMMsgP xMMsgP = new XMMsgP();
                if (parseFrom5.hasCookie()) {
                    xMMsgP.setCookie(parseFrom5.getCookie());
                }
                blob3.setPayload(xMMsgP.toByteArray(), null);
                this.mService.executeJob(new SendMessageJob(this.mService, blob3));
                StringBuilder sb6 = new StringBuilder();
                sb6.append("ACK msgP: id = ");
                sb6.append(blob.getPacketID());
                MyLog.w(sb6.toString());
            }
        } else if ("NOTIFY".equals(blob.getCmd())) {
            XMMsgNotify parseFrom6 = XMMsgNotify.parseFrom(blob.getPayload());
            StringBuilder sb7 = new StringBuilder();
            sb7.append("notify by server err = ");
            sb7.append(parseFrom6.getErrCode());
            sb7.append(" desc = ");
            sb7.append(parseFrom6.getErrStr());
            MyLog.w(sb7.toString());
        }
    }

    public void onBlobReceive(Blob blob) {
        if (5 != blob.getChannelId()) {
            dispatchNetFlow(blob);
        }
        try {
            handleBlob(blob);
        } catch (Exception e) {
            StringBuilder sb = new StringBuilder();
            sb.append("handle Blob chid = ");
            sb.append(blob.getChannelId());
            sb.append(" cmd = ");
            sb.append(blob.getCmd());
            sb.append(" packetid = ");
            sb.append(blob.getPacketID());
            sb.append(" failure ");
            MyLog.e(sb.toString(), e);
        }
    }

    public void onPacketReceive(Packet packet) {
        if (!"5".equals(packet.getChannelId())) {
            dispatchNetFlow(packet);
        }
        String channelId = packet.getChannelId();
        if (TextUtils.isEmpty(channelId)) {
            channelId = "1";
            packet.setChannelId(channelId);
        }
        if (channelId.equals(MovieStatUtils.DOWNLOAD_SUCCESS)) {
            StringBuilder sb = new StringBuilder();
            sb.append("Received wrong packet with chid = 0 : ");
            sb.append(packet.toXML());
            MyLog.w(sb.toString());
        }
        if (packet instanceof IQ) {
            CommonPacketExtension extension = packet.getExtension("kick");
            if (extension != null) {
                String to = packet.getTo();
                String attributeValue = extension.getAttributeValue(nexExportFormat.TAG_FORMAT_TYPE);
                String attributeValue2 = extension.getAttributeValue("reason");
                StringBuilder sb2 = new StringBuilder();
                sb2.append("kicked by server, chid=");
                sb2.append(channelId);
                sb2.append(" res=");
                sb2.append(ClientLoginInfo.getResource(to));
                sb2.append(" type=");
                sb2.append(attributeValue);
                sb2.append(" reason=");
                sb2.append(attributeValue2);
                MyLog.w(sb2.toString());
                if ("wait".equals(attributeValue)) {
                    ClientLoginInfo clientLoginInfoByChidAndUserId = PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(channelId, to);
                    if (clientLoginInfoByChidAndUserId != null) {
                        this.mService.scheduleRebindChannel(clientLoginInfoByChidAndUserId);
                        clientLoginInfoByChidAndUserId.setStatus(ClientStatus.unbind, 3, 0, attributeValue2, attributeValue);
                    }
                } else {
                    this.mService.closeChannel(channelId, to, 3, attributeValue2, attributeValue);
                    PushClientsManager.getInstance().deactivateClient(channelId, to);
                }
                return;
            }
        } else if (packet instanceof Message) {
            Message message = (Message) packet;
            if ("redir".equals(message.getType())) {
                CommonPacketExtension extension2 = message.getExtension("hosts");
                if (extension2 != null) {
                    processRedirectMessage(extension2);
                }
                return;
            }
        }
        this.mService.getClientEventDispatcher().notifyPacketArrival(this.mService, channelId, packet);
    }
}
