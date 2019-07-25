package com.xiaomi.push.service;

import android.text.TextUtils;
import com.xiaomi.channel.commonutils.string.XMStringUtils;

public class PacketHelper {
    private static String prefix = "";
    private static long sCurMsgId;

    public static String generatePacketID() {
        if (TextUtils.isEmpty(prefix)) {
            prefix = XMStringUtils.generateRandomString(4);
        }
        StringBuilder sb = new StringBuilder();
        sb.append(prefix);
        long j = sCurMsgId;
        sCurMsgId = 1 + j;
        sb.append(j);
        return sb.toString();
    }
}
