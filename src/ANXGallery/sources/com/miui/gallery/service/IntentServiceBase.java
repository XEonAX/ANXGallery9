package com.miui.gallery.service;

import android.app.IntentService;
import android.app.Notification;
import android.content.Intent;
import android.os.Build.VERSION;
import com.miui.gallery.util.Log;

public abstract class IntentServiceBase extends IntentService {
    protected static String TAG = "ServiceBase";

    public IntentServiceBase() {
        super(TAG);
    }

    /* access modifiers changed from: protected */
    public abstract Notification getNotification();

    /* access modifiers changed from: protected */
    public abstract int getNotificationId();

    /* access modifiers changed from: protected */
    public void onHandleIntent(Intent intent) {
        if (VERSION.SDK_INT >= 26) {
            Log.i(TAG, "start foreground service");
            startForeground(getNotificationId(), getNotification());
        }
    }
}
