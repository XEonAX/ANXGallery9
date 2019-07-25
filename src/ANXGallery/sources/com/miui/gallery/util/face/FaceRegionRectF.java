package com.miui.gallery.util.face;

import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.util.Log;
import java.util.Objects;

public class FaceRegionRectF extends RectF {
    public static final Creator<FaceRegionRectF> CREATOR = new Creator<FaceRegionRectF>() {
        public FaceRegionRectF createFromParcel(Parcel parcel) {
            FaceRegionRectF faceRegionRectF = new FaceRegionRectF();
            faceRegionRectF.readFromParcel(parcel);
            return faceRegionRectF;
        }

        public FaceRegionRectF[] newArray(int i) {
            return new FaceRegionRectF[i];
        }
    };
    public int orientation;

    private FaceRegionRectF() {
    }

    public FaceRegionRectF(float f, float f2, float f3, float f4, int i) {
        super(reducePrecision(f), reducePrecision(f2), reducePrecision(f3), reducePrecision(f4));
        this.orientation = i;
    }

    private static float reducePrecision(float f) {
        return (float) (Math.ceil((double) (f * 100000.0f)) / 100000.0d);
    }

    public static FaceRegionRectF resolveFrom(String str) {
        try {
            String[] split = str.split(" ");
            float parseFloat = Float.parseFloat(split[0]);
            float parseFloat2 = Float.parseFloat(split[1]);
            float parseFloat3 = Float.parseFloat(split[2]);
            FaceRegionRectF faceRegionRectF = new FaceRegionRectF(parseFloat, parseFloat2, parseFloat + parseFloat3, parseFloat2 + Float.parseFloat(split[3]), Integer.parseInt(split[4]));
            return faceRegionRectF;
        } catch (Exception unused) {
            Log.e("FaceRegionRectF", "wrong face rect format: %s", (Object) str);
            return null;
        }
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FaceRegionRectF) || !super.equals(obj)) {
            return false;
        }
        if (this.orientation != ((FaceRegionRectF) obj).orientation) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        return Objects.hash(new Object[]{Integer.valueOf(super.hashCode()), Integer.valueOf(this.orientation)});
    }

    public void readFromParcel(Parcel parcel) {
        this.left = parcel.readFloat();
        this.top = parcel.readFloat();
        this.right = parcel.readFloat();
        this.bottom = parcel.readFloat();
        this.orientation = parcel.readInt();
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeFloat(this.left);
        parcel.writeFloat(this.top);
        parcel.writeFloat(this.right);
        parcel.writeFloat(this.bottom);
        parcel.writeInt(this.orientation);
    }
}
