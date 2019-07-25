package com.miui.gallery.cloud.base;

public class SyncRequest {
    private boolean mIsDelayUpload;
    private boolean mIsManual;
    private long mSyncReason;
    private SyncType mSyncType;

    public static class Builder {
        /* access modifiers changed from: private */
        public boolean mIsDelayUpload;
        /* access modifiers changed from: private */
        public boolean mIsManual;
        /* access modifiers changed from: private */
        public long mSyncReason;
        /* access modifiers changed from: private */
        public SyncType mSyncType;

        public SyncRequest build() {
            return new SyncRequest(this);
        }

        public Builder cloneFrom(SyncRequest syncRequest) {
            this.mSyncType = syncRequest.getSyncType();
            this.mSyncReason = syncRequest.getSyncReason();
            this.mIsDelayUpload = syncRequest.isDelayUpload();
            this.mIsManual = syncRequest.isManual();
            return this;
        }

        public Builder setDelayUpload(boolean z) {
            this.mIsDelayUpload = z;
            return this;
        }

        public Builder setManual(boolean z) {
            this.mIsManual = z;
            return this;
        }

        public Builder setSyncReason(long j) {
            this.mSyncReason = j;
            return this;
        }

        public Builder setSyncType(SyncType syncType) {
            this.mSyncType = syncType;
            return this;
        }
    }

    private SyncRequest(Builder builder) {
        this.mSyncType = SyncType.NORMAL;
        this.mSyncReason = Long.MAX_VALUE;
        this.mIsDelayUpload = false;
        this.mSyncType = builder.mSyncType;
        this.mSyncReason = builder.mSyncReason;
        this.mIsDelayUpload = builder.mIsDelayUpload;
        this.mIsManual = builder.mIsManual;
    }

    public long getSyncReason() {
        return this.mSyncReason;
    }

    public SyncType getSyncType() {
        return this.mSyncType;
    }

    public boolean isDelayUpload() {
        return this.mIsDelayUpload;
    }

    public boolean isManual() {
        return this.mIsManual;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Request {syncType=");
        sb.append(this.mSyncType);
        sb.append(", reason=");
        sb.append(this.mSyncReason);
        sb.append(", delayUpload=");
        sb.append(this.mIsDelayUpload);
        sb.append(", manual=");
        sb.append(this.mIsManual);
        sb.append("}");
        return sb.toString();
    }
}
