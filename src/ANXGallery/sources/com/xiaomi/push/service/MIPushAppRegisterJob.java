package com.xiaomi.push.service;

import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.PushClientsManager.ClientLoginInfo;
import com.xiaomi.push.service.PushClientsManager.ClientStatus;
import com.xiaomi.push.service.XMPushService.Job;
import com.xiaomi.smack.XMPPException;
import java.io.IOException;
import java.util.Collection;
import org.json.JSONException;

public class MIPushAppRegisterJob extends Job {
    private String appId;
    private String appToken;
    private String packageName;
    private byte[] payload;
    private XMPushService pushService;

    public MIPushAppRegisterJob(XMPushService xMPushService, String str, String str2, String str3, byte[] bArr) {
        super(9);
        this.pushService = xMPushService;
        this.packageName = str;
        this.payload = bArr;
        this.appId = str2;
        this.appToken = str3;
    }

    public String getDesc() {
        return "register app";
    }

    public void process() {
        ClientLoginInfo clientLoginInfo;
        MIPushAccount mIPushAccount = MIPushAccountUtils.getMIPushAccount(this.pushService);
        if (mIPushAccount == null) {
            try {
                mIPushAccount = MIPushAccountUtils.register(this.pushService, this.packageName, this.appId, this.appToken);
            } catch (IOException e) {
                MyLog.e((Throwable) e);
            } catch (JSONException e2) {
                MyLog.e((Throwable) e2);
            }
        }
        if (mIPushAccount == null) {
            MyLog.e("no account for mipush");
            MIPushClientManager.notifyRegisterError(this.pushService, 70000002, "no account.");
            return;
        }
        Collection allClientLoginInfoByChid = PushClientsManager.getInstance().getAllClientLoginInfoByChid("5");
        if (allClientLoginInfoByChid.isEmpty()) {
            clientLoginInfo = mIPushAccount.toClientLoginInfo(this.pushService);
            MIPushHelper.prepareClientLoginInfo(this.pushService, clientLoginInfo);
            PushClientsManager.getInstance().addActiveClient(clientLoginInfo);
        } else {
            clientLoginInfo = (ClientLoginInfo) allClientLoginInfoByChid.iterator().next();
        }
        if (this.pushService.isConnected()) {
            try {
                if (clientLoginInfo.status == ClientStatus.binded) {
                    MIPushHelper.sendPacket(this.pushService, this.packageName, this.payload);
                } else if (clientLoginInfo.status == ClientStatus.unbind) {
                    XMPushService xMPushService = this.pushService;
                    XMPushService xMPushService2 = this.pushService;
                    xMPushService2.getClass();
                    xMPushService.executeJob(new BindJob(clientLoginInfo));
                }
            } catch (XMPPException e3) {
                MyLog.e((Throwable) e3);
                this.pushService.disconnect(10, e3);
            }
        } else {
            this.pushService.scheduleConnect(true);
        }
    }
}
