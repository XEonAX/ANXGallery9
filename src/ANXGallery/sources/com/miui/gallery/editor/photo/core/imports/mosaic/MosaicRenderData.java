package com.miui.gallery.editor.photo.core.imports.mosaic;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.RenderData;

class MosaicRenderData extends RenderData {
    public static final Creator<MosaicRenderData> CREATOR = new Creator<MosaicRenderData>() {
        public MosaicRenderData createFromParcel(Parcel parcel) {
            return new MosaicRenderData(parcel);
        }

        public MosaicRenderData[] newArray(int i) {
            return new MosaicRenderData[i];
        }
    };
    MosaicEntry mMosaicEntry;

    protected MosaicRenderData(Parcel parcel) {
        super(parcel);
        this.mMosaicEntry = (MosaicEntry) parcel.readParcelable(MosaicEntry.class.getClassLoader());
    }

    MosaicRenderData(MosaicEntry mosaicEntry) {
        this.mMosaicEntry = mosaicEntry;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeParcelable(this.mMosaicEntry, i);
    }
}
