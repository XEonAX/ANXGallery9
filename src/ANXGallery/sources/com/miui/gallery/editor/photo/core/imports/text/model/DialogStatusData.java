package com.miui.gallery.editor.photo.core.imports.text.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.imports.text.dialog.BaseDialogModel;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout.TextAlignment;
import com.miui.gallery.editor.photo.core.imports.text.watermark.WatermarkInfo;
import com.miui.gallery.editor.photo.core.imports.text.watermark.WatermarkInfo.TextPieceInfo;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelableGenericUtils;

public class DialogStatusData extends TextStatusData implements Parcelable {
    public static final Creator<DialogStatusData> CREATOR = new Creator<DialogStatusData>() {
        public DialogStatusData createFromParcel(Parcel parcel) {
            return new DialogStatusData(parcel);
        }

        public DialogStatusData[] newArray(int i) {
            return new DialogStatusData[i];
        }
    };
    public boolean isReverseColor;
    public float itemDegree;
    public float itemPositionX;
    public float itemPositionY;
    public float itemScale;
    public TextStatusData[] textStatusDatas;

    public DialogStatusData() {
    }

    protected DialogStatusData(Parcel parcel) {
        this.itemPositionX = parcel.readFloat();
        this.itemPositionY = parcel.readFloat();
        this.itemScale = parcel.readFloat();
        this.itemDegree = parcel.readFloat();
        this.isReverseColor = parcel.readByte() != 0;
        this.textStatusDatas = (TextStatusData[]) ParcelableGenericUtils.readArray(parcel);
    }

    public void configSelfByInit(BaseDialogModel baseDialogModel) {
        if (baseDialogModel == null || !baseDialogModel.hasDialog()) {
            this.color = -1;
            this.textAlignment = TextAlignment.LEFT;
            this.textShadow = true;
        } else if (baseDialogModel.isCorner) {
            this.color = -1;
            this.textAlignment = TextAlignment.LEFT;
            this.textShadow = true;
        } else {
            this.color = -16777216;
            this.textAlignment = TextAlignment.CENTER;
            this.textShadow = false;
        }
        this.transparentProgress = 0.0f;
        this.textStyle = null;
        this.textBold = false;
        this.itemScale = 1.0f;
        this.itemDegree = 0.0f;
        this.itemPositionX = 0.0f;
        this.itemPositionY = 0.0f;
    }

    public int describeContents() {
        return 0;
    }

    public void setEmpty() {
        this.color = -1;
        this.textAlignment = TextAlignment.LEFT;
        this.transparentProgress = 0.0f;
        this.textStyle = null;
        this.textBold = false;
        this.textShadow = false;
        this.itemScale = 1.0f;
        this.itemDegree = 0.0f;
        this.itemPositionX = 0.0f;
        this.itemPositionY = 0.0f;
        this.textStatusDatas = new TextStatusData[0];
    }

    public void watermarkInitSelf(WatermarkInfo watermarkInfo) {
        if (watermarkInfo == null || watermarkInfo.textPieceList == null) {
            setEmpty();
            return;
        }
        this.textStatusDatas = new TextStatusData[watermarkInfo.textPieceList.size()];
        for (int i = 0; i < this.textStatusDatas.length; i++) {
            TextStatusData textStatusData = new TextStatusData();
            textStatusData.textBold = ((TextPieceInfo) watermarkInfo.textPieceList.get(i)).isBold;
            textStatusData.color = -1;
            textStatusData.textAlignment = TextAlignment.LEFT;
            textStatusData.transparentProgress = 0.0f;
            textStatusData.textStyle = null;
            textStatusData.textShadow = false;
            this.textStatusDatas[i] = textStatusData;
        }
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeFloat(this.itemPositionX);
        parcel.writeFloat(this.itemPositionY);
        parcel.writeFloat(this.itemScale);
        parcel.writeFloat(this.itemDegree);
        parcel.writeByte(this.isReverseColor ? (byte) 1 : 0);
        ParcelableGenericUtils.writeArray(parcel, i, this.textStatusDatas, TextStatusData.class);
    }
}
