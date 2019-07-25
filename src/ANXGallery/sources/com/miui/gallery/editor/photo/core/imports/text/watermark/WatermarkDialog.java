package com.miui.gallery.editor.photo.core.imports.text.watermark;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PaintFlagsDrawFilter;
import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import android.view.View;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.editor.photo.core.imports.text.base.ITextDialogConfig;
import com.miui.gallery.editor.photo.core.imports.text.dialog.BaseDialogModel;
import com.miui.gallery.editor.photo.core.imports.text.model.DialogStatusData;
import com.miui.gallery.editor.photo.core.imports.text.model.TextStatusData;
import com.miui.gallery.editor.photo.core.imports.text.typeface.TextStyle;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout.TextAlignment;
import com.miui.gallery.editor.photo.core.imports.text.watermark.WatermarkInfo.TextPieceInfo;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelableGenericUtils;
import com.miui.gallery.util.ScreenUtils;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import java.util.ArrayList;
import java.util.List;

public class WatermarkDialog implements Parcelable, ITextDialogConfig {
    public static final Creator<WatermarkDialog> CREATOR = new Creator<WatermarkDialog>() {
        public WatermarkDialog createFromParcel(Parcel parcel) {
            return new WatermarkDialog(parcel);
        }

        public WatermarkDialog[] newArray(int i) {
            return new WatermarkDialog[i];
        }
    };
    private boolean mActivation;
    /* access modifiers changed from: private */
    public Bitmap mBgBitmap;
    /* access modifiers changed from: private */
    public Paint mBgPaint;
    private RectF mBgPostRect;
    private float mBitmapHeight;
    /* access modifiers changed from: private */
    public BitmapLoadingListener mBitmapLoadingListener;
    private float mBitmapWidth;
    private int mCurrentPieceIndex;
    private float mDefaultLocationX;
    private float mDefaultLocationY;
    private DialogStatusData mDialogStatusData;
    private boolean mIsCorrection;
    private boolean mIsFirstCount;
    private boolean mIsFromParcel;
    private Matrix mMatrix;
    private RectF mOutLineRect;
    private int mPaddingTop;
    private Resources mResource;
    private boolean mReverseColor;
    private float mRotateDegrees;
    private float mScaleMultipleOrigin;
    private RectF mTemRect;
    private float mUserLocationX;
    private float mUserLocationY;
    private float mUserScaleMultiple;
    private WatermarkInfo mWatermarkInfo;
    private List<WatermarkTextPiece> mWatermarkTextPieces;
    private ImageLoadingListener mbgPostLoadingListener;

    public interface BitmapLoadingListener {
        void onCompleted();
    }

    private WatermarkDialog() {
        this.mIsFirstCount = true;
        this.mDefaultLocationX = -1.0f;
        this.mDefaultLocationY = -1.0f;
        this.mbgPostLoadingListener = new ImageLoadingListener() {
            public void onLoadingCancelled(String str, View view) {
            }

            public void onLoadingComplete(String str, View view, Bitmap bitmap) {
                WatermarkDialog.this.mBgBitmap = bitmap;
                WatermarkDialog.this.mBgPaint = new Paint(1);
                WatermarkDialog.this.mBgPaint.setAntiAlias(true);
                if (WatermarkDialog.this.mBitmapLoadingListener != null) {
                    WatermarkDialog.this.mBitmapLoadingListener.onCompleted();
                }
            }

            public void onLoadingFailed(String str, View view, FailReason failReason) {
            }

            public void onLoadingStarted(String str, View view) {
            }
        };
    }

    public WatermarkDialog(Resources resources, WatermarkInfo watermarkInfo, float f) {
        this.mIsFirstCount = true;
        this.mDefaultLocationX = -1.0f;
        this.mDefaultLocationY = -1.0f;
        this.mbgPostLoadingListener = new ImageLoadingListener() {
            public void onLoadingCancelled(String str, View view) {
            }

            public void onLoadingComplete(String str, View view, Bitmap bitmap) {
                WatermarkDialog.this.mBgBitmap = bitmap;
                WatermarkDialog.this.mBgPaint = new Paint(1);
                WatermarkDialog.this.mBgPaint.setAntiAlias(true);
                if (WatermarkDialog.this.mBitmapLoadingListener != null) {
                    WatermarkDialog.this.mBitmapLoadingListener.onCompleted();
                }
            }

            public void onLoadingFailed(String str, View view, FailReason failReason) {
            }

            public void onLoadingStarted(String str, View view) {
            }
        };
        this.mResource = resources;
        this.mWatermarkInfo = watermarkInfo;
        setScaleMultipleOrigin(f);
    }

    protected WatermarkDialog(Parcel parcel) {
        this();
        this.mDialogStatusData = (DialogStatusData) ParcelableGenericUtils.readObject(parcel);
        this.mWatermarkInfo = (WatermarkInfo) ParcelableGenericUtils.readObject(parcel);
        this.mScaleMultipleOrigin = parcel.readFloat();
        this.mDefaultLocationX = parcel.readFloat();
        this.mDefaultLocationY = parcel.readFloat();
        this.mIsFromParcel = true;
        this.mResource = GalleryApp.sGetAndroidContext().getResources();
        init();
        countLocation(true, 0.0f);
    }

    private void canvasTranslate(Canvas canvas, boolean z, boolean z2) {
        canvas.translate(this.mDefaultLocationX + this.mUserLocationX, this.mDefaultLocationY + this.mUserLocationY);
        if (z) {
            canvas.scale(getScaleMultiple(), getScaleMultiple(), 0.0f, 0.0f);
        }
        if (z2) {
            canvas.rotate(getRotateDegrees(), 0.0f, 0.0f);
        }
    }

    private float getScaleMultiple() {
        return this.mUserScaleMultiple * this.mScaleMultipleOrigin;
    }

    private void getTransRect(RectF rectF, RectF rectF2) {
        rectF2.set(rectF);
        rectF2.inset(-(((rectF.width() * getScaleMultiple()) - rectF.width()) / 2.0f), -(((rectF.height() * getScaleMultiple()) - rectF.height()) / 2.0f));
        offsetRect(rectF2);
    }

    private void offsetRect(RectF rectF) {
        rectF.offset(this.mDefaultLocationX + this.mUserLocationX, this.mDefaultLocationY + this.mUserLocationY);
    }

    public void appendUserLocationX(float f) {
        this.mUserLocationX += f;
    }

    public void appendUserLocationY(float f) {
        this.mUserLocationY += f;
    }

    public boolean contains(float f, float f2) {
        getOutLineRect(this.mTemRect);
        this.mMatrix.reset();
        this.mMatrix.postRotate(-getRotateDegrees(), this.mTemRect.centerX(), this.mTemRect.centerY());
        float[] fArr = {f, f2};
        this.mMatrix.mapPoints(fArr);
        boolean contains = this.mTemRect.contains(fArr[0], fArr[1]);
        this.mCurrentPieceIndex = 0;
        if (this.mWatermarkTextPieces.size() > 1) {
            this.mCurrentPieceIndex = -1;
            int i = 0;
            float f3 = Float.MAX_VALUE;
            while (true) {
                if (i >= this.mWatermarkTextPieces.size()) {
                    break;
                }
                getTransRect(((WatermarkTextPiece) this.mWatermarkTextPieces.get(i)).getOutlineRect(), this.mTemRect);
                if (this.mTemRect.contains(fArr[0], fArr[1])) {
                    this.mCurrentPieceIndex = i;
                    break;
                }
                float pow = (float) (Math.pow((double) (fArr[0] - this.mTemRect.centerX()), 2.0d) + Math.pow((double) (fArr[1] - this.mTemRect.centerY()), 2.0d));
                if (pow < f3) {
                    this.mCurrentPieceIndex = i;
                    f3 = pow;
                }
                i++;
            }
        }
        return contains;
    }

    public void countLocation(boolean z, float f) {
        if (this.mIsFirstCount) {
            for (WatermarkTextPiece watermarkTextPiece : this.mWatermarkTextPieces) {
                watermarkTextPiece.configTextPaint();
                watermarkTextPiece.countTextInDialog();
            }
            this.mIsFirstCount = false;
            return;
        }
        for (WatermarkTextPiece watermarkTextPiece2 : this.mWatermarkTextPieces) {
            watermarkTextPiece2.configTextPaint();
            if (z) {
                watermarkTextPiece2.countTextInDialog();
            }
        }
    }

    public int describeContents() {
        return 0;
    }

    public void draw(Canvas canvas) {
        canvas.save();
        canvasTranslate(canvas, true, true);
        if (!(this.mBgBitmap == null || this.mWatermarkInfo.bgPostRect == null)) {
            canvas.setDrawFilter(new PaintFlagsDrawFilter(0, 3));
            canvas.drawBitmap(this.mBgBitmap, null, this.mBgPostRect, this.mBgPaint);
        }
        for (WatermarkTextPiece draw : this.mWatermarkTextPieces) {
            draw.draw(canvas);
        }
        canvas.restore();
    }

    public int getColor() {
        return ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).getColor();
    }

    public BaseDialogModel getDialogModel() {
        return null;
    }

    public void getDialogStatusData(DialogStatusData dialogStatusData) {
        dialogStatusData.itemPositionX = getUserLocationX();
        dialogStatusData.itemPositionY = getUserLocationY();
        dialogStatusData.itemScale = getUserScaleMultiple();
        dialogStatusData.itemDegree = getRotateDegrees();
        dialogStatusData.textStatusDatas = new TextStatusData[this.mWatermarkTextPieces.size()];
        dialogStatusData.isReverseColor = this.mReverseColor;
        for (int i = 0; i < dialogStatusData.textStatusDatas.length; i++) {
            WatermarkTextPiece watermarkTextPiece = (WatermarkTextPiece) this.mWatermarkTextPieces.get(i);
            TextStatusData textStatusData = new TextStatusData();
            textStatusData.color = watermarkTextPiece.getColor();
            textStatusData.transparentProgress = watermarkTextPiece.getTextTransparent();
            textStatusData.textStyle = watermarkTextPiece.getTextStyle();
            textStatusData.textBold = watermarkTextPiece.isBoldText();
            textStatusData.textShadow = watermarkTextPiece.isShadow();
            textStatusData.textAlignment = watermarkTextPiece.getTextAlignment();
            textStatusData.text = watermarkTextPiece.getText();
            dialogStatusData.textStatusDatas[i] = textStatusData;
        }
    }

    public void getOutLineRect(RectF rectF) {
        getTransRect(this.mOutLineRect, rectF);
    }

    public float getRotateDegrees() {
        float f = this.mRotateDegrees;
        if (f < 0.0f) {
            f += 360.0f;
        }
        float f2 = f % 360.0f;
        this.mIsCorrection = false;
        if (f2 > 0.0f && f2 < 5.0f) {
            this.mIsCorrection = true;
            f2 = 0.0f;
        }
        if (f2 > 355.0f) {
            this.mIsCorrection = true;
            f2 = 0.0f;
        }
        if (f2 != 90.0f && f2 > 85.0f && f2 < 95.0f) {
            this.mIsCorrection = true;
            f2 = 90.0f;
        }
        if (f2 != 180.0f && f2 > 175.0f && f2 < 185.0f) {
            this.mIsCorrection = true;
            f2 = 180.0f;
        }
        if (f2 == 270.0f || f2 <= 265.0f || f2 >= 275.0f) {
            return f2;
        }
        this.mIsCorrection = true;
        return 270.0f;
    }

    public String getSampleName() {
        StringBuilder sb = new StringBuilder();
        sb.append("watermark_");
        sb.append(this.mWatermarkInfo.name);
        return sb.toString();
    }

    public String getText() {
        return ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).getText();
    }

    public TextAlignment getTextAlignment() {
        return ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).getTextAlignment();
    }

    public TextStyle getTextStyle() {
        return ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).getTextStyle();
    }

    public float getTextTransparent() {
        return ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).getTextTransparent();
    }

    public float getUserLocationX() {
        return this.mUserLocationX;
    }

    public float getUserLocationY() {
        return this.mUserLocationY;
    }

    public float getUserScaleMultiple() {
        return this.mUserScaleMultiple;
    }

    public void init() {
        Resources resources = this.mResource;
        this.mWatermarkTextPieces = new ArrayList();
        float dpToPixel = ScreenUtils.dpToPixel(this.mWatermarkInfo.width);
        float dpToPixel2 = ScreenUtils.dpToPixel(this.mWatermarkInfo.height);
        for (TextPieceInfo textPieceInfo : this.mWatermarkInfo.textPieceList) {
            List<WatermarkTextPiece> list = this.mWatermarkTextPieces;
            WatermarkTextPiece watermarkTextPiece = new WatermarkTextPiece(resources, textPieceInfo, dpToPixel, dpToPixel2, this.mScaleMultipleOrigin);
            list.add(watermarkTextPiece);
        }
        if (!TextUtils.isEmpty(this.mWatermarkInfo.bgPost)) {
            if (this.mIsFromParcel) {
                this.mBgBitmap = ImageLoader.getInstance().loadImageSync(this.mWatermarkInfo.bgPost);
                this.mBgPaint = new Paint(1);
            } else {
                ImageLoader.getInstance().loadImage(this.mWatermarkInfo.bgPost, this.mbgPostLoadingListener);
            }
        }
        this.mUserLocationX = 0.0f;
        this.mUserLocationY = 0.0f;
        this.mUserScaleMultiple = 1.0f;
        this.mRotateDegrees = 0.0f;
        this.mIsCorrection = false;
        float f = (-dpToPixel) / 2.0f;
        float f2 = (-dpToPixel2) / 2.0f;
        this.mOutLineRect = new RectF(f, f2, dpToPixel / 2.0f, dpToPixel2 / 2.0f);
        this.mTemRect = new RectF();
        this.mMatrix = new Matrix();
        if (this.mWatermarkInfo.bgPostRect != null) {
            this.mBgPostRect = new RectF(ScreenUtils.dpToPixel(this.mWatermarkInfo.bgPostRect[0]), ScreenUtils.dpToPixel(this.mWatermarkInfo.bgPostRect[1]), ScreenUtils.dpToPixel(this.mWatermarkInfo.bgPostRect[2]), ScreenUtils.dpToPixel(this.mWatermarkInfo.bgPostRect[3]));
            this.mBgPostRect.offset(f, f2);
        }
        if (this.mIsFromParcel) {
            setDialogWithStatusData(this.mDialogStatusData);
            this.mIsFromParcel = false;
        }
    }

    public boolean isActivation() {
        return this.mActivation;
    }

    public boolean isBoldText() {
        return ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).isBoldText();
    }

    public boolean isDialogEnable() {
        return false;
    }

    public boolean isReverseColor() {
        return this.mReverseColor;
    }

    public boolean isShadow() {
        return ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).isShadow();
    }

    public boolean isWatermark() {
        return true;
    }

    public void refreshRotateDegree() {
        this.mRotateDegrees = getRotateDegrees();
    }

    public void reverseColor(int i) {
        this.mReverseColor = !this.mReverseColor;
        for (WatermarkTextPiece color : this.mWatermarkTextPieces) {
            color.setColor(i);
        }
    }

    public void setActivation(boolean z) {
        this.mActivation = z;
    }

    public void setBitmapLoadingListener(BitmapLoadingListener bitmapLoadingListener) {
        this.mBitmapLoadingListener = bitmapLoadingListener;
    }

    public void setBitmapSize(float f, float f2) {
        this.mBitmapWidth = f;
        this.mBitmapHeight = f2;
    }

    public void setBoldText(boolean z) {
        ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).setBoldText(z);
    }

    public void setColor(int i) {
        ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).setColor(i);
    }

    public void setDialogModel(BaseDialogModel baseDialogModel, Resources resources) {
    }

    public void setDialogWithStatusData(DialogStatusData dialogStatusData) {
        if (dialogStatusData.textStatusDatas != null) {
            int i = 0;
            while (i < dialogStatusData.textStatusDatas.length && i < this.mWatermarkTextPieces.size()) {
                WatermarkTextPiece watermarkTextPiece = (WatermarkTextPiece) this.mWatermarkTextPieces.get(i);
                TextStatusData textStatusData = dialogStatusData.textStatusDatas[i];
                watermarkTextPiece.setColor(textStatusData.color);
                watermarkTextPiece.setTextTransparent(textStatusData.transparentProgress);
                watermarkTextPiece.setTextStyle(textStatusData.textStyle);
                watermarkTextPiece.setBoldText(textStatusData.textBold);
                watermarkTextPiece.setShadow(textStatusData.textShadow);
                if (!TextUtils.isEmpty(textStatusData.text)) {
                    watermarkTextPiece.setText(textStatusData.text);
                }
                watermarkTextPiece.setTextAlignment(textStatusData.textAlignment);
                i++;
            }
        } else {
            setColor(dialogStatusData.color);
            setTextTransparent(dialogStatusData.transparentProgress);
            setTextStyle(dialogStatusData.textStyle);
            setBoldText(dialogStatusData.textBold);
            setShadow(dialogStatusData.textShadow);
            setTextAlignment(dialogStatusData.textAlignment);
        }
        setUserLocationX(dialogStatusData.itemPositionX);
        setUserLocationY(dialogStatusData.itemPositionY);
        setUserScaleMultiple(dialogStatusData.itemScale);
        setRotateDegrees(dialogStatusData.itemDegree);
        this.mReverseColor = dialogStatusData.isReverseColor;
    }

    public void setDisplaySize(float f, float f2) {
        this.mDefaultLocationX = f / 2.0f;
        this.mDefaultLocationY = f2 / 2.0f;
        if (this.mWatermarkInfo.offsetX > 0.0f) {
            this.mDefaultLocationX = ScreenUtils.dpToPixel(this.mWatermarkInfo.offsetX);
            this.mDefaultLocationX += (f - this.mBitmapWidth) / 2.0f;
        } else if (this.mWatermarkInfo.offsetX < 0.0f) {
            this.mDefaultLocationX = ScreenUtils.dpToPixel(this.mWatermarkInfo.offsetX) + f;
            this.mDefaultLocationX -= (f - this.mBitmapWidth) / 2.0f;
        }
        if (this.mWatermarkInfo.offsetY > 0.0f) {
            this.mDefaultLocationY = ScreenUtils.dpToPixel(this.mWatermarkInfo.offsetY);
            this.mDefaultLocationY += (f2 - this.mBitmapHeight) / 2.0f;
            this.mDefaultLocationY += (float) (this.mPaddingTop / 2);
        } else if (this.mWatermarkInfo.offsetY < 0.0f) {
            this.mDefaultLocationY = ScreenUtils.dpToPixel(this.mWatermarkInfo.offsetY) + f2;
            this.mDefaultLocationY -= (f2 - this.mBitmapHeight) / 2.0f;
            this.mDefaultLocationY += (float) (this.mPaddingTop / 2);
        }
    }

    public void setDrawOutline(boolean z) {
        for (WatermarkTextPiece drawOutline : this.mWatermarkTextPieces) {
            drawOutline.setDrawOutline(z);
        }
    }

    public void setPaddingTop(int i) {
        this.mPaddingTop = i;
    }

    public void setRotateDegrees(float f) {
        this.mRotateDegrees = f;
    }

    public void setScaleMultipleOrigin(float f) {
        this.mScaleMultipleOrigin = f;
        if (this.mScaleMultipleOrigin > 1.0f) {
            this.mScaleMultipleOrigin = 1.0f;
        }
        if (this.mScaleMultipleOrigin < 0.3f) {
            this.mScaleMultipleOrigin = 0.3f;
        }
    }

    public void setShadow(boolean z) {
        ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).setShadow(z);
    }

    public void setText(String str) {
        ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).setText(str);
    }

    public void setTextAlignment(TextAlignment textAlignment) {
        ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).setTextAlignment(textAlignment);
    }

    public void setTextStyle(TextStyle textStyle) {
        ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).setTextStyle(textStyle);
    }

    public void setTextTransparent(float f) {
        ((WatermarkTextPiece) this.mWatermarkTextPieces.get(this.mCurrentPieceIndex)).setTextTransparent(f);
    }

    public void setUserLocationX(float f) {
        this.mUserLocationX = f;
    }

    public void setUserLocationY(float f) {
        this.mUserLocationY = f;
    }

    public void setUserScaleMultiple(float f) {
        this.mUserScaleMultiple = f;
        if (this.mUserScaleMultiple < 0.3f) {
            this.mUserScaleMultiple = 0.3f;
        }
        if (this.mUserScaleMultiple > 5.0f) {
            this.mUserScaleMultiple = 5.0f;
        }
    }

    public void toggleMirror() {
    }

    public void writeToParcel(Parcel parcel, int i) {
        DialogStatusData dialogStatusData = new DialogStatusData();
        getDialogStatusData(dialogStatusData);
        ParcelableGenericUtils.writeObject(parcel, i, dialogStatusData);
        ParcelableGenericUtils.writeObject(parcel, i, this.mWatermarkInfo);
        parcel.writeFloat(this.mScaleMultipleOrigin);
        parcel.writeFloat(this.mDefaultLocationX);
        parcel.writeFloat(this.mDefaultLocationY);
    }
}
