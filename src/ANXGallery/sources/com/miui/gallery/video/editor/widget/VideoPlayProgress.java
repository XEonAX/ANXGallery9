package com.miui.gallery.video.editor.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.util.AttributeSet;
import android.view.View;

public class VideoPlayProgress extends View {
    private int defaultColor = Color.parseColor("#4da0f8");
    private Paint paint;
    private int startX = 0;
    private int startY;
    private int stopX = 0;
    private int stopY;

    public VideoPlayProgress(Context context) {
        super(context);
        init();
    }

    public VideoPlayProgress(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    private void init() {
        this.paint = new Paint();
        this.paint.setColor(this.defaultColor);
        this.paint.setStyle(Style.FILL);
        this.paint.setAntiAlias(true);
        this.paint.setStrokeWidth(10.0f);
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawLine((float) this.startX, (float) this.startY, (float) this.stopX, (float) this.stopY, this.paint);
    }

    public void setColor(int i) {
        this.paint.setColor(i);
        invalidate();
    }

    public void updateWidth(int i, int i2, int i3, int i4) {
        this.startX = i;
        this.startY = i2;
        this.stopX = i3;
        this.stopY = i4;
        invalidate();
    }
}
