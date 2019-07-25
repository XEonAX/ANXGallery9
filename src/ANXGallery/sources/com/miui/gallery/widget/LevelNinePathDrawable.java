package com.miui.gallery.widget;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.NinePatchDrawable;

public class LevelNinePathDrawable extends Drawable {
    private NinePatchDrawable mDrawable;

    public LevelNinePathDrawable(NinePatchDrawable ninePatchDrawable) {
        if (ninePatchDrawable != null) {
            this.mDrawable = ninePatchDrawable;
            return;
        }
        throw new NullPointerException();
    }

    public void draw(Canvas canvas) {
        float level = ((float) getLevel()) / 10000.0f;
        Rect bounds = getBounds();
        float width = ((float) bounds.width()) * level;
        if (width > 10.0f) {
            this.mDrawable.setBounds(bounds.left, bounds.top, (int) (((float) bounds.left) + width), bounds.bottom);
            this.mDrawable.draw(canvas);
            return;
        }
        canvas.save();
        canvas.scale(level, 1.0f);
        this.mDrawable.setBounds(getBounds());
        this.mDrawable.draw(canvas);
        canvas.restore();
    }

    public int getOpacity() {
        return 0;
    }

    public void setAlpha(int i) {
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }
}
