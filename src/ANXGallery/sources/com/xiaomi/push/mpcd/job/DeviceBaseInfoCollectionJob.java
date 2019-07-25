package com.xiaomi.push.mpcd.job;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.android.MIUIUtils;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import com.xiaomi.xmpush.thrift.ClientCollectionType;

public class DeviceBaseInfoCollectionJob extends CollectionJob {
    private boolean androidDeviceIdSwitch;
    private boolean iccidSwitch;
    private boolean imsiSwitch;
    private boolean macSwitch;

    public DeviceBaseInfoCollectionJob(Context context, int i, boolean z, boolean z2, boolean z3, boolean z4) {
        super(context, i);
        this.macSwitch = z;
        this.imsiSwitch = z2;
        if (MIUIUtils.isGlobalRegion()) {
            this.imsiSwitch = false;
        }
        this.iccidSwitch = z3;
        this.androidDeviceIdSwitch = z4;
    }

    private String getDeviceIdMd5Sha1(Context context) {
        return !this.androidDeviceIdSwitch ? "off" : "";
    }

    private String getIccidInfo() {
        return !this.iccidSwitch ? "off" : "";
    }

    private String getImsiInfo() {
        return !this.imsiSwitch ? "off" : "";
    }

    private String getMacInfo() {
        String str;
        if (!this.macSwitch) {
            return "off";
        }
        try {
            String wifiMacAddress = getWifiMacAddress();
            if (TextUtils.isEmpty(wifiMacAddress)) {
                str = "";
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append(XMStringUtils.getMd5Digest(wifiMacAddress));
                sb.append(",");
                sb.append(XMStringUtils.getSHA1Digest(wifiMacAddress));
                str = sb.toString();
            }
            return str;
        } catch (Throwable unused) {
            return "";
        }
    }

    private String getWifiMacAddress() {
        return "";
    }

    public String collectInfo() {
        StringBuilder sb = new StringBuilder();
        sb.append(getMacInfo());
        sb.append("|");
        sb.append(getImsiInfo());
        sb.append("|");
        sb.append(getIccidInfo());
        sb.append("|");
        sb.append(getDeviceIdMd5Sha1(this.context));
        return sb.toString();
    }

    public ClientCollectionType getCollectionType() {
        return ClientCollectionType.DeviceBaseInfo;
    }

    public int getJobId() {
        return 13;
    }
}
