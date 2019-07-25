package com.miui.gallery.model;

public class DiscoveryMessage {
    private boolean isConsumed;
    private String mActionUri;
    private long mExpireTime;
    private String mMessage;
    private BaseMessageDetail mMessageDetail;
    private long mMessageId;
    private String mMessageSource;
    private int mPriority;
    private long mReceiveTime;
    private String mSubTitle;
    private String mTitle;
    private long mTriggerTime;
    private int mType;
    private long mUpdateTime;

    public static abstract class BaseMessageDetail {
        public abstract String toJson();
    }

    public static class Builder {
        /* access modifiers changed from: private */
        public String actionUri = "";
        /* access modifiers changed from: private */
        public long expireTime = 0;
        /* access modifiers changed from: private */
        public boolean isConsumed = false;
        /* access modifiers changed from: private */
        public String message = "";
        /* access modifiers changed from: private */
        public BaseMessageDetail messageDetail = null;
        /* access modifiers changed from: private */
        public long messageId = -1;
        /* access modifiers changed from: private */
        public String messageSource = "";
        /* access modifiers changed from: private */
        public int priority = 5;
        /* access modifiers changed from: private */
        public long receiveTime = 0;
        /* access modifiers changed from: private */
        public String subTitle = "";
        /* access modifiers changed from: private */
        public String title = "";
        /* access modifiers changed from: private */
        public long triggerTime = 0;
        /* access modifiers changed from: private */
        public int type = 1;
        /* access modifiers changed from: private */
        public long updateTime = 0;

        public Builder actionUri(String str) {
            this.actionUri = str;
            return this;
        }

        public DiscoveryMessage build() {
            return new DiscoveryMessage(this);
        }

        public Builder consumed(boolean z) {
            this.isConsumed = z;
            return this;
        }

        public Builder expireTime(long j) {
            this.expireTime = j;
            return this;
        }

        public Builder message(String str) {
            this.message = str;
            return this;
        }

        public Builder messageId(long j) {
            this.messageId = j;
            return this;
        }

        public Builder messageSource(String str) {
            this.messageSource = str;
            return this;
        }

        public Builder priority(int i) {
            this.priority = i;
            return this;
        }

        public Builder receiveTime(long j) {
            this.receiveTime = j;
            return this;
        }

        public Builder subTitle(String str) {
            this.subTitle = str;
            return this;
        }

        public Builder title(String str) {
            this.title = str;
            return this;
        }

        public Builder triggerTime(long j) {
            this.triggerTime = j;
            return this;
        }

        public Builder type(int i) {
            this.type = i;
            return this;
        }

        public Builder updateTime(long j) {
            this.updateTime = j;
            return this;
        }
    }

    public DiscoveryMessage() {
    }

    private DiscoveryMessage(Builder builder) {
        long currentTimeMillis = System.currentTimeMillis();
        this.mMessageId = builder.messageId;
        this.mMessage = builder.message;
        this.mTitle = builder.title;
        this.mSubTitle = builder.subTitle;
        this.mType = builder.type;
        this.mPriority = builder.priority;
        if (builder.receiveTime != 0) {
            this.mReceiveTime = builder.receiveTime;
        } else {
            this.mReceiveTime = currentTimeMillis;
        }
        if (builder.updateTime != 0) {
            this.mUpdateTime = builder.updateTime;
        } else {
            this.mUpdateTime = currentTimeMillis;
        }
        if (builder.updateTime != 0) {
            this.mTriggerTime = builder.triggerTime;
        } else {
            this.mTriggerTime = currentTimeMillis;
        }
        if (builder.updateTime != 0) {
            this.mExpireTime = builder.expireTime;
        } else {
            this.mExpireTime = currentTimeMillis;
        }
        this.isConsumed = builder.isConsumed;
        this.mActionUri = builder.actionUri;
        this.mMessageSource = builder.messageSource;
        this.mMessageDetail = builder.messageDetail;
    }

    public String getActionUri() {
        return this.mActionUri;
    }

    public long getExpireTime() {
        return this.mExpireTime;
    }

    public String getMessage() {
        return this.mMessage;
    }

    public BaseMessageDetail getMessageDetail() {
        return this.mMessageDetail;
    }

    public long getMessageId() {
        return this.mMessageId;
    }

    public String getMessageSource() {
        return this.mMessageSource;
    }

    public int getPriority() {
        return this.mPriority;
    }

    public long getReceiveTime() {
        return this.mReceiveTime;
    }

    public String getSubTitle() {
        return this.mSubTitle;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public long getTriggerTime() {
        return this.mTriggerTime;
    }

    public int getType() {
        return this.mType;
    }

    public long getUpdateTime() {
        return this.mUpdateTime;
    }

    public boolean isConsumed() {
        return this.isConsumed;
    }

    public void setConsumed(boolean z) {
        this.isConsumed = z;
    }

    public void setMessage(String str) {
        this.mMessage = str;
    }

    public void setMessageDetail(BaseMessageDetail baseMessageDetail) {
        this.mMessageDetail = baseMessageDetail;
    }
}
