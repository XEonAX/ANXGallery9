package com.miui.gallery.collage.drawable;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.drawable.Drawable;
import com.miui.gallery.collage.core.poster.SpecifyDrawableModel;

public class ColorDrawable extends Drawable {
    private Paint mPaint = new Paint(1);

    public ColorDrawable(SpecifyDrawableModel specifyDrawableModel) {
        this.mPaint.setStyle(Style.FILL);
        this.mPaint.setColor(Color.parseColor(specifyDrawableModel.extras.color));
    }

    public void draw(Canvas canvas) {
        canvas.drawRect(getBounds(), this.mPaint);
    }

    public int getIntrinsicHeight() {
        return 1;
    }

    public int getIntrinsicWidth() {
        return 1;
    }

    public int getOpacity() {
        return -2;
    }

    public void setAlpha(int i) {
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }
}
