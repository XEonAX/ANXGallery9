package com.miui.gallery.people.model;

import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.gallery.sdk.download.DownloadType;

public class People implements Parcelable {
    public static final Creator<People> CREATOR = new Creator<People>() {
        public People createFromParcel(Parcel parcel) {
            People people = new People();
            people.readFromParcel(parcel);
            return people;
        }

        public People[] newArray(int i) {
            return new People[i];
        }
    };
    private RectF mCoverFaceRect;
    private long mCoverImageId;
    private String mCoverPath;
    private DownloadType mCoverType;
    private int mFaceCount;
    private long mId;
    private String mName;
    private String mRelationText;
    private int mRelationType;
    private String mServerId;
    private int mVisibilityType;

    public int describeContents() {
        return 0;
    }

    public RectF getCoverFaceRect() {
        return this.mCoverFaceRect;
    }

    public long getCoverImageId() {
        return this.mCoverImageId;
    }

    public String getCoverPath() {
        return this.mCoverPath;
    }

    public DownloadType getCoverType() {
        return this.mCoverType;
    }

    public int getFaceCount() {
        return this.mFaceCount;
    }

    public long getId() {
        return this.mId;
    }

    public String getName() {
        return this.mName;
    }

    public int getRelationType() {
        return this.mRelationType;
    }

    public void readFromParcel(Parcel parcel) {
        this.mId = parcel.readLong();
        this.mServerId = parcel.readString();
        this.mName = parcel.readString();
        this.mRelationType = parcel.readInt();
        this.mRelationText = parcel.readString();
        this.mCoverImageId = parcel.readLong();
        this.mCoverPath = parcel.readString();
        this.mCoverType = (DownloadType) parcel.readParcelable(DownloadType.class.getClassLoader());
        this.mCoverFaceRect = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
        this.mFaceCount = parcel.readInt();
        this.mVisibilityType = parcel.readInt();
    }

    public void setCoverFaceRect(RectF rectF) {
        this.mCoverFaceRect = rectF;
    }

    public void setCoverImageId(long j) {
        this.mCoverImageId = j;
    }

    public void setCoverPath(String str) {
        this.mCoverPath = str;
    }

    public void setCoverType(DownloadType downloadType) {
        this.mCoverType = downloadType;
    }

    public void setFaceCount(int i) {
        this.mFaceCount = i;
    }

    public void setId(long j) {
        this.mId = j;
    }

    public void setName(String str) {
        this.mName = str;
    }

    public void setRelationText(String str) {
        this.mRelationText = str;
    }

    public void setRelationType(int i) {
        this.mRelationType = i;
    }

    public void setServerId(String str) {
        this.mServerId = str;
    }

    public void setVisibilityType(int i) {
        this.mVisibilityType = i;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeLong(this.mId);
        parcel.writeString(this.mServerId);
        parcel.writeString(this.mName);
        parcel.writeInt(this.mRelationType);
        parcel.writeString(this.mRelationText);
        parcel.writeLong(this.mCoverImageId);
        parcel.writeString(this.mCoverPath);
        parcel.writeParcelable(this.mCoverType, i);
        parcel.writeParcelable(this.mCoverFaceRect, i);
        parcel.writeInt(this.mFaceCount);
        parcel.writeInt(this.mVisibilityType);
    }
}
