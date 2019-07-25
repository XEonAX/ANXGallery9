package com.miui.gallery.editor.photo.core.common.model;

import android.os.Parcel;

public abstract class AdjustData extends RenderMetaData {
    public final int icon;
    public int progress;

    protected AdjustData(Parcel parcel) {
        super(parcel);
        this.icon = parcel.readInt();
        this.progress = parcel.readInt();
    }

    public AdjustData(short s, String str, int i) {
        super(s, str);
        this.icon = i;
        this.progress = getMin();
    }

    public int describeContents() {
        return 0;
    }

    public abstract int getMax();

    public abstract int getMin();

    public abstract boolean isMid();

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeInt(this.icon);
        parcel.writeInt(this.progress);
    }
}
