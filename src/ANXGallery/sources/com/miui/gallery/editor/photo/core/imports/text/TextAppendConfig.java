package com.miui.gallery.editor.photo.core.imports.text;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.imports.text.base.ITextDialogConfig;
import com.miui.gallery.editor.photo.core.imports.text.dialog.BaseDialogModel;
import com.miui.gallery.editor.photo.core.imports.text.model.DialogStatusData;
import com.miui.gallery.editor.photo.core.imports.text.typeface.TextStyle;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout.TextAlignment;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelableGenericUtils;
import com.miui.gallery.util.Log;
import com.nexstreaming.nexeditorsdk.nexClip;

public class TextAppendConfig implements Parcelable, ITextDialogConfig {
    public static final Creator<TextAppendConfig> CREATOR = new Creator<TextAppendConfig>() {
        public TextAppendConfig createFromParcel(Parcel parcel) {
            return new TextAppendConfig(parcel);
        }

        public TextAppendConfig[] newArray(int i) {
            return new TextAppendConfig[i];
        }
    };
    /* access modifiers changed from: private */
    public AutoLineLayout mAutoLineLayout;
    /* access modifiers changed from: private */
    public int mColor;
    private Context mContext;
    private final int mCornerDialogWidth;
    private final int mCorrectionDegrees;
    private final float mCountSizeSpacing;
    /* access modifiers changed from: private */
    public float mDefaultLocationX;
    /* access modifiers changed from: private */
    public float mDefaultLocationY;
    private final int mDefaultStrokeWidth;
    private final float mDefaultTextSize;
    /* access modifiers changed from: private */
    public Drawable mDialogDrawable;
    private BaseDialogModel mDialogModel;
    private final int mDialogOutLineOffsetX;
    private final int mDialogOutLineOffsetY;
    /* access modifiers changed from: private */
    public RectF mDialogRect;
    private final int mDialogWidth;
    private boolean mIsActivation;
    private boolean mIsBoldText;
    private boolean mIsCorrection;
    /* access modifiers changed from: private */
    public boolean mIsMirror;
    private boolean mIsRTL;
    private boolean mIsShadow;
    private Matrix mMatrix;
    private final float mMaxTextSize;
    private float mMaxWidth;
    private final int mMinTextSize;
    private final int mOutLineOffsetX;
    private final int mOutLineOffsetY;
    private RectF mOutLineRect;
    private float mRotateDegrees;
    private float mScaleMultipleOrigin;
    private RectF mTemRect;
    /* access modifiers changed from: private */
    public String mText;
    private final float mTextAppendPadding;
    private TextDrawable mTextDrawable;
    /* access modifiers changed from: private */
    public RectF mTextInDialogRect;
    private RectF mTextRect;
    private TextStyle mTextStyle;
    private float mTextTransparent;
    /* access modifiers changed from: private */
    public float mUserLocationX;
    /* access modifiers changed from: private */
    public float mUserLocationY;
    private float mUserScaleMultiple;

    private class TextDrawable extends Drawable {
        private Rect rectTemp;

        private TextDrawable() {
            this.rectTemp = new Rect();
        }

        private void canvasTranslate(Canvas canvas, boolean z, boolean z2) {
            canvas.translate(TextAppendConfig.this.mDefaultLocationX + TextAppendConfig.this.mUserLocationX, TextAppendConfig.this.mDefaultLocationY + TextAppendConfig.this.mUserLocationY);
            if (z) {
                canvas.scale(TextAppendConfig.this.getScaleMultiple(), TextAppendConfig.this.getScaleMultiple(), 0.0f, 0.0f);
            }
            if (z2) {
                canvas.rotate(TextAppendConfig.this.getRotateDegrees(), 0.0f, 0.0f);
            }
        }

        private void drawDialog(Canvas canvas) {
            if (TextAppendConfig.this.mDialogDrawable != null) {
                TextAppendConfig.this.mDialogRect.round(this.rectTemp);
                TextAppendConfig.this.mDialogDrawable.setBounds(this.rectTemp);
                canvas.save();
                canvasTranslate(canvas, true, true);
                if (TextAppendConfig.this.mIsMirror) {
                    canvas.scale(-1.0f, 1.0f);
                }
                if (TextAppendConfig.this.isCornerDialog()) {
                    TextAppendConfig.this.mDialogDrawable.setColorFilter(TextAppendConfig.this.mColor, Mode.SRC_IN);
                }
                TextAppendConfig.this.mDialogDrawable.draw(canvas);
                canvas.restore();
            }
        }

        private void drawText(Canvas canvas) {
            if (!TextUtils.isEmpty(TextAppendConfig.this.mText)) {
                canvas.save();
                canvasTranslate(canvas, true, true);
                if (TextAppendConfig.this.isDialogEnable()) {
                    if (TextAppendConfig.this.mIsMirror) {
                        canvas.translate(-TextAppendConfig.this.mTextInDialogRect.centerX(), TextAppendConfig.this.mTextInDialogRect.centerY());
                    } else {
                        canvas.translate(TextAppendConfig.this.mTextInDialogRect.centerX(), TextAppendConfig.this.mTextInDialogRect.centerY());
                    }
                }
                TextAppendConfig.this.mAutoLineLayout.draw(canvas);
                canvas.restore();
            }
        }

        private void initCanvas(Canvas canvas) {
            if (TextAppendConfig.this.mDefaultLocationX < 0.0f) {
                TextAppendConfig.this.mDefaultLocationX = ((float) canvas.getWidth()) / 2.0f;
            }
            if (TextAppendConfig.this.mDefaultLocationY < 0.0f) {
                TextAppendConfig.this.mDefaultLocationY = ((float) canvas.getHeight()) / 2.0f;
            }
        }

        public void draw(Canvas canvas) {
            initCanvas(canvas);
            if (!TextAppendConfig.this.isDialogEnable()) {
                drawText(canvas);
                return;
            }
            drawDialog(canvas);
            drawText(canvas);
        }

        public int getOpacity() {
            return -3;
        }

        public void setAlpha(int i) {
        }

        public void setColorFilter(ColorFilter colorFilter) {
        }
    }

    public TextAppendConfig(Context context) {
        this.mIsRTL = false;
        this.mContext = context;
        Resources resources = context.getResources();
        if (resources.getConfiguration().getLayoutDirection() == 1) {
            this.mIsRTL = true;
        }
        this.mOutLineOffsetX = resources.getDimensionPixelSize(R.dimen.text_append_out_line_offset_x);
        this.mOutLineOffsetY = resources.getDimensionPixelSize(R.dimen.text_append_out_line_offset_y);
        this.mDialogOutLineOffsetX = resources.getDimensionPixelSize(R.dimen.text_append_dialog_out_line_offset_x);
        this.mDialogOutLineOffsetY = resources.getDimensionPixelSize(R.dimen.text_append_dialog_out_line_offset_y);
        this.mDialogWidth = resources.getDimensionPixelSize(R.dimen.text_append_dialog_bg_default_width);
        this.mCornerDialogWidth = resources.getDimensionPixelSize(R.dimen.text_append_corner_dialog_default_width);
        this.mMinTextSize = resources.getDimensionPixelSize(R.dimen.text_append_min_text_size);
        this.mDefaultStrokeWidth = resources.getDimensionPixelSize(R.dimen.text_append_default_stroke_width);
        this.mCorrectionDegrees = 5;
        this.mDefaultTextSize = resources.getDimension(R.dimen.text_append_default_text_size);
        this.mMaxTextSize = resources.getDimension(R.dimen.text_append_max_text_size);
        this.mCountSizeSpacing = resources.getDisplayMetrics().density;
        this.mTextAppendPadding = resources.getDimension(R.dimen.text_append_padding);
        this.mColor = -1;
        this.mTextStyle = null;
        if (this.mText == null) {
            this.mText = resources.getString(R.string.text_append_hint);
        }
        this.mIsActivation = false;
        this.mTextTransparent = 0.0f;
        this.mIsBoldText = false;
        this.mIsShadow = false;
        this.mDefaultLocationX = -1.0f;
        this.mDefaultLocationY = -1.0f;
        this.mUserLocationX = 0.0f;
        this.mUserLocationY = 0.0f;
        this.mUserScaleMultiple = 1.0f;
        this.mScaleMultipleOrigin = 1.0f;
        this.mRotateDegrees = 0.0f;
        this.mIsMirror = false;
        this.mIsCorrection = false;
        this.mAutoLineLayout = new AutoLineLayout();
        this.mAutoLineLayout.getPaint().setTextSize(this.mDefaultTextSize);
        this.mAutoLineLayout.setLineHeightOffset(resources.getDimension(R.dimen.text_append_line_height_offset));
        this.mOutLineRect = new RectF();
        this.mTextRect = new RectF();
        this.mTextInDialogRect = new RectF();
        this.mDialogRect = new RectF();
        this.mTemRect = new RectF();
        this.mMatrix = new Matrix();
        this.mTextDrawable = new TextDrawable();
        this.mAutoLineLayout.setTextAlignment(this.mIsRTL ? TextAlignment.RIGHT : TextAlignment.LEFT);
    }

    protected TextAppendConfig(Parcel parcel) {
        this(GalleryApp.sGetAndroidContext());
        this.mDialogModel = (BaseDialogModel) ParcelableGenericUtils.readObject(parcel);
        this.mColor = parcel.readInt();
        this.mTextStyle = (TextStyle) ParcelableGenericUtils.readObject(parcel);
        this.mText = parcel.readString();
        boolean z = false;
        this.mIsActivation = parcel.readByte() != 0;
        this.mTextTransparent = parcel.readFloat();
        this.mIsBoldText = parcel.readByte() != 0;
        this.mIsShadow = parcel.readByte() != 0;
        this.mDefaultLocationX = parcel.readFloat();
        this.mDefaultLocationY = parcel.readFloat();
        this.mUserLocationX = parcel.readFloat();
        this.mUserLocationY = parcel.readFloat();
        this.mUserScaleMultiple = parcel.readFloat();
        this.mScaleMultipleOrigin = parcel.readFloat();
        this.mRotateDegrees = parcel.readFloat();
        this.mIsMirror = parcel.readByte() != 0;
        if (parcel.readByte() != 0) {
            z = true;
        }
        this.mIsCorrection = z;
        this.mAutoLineLayout.setTextAlignment(TextAlignment.values()[parcel.readInt()]);
        this.mMaxWidth = parcel.readFloat();
        initForParcelable();
    }

    private void configTextPaint(Paint paint) {
        paint.setColor(this.mColor);
        paint.setTypeface(this.mTextStyle == null ? Typeface.DEFAULT : this.mTextStyle.getTypeFace());
        paint.setAlpha(getAlphaByConfig());
        paint.setFakeBoldText(this.mIsBoldText);
        if (this.mIsShadow) {
            paint.setShadowLayer(1.0f, 1.0f, 1.0f, 1711276032);
        } else {
            paint.clearShadowLayer();
        }
        if (!isDialogEnable() || isCornerDialog()) {
            paint.setTextSize(this.mDefaultTextSize);
        }
    }

    private void countDialog() {
        float intrinsicHeight = (((float) this.mDialogDrawable.getIntrinsicHeight()) * (((float) this.mDialogWidth) / ((float) this.mDialogDrawable.getIntrinsicWidth()))) / 2.0f;
        float f = ((float) this.mDialogWidth) / 2.0f;
        this.mDialogRect.set(-f, -intrinsicHeight, f, intrinsicHeight);
    }

    private void countDialogCorner() {
        this.mAutoLineLayout.getTextRect(this.mTextRect);
        float intrinsicHeight = (((float) this.mDialogDrawable.getIntrinsicHeight()) * (((float) this.mCornerDialogWidth) / ((float) this.mDialogDrawable.getIntrinsicWidth()))) / 2.0f;
        float f = ((float) this.mCornerDialogWidth) / 2.0f;
        float f2 = -f;
        float f3 = -intrinsicHeight;
        this.mDialogRect.set(f2, f3, f, intrinsicHeight);
        float width = this.mTextRect.width() / 2.0f;
        float height = this.mTextRect.height() / 2.0f;
        this.mTextInDialogRect.set(this.mTextRect);
        switch (this.mDialogModel.cornerPosition) {
            case 0:
                this.mDialogRect.offset(-width, -height);
                this.mTextInDialogRect.offset(f, intrinsicHeight);
                return;
            case 1:
                this.mDialogRect.offset(width, -height);
                this.mTextInDialogRect.offset(f2, intrinsicHeight);
                return;
            case 2:
                this.mDialogRect.offset(-width, height);
                this.mTextInDialogRect.offset(f, f3);
                return;
            case 3:
                this.mDialogRect.offset(width, height);
                this.mTextInDialogRect.offset(f2, f3);
                return;
            default:
                return;
        }
    }

    private void countOutLine() {
        this.mAutoLineLayout.getTextRect(this.mTextRect);
        if (!isDialogEnable()) {
            if (TextUtils.isEmpty(this.mText)) {
                this.mTextRect.setEmpty();
                this.mTextRect.inset((float) (-this.mDefaultStrokeWidth), (float) (-this.mDefaultStrokeWidth));
            }
            this.mOutLineRect.set(this.mTextRect);
        } else if (isCornerDialog()) {
            this.mOutLineRect.set(this.mDialogRect);
            this.mOutLineRect.union(this.mTextInDialogRect);
        } else {
            this.mOutLineRect.set(this.mDialogRect);
        }
        if (isDialogEnable()) {
            this.mOutLineRect.inset((float) (-this.mDialogOutLineOffsetX), (float) (-this.mDialogOutLineOffsetY));
        } else {
            this.mOutLineRect.inset((float) (-this.mOutLineOffsetX), (float) (-this.mOutLineOffsetY));
        }
        this.mOutLineRect.inset(-(((this.mOutLineRect.width() * getScaleMultiple()) - this.mOutLineRect.width()) / 2.0f), -(((this.mOutLineRect.height() * getScaleMultiple()) - this.mOutLineRect.height()) / 2.0f));
    }

    private void countTextInDialog() {
        this.mTextInDialogRect.setEmpty();
        if (!TextUtils.isEmpty(this.mText)) {
            this.mAutoLineLayout.setText(this.mText);
            this.mTextInDialogRect.set(this.mDialogRect);
            this.mDialogModel.configRect(this.mTextInDialogRect, false);
            long currentTimeMillis = System.currentTimeMillis();
            this.mAutoLineLayout.countTextArea(this.mTextInDialogRect.width(), this.mTextInDialogRect.height(), (float) this.mMinTextSize, this.mMaxTextSize, this.mCountSizeSpacing);
            Log.d("TextAppendConfig", "测量耗时： %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        }
    }

    private void countTextNormal(float f) {
        this.mAutoLineLayout.setText(this.mText);
        long currentTimeMillis = System.currentTimeMillis();
        this.mAutoLineLayout.countText(f, -1.0f);
        Log.d("TextAppendConfig", "文字计算耗时： %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
    }

    private int getAlphaByConfig() {
        return (int) (255.0f - (this.mTextTransparent * 230.0f));
    }

    private void initForParcelable() {
        if (this.mDialogModel != null) {
            this.mDialogDrawable = this.mDialogModel.readDialogDrawable(this.mContext.getResources());
        }
        countLocation(true, this.mMaxWidth);
    }

    /* access modifiers changed from: private */
    public boolean isCornerDialog() {
        return this.mDialogModel != null && this.mDialogModel.isCorner;
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
        return this.mTemRect.contains(fArr[0], fArr[1]);
    }

    public void countLocation(boolean z, float f) {
        this.mMaxWidth = f;
        float f2 = (f / this.mScaleMultipleOrigin) - this.mTextAppendPadding;
        configTextPaint(this.mAutoLineLayout.getPaint());
        if (!isDialogEnable()) {
            if (z) {
                countTextNormal(f2);
            }
            countOutLine();
        } else if (isCornerDialog()) {
            if (z) {
                countTextNormal(f2);
            }
            countDialogCorner();
            countOutLine();
        } else {
            countDialog();
            if (z) {
                countTextInDialog();
            }
            countOutLine();
        }
    }

    public int describeContents() {
        return 0;
    }

    public void draw(Canvas canvas) {
        if (this.mTextDrawable != null) {
            this.mTextDrawable.draw(canvas);
        }
    }

    public int getColor() {
        return this.mColor;
    }

    public BaseDialogModel getDialogModel() {
        return this.mDialogModel;
    }

    public void getDialogStatusData(DialogStatusData dialogStatusData) {
        dialogStatusData.itemPositionX = getUserLocationX();
        dialogStatusData.itemPositionY = getUserLocationY();
        dialogStatusData.itemScale = getUserScaleMultiple();
        dialogStatusData.itemDegree = getRotateDegrees();
        dialogStatusData.color = getColor();
        dialogStatusData.transparentProgress = getTextTransparent();
        dialogStatusData.textStyle = getTextStyle();
        dialogStatusData.textBold = isBoldText();
        dialogStatusData.textShadow = isShadow();
        dialogStatusData.textAlignment = getTextAlignment();
        dialogStatusData.text = getText();
    }

    public void getOutLineRect(RectF rectF) {
        rectF.set(this.mOutLineRect);
        offsetRect(rectF);
    }

    public float getRotateDegrees() {
        float f = this.mRotateDegrees;
        if (f < 0.0f) {
            f += 360.0f;
        }
        float f2 = f % 360.0f;
        this.mIsCorrection = false;
        if (f2 > 0.0f && f2 < ((float) this.mCorrectionDegrees)) {
            this.mIsCorrection = true;
            f2 = 0.0f;
        }
        if (f2 > ((float) (360 - this.mCorrectionDegrees))) {
            this.mIsCorrection = true;
            f2 = 0.0f;
        }
        if (f2 != 90.0f && f2 > ((float) (90 - this.mCorrectionDegrees)) && f2 < ((float) (this.mCorrectionDegrees + 90))) {
            this.mIsCorrection = true;
            f2 = 90.0f;
        }
        if (f2 != 180.0f && f2 > ((float) (180 - this.mCorrectionDegrees)) && f2 < ((float) (this.mCorrectionDegrees + nexClip.kClip_Rotate_180))) {
            this.mIsCorrection = true;
            f2 = 180.0f;
        }
        if (f2 == 270.0f || f2 <= ((float) (270 - this.mCorrectionDegrees)) || f2 >= ((float) (this.mCorrectionDegrees + nexClip.kClip_Rotate_270))) {
            return f2;
        }
        this.mIsCorrection = true;
        return 270.0f;
    }

    public String getSampleName() {
        if (this.mDialogModel == null) {
            return "dialog_none";
        }
        StringBuilder sb = new StringBuilder();
        sb.append("dialog_");
        sb.append(this.mDialogModel.name);
        return sb.toString();
    }

    public float getScaleMultiple() {
        return this.mUserScaleMultiple * this.mScaleMultipleOrigin;
    }

    public String getText() {
        return this.mText;
    }

    public TextAlignment getTextAlignment() {
        return this.mAutoLineLayout.getTextAlignment();
    }

    public TextStyle getTextStyle() {
        return this.mTextStyle;
    }

    public float getTextTransparent() {
        return this.mTextTransparent;
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

    public boolean isActivation() {
        return this.mIsActivation;
    }

    public boolean isBoldText() {
        return this.mIsBoldText;
    }

    public boolean isDialogEnable() {
        return this.mDialogModel != null && this.mDialogModel.hasDialog();
    }

    public boolean isReverseColor() {
        return false;
    }

    public boolean isShadow() {
        return this.mIsShadow;
    }

    public boolean isWatermark() {
        return false;
    }

    public void refreshRotateDegree() {
        this.mRotateDegrees = getRotateDegrees();
    }

    public void reverseColor(int i) {
    }

    public void setActivation(boolean z) {
        this.mIsActivation = z;
    }

    public void setBoldText(boolean z) {
        this.mIsBoldText = z;
    }

    public void setColor(int i) {
        this.mColor = i;
    }

    public void setDialogModel(BaseDialogModel baseDialogModel, Resources resources) {
        this.mDialogModel = baseDialogModel;
        this.mDialogDrawable = baseDialogModel.readDialogDrawable(resources);
        if (this.mDialogDrawable == null) {
            this.mDialogModel = null;
        }
    }

    public void setDialogWithStatusData(DialogStatusData dialogStatusData) {
        setUserLocationX(dialogStatusData.itemPositionX);
        setUserLocationY(dialogStatusData.itemPositionY);
        setUserScaleMultiple(dialogStatusData.itemScale);
        setRotateDegrees(dialogStatusData.itemDegree);
        setColor(dialogStatusData.color);
        setTextTransparent(dialogStatusData.transparentProgress);
        setTextStyle(dialogStatusData.textStyle);
        setBoldText(dialogStatusData.textBold);
        setShadow(dialogStatusData.textShadow);
        setTextAlignment(dialogStatusData.textAlignment);
        if (dialogStatusData.text != null) {
            setText(dialogStatusData.text);
        }
    }

    public void setDisplaySize(float f, float f2) {
        this.mDefaultLocationX = f / 2.0f;
        this.mDefaultLocationY = f2 / 2.0f;
    }

    public void setDrawOutline(boolean z) {
    }

    public void setRotateDegrees(float f) {
        this.mRotateDegrees = f;
    }

    public void setScaleMultipleOrigin(float f) {
        this.mScaleMultipleOrigin = f;
    }

    public void setShadow(boolean z) {
        this.mIsShadow = z;
    }

    public void setText(String str) {
        this.mText = str;
    }

    public void setTextAlignment(TextAlignment textAlignment) {
        this.mAutoLineLayout.setTextAlignment(textAlignment);
    }

    public void setTextStyle(TextStyle textStyle) {
        this.mTextStyle = textStyle;
    }

    public void setTextTransparent(float f) {
        this.mTextTransparent = f;
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
        this.mIsMirror = !this.mIsMirror;
    }

    public void writeToParcel(Parcel parcel, int i) {
        ParcelableGenericUtils.writeObject(parcel, i, this.mDialogModel);
        parcel.writeInt(this.mColor);
        ParcelableGenericUtils.writeObject(parcel, i, this.mTextStyle);
        parcel.writeString(this.mText);
        parcel.writeByte(this.mIsActivation ? (byte) 1 : 0);
        parcel.writeFloat(this.mTextTransparent);
        parcel.writeByte(this.mIsBoldText ? (byte) 1 : 0);
        parcel.writeByte(this.mIsShadow ? (byte) 1 : 0);
        parcel.writeFloat(this.mDefaultLocationX);
        parcel.writeFloat(this.mDefaultLocationY);
        parcel.writeFloat(this.mUserLocationX);
        parcel.writeFloat(this.mUserLocationY);
        parcel.writeFloat(this.mUserScaleMultiple);
        parcel.writeFloat(this.mScaleMultipleOrigin);
        parcel.writeFloat(this.mRotateDegrees);
        parcel.writeByte(this.mIsMirror ? (byte) 1 : 0);
        parcel.writeByte(this.mIsCorrection ? (byte) 1 : 0);
        parcel.writeInt(this.mAutoLineLayout.getTextAlignment().ordinal());
        parcel.writeFloat(this.mMaxWidth);
    }
}
