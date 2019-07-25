package com.miui.gallery.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.gallery.util.face.FaceRegionRectF;
import java.util.Objects;

public class FaceAlbumCover extends BaseAlbumCover implements Parcelable {
    public static final Creator<FaceAlbumCover> CREATOR = new Creator<FaceAlbumCover>() {
        public FaceAlbumCover createFromParcel(Parcel parcel) {
            return new FaceAlbumCover(parcel);
        }

        public FaceAlbumCover[] newArray(int i) {
            return new FaceAlbumCover[i];
        }
    };
    public FaceRegionRectF faceRectF;

    public FaceAlbumCover() {
    }

    protected FaceAlbumCover(Parcel parcel) {
        super(parcel);
        this.faceRectF = (FaceRegionRectF) parcel.readParcelable(FaceRegionRectF.class.getClassLoader());
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FaceAlbumCover) || !super.equals(obj)) {
            return false;
        }
        return Objects.equals(this.faceRectF, ((FaceAlbumCover) obj).faceRectF);
    }

    public int hashCode() {
        return Objects.hash(new Object[]{Integer.valueOf(super.hashCode()), this.faceRectF});
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("FaceAlbumCover{faceRectF=");
        sb.append(this.faceRectF);
        sb.append(", coverId=");
        sb.append(this.coverId);
        sb.append(", coverPath='");
        sb.append(this.coverPath);
        sb.append('\'');
        sb.append(", coverSha1='");
        sb.append(this.coverSha1);
        sb.append('\'');
        sb.append(", coverSyncState=");
        sb.append(this.coverSyncState);
        sb.append(", coverSize=");
        sb.append(this.coverSize);
        sb.append('}');
        return sb.toString();
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeParcelable(this.faceRectF, i);
    }
}
