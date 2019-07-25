package com.miui.gallery.model;

import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.gallery.util.FileMimeUtil;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.assist.ImageSize;

public class ImageLoadParams implements Parcelable {
    public static final Creator<ImageLoadParams> CREATOR = new Creator<ImageLoadParams>() {
        public ImageLoadParams createFromParcel(Parcel parcel) {
            return new ImageLoadParams(parcel);
        }

        public ImageLoadParams[] newArray(int i) {
            return new ImageLoadParams[i];
        }
    };
    private DisplayImageOptions mDisplayOptions;
    private long mFileLength;
    private String mFilePath;
    private boolean mFromCamera;
    private boolean mFromFace;
    private int mInitPosition;
    private long mKey;
    private String mMimeType;
    private RectF mRegionRect;
    private byte[] mSecretKey;
    private ImageSize mTargetSize;

    public ImageLoadParams(long j, String str, ImageSize imageSize, RectF rectF, int i, String str2, long j2) {
        this.mKey = j;
        this.mFilePath = str;
        this.mTargetSize = imageSize;
        this.mRegionRect = rectF;
        this.mInitPosition = i;
        this.mMimeType = str2;
        this.mFileLength = j2;
    }

    public ImageLoadParams(long j, String str, ImageSize imageSize, RectF rectF, int i, String str2, boolean z, long j2) {
        this(j, str, imageSize, rectF, i, str2, j2);
        this.mFromFace = z;
    }

    public ImageLoadParams(long j, String str, ImageSize imageSize, RectF rectF, int i, String str2, byte[] bArr, long j2) {
        this(j, str, imageSize, rectF, i, str2, j2);
        this.mSecretKey = bArr;
    }

    protected ImageLoadParams(Parcel parcel) {
        this.mKey = parcel.readLong();
        this.mFilePath = parcel.readString();
        this.mTargetSize = (ImageSize) parcel.readSerializable();
        this.mRegionRect = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
        this.mInitPosition = parcel.readInt();
        this.mMimeType = parcel.readString();
        int readInt = parcel.readInt();
        if (readInt > 0) {
            this.mSecretKey = new byte[readInt];
            parcel.readByteArray(this.mSecretKey);
        }
        boolean z = false;
        this.mFromFace = parcel.readInt() == 1;
        if (parcel.readInt() == 1) {
            z = true;
        }
        this.mFromCamera = z;
        this.mFileLength = parcel.readLong();
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        return obj != null && (obj instanceof ImageLoadParams) && getKey() == ((ImageLoadParams) obj).getKey();
    }

    public DisplayImageOptions getDisplayImageOptions() {
        return this.mDisplayOptions;
    }

    public long getFileLength() {
        return this.mFileLength;
    }

    public long getKey() {
        return this.mKey;
    }

    public String getPath() {
        return this.mFilePath;
    }

    public int getPos() {
        return this.mInitPosition;
    }

    public RectF getRegionRectF() {
        return this.mRegionRect;
    }

    public byte[] getSecretKey() {
        return this.mSecretKey;
    }

    public ImageSize getTargetSize() {
        return this.mTargetSize;
    }

    public int hashCode() {
        return new Long(getKey()).hashCode();
    }

    public boolean isFromFace() {
        return this.mFromFace;
    }

    public boolean isGif() {
        return FileMimeUtil.isGifFromMimeType(this.mMimeType);
    }

    public boolean isSecret() {
        return this.mSecretKey != null && this.mSecretKey.length > 0;
    }

    public boolean isVideo() {
        return FileMimeUtil.isVideoFromMimeType(this.mMimeType);
    }

    public boolean match(BaseDataItem baseDataItem, int i) {
        boolean z = false;
        if (baseDataItem == null) {
            if (i == this.mInitPosition) {
                z = true;
            }
            return z;
        }
        if (this.mKey == baseDataItem.getKey()) {
            z = true;
        }
        return z;
    }

    public void setDisplayImageOptions(DisplayImageOptions displayImageOptions) {
        this.mDisplayOptions = displayImageOptions;
    }

    public void setFromCamera(boolean z) {
        this.mFromCamera = z;
    }

    public void setPath(String str) {
        this.mFilePath = str;
    }

    public void updatePosition(int i) {
        this.mInitPosition = i;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeLong(this.mKey);
        parcel.writeString(this.mFilePath);
        parcel.writeSerializable(this.mTargetSize);
        parcel.writeParcelable(this.mRegionRect, i);
        parcel.writeInt(this.mInitPosition);
        parcel.writeString(this.mMimeType);
        parcel.writeInt(this.mSecretKey != null ? this.mSecretKey.length : 0);
        if (this.mSecretKey != null) {
            parcel.writeByteArray(this.mSecretKey);
        }
        parcel.writeInt(this.mFromFace ? 1 : 0);
        parcel.writeInt(this.mFromCamera ? 1 : 0);
        parcel.writeLong(this.mFileLength);
    }
}
