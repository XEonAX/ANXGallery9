package com.miui.gallery.sdk.download;

import com.miui.gallery.sdk.download.adapter.IUriAdapter;

public class DownloadOptions {
    /* access modifiers changed from: private */
    public final boolean mInterruptExecuting;
    /* access modifiers changed from: private */
    public final boolean mManual;
    /* access modifiers changed from: private */
    public final boolean mQueueFirst;
    /* access modifiers changed from: private */
    public final boolean mRequireCharging;
    /* access modifiers changed from: private */
    public final boolean mRequireDeviceStorage;
    /* access modifiers changed from: private */
    public final boolean mRequirePower;
    /* access modifiers changed from: private */
    public final boolean mRequireWLAN;
    /* access modifiers changed from: private */
    public final IUriAdapter mUriAdapter;

    public static class Builder {
        /* access modifiers changed from: private */
        public boolean mInterruptExecuting;
        /* access modifiers changed from: private */
        public boolean mManual;
        /* access modifiers changed from: private */
        public boolean mQueueFirst;
        /* access modifiers changed from: private */
        public boolean mRequireCharging;
        /* access modifiers changed from: private */
        public boolean mRequireDeviceStorage;
        /* access modifiers changed from: private */
        public boolean mRequirePower;
        /* access modifiers changed from: private */
        public boolean mRequireWLAN;
        /* access modifiers changed from: private */
        public IUriAdapter mUriAdapter;

        public DownloadOptions build() {
            return new DownloadOptions(this);
        }

        public Builder cloneFrom(DownloadOptions downloadOptions) {
            this.mUriAdapter = downloadOptions.mUriAdapter;
            this.mQueueFirst = downloadOptions.mQueueFirst;
            this.mInterruptExecuting = downloadOptions.mInterruptExecuting;
            this.mRequireWLAN = downloadOptions.mRequireWLAN;
            this.mRequirePower = downloadOptions.mRequirePower;
            this.mRequireCharging = downloadOptions.mRequireCharging;
            this.mRequireDeviceStorage = downloadOptions.mRequireDeviceStorage;
            this.mManual = downloadOptions.mManual;
            return this;
        }

        public Builder setInterruptExecuting(boolean z) {
            this.mInterruptExecuting = z;
            return this;
        }

        public Builder setManual(boolean z) {
            this.mManual = z;
            return this;
        }

        public Builder setQueueFirst(boolean z) {
            this.mQueueFirst = z;
            return this;
        }

        public Builder setRequireCharging(boolean z) {
            this.mRequireCharging = z;
            return this;
        }

        public Builder setRequireDeviceStorage(boolean z) {
            this.mRequireDeviceStorage = z;
            return this;
        }

        public Builder setRequirePower(boolean z) {
            this.mRequirePower = z;
            return this;
        }

        public Builder setRequireWLAN(boolean z) {
            this.mRequireWLAN = z;
            return this;
        }

        public Builder setUriAdapter(IUriAdapter iUriAdapter) {
            this.mUriAdapter = iUriAdapter;
            return this;
        }
    }

    private DownloadOptions(Builder builder) {
        this.mUriAdapter = builder.mUriAdapter;
        this.mQueueFirst = builder.mQueueFirst;
        this.mInterruptExecuting = builder.mInterruptExecuting;
        this.mRequireWLAN = builder.mRequireWLAN;
        this.mRequirePower = builder.mRequirePower;
        this.mRequireCharging = builder.mRequireCharging;
        this.mRequireDeviceStorage = builder.mRequireDeviceStorage;
        this.mManual = builder.mManual;
    }

    public IUriAdapter getUriAdapter() {
        return this.mUriAdapter;
    }

    public boolean isInterruptExecuting() {
        return this.mInterruptExecuting;
    }

    public boolean isManual() {
        return this.mManual;
    }

    public boolean isQueueFirst() {
        return this.mQueueFirst;
    }

    public boolean isRequireCharging() {
        return this.mRequireCharging;
    }

    public boolean isRequireDeviceStorage() {
        return this.mRequireDeviceStorage;
    }

    public boolean isRequirePower() {
        return this.mRequirePower;
    }

    public boolean isRequireWLAN() {
        return this.mRequireWLAN;
    }
}
