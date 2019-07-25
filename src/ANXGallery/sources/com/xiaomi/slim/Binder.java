package com.xiaomi.slim;

import android.text.TextUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.string.CloudCoder;
import com.xiaomi.push.protobuf.ChannelMessage.XMMsgBind;
import com.xiaomi.push.service.PushClientsManager.ClientLoginInfo;
import com.xiaomi.smack.Connection;
import com.xiaomi.smack.XMPPException;
import java.util.HashMap;

class Binder {
    public static void bind(ClientLoginInfo clientLoginInfo, String str, Connection connection) throws XMPPException {
        String str2;
        XMMsgBind xMMsgBind = new XMMsgBind();
        if (!TextUtils.isEmpty(clientLoginInfo.token)) {
            xMMsgBind.setToken(clientLoginInfo.token);
        }
        if (!TextUtils.isEmpty(clientLoginInfo.clientExtra)) {
            xMMsgBind.setClientAttrs(clientLoginInfo.clientExtra);
        }
        if (!TextUtils.isEmpty(clientLoginInfo.cloudExtra)) {
            xMMsgBind.setCloudAttrs(clientLoginInfo.cloudExtra);
        }
        xMMsgBind.setKick(clientLoginInfo.kick ? "1" : MovieStatUtils.DOWNLOAD_SUCCESS);
        if (!TextUtils.isEmpty(clientLoginInfo.authMethod)) {
            xMMsgBind.setMethod(clientLoginInfo.authMethod);
        } else {
            xMMsgBind.setMethod("XIAOMI-SASL");
        }
        Blob blob = new Blob();
        blob.setFrom(clientLoginInfo.userId);
        blob.setChannelId(Integer.parseInt(clientLoginInfo.chid));
        blob.setPackageName(clientLoginInfo.pkgName);
        blob.setCmd("BIND", null);
        blob.setPacketID(blob.getPacketID());
        StringBuilder sb = new StringBuilder();
        sb.append("[Slim]: bind id=");
        sb.append(blob.getPacketID());
        MyLog.w(sb.toString());
        HashMap hashMap = new HashMap();
        hashMap.put("challenge", str);
        hashMap.put("token", clientLoginInfo.token);
        hashMap.put("chid", clientLoginInfo.chid);
        hashMap.put("from", clientLoginInfo.userId);
        hashMap.put("id", blob.getPacketID());
        hashMap.put("to", "xiaomi.com");
        if (clientLoginInfo.kick) {
            hashMap.put("kick", "1");
        } else {
            hashMap.put("kick", MovieStatUtils.DOWNLOAD_SUCCESS);
        }
        if (!TextUtils.isEmpty(clientLoginInfo.clientExtra)) {
            hashMap.put("client_attrs", clientLoginInfo.clientExtra);
        } else {
            hashMap.put("client_attrs", "");
        }
        if (!TextUtils.isEmpty(clientLoginInfo.cloudExtra)) {
            hashMap.put("cloud_attrs", clientLoginInfo.cloudExtra);
        } else {
            hashMap.put("cloud_attrs", "");
        }
        if (clientLoginInfo.authMethod.equals("XIAOMI-PASS") || clientLoginInfo.authMethod.equals("XMPUSH-PASS")) {
            str2 = CloudCoder.generateSignature(clientLoginInfo.authMethod, null, hashMap, clientLoginInfo.security);
        } else {
            clientLoginInfo.authMethod.equals("XIAOMI-SASL");
            str2 = null;
        }
        xMMsgBind.setSig(str2);
        blob.setPayload(xMMsgBind.toByteArray(), null);
        connection.send(blob);
    }

    public static void unbind(String str, String str2, Connection connection) throws XMPPException {
        Blob blob = new Blob();
        blob.setFrom(str2);
        blob.setChannelId(Integer.parseInt(str));
        blob.setCmd("UBND", null);
        connection.send(blob);
    }
}
