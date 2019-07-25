package com.xiaomi.mipush.sdk;

import com.xiaomi.push.service.module.PushChannelRegion;

public class PushConfiguration {
    private boolean mOpenCOSPush = false;
    private boolean mOpenFCMPush = false;
    private boolean mOpenFTOSPush = false;
    private boolean mOpenHmsPush = false;
    private PushChannelRegion mRegion = PushChannelRegion.China;

    public boolean getOpenCOSPush() {
        return this.mOpenCOSPush;
    }

    public boolean getOpenFCMPush() {
        return this.mOpenFCMPush;
    }

    public boolean getOpenFTOSPush() {
        return this.mOpenFTOSPush;
    }

    public boolean getOpenHmsPush() {
        return this.mOpenHmsPush;
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer("PushConfiguration{");
        stringBuffer.append("Region:");
        if (this.mRegion == null) {
            stringBuffer.append("null");
        } else {
            stringBuffer.append(this.mRegion.name());
        }
        StringBuilder sb = new StringBuilder();
        sb.append(",mOpenHmsPush:");
        sb.append(this.mOpenHmsPush);
        stringBuffer.append(sb.toString());
        StringBuilder sb2 = new StringBuilder();
        sb2.append(",mOpenFCMPush:");
        sb2.append(this.mOpenFCMPush);
        stringBuffer.append(sb2.toString());
        StringBuilder sb3 = new StringBuilder();
        sb3.append(",mOpenCOSPush:");
        sb3.append(this.mOpenCOSPush);
        stringBuffer.append(sb3.toString());
        StringBuilder sb4 = new StringBuilder();
        sb4.append(",mOpenFTOSPush:");
        sb4.append(this.mOpenFTOSPush);
        stringBuffer.append(sb4.toString());
        stringBuffer.append('}');
        return stringBuffer.toString();
    }
}
