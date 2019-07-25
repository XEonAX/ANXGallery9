package com.miui.gallery.editor.photo.core.common.model;

import android.os.Parcel;
import com.miui.gallery.editor.photo.core.Metadata;

public abstract class MosaicData extends Metadata {
    public final String iconPath;

    protected MosaicData(Parcel parcel) {
        super(parcel);
        this.iconPath = parcel.readString();
    }

    public MosaicData(short s, String str, String str2) {
        super(s, str);
        this.iconPath = str2;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeString(this.iconPath);
    }
}
