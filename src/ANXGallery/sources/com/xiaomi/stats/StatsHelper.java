package com.xiaomi.stats;

import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.PushClientsManager.ClientLoginInfo;
import com.xiaomi.push.service.XMPushService;
import com.xiaomi.push.thrift.ChannelStatsType;
import com.xiaomi.push.thrift.StatsEvent;
import com.xiaomi.push.thrift.StatsEvents;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.util.Hashtable;

public class StatsHelper {
    private static final int PING_RTT = ChannelStatsType.PING_RTT.getValue();

    static class Holder {
        static Hashtable<Integer, Long> sTimeTracker = new Hashtable<>();
    }

    public static void connectFail(String str, Exception exc) {
        try {
            TypeWraper fromConnectionException = StatsAnalyser.fromConnectionException(exc);
            StatsEvent createStatsEvent = StatsHandler.getInstance().createStatsEvent();
            createStatsEvent.setType(fromConnectionException.type.getValue());
            createStatsEvent.setAnnotation(fromConnectionException.annotation);
            createStatsEvent.setHost(str);
            StatsHandler.getInstance().add(createStatsEvent);
        } catch (NullPointerException unused) {
        }
    }

    public static void connectionDown(String str, Exception exc) {
        try {
            TypeWraper fromDisconnectEx = StatsAnalyser.fromDisconnectEx(exc);
            StatsEvent createStatsEvent = StatsHandler.getInstance().createStatsEvent();
            createStatsEvent.setType(fromDisconnectEx.type.getValue());
            createStatsEvent.setAnnotation(fromDisconnectEx.annotation);
            createStatsEvent.setHost(str);
            StatsHandler.getInstance().add(createStatsEvent);
        } catch (NullPointerException unused) {
        }
    }

    public static void count(int i) {
        StatsEvent createStatsEvent = StatsHandler.getInstance().createStatsEvent();
        createStatsEvent.setType(ChannelStatsType.CHANNEL_STATS_COUNTER.getValue());
        createStatsEvent.setSubvalue(i);
        StatsHandler.getInstance().add(createStatsEvent);
    }

    public static void pingEnded() {
        trackEnd(0, PING_RTT, null, -1);
    }

    public static void pingStarted() {
        trackStart(0, PING_RTT);
    }

    public static byte[] retriveStatsAsByte() {
        StatsEvents retriveStatsEvents = StatsHandler.getInstance().retriveStatsEvents();
        if (retriveStatsEvents != null) {
            return XmPushThriftSerializeUtils.convertThriftObjectToBytes(retriveStatsEvents);
        }
        return null;
    }

    public static void stats(int i, int i2, int i3, String str, int i4) {
        StatsEvent createStatsEvent = StatsHandler.getInstance().createStatsEvent();
        createStatsEvent.setChid((byte) i);
        createStatsEvent.setType(i2);
        createStatsEvent.setValue(i3);
        createStatsEvent.setHost(str);
        createStatsEvent.setSubvalue(i4);
        StatsHandler.getInstance().add(createStatsEvent);
    }

    public static void statsBind(XMPushService xMPushService, ClientLoginInfo clientLoginInfo) {
        new BindTracker(xMPushService, clientLoginInfo).track();
    }

    public static void statsGslb(String str, int i, Exception exc) {
        StatsEvent createStatsEvent = StatsHandler.getInstance().createStatsEvent();
        if (i > 0) {
            createStatsEvent.setType(ChannelStatsType.GSLB_REQUEST_SUCCESS.getValue());
            createStatsEvent.setHost(str);
            createStatsEvent.setValue(i);
            StatsHandler.getInstance().add(createStatsEvent);
            return;
        }
        try {
            TypeWraper fromGslbException = StatsAnalyser.fromGslbException(exc);
            createStatsEvent.setType(fromGslbException.type.getValue());
            createStatsEvent.setAnnotation(fromGslbException.annotation);
            createStatsEvent.setHost(str);
            StatsHandler.getInstance().add(createStatsEvent);
        } catch (NullPointerException unused) {
        }
    }

    public static synchronized void trackEnd(int i, int i2, String str, int i3) {
        synchronized (StatsHelper.class) {
            long currentTimeMillis = System.currentTimeMillis();
            int i4 = (i << 24) | i2;
            if (Holder.sTimeTracker.containsKey(Integer.valueOf(i4))) {
                StatsEvent createStatsEvent = StatsHandler.getInstance().createStatsEvent();
                createStatsEvent.setType(i2);
                createStatsEvent.setValue((int) (currentTimeMillis - ((Long) Holder.sTimeTracker.get(Integer.valueOf(i4))).longValue()));
                createStatsEvent.setHost(str);
                if (i3 > -1) {
                    createStatsEvent.setSubvalue(i3);
                }
                StatsHandler.getInstance().add(createStatsEvent);
                Holder.sTimeTracker.remove(Integer.valueOf(i2));
            } else {
                MyLog.e("stats key not found");
            }
        }
    }

    public static synchronized void trackStart(int i, int i2) {
        synchronized (StatsHelper.class) {
            if (i2 < 16777215) {
                try {
                    Holder.sTimeTracker.put(Integer.valueOf((i << 24) | i2), Long.valueOf(System.currentTimeMillis()));
                } catch (Throwable th) {
                    throw th;
                }
            } else {
                MyLog.e("stats key should less than 16777215");
            }
        }
    }
}
