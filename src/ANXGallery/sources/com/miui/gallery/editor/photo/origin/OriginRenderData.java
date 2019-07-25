package com.miui.gallery.editor.photo.origin;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelableGenericUtils;
import java.util.List;

public class OriginRenderData implements Parcelable {
    public static final Creator<OriginRenderData> CREATOR = new Creator<OriginRenderData>() {
        public OriginRenderData createFromParcel(Parcel parcel) {
            return new OriginRenderData(parcel);
        }

        public OriginRenderData[] newArray(int i) {
            return new OriginRenderData[i];
        }
    };
    Bundle mBundle;
    Uri mOut;
    List<RenderData> mRenderDataList;
    Uri mSource;
    boolean mWithWatermark;

    protected OriginRenderData(Parcel parcel) {
        this.mRenderDataList = ParcelableGenericUtils.readList(parcel);
        this.mSource = (Uri) parcel.readParcelable(Uri.class.getClassLoader());
        this.mOut = (Uri) parcel.readParcelable(Uri.class.getClassLoader());
        this.mBundle = (Bundle) parcel.readParcelable(Bundle.class.getClassLoader());
        this.mWithWatermark = parcel.readByte() != 0;
    }

    public OriginRenderData(List<RenderData> list, Uri uri, Uri uri2, Bundle bundle, boolean z) {
        this.mRenderDataList = list;
        this.mSource = uri;
        this.mOut = uri2;
        this.mBundle = bundle;
        this.mWithWatermark = z;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        ParcelableGenericUtils.writeList(parcel, i, this.mRenderDataList);
        parcel.writeParcelable(this.mSource, i);
        parcel.writeParcelable(this.mOut, i);
        parcel.writeParcelable(this.mBundle, i);
        parcel.writeByte(this.mWithWatermark ? (byte) 1 : 0);
    }
}
