package com.miui.gallery.editor.photo.core.imports.text.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.imports.text.typeface.TextStyle;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout.TextAlignment;

public class TextStatusData implements Parcelable {
    public static final Creator<TextStatusData> CREATOR = new Creator<TextStatusData>() {
        public TextStatusData createFromParcel(Parcel parcel) {
            return new TextStatusData(parcel);
        }

        public TextStatusData[] newArray(int i) {
            return new TextStatusData[i];
        }
    };
    public int color;
    public String text;
    public TextAlignment textAlignment;
    public boolean textBold;
    public boolean textShadow;
    public TextStyle textStyle;
    public float transparentProgress;

    public TextStatusData() {
    }

    protected TextStatusData(Parcel parcel) {
        this.color = parcel.readInt();
        this.transparentProgress = parcel.readFloat();
        boolean z = false;
        this.textBold = parcel.readByte() != 0;
        if (parcel.readByte() != 0) {
            z = true;
        }
        this.textShadow = z;
        int readInt = parcel.readInt();
        this.textAlignment = readInt == -1 ? null : TextAlignment.values()[readInt];
        this.text = parcel.readString();
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.color);
        parcel.writeFloat(this.transparentProgress);
        parcel.writeByte(this.textBold ? (byte) 1 : 0);
        parcel.writeByte(this.textShadow ? (byte) 1 : 0);
        parcel.writeInt(this.textAlignment == null ? -1 : this.textAlignment.ordinal());
        parcel.writeString(this.text);
    }
}
