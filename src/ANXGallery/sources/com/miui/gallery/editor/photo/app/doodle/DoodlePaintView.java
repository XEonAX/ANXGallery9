package com.miui.gallery.editor.photo.app.doodle;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import com.miui.gallery.util.MiscUtil;

public class DoodlePaintView extends View {
    private int mInnerColor = Color.parseColor("#FF7A31");
    private int mOuterColor = Color.parseColor("#F1F1F1");
    private float mOuterHeight;
    private float mOuterWidth;
    private Paint mPaint = new Paint(1);
    private PaintType mPaintType = PaintType.MEDIUM;
    private float mRadiusPercent = 0.21f;

    public enum PaintType {
        HEAVY(13.333f),
        MEDIUM(4.333f),
        LIGHT(1.333f);
        
        public final float paintSize;

        private PaintType(float f) {
            this.paintSize = f;
        }
    }

    public DoodlePaintView(Context context) {
        super(context);
        init(context);
    }

    public DoodlePaintView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context);
    }

    private void drawInnerCircle(Canvas canvas) {
        this.mPaint.setColor(this.mInnerColor);
        canvas.drawCircle(this.mOuterWidth / 2.0f, this.mOuterHeight / 2.0f, Math.min(this.mRadiusPercent * this.mOuterWidth, this.mRadiusPercent * this.mOuterHeight) / 2.0f, this.mPaint);
    }

    private void drawOuterCircle(Canvas canvas) {
        this.mPaint.setColor(this.mOuterColor);
        canvas.drawCircle(this.mOuterWidth / 2.0f, this.mOuterHeight / 2.0f, Math.min(this.mOuterWidth, this.mOuterHeight) / 2.0f, this.mPaint);
    }

    private void init(Context context) {
        if (MiscUtil.isNightMode(context)) {
            this.mOuterColor = Color.parseColor("#242424");
        }
    }

    public PaintType getPaintType() {
        return this.mPaintType;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        drawOuterCircle(canvas);
        drawInnerCircle(canvas);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        this.mOuterWidth = (float) MeasureSpec.getSize(i);
        this.mOuterHeight = (float) MeasureSpec.getSize(i2);
    }

    public void setClickListener(OnClickListener onClickListener) {
        setOnClickListener(onClickListener);
    }

    public void setColor(int i) {
        this.mInnerColor = i;
        invalidate();
    }

    public void updateInnerRadiusPercent() {
        if (this.mRadiusPercent == 0.17f) {
            this.mRadiusPercent = 0.21f;
            this.mPaintType = PaintType.MEDIUM;
        } else if (this.mRadiusPercent == 0.21f) {
            this.mRadiusPercent = 0.25f;
            this.mPaintType = PaintType.HEAVY;
        } else {
            this.mRadiusPercent = 0.17f;
            this.mPaintType = PaintType.LIGHT;
        }
        invalidate();
    }
}
