package com.miui.gallery.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.miui.gallery.util.GallerySamplingStatHelper;
import java.util.HashMap;

public class StatReceiver extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        String stringExtra = intent.getStringExtra("stat_type");
        if ("count_event".equals(stringExtra)) {
            HashMap hashMap = null;
            String[] stringArrayExtra = intent.getStringArrayExtra("param_keys");
            if (stringArrayExtra != null && stringArrayExtra.length > 0) {
                String[] stringArrayExtra2 = intent.getStringArrayExtra("param_values");
                if (stringArrayExtra2 == null || stringArrayExtra2.length != stringArrayExtra.length) {
                    Log.e("StatReceiver", "Param keys and values has not the same count.");
                    return;
                }
                HashMap hashMap2 = new HashMap();
                for (int i = 0; i < stringArrayExtra.length; i++) {
                    hashMap2.put(stringArrayExtra[i], stringArrayExtra2[i]);
                }
                hashMap = hashMap2;
            }
            GallerySamplingStatHelper.recordCountEvent(intent.getStringExtra("category"), intent.getStringExtra("event"), hashMap);
        } else if ("numeric_event".equals(stringExtra)) {
            GallerySamplingStatHelper.recordNumericPropertyEvent(intent.getStringExtra("category"), intent.getStringExtra("event"), intent.getLongExtra("value", 0));
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Unsupported stat broadcast: ");
            sb.append(intent.toUri(0));
            Log.w("StatReceiver", sb.toString());
        }
    }
}
