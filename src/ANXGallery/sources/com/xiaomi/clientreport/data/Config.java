package com.xiaomi.clientreport.data;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.clientreport.util.ClientReportUtil;

public class Config {
    private String mAESKey;
    private boolean mEventEncrypted;
    private long mEventUploadFrequency;
    private boolean mEventUploadSwitchOpen;
    private long mMaxFileLength;
    private long mPerfUploadFrequency;
    private boolean mPerfUploadSwitchOpen;

    public static class Builder {
        /* access modifiers changed from: private */
        public String mAESKey = null;
        /* access modifiers changed from: private */
        public int mEventEncrypted = -1;
        /* access modifiers changed from: private */
        public long mEventUploadFrequency = -1;
        /* access modifiers changed from: private */
        public int mEventUploadSwitchOpen = -1;
        /* access modifiers changed from: private */
        public long mMaxFileLength = -1;
        /* access modifiers changed from: private */
        public long mPerfUploadFrequency = -1;
        /* access modifiers changed from: private */
        public int mPerfUploadSwitchOpen = -1;

        public Config build(Context context) {
            return new Config(context, this);
        }

        public Builder setAESKey(String str) {
            this.mAESKey = str;
            return this;
        }

        public Builder setEventEncrypted(boolean z) {
            this.mEventEncrypted = z ? 1 : 0;
            return this;
        }

        public Builder setEventUploadFrequency(long j) {
            this.mEventUploadFrequency = j;
            return this;
        }

        public Builder setEventUploadSwitchOpen(boolean z) {
            this.mEventUploadSwitchOpen = z ? 1 : 0;
            return this;
        }

        public Builder setMaxFileLength(long j) {
            this.mMaxFileLength = j;
            return this;
        }

        public Builder setPerfUploadFrequency(long j) {
            this.mPerfUploadFrequency = j;
            return this;
        }

        public Builder setPerfUploadSwitchOpen(boolean z) {
            this.mPerfUploadSwitchOpen = z ? 1 : 0;
            return this;
        }
    }

    private Config() {
        this.mEventEncrypted = true;
        this.mEventUploadSwitchOpen = false;
        this.mPerfUploadSwitchOpen = false;
        this.mMaxFileLength = 1048576;
        this.mEventUploadFrequency = 86400;
        this.mPerfUploadFrequency = 86400;
    }

    private Config(Context context, Builder builder) {
        this.mEventEncrypted = true;
        this.mEventUploadSwitchOpen = false;
        this.mPerfUploadSwitchOpen = false;
        this.mMaxFileLength = 1048576;
        this.mEventUploadFrequency = 86400;
        this.mPerfUploadFrequency = 86400;
        if (builder.mEventEncrypted == 0) {
            this.mEventEncrypted = false;
        } else if (builder.mEventEncrypted == 1) {
            this.mEventEncrypted = true;
        } else {
            this.mEventEncrypted = true;
        }
        if (!TextUtils.isEmpty(builder.mAESKey)) {
            this.mAESKey = builder.mAESKey;
        } else {
            this.mAESKey = ClientReportUtil.getEventKeyWithDefault(context);
        }
        if (builder.mMaxFileLength > -1) {
            this.mMaxFileLength = builder.mMaxFileLength;
        } else {
            this.mMaxFileLength = 1048576;
        }
        if (builder.mEventUploadFrequency > -1) {
            this.mEventUploadFrequency = builder.mEventUploadFrequency;
        } else {
            this.mEventUploadFrequency = 86400;
        }
        if (builder.mPerfUploadFrequency > -1) {
            this.mPerfUploadFrequency = builder.mPerfUploadFrequency;
        } else {
            this.mPerfUploadFrequency = 86400;
        }
        if (builder.mEventUploadSwitchOpen == 0) {
            this.mEventUploadSwitchOpen = false;
        } else if (builder.mEventUploadSwitchOpen == 1) {
            this.mEventUploadSwitchOpen = true;
        } else {
            this.mEventUploadSwitchOpen = false;
        }
        if (builder.mPerfUploadSwitchOpen == 0) {
            this.mPerfUploadSwitchOpen = false;
        } else if (builder.mPerfUploadSwitchOpen == 1) {
            this.mPerfUploadSwitchOpen = true;
        } else {
            this.mPerfUploadSwitchOpen = false;
        }
    }

    public static Config defaultConfig(Context context) {
        return getBuilder().setEventEncrypted(true).setAESKey(ClientReportUtil.getEventKeyWithDefault(context)).setMaxFileLength(1048576).setEventUploadSwitchOpen(false).setEventUploadFrequency(86400).setPerfUploadSwitchOpen(false).setPerfUploadFrequency(86400).build(context);
    }

    public static Builder getBuilder() {
        return new Builder();
    }

    public long getEventUploadFrequency() {
        return this.mEventUploadFrequency;
    }

    public long getMaxFileLength() {
        return this.mMaxFileLength;
    }

    public long getPerfUploadFrequency() {
        return this.mPerfUploadFrequency;
    }

    public boolean isEventEncrypted() {
        return this.mEventEncrypted;
    }

    public boolean isEventUploadSwitchOpen() {
        return this.mEventUploadSwitchOpen;
    }

    public boolean isPerfUploadSwitchOpen() {
        return this.mPerfUploadSwitchOpen;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Config{mEventEncrypted=");
        sb.append(this.mEventEncrypted);
        sb.append(", mAESKey='");
        sb.append(this.mAESKey);
        sb.append('\'');
        sb.append(", mMaxFileLength=");
        sb.append(this.mMaxFileLength);
        sb.append(", mEventUploadSwitchOpen=");
        sb.append(this.mEventUploadSwitchOpen);
        sb.append(", mPerfUploadSwitchOpen=");
        sb.append(this.mPerfUploadSwitchOpen);
        sb.append(", mEventUploadFrequency=");
        sb.append(this.mEventUploadFrequency);
        sb.append(", mPerfUploadFrequency=");
        sb.append(this.mPerfUploadFrequency);
        sb.append('}');
        return sb.toString();
    }
}
