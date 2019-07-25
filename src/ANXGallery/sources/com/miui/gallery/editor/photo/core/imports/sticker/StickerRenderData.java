package com.miui.gallery.editor.photo.core.imports.sticker;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.imports.sticker.StickerEditorView.StickerEntry;

class StickerRenderData extends RenderData {
    public static final Creator<StickerRenderData> CREATOR = new Creator<StickerRenderData>() {
        public StickerRenderData createFromParcel(Parcel parcel) {
            return new StickerRenderData(parcel);
        }

        public StickerRenderData[] newArray(int i) {
            return new StickerRenderData[i];
        }
    };
    StickerEntry mEntry;

    protected StickerRenderData(Parcel parcel) {
        super(parcel);
        this.mEntry = (StickerEntry) parcel.readParcelable(StickerEntry.class.getClassLoader());
    }

    public StickerRenderData(StickerEntry stickerEntry) {
        this.mEntry = stickerEntry;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeParcelable(this.mEntry, i);
    }
}
