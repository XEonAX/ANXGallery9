package com.miui.gallery.share;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import java.util.WeakHashMap;

public class Path implements Parcelable {
    public static final Creator<Path> CREATOR = new Creator<Path>() {
        public Path createFromParcel(Parcel parcel) {
            return new Path(parcel);
        }

        public Path[] newArray(int i) {
            return new Path[i];
        }
    };
    static WeakHashMap<Path, CloudSharerMediaSet> sSetCache = new WeakHashMap<>();
    private long mId;
    private boolean mIsBabyAlbum;
    private boolean mIsOtherShared;

    public Path() {
    }

    public Path(long j, boolean z) {
        this.mId = j;
        this.mIsOtherShared = z;
    }

    public Path(long j, boolean z, boolean z2) {
        this.mId = j;
        this.mIsOtherShared = z;
        this.mIsBabyAlbum = z2;
    }

    protected Path(Parcel parcel) {
        boolean z = false;
        this.mIsOtherShared = parcel.readByte() != 0;
        if (parcel.readByte() != 0) {
            z = true;
        }
        this.mIsBabyAlbum = z;
        this.mId = parcel.readLong();
    }

    public static Path fromString(String str) {
        if (TextUtils.isEmpty(str) || str.indexOf("/") == -1) {
            return null;
        }
        Path path = new Path();
        int indexOf = str.indexOf("/");
        path.mIsOtherShared = str.indexOf("other") != -1;
        path.mId = Long.parseLong(str.substring(indexOf + 1));
        return path;
    }

    public int describeContents() {
        return 0;
    }

    public long getId() {
        return this.mId;
    }

    public CloudSharerMediaSet getMediaSet() {
        if (sSetCache.containsKey(this)) {
            return (CloudSharerMediaSet) sSetCache.get(this);
        }
        CloudSharerMediaSet cloudSharerMediaSet = new CloudSharerMediaSet(this);
        sSetCache.put(this, cloudSharerMediaSet);
        return cloudSharerMediaSet;
    }

    public boolean isBabyAlbum() {
        return this.mIsBabyAlbum;
    }

    public boolean isOtherShared() {
        return this.mIsOtherShared;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.mIsOtherShared ? "other" : "owner");
        sb.append("/");
        sb.append(String.valueOf(this.mId));
        return sb.toString();
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeByte(this.mIsOtherShared ? (byte) 1 : 0);
        parcel.writeByte(this.mIsBabyAlbum ? (byte) 1 : 0);
        parcel.writeLong(this.mId);
    }
}
