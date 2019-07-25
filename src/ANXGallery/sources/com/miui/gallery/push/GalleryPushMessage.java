package com.miui.gallery.push;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;

public class GalleryPushMessage implements Parcelable {
    public static final Creator<GalleryPushMessage> CREATOR = new Creator<GalleryPushMessage>() {
        public GalleryPushMessage createFromParcel(Parcel parcel) {
            return new GalleryPushMessage(parcel);
        }

        public GalleryPushMessage[] newArray(int i) {
            return new GalleryPushMessage[i];
        }
    };
    @SerializedName("businessModule")
    private String mBusinessModule;
    @SerializedName("data")
    private String mData;
    @SerializedName("messageScope")
    private String mMessageScope;
    @SerializedName("tag")
    private long mTag;
    @SerializedName("type")
    private String mType;

    public GalleryPushMessage() {
    }

    protected GalleryPushMessage(Parcel parcel) {
        this.mType = parcel.readString();
        this.mBusinessModule = parcel.readString();
        this.mData = parcel.readString();
        this.mTag = parcel.readLong();
        this.mMessageScope = parcel.readString();
    }

    public static GalleryPushMessage fromJson(String str) {
        try {
            return (GalleryPushMessage) new Gson().fromJson(str, GalleryPushMessage.class);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int describeContents() {
        return 0;
    }

    public String getBusinessModule() {
        return this.mBusinessModule;
    }

    public String getData() {
        return this.mData;
    }

    public String getMessageScope() {
        return this.mMessageScope;
    }

    public long getTag() {
        return this.mTag;
    }

    public String getType() {
        return this.mType;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.mType);
        parcel.writeString(this.mBusinessModule);
        parcel.writeString(this.mData);
        parcel.writeLong(this.mTag);
        parcel.writeString(this.mMessageScope);
    }
}
