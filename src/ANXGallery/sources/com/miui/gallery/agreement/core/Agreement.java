package com.miui.gallery.agreement.core;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class Agreement implements Parcelable {
    public static final Creator<Agreement> CREATOR = new Creator<Agreement>() {
        public Agreement createFromParcel(Parcel parcel) {
            return new Agreement(parcel);
        }

        public Agreement[] newArray(int i) {
            return new Agreement[i];
        }
    };
    public final String mLink;
    public final boolean mRequired;
    public final String mText;

    protected Agreement(Parcel parcel) {
        this.mText = parcel.readString();
        this.mLink = parcel.readString();
        this.mRequired = parcel.readByte() != 0;
    }

    public Agreement(String str, String str2, boolean z) {
        this.mText = str;
        this.mLink = str2;
        this.mRequired = z;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.mText);
        parcel.writeString(this.mLink);
        parcel.writeByte(this.mRequired ? (byte) 1 : 0);
    }
}
