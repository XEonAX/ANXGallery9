package com.miui.gallery.editor.photo.core.imports.filter;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.common.model.FilterCategory;
import java.util.List;

public class FilterCategoryData extends FilterCategory {
    public static final Creator<FilterCategoryData> CREATOR = new Creator<FilterCategoryData>() {
        public FilterCategoryData createFromParcel(Parcel parcel) {
            return new FilterCategoryData(parcel);
        }

        public FilterCategoryData[] newArray(int i) {
            return new FilterCategoryData[i];
        }
    };
    private int mCategory;
    private float mDownloadPercent;
    private int mDownloadState;

    public FilterCategoryData(int i, String str, int i2) {
        super(4, str, i2);
        this.mDownloadState = 0;
        this.mCategory = i;
    }

    public FilterCategoryData(int i, String str, int i2, int i3, int i4) {
        this(i, str, i2);
        this.subHighlighColor = i3;
        this.subItemSize = i4;
    }

    protected FilterCategoryData(Parcel parcel) {
        super(parcel);
        this.mDownloadState = 0;
        this.mCategory = parcel.readInt();
    }

    public int describeContents() {
        return 0;
    }

    public float getDownloadPercent() {
        return this.mDownloadPercent;
    }

    public int getDownloadState() {
        return this.mDownloadState;
    }

    public int getFilterCategory() {
        return this.mCategory;
    }

    public List<FilterItem> getFilterDatas() {
        return FilterManager.getFiltersByCategory(this.mCategory);
    }

    public void setDownloadPercent(float f) {
        this.mDownloadPercent = f;
    }

    public void setDownloadState(int i) {
        this.mDownloadState = i;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeInt(this.mCategory);
    }
}
