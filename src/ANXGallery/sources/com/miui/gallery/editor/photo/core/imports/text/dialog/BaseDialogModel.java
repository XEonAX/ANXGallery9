package com.miui.gallery.editor.photo.core.imports.text.dialog;

import android.content.res.Resources;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;

public abstract class BaseDialogModel implements Parcelable {
    public final int backgroundColor;
    public final float bottomOffsetPercent;
    public final int cornerPosition;
    public String dialogPath;
    public String dialogSmallIconPath;
    public final boolean isCorner;
    public final float leftOffsetPercent;
    public final String name;
    public final float rightOffsetPercent;
    public final float topOffsetPercent;

    public BaseDialogModel(int i, String str, String str2, float f, float f2, float f3, float f4, boolean z, int i2, String str3) {
        this.dialogSmallIconPath = str;
        this.dialogPath = str2;
        this.leftOffsetPercent = f;
        this.topOffsetPercent = f2;
        this.rightOffsetPercent = f3;
        this.bottomOffsetPercent = f4;
        this.backgroundColor = i;
        this.isCorner = z;
        this.cornerPosition = i2;
        this.name = str3;
    }

    protected BaseDialogModel(Parcel parcel) {
        this.backgroundColor = parcel.readInt();
        this.leftOffsetPercent = parcel.readFloat();
        this.topOffsetPercent = parcel.readFloat();
        this.rightOffsetPercent = parcel.readFloat();
        this.bottomOffsetPercent = parcel.readFloat();
        this.isCorner = parcel.readByte() != 0;
        this.cornerPosition = parcel.readInt();
        this.name = parcel.readString();
    }

    public void configRect(RectF rectF, boolean z) {
        float width = rectF.width();
        float height = rectF.height();
        rectF.left += (z ? this.rightOffsetPercent : this.leftOffsetPercent) * width;
        rectF.right -= width * (z ? this.leftOffsetPercent : this.rightOffsetPercent);
        rectF.top += this.topOffsetPercent * height;
        rectF.bottom -= height * this.bottomOffsetPercent;
    }

    public int describeContents() {
        return 0;
    }

    public boolean hasDialog() {
        return !TextUtils.isEmpty(this.dialogPath);
    }

    public abstract Drawable readDialogDrawable(Resources resources);

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.backgroundColor);
        parcel.writeFloat(this.leftOffsetPercent);
        parcel.writeFloat(this.topOffsetPercent);
        parcel.writeFloat(this.rightOffsetPercent);
        parcel.writeFloat(this.bottomOffsetPercent);
        parcel.writeByte(this.isCorner ? (byte) 1 : 0);
        parcel.writeInt(this.cornerPosition);
        parcel.writeString(this.name);
    }
}
