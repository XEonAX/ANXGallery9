package com.miui.gallery.editor.photo.core.common.model;

import android.os.Parcel;

public abstract class BeautifyData extends RenderMetaData {
    public final int icon;

    protected BeautifyData(Parcel parcel) {
        super(parcel);
        this.icon = parcel.readInt();
    }

    public BeautifyData(short s, String str, int i) {
        super(s, str);
        this.icon = i;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeInt(this.icon);
    }
}
