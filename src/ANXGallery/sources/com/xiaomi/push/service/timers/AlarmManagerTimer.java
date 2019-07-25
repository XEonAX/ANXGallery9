package com.xiaomi.push.service.timers;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build.VERSION;
import android.os.SystemClock;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.reflect.JavaCalls;
import com.xiaomi.push.service.PushConstants;
import com.xiaomi.smack.SmackConfiguration;

class AlarmManagerTimer implements IAlarm {
    protected Context mContext = null;
    private volatile long mNextPingTs = 0;
    private PendingIntent mPi = null;

    public AlarmManagerTimer(Context context) {
        this.mContext = context;
    }

    private void setExact(AlarmManager alarmManager, long j, PendingIntent pendingIntent) {
        try {
            AlarmManager.class.getMethod("setExact", new Class[]{Integer.TYPE, Long.TYPE, PendingIntent.class}).invoke(alarmManager, new Object[]{Integer.valueOf(0), Long.valueOf(j), pendingIntent});
        } catch (Exception e) {
            MyLog.e((Throwable) e);
        }
    }

    /* access modifiers changed from: 0000 */
    public long getPingInteval() {
        return (long) SmackConfiguration.getPingInteval();
    }

    public boolean isAlive() {
        return this.mNextPingTs != 0;
    }

    public void register(Intent intent, long j) {
        AlarmManager alarmManager = (AlarmManager) this.mContext.getSystemService("alarm");
        this.mPi = PendingIntent.getBroadcast(this.mContext, 0, intent, 0);
        if (VERSION.SDK_INT >= 23) {
            JavaCalls.callMethod(alarmManager, "setExactAndAllowWhileIdle", Integer.valueOf(0), Long.valueOf(j), this.mPi);
        } else if (VERSION.SDK_INT >= 19) {
            setExact(alarmManager, j, this.mPi);
        } else {
            alarmManager.set(0, j, this.mPi);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("register timer ");
        sb.append(j);
        MyLog.v(sb.toString());
    }

    public void registerPing(boolean z) {
        long pingInteval = getPingInteval();
        if (z || this.mNextPingTs != 0) {
            if (z) {
                stop();
            }
            if (z || this.mNextPingTs == 0) {
                this.mNextPingTs = System.currentTimeMillis() + (pingInteval - (SystemClock.elapsedRealtime() % pingInteval));
            } else {
                this.mNextPingTs += pingInteval;
                if (this.mNextPingTs < System.currentTimeMillis()) {
                    this.mNextPingTs = System.currentTimeMillis() + pingInteval;
                }
            }
            Intent intent = new Intent(PushConstants.ACTION_PING_TIMER);
            intent.setPackage(this.mContext.getPackageName());
            register(intent, this.mNextPingTs);
        }
    }

    public void stop() {
        if (this.mPi != null) {
            try {
                ((AlarmManager) this.mContext.getSystemService("alarm")).cancel(this.mPi);
            } catch (Exception unused) {
            } catch (Throwable th) {
                this.mPi = null;
                MyLog.v("unregister timer");
                this.mNextPingTs = 0;
                throw th;
            }
            this.mPi = null;
            MyLog.v("unregister timer");
            this.mNextPingTs = 0;
        }
        this.mNextPingTs = 0;
    }
}
