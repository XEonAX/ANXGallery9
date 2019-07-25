package com.xiaomi.push.service;

import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager.Job;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.lang.ref.WeakReference;

public class AwakeAppPingJob extends Job {
    private boolean mIsCache = false;
    private WeakReference<XMPushService> mXMPushServiceWR;
    private XmPushActionNotification mXmPushActionNotification;

    public AwakeAppPingJob(XmPushActionNotification xmPushActionNotification, WeakReference<XMPushService> weakReference, boolean z) {
        this.mXmPushActionNotification = xmPushActionNotification;
        this.mXMPushServiceWR = weakReference;
        this.mIsCache = z;
    }

    public int getJobId() {
        return 22;
    }

    public void run() {
        if (this.mXMPushServiceWR != null && this.mXmPushActionNotification != null) {
            XMPushService xMPushService = (XMPushService) this.mXMPushServiceWR.get();
            if (xMPushService != null) {
                this.mXmPushActionNotification.setId(PacketHelper.generatePacketID());
                this.mXmPushActionNotification.setRequireAck(false);
                StringBuilder sb = new StringBuilder();
                sb.append("MoleInfo aw_ping : send aw_Ping msg ");
                sb.append(this.mXmPushActionNotification.getId());
                MyLog.v(sb.toString());
                try {
                    String packageName = this.mXmPushActionNotification.getPackageName();
                    xMPushService.sendMessage(packageName, XmPushThriftSerializeUtils.convertThriftObjectToBytes(MIPushHelper.generateRequestContainer(packageName, this.mXmPushActionNotification.getAppId(), this.mXmPushActionNotification, ActionType.Notification)), this.mIsCache);
                } catch (Exception e) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("MoleInfo aw_ping : send help app ping error");
                    sb2.append(e.toString());
                    MyLog.e(sb2.toString());
                }
            }
        }
    }
}
