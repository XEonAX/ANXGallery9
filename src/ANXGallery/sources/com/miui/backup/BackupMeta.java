package com.miui.backup;

public class BackupMeta {
    public static final int META_VERSION = 1;
    public int appVersionCode;
    public String appVersionName;
    public long createTime;
    public String deviceName;
    public int feature;
    public int metaVersion = 1;
    public String miuiVersion;
    public String packageName;
    public int version;

    public int getAppVersionCode() {
        return this.appVersionCode;
    }

    public String getAppVersionName() {
        return this.appVersionName;
    }

    public long getCreateTime() {
        return this.createTime;
    }

    public String getDeviceName() {
        return this.deviceName;
    }

    public int getFeature() {
        return this.feature;
    }

    public int getMetaVersion() {
        return 1;
    }

    public String getMiuiVersion() {
        return this.miuiVersion;
    }

    public String getPackageName() {
        return this.packageName;
    }

    public int getVersion() {
        return this.version;
    }
}
