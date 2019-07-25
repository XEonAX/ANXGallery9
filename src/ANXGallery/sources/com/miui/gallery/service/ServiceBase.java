package com.miui.gallery.service;

import android.app.Notification;
import android.app.Service;
import android.content.Intent;
import android.os.Build.VERSION;
import android.os.IBinder;
import com.miui.gallery.util.Log;

public abstract class ServiceBase extends Service {
    protected static String TAG = "ServiceBase";

    /* access modifiers changed from: protected */
    public abstract Notification getNotification();

    /* access modifiers changed from: protected */
    public abstract int getNotificationId();

    public IBinder onBind(Intent intent) {
        return null;
    }

    public void onCreate() {
        super.onCreate();
        if (VERSION.SDK_INT >= 26) {
            Log.i(TAG, "start foreground service");
            startForeground(getNotificationId(), getNotification());
        }
    }

    public int onStartCommand(Intent intent, int i, int i2) {
        if (VERSION.SDK_INT >= 26) {
            Log.i(TAG, "start foreground service");
            startForeground(getNotificationId(), getNotification());
        }
        return super.onStartCommand(intent, i, i2);
    }
}
