package com.xiaomi.micloudsdk.remote;

import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import com.miui.app.ServiceInstalled;

public abstract class XiaomiAccountRemoteMethodInvoker<R> extends RemoteMethodInvoker<R> {
    private static final ServiceInstalled ACCOUNT_NEW_SERVICE_INSTALLED = new ServiceInstalled(new Intent("com.xiaomi.account.action.BIND_XIAOMI_ACCOUNT_SERVICE").setPackage("com.xiaomi.account"));

    public XiaomiAccountRemoteMethodInvoker(Context context) {
        super(context);
    }

    private static boolean bindAccountService(Context context, String str, ServiceConnection serviceConnection) {
        Intent intent = new Intent(str);
        intent.setPackage("com.xiaomi.account");
        return context.bindService(intent, serviceConnection, 1);
    }

    /* access modifiers changed from: protected */
    public boolean bindService(Context context, ServiceConnection serviceConnection) {
        return ((Boolean) ACCOUNT_NEW_SERVICE_INSTALLED.get(context)).booleanValue() ? bindAccountService(context, "com.xiaomi.account.action.BIND_XIAOMI_ACCOUNT_SERVICE", serviceConnection) : bindAccountService(context, "android.intent.action.BIND_XIAOMI_ACCOUNT_SERVICE", serviceConnection);
    }
}
