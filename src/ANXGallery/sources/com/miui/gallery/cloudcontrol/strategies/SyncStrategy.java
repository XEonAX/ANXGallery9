package com.miui.gallery.cloudcontrol.strategies;

import com.google.gson.annotations.SerializedName;

public class SyncStrategy extends BaseStrategy {
    @SerializedName("auto_download")
    private boolean isAutoDownload = true;
    @SerializedName("auto-download-in-back-periodic")
    private boolean isAutoDownloadBackPeriodic = false;
    @SerializedName("auto-download-in-fore-periodic")
    private boolean isAutoDownloadForePeriodic = false;
    @SerializedName("auto-download-require-device-idle")
    private boolean isAutoDownloadRequireDeviceIdle = true;
    @SerializedName("auto_download_share")
    private boolean isAutoDownloadShare = false;
    @SerializedName("front_for_manual_download")
    private boolean isFrontForManualDownload = true;
    @SerializedName("guide-cloud-for-international-build")
    private boolean isGuideCloudInternational = false;
    @SerializedName("monitor_background")
    private boolean isMonitorBackground = true;
    @SerializedName("monitor_enable")
    private boolean isMonitorEnable = true;
    @SerializedName("monitor_sync_time")
    private boolean isMonitorSyncTime = false;
    @SerializedName("monitor_traffic")
    private boolean isMonitorTraffic = false;
    @SerializedName("support_backup_only_wifi")
    private boolean isSupportBackupOnlyWifi = true;
    @SerializedName("auto-download-num-in-foreground")
    private int mAutoDownloadNumInForeground = 500;
    @SerializedName("auto-download-owner-synced-image")
    private boolean mAutoDownloadOwnerSyncedImage = true;
    @SerializedName("auto-download-share-synced-image")
    private boolean mAutoDownloadShareSyncedImage = false;
    @SerializedName("auto-download-space-limit")
    private float mAutoDownloadSpaceLimit = 0.2f;
    @SerializedName("download_type")
    private int mAutoDownloadType = 0;
    @SerializedName("delay-upload-time")
    private long mDelayUploadTime = 0;
    @SerializedName("interval_for_active_pull")
    private long mIntervalForActivePull = 10800000;
    @SerializedName("max-download-times-when-timeout")
    private int mMaxDownloadTimes = 1;
    @SerializedName("max-capacity-temp-operation-server-tag")
    private int mMaxTempOperationServerTagCapacity = 30;
    @SerializedName("monitor_background_buffer_time")
    private long mMonitorBackBufferTime = 15000;
    @SerializedName("monitor_background_upper_time")
    private long mMonitorBackUpperTime = 120000;
    @SerializedName("monitor_check_interval")
    private long mMonitorCheckInterval = 0;
    @SerializedName("monitor_sync_upper_time")
    private long mMonitorSyncUpperTime = 1800000;
    @SerializedName("monitor_traffic_step")
    private long mMonitorTrafficStep = 104857600;
    @SerializedName("only-charging-acquire-wakelock")
    private boolean mOnlyChargingAcquireWakelock = true;
    @SerializedName("only-screen-off-acquire-wakelock")
    private boolean mOnlyScreenOffAcquireWakelock = true;
    @SerializedName("total-owner-save-thumbnail-count-limit")
    private int mTotalOwnerSaveThumbnailCountLimit = 10000;
    @SerializedName("total-sharer-save-thumbnail-count-limit")
    private int mTotalSharerSaveThumbnailCountLimit = 0;

    public static SyncStrategy createDefault() {
        return new SyncStrategy();
    }

    public float getAutoDownloadSpaceLimit() {
        return this.mAutoDownloadSpaceLimit;
    }

    public int getAutoDownloadType() {
        return this.mAutoDownloadType;
    }

    public long getDelayUploadTime() {
        return this.mDelayUploadTime;
    }

    public long getIntervalForActivePull() {
        return this.mIntervalForActivePull;
    }

    public int getMaxDownloadTimes() {
        return this.mMaxDownloadTimes;
    }

    public int getMaxTempOperationServerTagCapacity() {
        return this.mMaxTempOperationServerTagCapacity;
    }

    public long getMonitorBackBufferTime() {
        return this.mMonitorBackBufferTime;
    }

    public long getMonitorBackUpperTime() {
        return this.mMonitorBackUpperTime;
    }

    public long getMonitorCheckInterval() {
        return this.mMonitorCheckInterval;
    }

    public long getMonitorSyncUpperTime() {
        return this.mMonitorSyncUpperTime;
    }

    public long getMonitorTrafficStep() {
        return this.mMonitorTrafficStep;
    }

    public boolean isAutoDownload() {
        return this.isAutoDownload;
    }

    @Deprecated
    public boolean isAutoDownloadRequireDeviceIdle() {
        return this.isAutoDownloadRequireDeviceIdle;
    }

    public boolean isAutoDownloadShare() {
        return this.isAutoDownloadShare;
    }

    public boolean isFrontForManualDownload() {
        return this.isFrontForManualDownload;
    }

    public boolean isGuideCloudInternational() {
        return this.isGuideCloudInternational;
    }

    public boolean isMonitorBackground() {
        return this.isMonitorBackground;
    }

    public boolean isMonitorEnable() {
        return this.isMonitorEnable;
    }

    public boolean isMonitorSyncTime() {
        return this.isMonitorSyncTime;
    }

    public boolean isMonitorTraffic() {
        return this.isMonitorTraffic;
    }

    public boolean isOnlyChargingAcquireWakelock() {
        return this.mOnlyChargingAcquireWakelock;
    }

    public boolean isOnlyScreenOffAcquireWakelock() {
        return this.mOnlyScreenOffAcquireWakelock;
    }

    public boolean isSupportBackupOnlyWifi() {
        return this.isSupportBackupOnlyWifi;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("SyncStrategy{mTotalOwnerSaveThumbnailCountLimit=");
        sb.append(this.mTotalOwnerSaveThumbnailCountLimit);
        sb.append(", mTotalSharerSaveThumbnailCountLimit=");
        sb.append(this.mTotalSharerSaveThumbnailCountLimit);
        sb.append(", mDelayUploadTime=");
        sb.append(this.mDelayUploadTime);
        sb.append(", mOnlyScreenOffAcquireWakelock=");
        sb.append(this.mOnlyScreenOffAcquireWakelock);
        sb.append(", mOnlyChargingAcquireWakelock=");
        sb.append(this.mOnlyChargingAcquireWakelock);
        sb.append(", mMaxTempOperationServerTagCapacity=");
        sb.append(this.mMaxTempOperationServerTagCapacity);
        sb.append(", mAutoDownloadSpaceLimit=");
        sb.append(this.mAutoDownloadSpaceLimit);
        sb.append(", mAutoDownloadNumInForeground=");
        sb.append(this.mAutoDownloadNumInForeground);
        sb.append(", mAutoDownloadOwnerSyncedImage=");
        sb.append(this.mAutoDownloadOwnerSyncedImage);
        sb.append(", mAutoDownloadShareSyncedImage=");
        sb.append(this.mAutoDownloadShareSyncedImage);
        sb.append(", isAutoDownloadBackPeriodic=");
        sb.append(this.isAutoDownloadBackPeriodic);
        sb.append(", isAutoDownloadForePeriodic=");
        sb.append(this.isAutoDownloadForePeriodic);
        sb.append(", isAutoDownloadRequireDeviceIdle=");
        sb.append(this.isAutoDownloadRequireDeviceIdle);
        sb.append(", isGuideCloudInternational=");
        sb.append(this.isGuideCloudInternational);
        sb.append(", isAutoDownload=");
        sb.append(this.isAutoDownload);
        sb.append(", mAutoDownloadType=");
        sb.append(this.mAutoDownloadType);
        sb.append(", isAutoDownloadShare=");
        sb.append(this.isAutoDownloadShare);
        sb.append(", isSupportBackupOnlyWifi=");
        sb.append(this.isSupportBackupOnlyWifi);
        sb.append(", isMonitorEnable=");
        sb.append(this.isMonitorEnable);
        sb.append(", mMonitorCheckInterval=");
        sb.append(this.mMonitorCheckInterval);
        sb.append(", isMonitorBackground=");
        sb.append(this.isMonitorBackground);
        sb.append(", mMonitorBackBufferTime=");
        sb.append(this.mMonitorBackBufferTime);
        sb.append(", mMonitorBackUpperTime=");
        sb.append(this.mMonitorBackUpperTime);
        sb.append(", isMonitorTraffic=");
        sb.append(this.isMonitorTraffic);
        sb.append(", mMonitorTrafficStep=");
        sb.append(this.mMonitorTrafficStep);
        sb.append(", isMonitorSyncTime=");
        sb.append(this.isMonitorSyncTime);
        sb.append(", mMonitorSyncUpperTime=");
        sb.append(this.mMonitorSyncUpperTime);
        sb.append(", isFrontForManualDownload=");
        sb.append(this.isFrontForManualDownload);
        sb.append(", mIntervalForActivePull=");
        sb.append(this.mIntervalForActivePull);
        sb.append('}');
        return sb.toString();
    }
}
