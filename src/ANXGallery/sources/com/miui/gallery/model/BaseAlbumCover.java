package com.miui.gallery.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.Objects;

public class BaseAlbumCover implements Parcelable {
    public static final Creator<BaseAlbumCover> CREATOR = new Creator<BaseAlbumCover>() {
        public BaseAlbumCover createFromParcel(Parcel parcel) {
            return new BaseAlbumCover(parcel);
        }

        public BaseAlbumCover[] newArray(int i) {
            return new BaseAlbumCover[i];
        }
    };
    public long coverId;
    public String coverPath;
    public String coverSha1;
    public long coverSize;
    public int coverSyncState;

    public BaseAlbumCover() {
    }

    protected BaseAlbumCover(Parcel parcel) {
        this.coverId = parcel.readLong();
        this.coverPath = parcel.readString();
        this.coverSha1 = parcel.readString();
        this.coverSyncState = parcel.readInt();
        this.coverSize = parcel.readLong();
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        BaseAlbumCover baseAlbumCover = (BaseAlbumCover) obj;
        if (!(this.coverId == baseAlbumCover.coverId && this.coverSyncState == baseAlbumCover.coverSyncState && this.coverSize == baseAlbumCover.coverSize && Objects.equals(this.coverPath, baseAlbumCover.coverPath) && Objects.equals(this.coverSha1, baseAlbumCover.coverSha1))) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        return Objects.hash(new Object[]{Long.valueOf(this.coverId), this.coverPath, this.coverSha1, Integer.valueOf(this.coverSyncState), Long.valueOf(this.coverSize)});
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeLong(this.coverId);
        parcel.writeString(this.coverPath);
        parcel.writeString(this.coverSha1);
        parcel.writeInt(this.coverSyncState);
        parcel.writeLong(this.coverSize);
    }
}
