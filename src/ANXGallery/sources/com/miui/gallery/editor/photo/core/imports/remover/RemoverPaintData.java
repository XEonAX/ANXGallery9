package com.miui.gallery.editor.photo.core.imports.remover;

import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.imports.remover.RemoverGestureView.Curve;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelableGenericUtils;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelableMatrix;
import java.util.ArrayList;
import java.util.List;

public class RemoverPaintData implements Parcelable {
    public static final Creator<RemoverPaintData> CREATOR = new Creator<RemoverPaintData>() {
        public RemoverPaintData createFromParcel(Parcel parcel) {
            return new RemoverPaintData(parcel);
        }

        public RemoverPaintData[] newArray(int i) {
            return new RemoverPaintData[i];
        }
    };
    ParcelableMatrix mApplyDoodleMatrix;
    RectF mBmpBounds;
    List<Curve> mCurves;
    ParcelableMatrix mDrawBitmapMatrix;
    RectF mDrawableBounds;
    RectF mExportBounds;
    ParcelableMatrix mExportMatrix;
    RemoverNNFData mRemoverNNFData;
    RectF mViewBounds;

    public RemoverPaintData() {
        this.mExportBounds = new RectF();
        this.mExportMatrix = new ParcelableMatrix();
        this.mBmpBounds = new RectF();
        this.mViewBounds = new RectF();
        this.mDrawableBounds = new RectF();
        this.mDrawBitmapMatrix = new ParcelableMatrix();
        this.mApplyDoodleMatrix = new ParcelableMatrix();
        this.mCurves = new ArrayList();
    }

    protected RemoverPaintData(Parcel parcel) {
        this.mExportBounds = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
        this.mExportMatrix = (ParcelableMatrix) parcel.readParcelable(ParcelableMatrix.class.getClassLoader());
        this.mBmpBounds = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
        this.mViewBounds = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
        this.mDrawableBounds = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
        this.mDrawBitmapMatrix = (ParcelableMatrix) parcel.readParcelable(ParcelableMatrix.class.getClassLoader());
        this.mApplyDoodleMatrix = (ParcelableMatrix) parcel.readParcelable(ParcelableMatrix.class.getClassLoader());
        this.mCurves = ParcelableGenericUtils.readList(parcel);
        this.mRemoverNNFData = (RemoverNNFData) parcel.readParcelable(RemoverNNFData.class.getClassLoader());
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.mExportBounds, i);
        parcel.writeParcelable(this.mExportMatrix, i);
        parcel.writeParcelable(this.mBmpBounds, i);
        parcel.writeParcelable(this.mViewBounds, i);
        parcel.writeParcelable(this.mDrawableBounds, i);
        parcel.writeParcelable(this.mDrawBitmapMatrix, i);
        parcel.writeParcelable(this.mApplyDoodleMatrix, i);
        ParcelableGenericUtils.writeList(parcel, i, this.mCurves);
        parcel.writeParcelable(this.mRemoverNNFData, i);
    }
}
