package com.miui.gallery.cloud.control;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.preference.GalleryPreferences.Sync;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ReceiverUtils;

public class BatteryMonitor {
    private int mCount;
    private BroadcastReceiver mPowerIntentReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.BATTERY_CHANGED".equals(intent.getAction())) {
                Sync.setPowerCanSync(BatteryMonitor.isPowerCanSync(context, intent));
            }
        }
    };

    public static class Holder {
        /* access modifiers changed from: private */
        public static final BatteryMonitor sInstance = new BatteryMonitor();
    }

    public static BatteryMonitor getInstance() {
        return Holder.sInstance;
    }

    public static boolean isPowerCanSync(Context context, Intent intent) {
        int intExtra = intent.getIntExtra("status", -1);
        boolean z = false;
        boolean z2 = intExtra == 2 || intExtra == 5;
        StringBuilder sb = new StringBuilder();
        sb.append("ACTION_BATTERY_CHANGED, plugged:");
        sb.append(z2);
        Log.d("BatteryMonitor", sb.toString());
        if (context != null) {
            if (z2) {
                Sync.setIsPlugged(true);
                Log.d("BatteryMonitor", "power is connected");
            } else {
                Sync.setIsPlugged(false);
                Log.d("BatteryMonitor", "power disconnected");
            }
        }
        if (z2) {
            return true;
        }
        int intExtra2 = (intent.getIntExtra("level", 0) * 100) / intent.getIntExtra("scale", 100);
        StringBuilder sb2 = new StringBuilder();
        sb2.append("ACTION_BATTERY_CHANGED, power remaining:");
        sb2.append(intExtra2);
        Log.d("BatteryMonitor", sb2.toString());
        if (intExtra2 > 20) {
            z = true;
        }
        return z;
    }

    public synchronized void end() {
        this.mCount--;
        if (this.mCount == 0) {
            ReceiverUtils.safeUnregisterReceiver(GalleryApp.sGetAndroidContext(), this.mPowerIntentReceiver);
        }
    }

    public synchronized void start() {
        if (this.mCount == 0) {
            GalleryApp.sGetAndroidContext().registerReceiver(this.mPowerIntentReceiver, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        }
        this.mCount++;
    }
}
