package com.xiaomi.mipush.sdk;

import android.content.Context;

public class HWPushHelper {
    private static boolean isFailed;

    public static boolean needConnect() {
        return isFailed;
    }

    public static void registerHuaWeiAssemblePush(Context context) {
        AbstractPushManager manager = AssemblePushCollectionsManager.getInstance(context).getManager(AssemblePush.ASSEMBLE_PUSH_HUAWEI);
        if (manager != null) {
            manager.register();
        }
    }

    public static synchronized void setConnectTime(Context context) {
        synchronized (HWPushHelper.class) {
            context.getSharedPreferences("mipush_extra", 0).edit().putLong("last_connect_time", System.currentTimeMillis()).commit();
        }
    }

    public static synchronized boolean shouldTryConnect(Context context) {
        boolean z;
        synchronized (HWPushHelper.class) {
            z = false;
            if (Math.abs(System.currentTimeMillis() - context.getSharedPreferences("mipush_extra", 0).getLong("last_connect_time", -1)) > 5000) {
                z = true;
            }
        }
        return z;
    }
}
