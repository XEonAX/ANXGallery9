package com.miui.gallery.editor.photo.core.imports.text.watermark;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.imports.text.base.ITextSetting;
import com.miui.gallery.editor.photo.core.imports.text.typeface.TextStyle;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout.TextAlignment;
import com.miui.gallery.editor.photo.core.imports.text.watermark.WatermarkInfo.TextPieceInfo;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ScreenUtils;

public class WatermarkTextPiece implements ITextSetting {
    private AutoLineLayout mAutoLineLayout;
    private int mColor;
    private final float mCountSizeSpacing;
    private final float mDefaultTextSize;
    private boolean mDrawOutline = true;
    private boolean mIsBoldText;
    private boolean mIsRTL = false;
    private boolean mIsShadow;
    private final float mMaxTextSize;
    private final float mMinTextSize;
    private RectF mOutlineDisplayRect;
    private RectF mOutlineRect;
    private Paint mPaint;
    private String mText;
    private RectF mTextInDialogRect;
    private final float mTextPaddingInsert;
    private TextPieceInfo mTextPieceInfo;
    private RectF mTextRect = new RectF();
    private TextStyle mTextStyle;
    private float mTextTransparent;

    public WatermarkTextPiece(Resources resources, TextPieceInfo textPieceInfo, float f, float f2, float f3) {
        this.mTextPieceInfo = textPieceInfo;
        if (resources.getConfiguration().getLayoutDirection() == 1) {
            this.mIsRTL = true;
        }
        if (textPieceInfo.size == 0.0f) {
            this.mDefaultTextSize = resources.getDimension(R.dimen.text_append_default_text_size) * f3;
        } else {
            this.mDefaultTextSize = ScreenUtils.dpToPixel(textPieceInfo.size) * f3;
        }
        if (textPieceInfo.minSize > 0.0f) {
            this.mMinTextSize = ScreenUtils.dpToPixel(textPieceInfo.minSize) * f3;
        } else {
            this.mMinTextSize = (float) resources.getDimensionPixelSize(R.dimen.text_watermark_append_min_text_size);
        }
        this.mMaxTextSize = this.mDefaultTextSize;
        this.mCountSizeSpacing = resources.getDisplayMetrics().density;
        this.mTextPaddingInsert = resources.getDimension(R.dimen.text_watermark_padding_insert);
        this.mColor = -1;
        this.mTextStyle = null;
        this.mTextTransparent = 0.0f;
        this.mIsBoldText = false;
        this.mIsShadow = false;
        this.mAutoLineLayout = new AutoLineLayout();
        this.mAutoLineLayout.getPaint().setTextSize(this.mDefaultTextSize);
        this.mAutoLineLayout.setLineHeightOffset(resources.getDimension(R.dimen.text_append_line_height_offset));
        this.mAutoLineLayout.setTextAlignment(this.mIsRTL ? TextAlignment.RIGHT : TextAlignment.LEFT);
        this.mAutoLineLayout.setSingleVerticalText(this.mTextPieceInfo.isVerticalText == 1);
        this.mAutoLineLayout.setText(this.mTextPieceInfo.text);
        this.mAutoLineLayout.setLetterSpace(this.mTextPieceInfo.letterSpacing);
        this.mAutoLineLayout.setMaxLines(this.mTextPieceInfo.lines);
        this.mPaint = new Paint(1);
        this.mPaint.setColor(-1);
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setStrokeWidth(3.0f);
        this.mPaint.setPathEffect(new DashPathEffect(new float[]{8.0f, 4.0f}, 0.0f));
        this.mPaint.setShadowLayer(1.0f, 0.0f, 0.0f, resources.getColor(R.color.text_watermark_outline_shadow));
        this.mOutlineRect = new RectF(ScreenUtils.dpToPixel(this.mTextPieceInfo.frameRect[0]), ScreenUtils.dpToPixel(this.mTextPieceInfo.frameRect[1]), ScreenUtils.dpToPixel(this.mTextPieceInfo.frameRect[2]), ScreenUtils.dpToPixel(this.mTextPieceInfo.frameRect[3]));
        this.mOutlineRect.offset((-f) / 2.0f, (-f2) / 2.0f);
        this.mText = this.mTextPieceInfo.text;
        this.mTextInDialogRect = new RectF();
        this.mOutlineDisplayRect = new RectF(this.mOutlineRect);
        this.mOutlineDisplayRect.bottom -= 3.0f;
    }

    private int getAlphaByConfig() {
        return (int) (255.0f - (this.mTextTransparent * 230.0f));
    }

    public void configTextPaint() {
        Paint paint = this.mAutoLineLayout.getPaint();
        paint.setColor(this.mColor);
        paint.setTypeface(this.mTextStyle == null ? Typeface.DEFAULT : this.mTextStyle.getTypeFace());
        paint.setAlpha(getAlphaByConfig());
        paint.setFakeBoldText(this.mIsBoldText);
        if (this.mIsShadow) {
            paint.setShadowLayer(1.0f, 1.0f, 1.0f, 1711276032);
        } else {
            paint.clearShadowLayer();
        }
    }

    public void countTextInDialog() {
        if (!TextUtils.isEmpty(this.mText)) {
            this.mAutoLineLayout.setText(this.mText);
            this.mTextInDialogRect.set(this.mOutlineRect);
            this.mTextInDialogRect.inset(this.mTextPaddingInsert, 0.0f);
            long currentTimeMillis = System.currentTimeMillis();
            this.mAutoLineLayout.countTextArea(this.mTextInDialogRect.width(), this.mTextInDialogRect.height() * 1.5f, this.mMinTextSize, this.mMaxTextSize, this.mCountSizeSpacing);
            long currentTimeMillis2 = System.currentTimeMillis();
            this.mAutoLineLayout.getTextRect(this.mTextRect);
            Log.d("WatermarkTextPiece", "count text time： %d", (Object) Long.valueOf(currentTimeMillis2 - currentTimeMillis));
        }
    }

    public void draw(Canvas canvas) {
        canvas.save();
        if (this.mDrawOutline) {
            canvas.drawRect(this.mOutlineDisplayRect, this.mPaint);
        }
        canvas.translate(this.mOutlineRect.centerX(), this.mOutlineRect.centerY());
        if (!TextUtils.isEmpty(this.mText)) {
            canvas.translate(this.mTextRect.width() / 2.0f, this.mTextRect.height() / 2.0f);
            switch (this.mTextPieceInfo.align) {
                case 0:
                    canvas.translate((-this.mTextInDialogRect.width()) / 2.0f, (-this.mTextRect.height()) / 2.0f);
                    break;
                case 1:
                    canvas.translate((-this.mTextRect.width()) / 2.0f, (-this.mTextRect.height()) / 2.0f);
                    break;
                case 2:
                    canvas.translate((this.mTextInDialogRect.width() / 2.0f) - this.mTextRect.width(), (-this.mTextRect.height()) / 2.0f);
                    break;
            }
            this.mAutoLineLayout.draw(canvas);
        }
        canvas.restore();
    }

    public int getColor() {
        return this.mColor;
    }

    public RectF getOutlineRect() {
        return this.mOutlineRect;
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

    public boolean isBoldText() {
        return this.mIsBoldText;
    }

    public boolean isShadow() {
        return this.mIsShadow;
    }

    public void setBoldText(boolean z) {
        this.mIsBoldText = z;
    }

    public void setColor(int i) {
        this.mColor = i;
        this.mAutoLineLayout.getPaint().setColor(this.mColor);
    }

    public void setDrawOutline(boolean z) {
        this.mDrawOutline = z;
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
}
