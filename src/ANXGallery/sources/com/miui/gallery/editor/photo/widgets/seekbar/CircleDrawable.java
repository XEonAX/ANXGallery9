package com.miui.gallery.editor.photo.widgets.seekbar;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.drawable.ShapeDrawable;
import com.miui.gallery.R;

public class CircleDrawable extends ShapeDrawable {
    private static int INIT_COLOR = -16739876;
    private static int STROKE_COLOR = 1275068416;
    private final float mOffset;
    private Paint mPaint = new Paint(1);
    private PorterDuffXfermode mPorterDuffXfermode = new PorterDuffXfermode(Mode.CLEAR);
    private Paint mStrokePaint;
    private final int mThumbSize;
    private final int mThumbTouchSize;

    public CircleDrawable(float f, Resources resources) {
        this.mOffset = f;
        this.mPaint.setStyle(Style.FILL);
        this.mPaint.setColor(INIT_COLOR);
        this.mStrokePaint = new Paint(1);
        this.mStrokePaint.setStyle(Style.FILL);
        this.mStrokePaint.setXfermode(this.mPorterDuffXfermode);
        this.mThumbTouchSize = resources.getDimensionPixelSize(R.dimen.photo_editor_seekbar_thumb_touch_size);
        this.mThumbSize = resources.getDimensionPixelSize(R.dimen.editor_menu_doodle_seek_bar_thumb_size);
    }

    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        float f = (float) this.mThumbSize;
        canvas.drawCircle((float) bounds.centerX(), (float) bounds.centerY(), this.mOffset + f, this.mStrokePaint);
        canvas.drawCircle((float) bounds.centerX(), (float) bounds.centerY(), f, this.mPaint);
        int color = this.mPaint.getColor();
        if (color == -1) {
            this.mPaint.setColor(STROKE_COLOR);
            this.mPaint.setStyle(Style.STROKE);
            this.mPaint.setStrokeWidth(1.0f);
            canvas.drawCircle((float) bounds.centerX(), (float) bounds.centerY(), f, this.mPaint);
            this.mPaint.setStyle(Style.FILL);
            this.mPaint.setColor(color);
        } else if (color == -16777216) {
            this.mPaint.setColor(-1);
            this.mPaint.setStyle(Style.STROKE);
            this.mPaint.setStrokeWidth(1.0f);
            canvas.drawCircle((float) bounds.centerX(), (float) bounds.centerY(), f, this.mPaint);
            this.mPaint.setStyle(Style.FILL);
            this.mPaint.setColor(color);
        }
    }

    public int getIntrinsicHeight() {
        return this.mThumbTouchSize;
    }

    public int getIntrinsicWidth() {
        return this.mThumbTouchSize;
    }

    public int getOpacity() {
        return 0;
    }

    public void setAlpha(int i) {
    }

    public void setColor(int i) {
        this.mPaint.setColor(i);
        invalidateSelf();
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }
}
