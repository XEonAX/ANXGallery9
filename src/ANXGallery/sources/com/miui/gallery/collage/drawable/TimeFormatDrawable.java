package com.miui.gallery.collage.drawable;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import com.miui.gallery.R;
import com.miui.gallery.collage.core.poster.SpecifyDrawableModel;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout;
import com.miui.gallery.util.BuildUtil;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class TimeFormatDrawable extends Drawable {
    private AutoLineLayout mAutoLineLayout = new AutoLineLayout();
    private int mHeight;
    private int mWidth;

    public TimeFormatDrawable(Resources resources, SpecifyDrawableModel specifyDrawableModel) {
        float f = resources.getDisplayMetrics().density;
        String str = specifyDrawableModel.extras.textColor;
        float f2 = specifyDrawableModel.extras.textSize;
        float f3 = specifyDrawableModel.extras.letterSpace;
        Paint paint = this.mAutoLineLayout.getPaint();
        paint.setTextSize(f2 * f);
        paint.setColor(Color.parseColor(str));
        String dataStringByFormat = getDataStringByFormat(resources.getString(R.string.collage_drawable_normal_date_format));
        this.mAutoLineLayout.setLetterSpace(f3);
        this.mAutoLineLayout.setText(dataStringByFormat);
        this.mAutoLineLayout.countText();
        RectF rectF = new RectF();
        this.mAutoLineLayout.getTextRect(rectF);
        this.mWidth = Math.round(rectF.width());
        this.mHeight = Math.round(rectF.height());
    }

    private static String getDataStringByFormat(String str) {
        return new SimpleDateFormat(str, BuildUtil.isInternational() ? Locale.getDefault() : Locale.US).format(Long.valueOf(System.currentTimeMillis()));
    }

    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        float width = ((float) bounds.width()) / ((float) getIntrinsicWidth());
        canvas.save();
        canvas.translate((float) bounds.centerX(), (float) bounds.centerY());
        canvas.scale(width, width);
        this.mAutoLineLayout.draw(canvas);
        canvas.restore();
    }

    public int getIntrinsicHeight() {
        return this.mHeight;
    }

    public int getIntrinsicWidth() {
        return this.mWidth;
    }

    public int getOpacity() {
        return -2;
    }

    public void setAlpha(int i) {
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }
}
