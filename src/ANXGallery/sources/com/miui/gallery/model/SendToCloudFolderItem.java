package com.miui.gallery.model;

import com.miui.gallery.cloud.baby.BabyInfo;

public class SendToCloudFolderItem {
    private BabyInfo babyInfo;
    private final int count;
    private String folderName;
    private final boolean isShareAlbum;
    private final String localGroupId;

    public SendToCloudFolderItem(int i, String str, boolean z) {
        this.count = i;
        this.localGroupId = str;
        this.isShareAlbum = z;
    }

    public SendToCloudFolderItem(int i, String str, boolean z, String str2, BabyInfo babyInfo2) {
        this(i, str, z);
        this.folderName = str2;
        this.babyInfo = babyInfo2;
    }

    public String getFolderName() {
        return this.folderName;
    }

    public String getLocalGroupId() {
        return this.localGroupId;
    }

    public boolean isShareAlbum() {
        return this.isShareAlbum;
    }
}
