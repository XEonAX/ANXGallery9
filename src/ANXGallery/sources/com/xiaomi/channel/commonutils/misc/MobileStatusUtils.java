package com.xiaomi.channel.commonutils.misc;

import android.app.KeyguardManager;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.xiaomi.channel.commonutils.logger.MyLog;

public class MobileStatusUtils {
    public static boolean isCharging(Context context) {
        Intent intent;
        try {
            intent = context.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        } catch (Exception unused) {
            intent = null;
        }
        boolean z = false;
        if (intent == null) {
            return false;
        }
        int intExtra = intent.getIntExtra("status", -1);
        if (intExtra == 2 || intExtra == 5) {
            z = true;
        }
        return z;
    }

    public static boolean isScreenLocked(Context context) {
        try {
            return ((KeyguardManager) context.getSystemService("keyguard")).inKeyguardRestrictedInputMode();
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            return false;
        }
    }
}
