package com.miui.gallery.editor.photo.core.imports.remover;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.RenderData;
import java.util.ArrayList;
import java.util.List;

public class RemoverRenderData extends RenderData {
    public static final Creator<RemoverRenderData> CREATOR = new Creator<RemoverRenderData>() {
        public RemoverRenderData createFromParcel(Parcel parcel) {
            return new RemoverRenderData(parcel);
        }

        public RemoverRenderData[] newArray(int i) {
            return new RemoverRenderData[i];
        }
    };
    final List<RemoverPaintData> mPaintData;

    protected RemoverRenderData(Parcel parcel) {
        super(parcel);
        this.mPaintData = new ArrayList();
        parcel.readList(this.mPaintData, RemoverPaintData.class.getClassLoader());
    }

    public RemoverRenderData(List<RemoverPaintData> list) {
        this.mPaintData = list;
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: protected */
    public void onRelease() {
        for (RemoverPaintData removerPaintData : this.mPaintData) {
            if (removerPaintData.mRemoverNNFData != null) {
                removerPaintData.mRemoverNNFData.releaseMemoryFile();
            }
        }
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeList(this.mPaintData);
    }
}
