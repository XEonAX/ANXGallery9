package com.xiaomi.push.service;

import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.XMPushService.Job;
import com.xiaomi.slim.Blob;
import com.xiaomi.smack.XMPPException;

class SendMessageJob extends Job {
    private Blob mBlob;
    private XMPushService pushService = null;

    public SendMessageJob(XMPushService xMPushService, Blob blob) {
        super(4);
        this.pushService = xMPushService;
        this.mBlob = blob;
    }

    public String getDesc() {
        return "send a message.";
    }

    public void process() {
        try {
            if (this.mBlob != null) {
                this.pushService.sendPacket(this.mBlob);
            }
        } catch (XMPPException e) {
            MyLog.e((Throwable) e);
            this.pushService.disconnect(10, e);
        }
    }
}
