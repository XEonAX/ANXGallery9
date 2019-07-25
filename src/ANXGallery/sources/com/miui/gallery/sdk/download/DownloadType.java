package com.miui.gallery.sdk.download;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public enum DownloadType implements Parcelable {
    ORIGIN(10, false),
    ORIGIN_FORCE(11, false),
    THUMBNAIL(12, false),
    MICRO(13, false),
    THUMBNAIL_BATCH(7, true),
    ORIGIN_BATCH(10, true),
    MICRO_BATCH(8, true);
    
    public static final Creator<DownloadType> CREATOR = null;
    private boolean mIsBackground;
    private int mPriority;

    static {
        CREATOR = new Creator<DownloadType>() {
            public DownloadType createFromParcel(Parcel parcel) {
                return DownloadType.values()[parcel.readInt()];
            }

            public DownloadType[] newArray(int i) {
                return new DownloadType[i];
            }
        };
    }

    private DownloadType(int i, boolean z) {
        this.mPriority = i;
        this.mIsBackground = z;
    }

    public int describeContents() {
        return 0;
    }

    public int getPriority() {
        return this.mPriority;
    }

    public boolean isBackground() {
        return this.mIsBackground;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(ordinal());
    }
}
