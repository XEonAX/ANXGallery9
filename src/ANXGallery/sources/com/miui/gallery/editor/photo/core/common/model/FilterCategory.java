package com.miui.gallery.editor.photo.core.common.model;

import android.os.Parcel;
import com.miui.gallery.editor.photo.core.Metadata;
import java.io.Serializable;
import java.util.List;

public abstract class FilterCategory extends Metadata implements Serializable {
    public int highlighColor;
    public int subHighlighColor;
    public int subItemSize;

    protected FilterCategory(Parcel parcel) {
        super(parcel);
        this.highlighColor = parcel.readInt();
    }

    public FilterCategory(short s, String str, int i) {
        super(s, str);
        this.highlighColor = i;
    }

    public int describeContents() {
        return 0;
    }

    public abstract float getDownloadPercent();

    public abstract int getDownloadState();

    public abstract int getFilterCategory();

    public abstract List<? extends FilterData> getFilterDatas();

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeInt(this.highlighColor);
    }
}
