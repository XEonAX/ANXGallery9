package com.miui.gallery.editor.photo.widgets;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import com.miui.gallery.R;

public class StrokeImageHelper {
    private RectF mContentBounds = new RectF();
    private Paint mStrokePaint = new Paint(1);

    public StrokeImageHelper(Context context) {
        this.mStrokePaint.setStyle(Style.STROKE);
        this.mStrokePaint.setStrokeWidth((float) context.getResources().getDimensionPixelSize(R.dimen.photo_editor_preview_stroke_width));
        this.mStrokePaint.setColor(context.getResources().getColor(R.color.photo_editor_preview_stroke_color));
    }

    private void draw(Canvas canvas, Matrix matrix) {
        matrix.mapRect(this.mContentBounds);
        fixContentBounds();
        canvas.drawRect(this.mContentBounds, this.mStrokePaint);
    }

    private void fixContentBounds() {
        this.mContentBounds.set(((float) Math.round(this.mContentBounds.left)) + 0.5f, ((float) Math.round(this.mContentBounds.top)) + 0.5f, ((float) Math.round(this.mContentBounds.right)) - 0.5f, ((float) Math.round(this.mContentBounds.bottom)) - 0.5f);
    }

    public void draw(Canvas canvas, Rect rect, Matrix matrix) {
        this.mContentBounds.set(rect);
        draw(canvas, matrix);
    }

    public void draw(Canvas canvas, RectF rectF) {
        this.mContentBounds.set(rectF);
        fixContentBounds();
        canvas.drawRect(this.mContentBounds, this.mStrokePaint);
    }

    public void draw(Canvas canvas, RectF rectF, Matrix matrix) {
        this.mContentBounds.set(rectF);
        draw(canvas, matrix);
    }
}
