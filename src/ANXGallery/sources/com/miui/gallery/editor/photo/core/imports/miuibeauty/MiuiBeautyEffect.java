package com.miui.gallery.editor.photo.core.imports.miuibeauty;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.filtersdk.beauty.BeautyParameterType;

public class MiuiBeautyEffect implements Parcelable {
    public static final Creator<MiuiBeautyEffect> CREATOR = new Creator<MiuiBeautyEffect>() {
        public MiuiBeautyEffect createFromParcel(Parcel parcel) {
            return new MiuiBeautyEffect(parcel);
        }

        public MiuiBeautyEffect[] newArray(int i) {
            return new MiuiBeautyEffect[i];
        }
    };
    public BeautyParameterType mBeautyType;
    public String mName;
    public int mOrdinal;

    protected MiuiBeautyEffect(Parcel parcel) {
        this.mOrdinal = parcel.readInt();
        this.mName = parcel.readString();
        this.mBeautyType = BeautyParameterType.valueOf(parcel.readString());
    }

    public MiuiBeautyEffect(String str, int i, BeautyParameterType beautyParameterType) {
        this.mOrdinal = i;
        this.mName = str;
        this.mBeautyType = beautyParameterType;
    }

    public int describeContents() {
        return 0;
    }

    public boolean needFace() {
        if (this.mBeautyType == null) {
            return false;
        }
        switch (this.mBeautyType) {
            case WHITEN_STRENGTH:
            case SMOOTH_STRENGTH:
                return false;
            default:
                return true;
        }
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mOrdinal);
        parcel.writeString(this.mName);
        parcel.writeString(this.mBeautyType.name());
    }
}
