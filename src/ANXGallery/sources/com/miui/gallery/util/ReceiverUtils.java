package com.miui.gallery.util;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.text.TextUtils;

public class ReceiverUtils {
    public static void registerReceiver(Context context, BroadcastReceiver broadcastReceiver, int i, String str, String... strArr) {
        if (broadcastReceiver != null && strArr != null && strArr.length > 0) {
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.setPriority(i);
            if (!TextUtils.isEmpty(str)) {
                intentFilter.addDataScheme(str);
            }
            for (String addAction : strArr) {
                intentFilter.addAction(addAction);
            }
            context.registerReceiver(broadcastReceiver, intentFilter);
        }
    }

    public static void registerReceiver(Context context, BroadcastReceiver broadcastReceiver, String... strArr) {
        registerReceiver(context, broadcastReceiver, 0, null, strArr);
    }

    public static boolean safeUnregisterReceiver(Context context, BroadcastReceiver broadcastReceiver) {
        if (!(context == null || broadcastReceiver == null)) {
            try {
                context.unregisterReceiver(broadcastReceiver);
                return true;
            } catch (Exception e) {
                StringBuilder sb = new StringBuilder();
                sb.append("fail to unregister receiver: ");
                sb.append(broadcastReceiver);
                sb.append(e.toString());
                Log.e("ReceiverUtils", sb.toString());
            }
        }
        return false;
    }
}
