package com.xiaomi.push.service;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ProviderInfo;
import android.content.pm.ServiceInfo;
import android.os.Build.VERSION;
import com.xiaomi.channel.commonutils.logger.MyLog;
import java.util.List;

public class ComponentHelper {
    public static boolean checkActivity(Context context, String str, String str2) {
        try {
            PackageManager packageManager = context.getPackageManager();
            Intent intent = new Intent(str2);
            intent.setPackage(str);
            List queryIntentActivities = packageManager.queryIntentActivities(intent, 32);
            return queryIntentActivities != null && !queryIntentActivities.isEmpty();
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            return false;
        }
    }

    public static boolean checkProvider(Context context, String str) {
        boolean z;
        boolean z2 = false;
        try {
            PackageManager packageManager = context.getPackageManager();
            if (VERSION.SDK_INT < 19) {
                return true;
            }
            List<ProviderInfo> queryContentProviders = packageManager.queryContentProviders(null, 0, 8);
            if (queryContentProviders == null || queryContentProviders.isEmpty()) {
                return false;
            }
            for (ProviderInfo providerInfo : queryContentProviders) {
                try {
                    if (providerInfo.enabled && providerInfo.exported && providerInfo.authority.equals(str)) {
                        z2 = true;
                    }
                } catch (Exception e) {
                    e = e;
                    z = z2;
                    MyLog.e((Throwable) e);
                    return z;
                }
            }
            return z2;
        } catch (Exception e2) {
            e = e2;
            z = false;
            MyLog.e((Throwable) e);
            return z;
        }
    }

    public static boolean checkService(Context context, String str) {
        try {
            ServiceInfo[] serviceInfoArr = context.getPackageManager().getPackageInfo(str, 4).services;
            if (serviceInfoArr == null) {
                return false;
            }
            for (ServiceInfo serviceInfo : serviceInfoArr) {
                if (serviceInfo.exported && serviceInfo.enabled && "com.xiaomi.mipush.sdk.PushMessageHandler".equals(serviceInfo.name) && !context.getPackageName().equals(serviceInfo.packageName)) {
                    return true;
                }
            }
            return false;
        } catch (NameNotFoundException e) {
            MyLog.e((Throwable) e);
            return false;
        }
    }

    public static boolean checkService(Context context, String str, String str2) {
        try {
            PackageManager packageManager = context.getPackageManager();
            Intent intent = new Intent(str2);
            intent.setPackage(str);
            List queryIntentServices = packageManager.queryIntentServices(intent, 32);
            return queryIntentServices != null && !queryIntentServices.isEmpty();
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            return false;
        }
    }
}
