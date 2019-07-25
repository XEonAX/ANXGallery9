package com.miui.gallery.editor.photo.core.common.model;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.Metadata;

public class FrameData extends Metadata {
    public static final Creator<FrameData> CREATOR = new Creator<FrameData>() {
        public FrameData createFromParcel(Parcel parcel) {
            return new FrameData(parcel);
        }

        public FrameData[] newArray(int i) {
            return new FrameData[i];
        }
    };
    public final int height;
    public final float iconRatio;
    public final int width;

    protected FrameData(Parcel parcel) {
        super(parcel);
        this.width = parcel.readInt();
        this.height = parcel.readInt();
        this.iconRatio = parcel.readFloat();
    }

    public FrameData(short s, String str, int i, int i2, float f) {
        super(s, str);
        this.width = i;
        this.height = i2;
        this.iconRatio = f;
    }

    public int describeContents() {
        return 0;
    }

    public String toString() {
        return String.format("%s:%s", new Object[]{Integer.valueOf(this.width), Integer.valueOf(this.height)});
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeInt(this.width);
        parcel.writeInt(this.height);
        parcel.writeFloat(this.iconRatio);
    }
}
