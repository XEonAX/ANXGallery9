package com.miui.gallery.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.miui.gallery.data.BackgroundJobService;
import com.miui.gallery.util.Log;
import java.util.ArrayList;

public class DeleteImageReceiver extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if ("com.miui.gallery.intent.action.DELETE_IMAGE_BY_SHA1".equals(action)) {
            try {
                ArrayList stringArrayListExtra = intent.getStringArrayListExtra("image-sha1-list");
                if (stringArrayListExtra != null && !stringArrayListExtra.isEmpty()) {
                    String[] strArr = new String[stringArrayListExtra.size()];
                    stringArrayListExtra.toArray(strArr);
                    BackgroundJobService.startJobDeleteImageBySha1(context, strArr, true);
                }
            } catch (Exception unused) {
                Log.w("DeleteImageReceiver", "error params");
            }
        } else if ("com.miui.gallery.intent.action.DELETE_IMAGE_BY_PATH".equals(action)) {
            try {
                ArrayList stringArrayListExtra2 = intent.getStringArrayListExtra("image-path-list");
                if (stringArrayListExtra2 != null && !stringArrayListExtra2.isEmpty()) {
                    String[] strArr2 = new String[stringArrayListExtra2.size()];
                    stringArrayListExtra2.toArray(strArr2);
                    BackgroundJobService.startJobDeleteImageByPath(context, strArr2);
                }
            } catch (Exception unused2) {
                Log.w("DeleteImageReceiver", "error params");
            }
        }
    }
}
