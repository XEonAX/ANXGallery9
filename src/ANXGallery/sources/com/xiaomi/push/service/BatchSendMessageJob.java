package com.xiaomi.push.service;

import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.XMPushService.Job;
import com.xiaomi.slim.Blob;
import com.xiaomi.smack.XMPPException;

class BatchSendMessageJob extends Job {
    private Blob[] mBlobs;
    private XMPushService pushService = null;

    public BatchSendMessageJob(XMPushService xMPushService, Blob[] blobArr) {
        super(4);
        this.pushService = xMPushService;
        this.mBlobs = blobArr;
    }

    public String getDesc() {
        return "batch send message.";
    }

    public void process() {
        try {
            if (this.mBlobs != null) {
                this.pushService.batchSendPacket(this.mBlobs);
            }
        } catch (XMPPException e) {
            MyLog.e((Throwable) e);
            this.pushService.disconnect(10, e);
        }
    }
}
