package com.miui.gallery.share;

public class CloudUserCacheEntry {
    public final String mAlbumId;
    public final long mCreateTime;
    public final String mPhone;
    public final String mRelation;
    public final String mRelationText;
    public final String mServerStatus;
    public final String mUserId;

    public CloudUserCacheEntry(String str, String str2, long j, String str3, String str4, String str5, String str6) {
        this.mAlbumId = str;
        this.mUserId = str2;
        this.mCreateTime = j;
        this.mRelation = str3;
        this.mRelationText = str4;
        this.mServerStatus = str5;
        this.mPhone = str6;
    }
}
