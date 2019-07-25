package com.xiaomi.channel.commonutils.android;

import android.content.Context;

public class PermissionUtils {
    public static boolean checkSelfPermission(Context context, String str) {
        return context.getPackageManager().checkPermission(str, context.getPackageName()) == 0;
    }
}
