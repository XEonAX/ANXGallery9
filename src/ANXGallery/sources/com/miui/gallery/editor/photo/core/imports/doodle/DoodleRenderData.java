package com.miui.gallery.editor.photo.core.imports.doodle;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.imports.doodle.DoodleEditorView.DoodleEntry;

class DoodleRenderData extends RenderData {
    public static final Creator<DoodleRenderData> CREATOR = new Creator<DoodleRenderData>() {
        public DoodleRenderData createFromParcel(Parcel parcel) {
            return new DoodleRenderData(parcel);
        }

        public DoodleRenderData[] newArray(int i) {
            return new DoodleRenderData[i];
        }
    };
    DoodleEntry mDoodleEntry;

    protected DoodleRenderData(Parcel parcel) {
        super(parcel);
        this.mDoodleEntry = (DoodleEntry) parcel.readParcelable(DoodleEntry.class.getClassLoader());
    }

    DoodleRenderData(DoodleEntry doodleEntry) {
        this.mDoodleEntry = doodleEntry;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeParcelable(this.mDoodleEntry, i);
    }
}
