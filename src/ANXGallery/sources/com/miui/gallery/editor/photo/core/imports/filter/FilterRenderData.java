package com.miui.gallery.editor.photo.core.imports.filter;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.filtersdk.filter.base.BaseOriginalFilter;
import com.miui.gallery.editor.photo.app.filter.skytransfer.SkyTransferItem;
import com.miui.gallery.editor.photo.app.filter.skytransfer.SkyTransferTempData;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.common.model.RenderMetaData;
import com.miui.gallery.editor.photo.core.imports.filter.render.BaseOriginalFilterGroup;
import com.miui.gallery.editor.photo.core.imports.filter.render.EmptyGPUImageFilter;
import java.util.ArrayList;
import java.util.List;

public class FilterRenderData extends RenderData {
    public static final Creator<FilterRenderData> CREATOR = new Creator<FilterRenderData>() {
        public FilterRenderData createFromParcel(Parcel parcel) {
            return new FilterRenderData(parcel);
        }

        public FilterRenderData[] newArray(int i) {
            return new FilterRenderData[i];
        }
    };
    private final List<RenderMetaData> mEffects;
    private SkyTransferTempData mTransferTempData;

    protected FilterRenderData(Parcel parcel) {
        super(parcel);
        this.mEffects = new ArrayList();
        parcel.readList(this.mEffects, FilterItem.class.getClassLoader());
    }

    public FilterRenderData(List<RenderMetaData> list) {
        this.mEffects = new ArrayList(list);
    }

    public int describeContents() {
        return 0;
    }

    public SkyTransferTempData getTransferTempData() {
        return this.mTransferTempData;
    }

    public BaseOriginalFilter instantiate() {
        if (this.mEffects.size() == 0) {
            return new EmptyGPUImageFilter();
        }
        if (this.mEffects.size() == 1) {
            return ((RenderMetaData) this.mEffects.get(0)).instantiate();
        }
        ArrayList arrayList = new ArrayList(this.mEffects.size());
        for (int i = 0; i < this.mEffects.size(); i++) {
            arrayList.add(((RenderMetaData) this.mEffects.get(i)).instantiate());
        }
        return new BaseOriginalFilterGroup(arrayList);
    }

    public SkyTransferItem instantiateSky() {
        if (this.mEffects.size() != 1 || !(this.mEffects.get(0) instanceof FilterItem)) {
            return new SkyTransferItem(null, 0);
        }
        FilterItem filterItem = (FilterItem) this.mEffects.get(0);
        return new SkyTransferItem(filterItem.getSkyPath(), filterItem.progress);
    }

    public boolean isEmpty() {
        return this.mEffects.isEmpty();
    }

    public boolean isPortraitBeauty() {
        if (this.mEffects.size() != 1 || !(this.mEffects.get(0) instanceof FilterBeautify)) {
            return false;
        }
        return ((FilterBeautify) this.mEffects.get(0)).isPortraitBeauty();
    }

    public boolean isSkyTransfer() {
        if (this.mEffects.size() != 1 || !(this.mEffects.get(0) instanceof FilterItem)) {
            return false;
        }
        return ((FilterItem) this.mEffects.get(0)).isSkyTransfer();
    }

    /* access modifiers changed from: protected */
    public RenderData onMerge(RenderData renderData) {
        if (!isSkyTransfer() && (renderData instanceof FilterRenderData)) {
            FilterRenderData filterRenderData = (FilterRenderData) renderData;
            if (filterRenderData.isSkyTransfer()) {
                ArrayList arrayList = new ArrayList(this.mEffects);
                arrayList.addAll(filterRenderData.mEffects);
                return new FilterRenderData((List<RenderMetaData>) arrayList);
            }
        }
        return null;
    }

    public void setTransferTempData(SkyTransferTempData skyTransferTempData) {
        this.mTransferTempData = skyTransferTempData;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeList(this.mEffects);
    }
}
