package com.xiaomi.micloudsdk.sync;

import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;
import java.util.HashMap;
import java.util.Map;

public abstract class SyncCommandServiceBase extends IntentService {
    private static Map<String, String> mPackageNameMap = new HashMap();

    static {
        mPackageNameMap.put("com.miui.gallery.cloud.provider", "com.miui.gallery");
    }

    public SyncCommandServiceBase() {
        super("SyncCommandServiceBase");
    }

    public static void sendCommandService(Context context, String str, String str2) {
        if (context == null || TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            Log.e("SyncCommandServiceBase", "illegal arguments");
        } else if (!mPackageNameMap.containsKey(str)) {
            Log.e("SyncCommandServiceBase", "authority does not have target package name");
        } else {
            Intent intent = new Intent("com.xiaomi.micloud.action.SYNC_COMMAND");
            intent.setPackage((String) mPackageNameMap.get(str));
            intent.putExtra("key_command", str2);
            context.startService(intent);
        }
    }

    public abstract void handleCommand(String str);

    /* access modifiers changed from: protected */
    public void onHandleIntent(Intent intent) {
        if (intent == null || !"com.xiaomi.micloud.action.SYNC_COMMAND".equals(intent.getAction())) {
            Log.e("SyncCommandServiceBase", "illegal arguments");
        } else {
            handleCommand(intent.getStringExtra("key_command"));
        }
    }
}
