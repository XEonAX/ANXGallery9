package com.miui.video.localvideoplayer;

import android.graphics.Bitmap.Config;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.io.FileDescriptor;

public class FrameParams implements Parcelable {
    public static final Creator<FrameParams> CREATOR = new Creator<FrameParams>() {
        public FrameParams createFromParcel(Parcel parcel) {
            return new FrameParams(parcel);
        }

        public FrameParams[] newArray(int i) {
            return new FrameParams[i];
        }
    };
    private Config mConfig;
    private int mCount;
    private ParcelFileDescriptor mFd;
    private int mHeight;
    private int mWidth;

    private FrameParams() {
    }

    protected FrameParams(Parcel parcel) {
        this.mWidth = parcel.readInt();
        this.mHeight = parcel.readInt();
        this.mCount = parcel.readInt();
        this.mConfig = Config.valueOf(parcel.readString());
        this.mFd = (ParcelFileDescriptor) ParcelFileDescriptor.CREATOR.createFromParcel(parcel);
    }

    public int describeContents() {
        return 0;
    }

    public Config getConfig() {
        return this.mConfig;
    }

    public int getCount() {
        return this.mCount;
    }

    public FileDescriptor getFileDescriptor() {
        if (this.mFd != null) {
            return this.mFd.getFileDescriptor();
        }
        return null;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mWidth);
        parcel.writeInt(this.mHeight);
        parcel.writeInt(this.mCount);
        parcel.writeString(this.mConfig.name());
        this.mFd.writeToParcel(parcel, i);
    }
}
