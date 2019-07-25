package com.miui.gallery.editor.photo.core.imports.mosaic;

import android.os.Parcel;
import com.miui.gallery.editor.photo.core.common.model.MosaicData;

public abstract class MosaicGLEntity extends MosaicData {
    public final TYPE type;

    enum TYPE {
        ORIGIN,
        EFFECT,
        RESOURCE
    }

    protected MosaicGLEntity(Parcel parcel) {
        super(parcel);
        int readInt = parcel.readInt();
        this.type = readInt == -1 ? null : TYPE.values()[readInt];
    }

    public MosaicGLEntity(short s, String str, String str2, TYPE type2) {
        super(s, str, str2);
        this.type = type2;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeInt(this.type == null ? -1 : this.type.ordinal());
    }
}
