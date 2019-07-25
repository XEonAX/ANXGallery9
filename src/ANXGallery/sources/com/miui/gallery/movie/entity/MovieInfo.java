package com.miui.gallery.movie.entity;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.ArrayList;
import java.util.List;

public class MovieInfo implements Parcelable {
    public static final Creator<MovieInfo> CREATOR = new Creator<MovieInfo>() {
        public MovieInfo createFromParcel(Parcel parcel) {
            return new MovieInfo(parcel);
        }

        public MovieInfo[] newArray(int i) {
            return new MovieInfo[i];
        }
    };
    public String audio;
    private List<ImageEntity> extraList;
    public List<ImageEntity> imageList;
    public boolean isFromStory;
    public boolean isShortVideo;
    public String subTitle;
    public String template;
    public String title;

    protected MovieInfo(Parcel parcel) {
        this.audio = "default";
        this.imageList = new ArrayList();
        parcel.readList(this.imageList, ImageEntity.class.getClassLoader());
        this.template = parcel.readString();
        this.audio = parcel.readString();
        boolean z = false;
        this.isFromStory = parcel.readByte() != 0;
        if (parcel.readByte() != 0) {
            z = true;
        }
        this.isShortVideo = z;
        this.title = parcel.readString();
        this.subTitle = parcel.readString();
        this.extraList = new ArrayList();
        parcel.readList(this.extraList, ImageEntity.class.getClassLoader());
    }

    public MovieInfo(List<ImageEntity> list) {
        this.audio = "default";
        this.imageList = list;
        this.isShortVideo = list.size() <= 5;
    }

    public boolean backToLongVideo() {
        this.isShortVideo = false;
        if (this.extraList == null) {
            return false;
        }
        this.imageList.addAll(this.extraList);
        this.extraList = null;
        return true;
    }

    public boolean changeToShortVideo() {
        this.isShortVideo = true;
        if (this.imageList.size() > 5) {
            this.extraList = this.imageList.subList(5, this.imageList.size());
            ArrayList arrayList = new ArrayList();
            this.imageList = this.imageList.subList(0, 5);
            arrayList.addAll(this.imageList);
            this.imageList = arrayList;
            return true;
        }
        this.extraList = null;
        return false;
    }

    public int describeContents() {
        return 0;
    }

    public boolean discardToLongVideo() {
        this.isShortVideo = false;
        if (this.extraList == null) {
            return false;
        }
        this.extraList = null;
        return true;
    }

    public boolean discardToShortVideo() {
        this.isShortVideo = true;
        if (this.extraList == null) {
            return false;
        }
        this.extraList = null;
        return true;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeList(this.imageList);
        parcel.writeString(this.template);
        parcel.writeString(this.audio);
        parcel.writeByte(this.isFromStory ? (byte) 1 : 0);
        parcel.writeByte(this.isShortVideo ? (byte) 1 : 0);
        parcel.writeString(this.title);
        parcel.writeString(this.subTitle);
        parcel.writeList(this.extraList);
    }
}
