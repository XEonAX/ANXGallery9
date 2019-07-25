package com.miui.gallery.editor.photo.core.imports.filter;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.filtersdk.filter.base.BaseOriginalFilter;
import com.miui.filtersdk.filter.base.ColorLookupFilter;
import com.miui.gallery.editor.photo.core.common.model.BeautifyData;
import com.miui.gallery.editor.photo.core.imports.filter.render.EmptyGPUImageFilter;

public class FilterBeautify extends BeautifyData {
    private static short BEAUTIFY_ITEM_PRIORITY = 10;
    public static final Creator<FilterBeautify> CREATOR = new Creator<FilterBeautify>() {
        public FilterBeautify createFromParcel(Parcel parcel) {
            return new FilterBeautify(parcel);
        }

        public FilterBeautify[] newArray(int i) {
            return new FilterBeautify[i];
        }
    };
    private int mId;

    public FilterBeautify(int i, String str, int i2) {
        super(BEAUTIFY_ITEM_PRIORITY, str, i2);
        this.mId = i;
    }

    protected FilterBeautify(Parcel parcel) {
        super(parcel);
        this.mId = parcel.readInt();
    }

    private String getTablePath() {
        switch (this.mId) {
            case 1:
                return "filter/onekey/auto.png";
            case 2:
                return "filter/onekey/portrait.png";
            case 3:
                return "filter/onekey/food.png";
            case 4:
                return "filter/onekey/scene.png";
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("not table for this id: ");
                sb.append(this.mId);
                throw new IllegalArgumentException(sb.toString());
        }
    }

    public int describeContents() {
        return 0;
    }

    public BaseOriginalFilter instantiate() {
        if (this.mId == 0) {
            return new EmptyGPUImageFilter();
        }
        ColorLookupFilter colorLookupFilter = new ColorLookupFilter(getTablePath());
        if (!colorLookupFilter.isDegreeAdjustSupported()) {
            return colorLookupFilter;
        }
        colorLookupFilter.setDegree(100);
        return colorLookupFilter;
    }

    public boolean isPortraitBeauty() {
        return this.mId == 2;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeInt(this.mId);
    }
}
