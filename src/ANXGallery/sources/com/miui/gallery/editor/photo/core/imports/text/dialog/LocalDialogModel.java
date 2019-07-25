package com.miui.gallery.editor.photo.core.imports.text.dialog;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;

public class LocalDialogModel extends BaseDialogModel {
    public static final Creator<LocalDialogModel> CREATOR = new Creator<LocalDialogModel>() {
        public LocalDialogModel createFromParcel(Parcel parcel) {
            return new LocalDialogModel(parcel);
        }

        public LocalDialogModel[] newArray(int i) {
            return new LocalDialogModel[i];
        }
    };
    private int mDialogRes;

    public LocalDialogModel(int i, int i2, int i3, float f, float f2, float f3, float f4, boolean z, int i4, String str) {
        super(i, Scheme.DRAWABLE.wrap(Integer.toString(i2)), Scheme.DRAWABLE.wrap(Integer.toString(i3)), f, f2, f3, f4, z, i4, str);
        this.mDialogRes = i3;
    }

    protected LocalDialogModel(Parcel parcel) {
        super(parcel);
        this.mDialogRes = parcel.readInt();
    }

    public int describeContents() {
        return 0;
    }

    public boolean hasDialog() {
        return this.mDialogRes != 0;
    }

    public Drawable readDialogDrawable(Resources resources) {
        if (hasDialog()) {
            return resources.getDrawable(this.mDialogRes);
        }
        return null;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeInt(this.mDialogRes);
    }
}
