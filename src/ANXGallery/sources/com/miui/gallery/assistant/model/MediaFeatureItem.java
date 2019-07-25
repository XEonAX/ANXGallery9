package com.miui.gallery.assistant.model;

import android.database.Cursor;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.List;

public class MediaFeatureItem implements ImageFeatureItem, Comparable<MediaFeatureItem> {
    public static final String[] MEDIA_PROJECTION = {"_id", "sha1", "microthumbfile", "thumbnailFile", "localFile", "alias_create_time", "localFlag", "serverId"};
    public static final String[] PROJECTION = {"_id", "sha1", "microthumbfile", "thumbnailFile", "localFile", "mixedDateTime", "localFlag", "serverId"};
    private long mDateTime;
    private long mId;
    private transient ImageFeature mImageFeature;
    private int mLocalFlag;
    private String mMicroThumbnailPath;
    private String mOriginPath;
    private long mServerId;
    private String mSha1;
    private String mThumbnailPath;

    public MediaFeatureItem(Cursor cursor) {
        if (cursor != null) {
            this.mId = cursor.getLong(0);
            this.mSha1 = cursor.getString(1);
            this.mMicroThumbnailPath = cursor.getString(2);
            this.mThumbnailPath = cursor.getString(3);
            this.mOriginPath = cursor.getString(4);
            this.mDateTime = cursor.getLong(5);
            this.mLocalFlag = cursor.getInt(6);
            this.mServerId = cursor.getLong(7);
        }
    }

    public static List<MediaFeatureItem> getMediaFeatureItemsFromCursor(Cursor cursor) {
        ArrayList arrayList = new ArrayList();
        if (cursor == null || !cursor.moveToFirst()) {
            return arrayList;
        }
        do {
            arrayList.add(new MediaFeatureItem(cursor));
        } while (cursor.moveToNext());
        return arrayList;
    }

    public int compareTo(MediaFeatureItem mediaFeatureItem) {
        if (this.mImageFeature == null || mediaFeatureItem.mImageFeature == null) {
            return 0;
        }
        return Double.compare(mediaFeatureItem.mImageFeature.getScore(), this.mImageFeature.getScore());
    }

    public long getDateTime() {
        return this.mDateTime;
    }

    public long getId() {
        return this.mId;
    }

    public ImageFeature getImageFeature() {
        return this.mImageFeature;
    }

    public String getImagePath() {
        return TextUtils.isEmpty(getOriginPath()) ? TextUtils.isEmpty(getThumbnailPath()) ? getMicroThumbnailPath() : getThumbnailPath() : getOriginPath();
    }

    public int getLocalFlag() {
        return this.mLocalFlag;
    }

    public long getMediaId() {
        return this.mId;
    }

    public String getMediaSha1() {
        return this.mSha1;
    }

    public String getMicroThumbnailPath() {
        return this.mMicroThumbnailPath;
    }

    public String getOriginPath() {
        return this.mOriginPath;
    }

    public long getServerId() {
        return this.mServerId;
    }

    public String getSha1() {
        return this.mSha1;
    }

    public String getThumbnailPath() {
        return this.mThumbnailPath;
    }

    public boolean isSelectionFeatureDone() {
        return this.mImageFeature != null && this.mImageFeature.isSelectionFeatureDone();
    }

    public void setImageFeature(ImageFeature imageFeature) {
        this.mImageFeature = imageFeature;
    }

    public void setMicroThumbnailPath(String str) {
        this.mMicroThumbnailPath = str;
    }

    public void setOriginPath(String str) {
        this.mOriginPath = str;
    }

    public void setThumbnailPath(String str) {
        this.mThumbnailPath = str;
    }
}
