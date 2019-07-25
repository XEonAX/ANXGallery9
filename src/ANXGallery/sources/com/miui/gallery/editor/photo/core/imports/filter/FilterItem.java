package com.miui.gallery.editor.photo.core.imports.filter;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.miui.filtersdk.filter.base.BaseOriginalFilter;
import com.miui.filtersdk.filter.base.ColorLookupFilter;
import com.miui.gallery.editor.photo.core.common.model.FilterData;
import com.miui.gallery.editor.photo.core.imports.filter.render.EmptyGPUImageFilter;
import com.miui.gallery.editor.photo.core.imports.filter.render.PathLUTFilter;

public class FilterItem extends FilterData {
    public static final Creator<FilterItem> CREATOR = new Creator<FilterItem>() {
        public FilterItem createFromParcel(Parcel parcel) {
            return new FilterItem(parcel);
        }

        public FilterItem[] newArray(int i) {
            return new FilterItem[i];
        }
    };
    private static short FILTER_ITEM_PRIORITY = 10;
    private int mDefault;
    private boolean mIsFilePath;
    private boolean mIsSkyTransfer;
    private String mTablePath;

    protected FilterItem(Parcel parcel) {
        super(parcel);
        this.mTablePath = parcel.readString();
        this.mDefault = parcel.readInt();
        boolean z = false;
        this.mIsFilePath = parcel.readByte() != 0;
        if (parcel.readByte() != 0) {
            z = true;
        }
        this.mIsSkyTransfer = z;
    }

    public FilterItem(String str, int i) {
        super(FILTER_ITEM_PRIORITY, str, i);
    }

    public FilterItem(String str, String str2, int i, int i2) {
        super(FILTER_ITEM_PRIORITY, str2, i);
        this.mTablePath = str;
        this.mDefault = i2;
        this.progress = getDefault();
    }

    public FilterItem(boolean z, String str, int i) {
        super(FILTER_ITEM_PRIORITY, str, i);
        this.mIsSkyTransfer = z;
    }

    public FilterItem(boolean z, String str, String str2, int i, int i2) {
        this(str, str2, i, i2);
        this.mIsSkyTransfer = z;
    }

    public int describeContents() {
        return 0;
    }

    public int getDefault() {
        return this.mDefault;
    }

    public String getSkyPath() {
        return this.mTablePath;
    }

    public BaseOriginalFilter instantiate() {
        if (TextUtils.isEmpty(this.mTablePath)) {
            return new EmptyGPUImageFilter();
        }
        BaseOriginalFilter pathLUTFilter = this.mIsFilePath ? new PathLUTFilter(this.mTablePath) : new ColorLookupFilter(this.mTablePath);
        if (pathLUTFilter.isDegreeAdjustSupported()) {
            pathLUTFilter.setDegree(this.progress);
        }
        return pathLUTFilter;
    }

    public boolean isNone() {
        return TextUtils.isEmpty(this.mTablePath);
    }

    public boolean isSkyTransfer() {
        return this.mIsSkyTransfer;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeString(this.mTablePath);
        parcel.writeInt(this.mDefault);
        parcel.writeByte(this.mIsFilePath ? (byte) 1 : 0);
        parcel.writeByte(this.mIsSkyTransfer ? (byte) 1 : 0);
    }
}
