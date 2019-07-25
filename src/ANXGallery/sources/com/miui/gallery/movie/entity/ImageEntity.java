package com.miui.gallery.movie.entity;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class ImageEntity implements Parcelable {
    public static final Creator<ImageEntity> CREATOR = new Creator<ImageEntity>() {
        public ImageEntity createFromParcel(Parcel parcel) {
            return new ImageEntity(parcel);
        }

        public ImageEntity[] newArray(int i) {
            return new ImageEntity[i];
        }
    };
    public String image;
    public String sha1;

    protected ImageEntity(Parcel parcel) {
        this.image = parcel.readString();
        this.sha1 = parcel.readString();
    }

    public ImageEntity(String str, String str2) {
        this.image = str;
        this.sha1 = str2;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.image);
        parcel.writeString(this.sha1);
    }
}
