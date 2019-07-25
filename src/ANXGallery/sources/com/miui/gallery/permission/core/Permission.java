package com.miui.gallery.permission.core;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class Permission implements Parcelable {
    public static final Creator<Permission> CREATOR = new Creator<Permission>() {
        public Permission createFromParcel(Parcel parcel) {
            return new Permission(parcel);
        }

        public Permission[] newArray(int i) {
            return new Permission[i];
        }
    };
    public final String mDesc;
    public final String mName;
    public final String mPermissionGroup;
    public final boolean mRequired;

    protected Permission(Parcel parcel) {
        this.mPermissionGroup = parcel.readString();
        this.mName = parcel.readString();
        this.mDesc = parcel.readString();
        this.mRequired = parcel.readByte() != 0;
    }

    public Permission(String str, String str2, String str3, boolean z) {
        this.mPermissionGroup = str;
        this.mName = str2;
        this.mDesc = str3;
        this.mRequired = z;
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        if (obj instanceof Permission) {
            return this.mPermissionGroup.equalsIgnoreCase(((Permission) obj).mPermissionGroup);
        }
        return false;
    }

    public int hashCode() {
        return this.mPermissionGroup.hashCode();
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.mPermissionGroup);
        parcel.writeString(this.mName);
        parcel.writeString(this.mDesc);
        parcel.writeByte(this.mRequired ? (byte) 1 : 0);
    }
}
