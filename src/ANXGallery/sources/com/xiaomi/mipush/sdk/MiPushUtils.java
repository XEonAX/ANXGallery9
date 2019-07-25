package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.os.Build;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.android.DeviceInfo;
import com.xiaomi.channel.commonutils.android.MIUIUtils;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import java.util.HashMap;

class MiPushUtils {
    public static HashMap<String, String> collectDeviceInfo(Context context, String str) {
        HashMap<String, String> hashMap = new HashMap<>();
        try {
            hashMap.put("appToken", AppInfoHolder.getInstance(context).getAppToken());
            hashMap.put("regId", MiPushClient.getRegId(context));
            hashMap.put("appId", AppInfoHolder.getInstance(context).getAppID());
            hashMap.put("regResource", AppInfoHolder.getInstance(context).getRegResource());
            if (!MIUIUtils.isGlobalRegion()) {
                String quicklyGetIMEI = DeviceInfo.quicklyGetIMEI(context);
                if (!TextUtils.isEmpty(quicklyGetIMEI)) {
                    hashMap.put("imeiMd5", XMStringUtils.getMd5Digest(quicklyGetIMEI));
                }
            }
            hashMap.put("isMIUI", String.valueOf(MIUIUtils.isMIUI()));
            hashMap.put("miuiVersion", MIUIUtils.getMIUIType());
            hashMap.put("devId", DeviceInfo.getDeviceId(context, true));
            hashMap.put("model", Build.MODEL);
            hashMap.put("pkgName", context.getPackageName());
            hashMap.put("sdkVersion", "3_6_19");
            hashMap.put("androidVersion", String.valueOf(VERSION.SDK_INT));
            StringBuilder sb = new StringBuilder();
            sb.append(VERSION.RELEASE);
            sb.append("-");
            sb.append(VERSION.INCREMENTAL);
            hashMap.put("os", sb.toString());
            hashMap.put("andId", DeviceInfo.getAndroidId(context));
            if (!TextUtils.isEmpty(str)) {
                hashMap.put("clientInterfaceId", str);
            }
            return hashMap;
        } catch (Throwable unused) {
            return hashMap;
        }
    }
}
