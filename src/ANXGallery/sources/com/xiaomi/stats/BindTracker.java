package com.xiaomi.stats;

import com.xiaomi.push.service.PushClientsManager.ClientLoginInfo;
import com.xiaomi.push.service.PushClientsManager.ClientLoginInfo.ClientStatusListener;
import com.xiaomi.push.service.PushClientsManager.ClientStatus;
import com.xiaomi.push.service.XMPushService;
import com.xiaomi.push.service.XMPushService.Job;
import com.xiaomi.push.thrift.ChannelStatsType;
import com.xiaomi.push.thrift.StatsEvent;
import com.xiaomi.smack.Connection;

class BindTracker implements ClientStatusListener {
    private ClientLoginInfo client;
    private Connection connection;
    private XMPushService pushService;
    private int reason;
    private ClientStatus status;
    private boolean tracked = false;

    BindTracker(XMPushService xMPushService, ClientLoginInfo clientLoginInfo) {
        this.pushService = xMPushService;
        this.status = ClientStatus.binding;
        this.client = clientLoginInfo;
    }

    /* access modifiers changed from: private */
    public void done() {
        untrack();
        if (this.tracked && this.reason != 11) {
            StatsEvent createStatsEvent = StatsHandler.getInstance().createStatsEvent();
            switch (this.status) {
                case unbind:
                    if (this.reason != 17) {
                        if (this.reason != 21) {
                            try {
                                TypeWraper fromBind = StatsAnalyser.fromBind(StatsHandler.getContext().getCaughtException());
                                createStatsEvent.type = fromBind.type.getValue();
                                createStatsEvent.setAnnotation(fromBind.annotation);
                                break;
                            } catch (NullPointerException unused) {
                                createStatsEvent = null;
                                break;
                            }
                        } else {
                            createStatsEvent.type = ChannelStatsType.BIND_TIMEOUT.getValue();
                            break;
                        }
                    } else {
                        createStatsEvent.type = ChannelStatsType.BIND_TCP_READ_TIMEOUT.getValue();
                        break;
                    }
                case binded:
                    createStatsEvent.type = ChannelStatsType.BIND_SUCCESS.getValue();
                    break;
            }
            if (createStatsEvent != null) {
                createStatsEvent.setHost(this.connection.getHost());
                createStatsEvent.setUser(this.client.userId);
                createStatsEvent.value = 1;
                try {
                    createStatsEvent.setChid((byte) Integer.parseInt(this.client.chid));
                } catch (NumberFormatException unused2) {
                }
                StatsHandler.getInstance().add(createStatsEvent);
            }
        }
    }

    private void untrack() {
        this.client.removeClientStatusListener(this);
    }

    public void onChange(ClientStatus clientStatus, ClientStatus clientStatus2, int i) {
        if (!this.tracked && clientStatus == ClientStatus.binding) {
            this.status = clientStatus2;
            this.reason = i;
            this.tracked = true;
        }
        this.pushService.executeJob(new Job(4) {
            public String getDesc() {
                return "Handling bind stats";
            }

            public void process() {
                BindTracker.this.done();
            }
        });
    }

    /* access modifiers changed from: 0000 */
    public void track() {
        this.client.addClientStatusListener(this);
        this.connection = this.pushService.getCurrentConnection();
    }
}
