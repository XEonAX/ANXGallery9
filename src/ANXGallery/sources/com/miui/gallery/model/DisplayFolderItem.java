package com.miui.gallery.model;

public class DisplayFolderItem {
    public int count;
    public String coverImagePath;
    public String imageJob;
    public boolean isNewlyCreate;
    public String localGroupId;
    public String name;
    public String thumbnailPath;

    public DisplayFolderItem(String str, String str2, int i, String str3, String str4) {
        this.name = str;
        this.imageJob = str2;
        this.count = i;
        this.localGroupId = str3;
        this.coverImagePath = str4;
        this.isNewlyCreate = false;
    }

    public DisplayFolderItem(String str, String str2, String str3) {
        this.name = str;
        this.thumbnailPath = str2;
        this.localGroupId = str3;
    }
}
