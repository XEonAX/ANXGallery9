package com.xiaomi.push.service;

import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.XMPushService.ConnectJob;
import com.xiaomi.stats.StatsHandler;

class ReconnectionManager {
    private static int MAX_RETRY_INTERVAL = 300000;
    private int attempts = 0;
    private int curDelay;
    private long lastConnectTime;
    private XMPushService mPushService;
    private int shortLiveConnCount = 0;

    public ReconnectionManager(XMPushService xMPushService) {
        this.mPushService = xMPushService;
        this.curDelay = 500;
        this.lastConnectTime = 0;
    }

    private int timeDelay() {
        if (this.attempts > 8) {
            return 300000;
        }
        double random = (Math.random() * 2.0d) + 1.0d;
        if (this.attempts > 4) {
            return (int) (random * 60000.0d);
        }
        if (this.attempts > 1) {
            return (int) (random * 10000.0d);
        }
        if (this.lastConnectTime == 0) {
            return 0;
        }
        if (System.currentTimeMillis() - this.lastConnectTime >= 310000) {
            this.curDelay = 1000;
            this.shortLiveConnCount = 0;
            return 0;
        } else if (this.curDelay >= MAX_RETRY_INTERVAL) {
            return this.curDelay;
        } else {
            int i = this.curDelay;
            this.shortLiveConnCount++;
            if (this.shortLiveConnCount >= 4) {
                i = MAX_RETRY_INTERVAL;
            } else {
                double d = (double) this.curDelay;
                Double.isNaN(d);
                this.curDelay = (int) (d * 1.5d);
            }
            return i;
        }
    }

    public void onConnectSucceeded() {
        this.lastConnectTime = System.currentTimeMillis();
        this.mPushService.removeJobs(1);
        this.attempts = 0;
    }

    public void tryReconnect(boolean z) {
        if (!this.mPushService.shouldReconnect()) {
            MyLog.v("should not reconnect as no client or network.");
        } else if (z) {
            if (!this.mPushService.hasJob(1)) {
                this.attempts++;
            }
            this.mPushService.removeJobs(1);
            XMPushService xMPushService = this.mPushService;
            XMPushService xMPushService2 = this.mPushService;
            xMPushService2.getClass();
            xMPushService.executeJob(new ConnectJob());
        } else if (!this.mPushService.hasJob(1)) {
            int timeDelay = timeDelay();
            if (!this.mPushService.hasJob(1)) {
                this.attempts++;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("schedule reconnect in ");
            sb.append(timeDelay);
            sb.append("ms");
            MyLog.w(sb.toString());
            XMPushService xMPushService3 = this.mPushService;
            XMPushService xMPushService4 = this.mPushService;
            xMPushService4.getClass();
            xMPushService3.executeJobDelayed(new ConnectJob(), (long) timeDelay);
            if (this.attempts == 2 && StatsHandler.getInstance().isAllowStats()) {
                NetworkCheckup.dumpNativeNetInfo();
            }
            if (this.attempts == 3) {
                NetworkCheckup.connectivityTest();
            }
        }
    }
}
