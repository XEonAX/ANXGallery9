package com.nexstreaming.nexeditorsdk.service;

public class NexInstalledAssetItem {
    public String assetName;
    public long assetVersion;
    public String categoryName;
    public long expireTime;
    public String id;
    public int index;
    public long installedTime;
    public long sdkLevel;
    public String thumbUrl;

    public NexInstalledAssetItem(int i, String str, String str2, String str3, String str4) {
        this.index = i;
        this.id = str;
        this.assetName = str2;
        this.categoryName = str3;
        this.thumbUrl = str4;
        this.installedTime = 0;
        this.expireTime = 0;
        this.sdkLevel = 2;
        this.assetVersion = 1;
    }

    public NexInstalledAssetItem(int i, String str, String str2, String str3, String str4, long j, long j2, int i2, int i3) {
        this.index = i;
        this.id = str;
        this.assetName = str2;
        this.categoryName = str3;
        this.thumbUrl = str4;
        this.installedTime = j;
        this.expireTime = j2;
        this.sdkLevel = (long) i2;
        this.assetVersion = (long) i3;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("nexAssetTransferData{index=");
        sb.append(this.index);
        sb.append(", id='");
        sb.append(this.id);
        sb.append('\'');
        sb.append(", assetName='");
        sb.append(this.assetName);
        sb.append('\'');
        sb.append(", categoryName='");
        sb.append(this.categoryName);
        sb.append('\'');
        sb.append(", thumbUrl='");
        sb.append(this.thumbUrl);
        sb.append('\'');
        sb.append('}');
        return sb.toString();
    }
}
