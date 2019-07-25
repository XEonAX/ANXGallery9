package com.xiaomi.push.service;

import android.content.Context;
import com.xiaomi.channel.commonutils.android.AppInfoUtils;
import com.xiaomi.channel.commonutils.android.SystemUtils;
import com.xiaomi.push.service.PushClientsManager.ClientLoginInfo;
import java.util.Locale;

public class MIPushAccount {
    public final String account;
    public final String appId;
    public final String appToken;
    public final int envType;
    public final String packageName;
    public final String security;
    public final String token;

    public MIPushAccount(String str, String str2, String str3, String str4, String str5, String str6, int i) {
        this.account = str;
        this.token = str2;
        this.security = str3;
        this.appId = str4;
        this.appToken = str5;
        this.packageName = str6;
        this.envType = i;
    }

    public static boolean isAbTestSupported(Context context) {
        return "com.xiaomi.xmsf".equals(context.getPackageName()) && isMIUIAlphaVersion();
    }

    public static boolean isMIUIAlphaVersion() {
        try {
            return Class.forName("miui.os.Build").getField("IS_ALPHA_BUILD").getBoolean(null);
        } catch (Exception unused) {
            return false;
        }
    }

    private static boolean isMIUIPush(Context context) {
        return context.getPackageName().equals("com.xiaomi.xmsf");
    }

    public ClientLoginInfo toClientLoginInfo(ClientLoginInfo clientLoginInfo, Context context, ClientEventDispatcher clientEventDispatcher, String str) {
        clientLoginInfo.pkgName = context.getPackageName();
        clientLoginInfo.userId = this.account;
        clientLoginInfo.security = this.security;
        clientLoginInfo.token = this.token;
        clientLoginInfo.chid = "5";
        clientLoginInfo.authMethod = "XMPUSH-PASS";
        clientLoginInfo.kick = false;
        String str2 = "";
        if (isMIUIPush(context)) {
            str2 = AppInfoUtils.getRunningAppPkgNames(context);
        }
        clientLoginInfo.clientExtra = String.format("%1$s:%2$s,%3$s:%4$s,%5$s:%6$s:%7$s:%8$s,%9$s:%10$s,%11$s:%12$s", new Object[]{"sdk_ver", Integer.valueOf(38), "cpvn", "3_6_19", "cpvc", Integer.valueOf(30619), "aapn", str2, "country_code", AppRegionStorage.getInstance(context).getCountryCode(), "region", AppRegionStorage.getInstance(context).getRegion()});
        clientLoginInfo.cloudExtra = String.format("%1$s:%2$s,%3$s:%4$s,%5$s:%6$s,sync:1", new Object[]{"appid", isMIUIPush(context) ? "1000271" : this.appId, "locale", Locale.getDefault().toString(), "miid", SystemUtils.getMIID(context)});
        if (isAbTestSupported(context)) {
            StringBuilder sb = new StringBuilder();
            sb.append(clientLoginInfo.cloudExtra);
            sb.append(String.format(",%1$s:%2$s", new Object[]{"ab", str}));
            clientLoginInfo.cloudExtra = sb.toString();
        }
        clientLoginInfo.mClientEventDispatcher = clientEventDispatcher;
        return clientLoginInfo;
    }

    public ClientLoginInfo toClientLoginInfo(XMPushService xMPushService) {
        ClientLoginInfo clientLoginInfo = new ClientLoginInfo(xMPushService);
        toClientLoginInfo(clientLoginInfo, xMPushService, xMPushService.getClientEventDispatcher(), "c");
        return clientLoginInfo;
    }
}
