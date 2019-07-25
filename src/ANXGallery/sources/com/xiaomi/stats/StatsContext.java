package com.xiaomi.stats;

import android.net.TrafficStats;
import android.os.Process;
import android.os.SystemClock;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.push.service.XMPushService;
import com.xiaomi.push.thrift.ChannelStatsType;
import com.xiaomi.push.thrift.StatsEvent;
import com.xiaomi.smack.Connection;
import com.xiaomi.smack.ConnectionListener;
import com.xiaomi.smack.SmackConfiguration;

public class StatsContext implements ConnectionListener {
    private long accumulatedChannelDuration = 0;
    private long accumulatedNetworkDuration = 0;
    private long channelConnectedTime = 0;
    Connection connection;
    private String connectionPoint;
    private Exception exception;
    private long mRxBytes = 0;
    private long mTxBytes = 0;
    private long networkConnectedTime = 0;
    XMPushService pushService;
    private int reason;

    StatsContext(XMPushService xMPushService) {
        this.pushService = xMPushService;
        this.connectionPoint = "";
        resetChannelStats();
        int myUid = Process.myUid();
        this.mRxBytes = TrafficStats.getUidRxBytes(myUid);
        this.mTxBytes = TrafficStats.getUidTxBytes(myUid);
    }

    private void resetChannelStats() {
        this.accumulatedNetworkDuration = 0;
        this.accumulatedChannelDuration = 0;
        this.networkConnectedTime = 0;
        this.channelConnectedTime = 0;
        long elapsedRealtime = SystemClock.elapsedRealtime();
        if (Network.hasNetwork(this.pushService)) {
            this.networkConnectedTime = elapsedRealtime;
        }
        if (this.pushService.isConnected()) {
            this.channelConnectedTime = elapsedRealtime;
        }
    }

    private synchronized void statsChannelDuration() {
        StringBuilder sb = new StringBuilder();
        sb.append("stat connpt = ");
        sb.append(this.connectionPoint);
        sb.append(" netDuration = ");
        sb.append(this.accumulatedNetworkDuration);
        sb.append(" ChannelDuration = ");
        sb.append(this.accumulatedChannelDuration);
        sb.append(" channelConnectedTime = ");
        sb.append(this.channelConnectedTime);
        MyLog.v(sb.toString());
        StatsEvent statsEvent = new StatsEvent();
        statsEvent.chid = 0;
        statsEvent.setType(ChannelStatsType.CHANNEL_ONLINE_RATE.getValue());
        statsEvent.setConnpt(this.connectionPoint);
        statsEvent.setTime((int) (System.currentTimeMillis() / 1000));
        statsEvent.setValue((int) (this.accumulatedNetworkDuration / 1000));
        statsEvent.setSubvalue((int) (this.accumulatedChannelDuration / 1000));
        StatsHandler.getInstance().add(statsEvent);
        resetChannelStats();
    }

    public void connectionClosed(Connection connection2, int i, Exception exc) {
        if (this.reason == 0 && this.exception == null) {
            this.reason = i;
            this.exception = exc;
            StatsHelper.connectionDown(connection2.getHost(), exc);
        }
        if (i == 22 && this.channelConnectedTime != 0) {
            long lastPingRecv = connection2.getLastPingRecv() - this.channelConnectedTime;
            if (lastPingRecv < 0) {
                lastPingRecv = 0;
            }
            this.accumulatedChannelDuration += lastPingRecv + ((long) (SmackConfiguration.getPingInteval() / 2));
            this.channelConnectedTime = 0;
        }
        statsChannelIfNeed();
        int myUid = Process.myUid();
        long uidRxBytes = TrafficStats.getUidRxBytes(myUid);
        long uidTxBytes = TrafficStats.getUidTxBytes(myUid);
        StringBuilder sb = new StringBuilder();
        sb.append("Stats rx=");
        sb.append(uidRxBytes - this.mRxBytes);
        sb.append(", tx=");
        sb.append(uidTxBytes - this.mTxBytes);
        MyLog.v(sb.toString());
        this.mRxBytes = uidRxBytes;
        this.mTxBytes = uidTxBytes;
    }

    public void connectionStarted(Connection connection2) {
        this.reason = 0;
        this.exception = null;
        this.connection = connection2;
        this.connectionPoint = Network.getActiveConnPoint(this.pushService);
        StatsHelper.trackStart(0, ChannelStatsType.CONN_SUCCESS.getValue());
    }

    /* access modifiers changed from: 0000 */
    public Exception getCaughtException() {
        return this.exception;
    }

    public void reconnectionFailed(Connection connection2, Exception exc) {
        StatsHelper.stats(0, ChannelStatsType.CHANNEL_CON_FAIL.getValue(), 1, connection2.getHost(), Network.hasNetwork(this.pushService) ? 1 : 0);
        statsChannelIfNeed();
    }

    public void reconnectionSuccessful(Connection connection2) {
        statsChannelIfNeed();
        this.channelConnectedTime = SystemClock.elapsedRealtime();
        StatsHelper.trackEnd(0, ChannelStatsType.CONN_SUCCESS.getValue(), connection2.getHost(), connection2.getConnTryTimes());
    }

    /* JADX WARNING: Code restructure failed: missing block: B:28:0x0070, code lost:
        return;
     */
    public synchronized void statsChannelIfNeed() {
        if (this.pushService != null) {
            String activeConnPoint = Network.getActiveConnPoint(this.pushService);
            boolean hasNetwork = Network.hasNetwork(this.pushService);
            long elapsedRealtime = SystemClock.elapsedRealtime();
            if (this.networkConnectedTime > 0) {
                this.accumulatedNetworkDuration += elapsedRealtime - this.networkConnectedTime;
                this.networkConnectedTime = 0;
            }
            if (this.channelConnectedTime != 0) {
                this.accumulatedChannelDuration += elapsedRealtime - this.channelConnectedTime;
                this.channelConnectedTime = 0;
            }
            if (hasNetwork) {
                if ((!TextUtils.equals(this.connectionPoint, activeConnPoint) && this.accumulatedNetworkDuration > 30000) || this.accumulatedNetworkDuration > 5400000) {
                    statsChannelDuration();
                }
                this.connectionPoint = activeConnPoint;
                if (this.networkConnectedTime == 0) {
                    this.networkConnectedTime = elapsedRealtime;
                }
                if (this.pushService.isConnected()) {
                    this.channelConnectedTime = elapsedRealtime;
                }
            }
        }
    }
}
