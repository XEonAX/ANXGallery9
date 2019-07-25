package com.miui.gallery.cloud.service;

import android.text.TextUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SyncUtil;
import com.xiaomi.micloudsdk.sync.SyncCommandServiceBase;

public class GallerySyncCommandService extends SyncCommandServiceBase {
    public void handleCommand(String str) {
        Log.d("GallerySyncCommandService", "command %s", (Object) str);
        if (TextUtils.equals("value_command_cancel_sync", str)) {
            SyncUtil.stopSync(this);
        }
    }
}
