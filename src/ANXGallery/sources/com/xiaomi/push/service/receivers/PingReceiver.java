package com.xiaomi.push.service.receivers;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.PushConstants;
import com.xiaomi.push.service.ServiceClient;
import com.xiaomi.push.service.XMPushService;
import com.xiaomi.push.service.timers.Alarm;

public class PingReceiver extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        StringBuilder sb = new StringBuilder();
        sb.append(intent.getPackage());
        sb.append(" is the package name");
        MyLog.v(sb.toString());
        if (!PushConstants.ACTION_PING_TIMER.equals(intent.getAction())) {
            MyLog.w("cancel the old ping timer");
            Alarm.stop();
        } else if (TextUtils.equals(context.getPackageName(), intent.getPackage())) {
            MyLog.v("Ping XMChannelService on timer");
            try {
                Intent intent2 = new Intent(context, XMPushService.class);
                intent2.putExtra("time_stamp", System.currentTimeMillis());
                intent2.setAction("com.xiaomi.push.timer");
                ServiceClient.getInstance(context).startServiceSafely(intent2);
            } catch (Exception e) {
                MyLog.e((Throwable) e);
            }
        }
    }
}
