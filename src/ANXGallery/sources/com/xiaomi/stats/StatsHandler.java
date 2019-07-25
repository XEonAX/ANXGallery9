package com.xiaomi.stats;

import com.xiaomi.channel.commonutils.android.DeviceInfo;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.channel.commonutils.stats.Stats;
import com.xiaomi.channel.commonutils.stats.Stats.Item;
import com.xiaomi.push.protobuf.ChannelMessage.PushServiceConfigMsg;
import com.xiaomi.push.service.ServiceConfig;
import com.xiaomi.push.service.ServiceConfig.Listener;
import com.xiaomi.push.service.XMPushService;
import com.xiaomi.push.thrift.ChannelStatsType;
import com.xiaomi.push.thrift.StatsEvent;
import com.xiaomi.push.thrift.StatsEvents;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.NoSuchElementException;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.XmPushTBinaryProtocol.Factory;
import org.apache.thrift.transport.TMemoryBuffer;

public class StatsHandler {
    private boolean allowStatsUpload = false;
    private StatsContext context;
    private int duration;
    private long startTime;
    private Stats statsContainer = Stats.instance();
    private String uuid;

    static class Holder {
        static final StatsHandler sStatsHandler = new StatsHandler();
    }

    private StatsEvent from(Item item) {
        if (item.key != 0) {
            StatsEvent createStatsEvent = createStatsEvent();
            createStatsEvent.setType(ChannelStatsType.CHANNEL_STATS_COUNTER.getValue());
            createStatsEvent.setSubvalue(item.key);
            createStatsEvent.setAnnotation(item.annotation);
            return createStatsEvent;
        } else if (item.obj instanceof StatsEvent) {
            return (StatsEvent) item.obj;
        } else {
            return null;
        }
    }

    public static StatsContext getContext() {
        StatsContext statsContext;
        synchronized (Holder.sStatsHandler) {
            statsContext = Holder.sStatsHandler.context;
        }
        return statsContext;
    }

    public static StatsHandler getInstance() {
        return Holder.sStatsHandler;
    }

    private StatsEvents retriveStatsEvents(int i) {
        ArrayList arrayList = new ArrayList();
        StatsEvents statsEvents = new StatsEvents(this.uuid, arrayList);
        if (!Network.isWIFIConnected(this.context.pushService)) {
            statsEvents.setOperator(DeviceInfo.getSimOperatorName(this.context.pushService));
        }
        TMemoryBuffer tMemoryBuffer = new TMemoryBuffer(i);
        TProtocol protocol = new Factory().getProtocol(tMemoryBuffer);
        try {
            statsEvents.write(protocol);
        } catch (TException unused) {
        }
        LinkedList stats = this.statsContainer.getStats();
        while (true) {
            try {
                if (stats.size() <= 0) {
                    break;
                }
                StatsEvent from = from((Item) stats.getLast());
                if (from != null) {
                    from.write(protocol);
                }
                if (tMemoryBuffer.length() > i) {
                    break;
                }
                if (from != null) {
                    arrayList.add(from);
                }
                stats.removeLast();
            } catch (NoSuchElementException | TException unused2) {
            }
        }
        return statsEvents;
    }

    private void stopStatsIfNeed() {
        if (this.allowStatsUpload && System.currentTimeMillis() - this.startTime > ((long) this.duration)) {
            this.allowStatsUpload = false;
            this.startTime = 0;
        }
    }

    /* access modifiers changed from: 0000 */
    public synchronized void add(StatsEvent statsEvent) {
        this.statsContainer.stat(statsEvent);
    }

    /* access modifiers changed from: 0000 */
    public synchronized StatsEvent createStatsEvent() {
        StatsEvent statsEvent;
        statsEvent = new StatsEvent();
        statsEvent.setConnpt(Network.getActiveConnPoint(this.context.pushService));
        statsEvent.chid = 0;
        statsEvent.value = 1;
        statsEvent.setTime((int) (System.currentTimeMillis() / 1000));
        return statsEvent;
    }

    public synchronized void init(XMPushService xMPushService) {
        this.context = new StatsContext(xMPushService);
        this.uuid = "";
        ServiceConfig.getInstance().addListener(new Listener() {
            public void onConfigMsgReceive(PushServiceConfigMsg pushServiceConfigMsg) {
                if (pushServiceConfigMsg.hasDots()) {
                    StatsHandler.getInstance().setDuration(pushServiceConfigMsg.getDots());
                }
            }
        });
    }

    public boolean isAllowStats() {
        return this.allowStatsUpload;
    }

    /* access modifiers changed from: 0000 */
    public synchronized StatsEvents retriveStatsEvents() {
        StatsEvents statsEvents;
        statsEvents = null;
        if (shouldSendStatsNow()) {
            int i = 750;
            if (!Network.isWIFIConnected(this.context.pushService)) {
                i = 375;
            }
            statsEvents = retriveStatsEvents(i);
        }
        return statsEvents;
    }

    public void setDuration(int i) {
        if (i > 0) {
            int i2 = i * 1000;
            if (i2 > 604800000) {
                i2 = 604800000;
            }
            if (this.duration != i2 || !this.allowStatsUpload) {
                this.allowStatsUpload = true;
                this.startTime = System.currentTimeMillis();
                this.duration = i2;
                StringBuilder sb = new StringBuilder();
                sb.append("enable dot duration = ");
                sb.append(i2);
                sb.append(" start = ");
                sb.append(this.startTime);
                MyLog.v(sb.toString());
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public boolean shouldSendStatsNow() {
        stopStatsIfNeed();
        return this.allowStatsUpload && this.statsContainer.getCount() > 0;
    }
}
