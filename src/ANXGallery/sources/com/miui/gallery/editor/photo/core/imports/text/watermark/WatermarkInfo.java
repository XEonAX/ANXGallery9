package com.miui.gallery.editor.photo.core.imports.text.watermark;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelableGenericUtils;
import java.util.List;

public class WatermarkInfo implements Parcelable {
    public static final Creator<WatermarkInfo> CREATOR = new Creator<WatermarkInfo>() {
        public WatermarkInfo createFromParcel(Parcel parcel) {
            return new WatermarkInfo(parcel);
        }

        public WatermarkInfo[] newArray(int i) {
            return new WatermarkInfo[i];
        }
    };
    public String bgPost;
    public float[] bgPostRect;
    public float height;
    public String icon;
    public String name;
    public float offsetX;
    public float offsetY;
    public List<TextPieceInfo> textPieceList;
    public int version;
    public float width;

    public static class TextPieceInfo implements Parcelable {
        public static final Creator<TextPieceInfo> CREATOR = new Creator<TextPieceInfo>() {
            public TextPieceInfo createFromParcel(Parcel parcel) {
                return new TextPieceInfo(parcel);
            }

            public TextPieceInfo[] newArray(int i) {
                return new TextPieceInfo[i];
            }
        };
        public int align;
        String font;
        public float[] frameRect;
        public boolean isBold;
        int isVerticalText;
        public float letterSpacing;
        public int lines;
        public float minSize;
        public float size;
        public String text;

        public TextPieceInfo() {
        }

        protected TextPieceInfo(Parcel parcel) {
            this.frameRect = parcel.createFloatArray();
            this.text = parcel.readString();
            this.size = parcel.readFloat();
            this.minSize = parcel.readFloat();
            this.isVerticalText = parcel.readInt();
            this.font = parcel.readString();
            this.align = parcel.readInt();
            this.letterSpacing = parcel.readFloat();
            this.isBold = parcel.readByte() != 0;
            this.lines = parcel.readInt();
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeFloatArray(this.frameRect);
            parcel.writeString(this.text);
            parcel.writeFloat(this.size);
            parcel.writeFloat(this.minSize);
            parcel.writeInt(this.isVerticalText);
            parcel.writeString(this.font);
            parcel.writeInt(this.align);
            parcel.writeFloat(this.letterSpacing);
            parcel.writeByte(this.isBold ? (byte) 1 : 0);
            parcel.writeInt(this.lines);
        }
    }

    protected WatermarkInfo(Parcel parcel) {
        this.width = parcel.readFloat();
        this.height = parcel.readFloat();
        this.version = parcel.readInt();
        this.offsetX = parcel.readFloat();
        this.offsetY = parcel.readFloat();
        this.icon = parcel.readString();
        this.bgPost = parcel.readString();
        this.bgPostRect = parcel.createFloatArray();
        this.name = parcel.readString();
        this.textPieceList = ParcelableGenericUtils.readList(parcel);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeFloat(this.width);
        parcel.writeFloat(this.height);
        parcel.writeInt(this.version);
        parcel.writeFloat(this.offsetX);
        parcel.writeFloat(this.offsetY);
        parcel.writeString(this.icon);
        parcel.writeString(this.bgPost);
        parcel.writeFloatArray(this.bgPostRect);
        parcel.writeString(this.name);
        ParcelableGenericUtils.writeList(parcel, i, this.textPieceList);
    }
}
