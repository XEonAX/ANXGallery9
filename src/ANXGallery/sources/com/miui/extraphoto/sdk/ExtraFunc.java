package com.miui.extraphoto.sdk;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public enum ExtraFunc implements Parcelable {
    FUNC_FANCYCOLOR,
    FUNC_REFOCUS,
    FUNC_FREEVIEW;
    
    public static final Creator<ExtraFunc> CREATOR = null;

    static {
        CREATOR = new Creator<ExtraFunc>() {
            public ExtraFunc createFromParcel(Parcel parcel) {
                return ExtraFunc.values()[parcel.readInt()];
            }

            public ExtraFunc[] newArray(int i) {
                return new ExtraFunc[i];
            }
        };
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(ordinal());
    }
}
