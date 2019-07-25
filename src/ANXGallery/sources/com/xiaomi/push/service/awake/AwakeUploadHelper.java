package com.xiaomi.push.service.awake;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.push.service.awake.module.AwakeManager;
import com.xiaomi.push.service.awake.module.IProcessData;
import java.util.HashMap;

public class AwakeUploadHelper {
    private static void doLast(Context context, HashMap<String, String> hashMap) {
        IProcessData sendDataIml = AwakeManager.getInstance(context).getSendDataIml();
        if (sendDataIml != null) {
            sendDataIml.shouldDoLast(context, hashMap);
        }
    }

    /* access modifiers changed from: private */
    public static void doUploadData(Context context, String str, int i, String str2) {
        if (context != null && !TextUtils.isEmpty(str)) {
            try {
                HashMap hashMap = new HashMap();
                hashMap.put("awake_info", str);
                hashMap.put("event_type", String.valueOf(i));
                hashMap.put("description", str2);
                switch (AwakeManager.getInstance(context).getOnLineCmd()) {
                    case 1:
                        sendResponseDirectly(context, hashMap);
                        break;
                    case 2:
                        sendResultByTinyData(context, hashMap);
                        break;
                    case 3:
                        sendResponseDirectly(context, hashMap);
                        sendResultByTinyData(context, hashMap);
                        break;
                }
                doLast(context, hashMap);
            } catch (Exception e) {
                MyLog.e((Throwable) e);
            }
        }
    }

    private static void sendResponseDirectly(Context context, HashMap<String, String> hashMap) {
        IProcessData sendDataIml = AwakeManager.getInstance(context).getSendDataIml();
        if (sendDataIml != null) {
            sendDataIml.sendDirectly(context, hashMap);
        }
    }

    private static void sendResultByTinyData(Context context, HashMap<String, String> hashMap) {
        IProcessData sendDataIml = AwakeManager.getInstance(context).getSendDataIml();
        if (sendDataIml != null) {
            sendDataIml.sendByTinyData(context, hashMap);
        }
    }

    public static void uploadData(final Context context, final String str, final int i, final String str2) {
        ScheduledJobManager.getInstance(context).addOneShootJob(new Runnable() {
            public void run() {
                AwakeUploadHelper.doUploadData(context, str, i, str2);
            }
        });
    }
}
