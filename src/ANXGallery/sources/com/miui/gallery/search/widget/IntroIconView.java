package com.miui.gallery.search.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import com.miui.gallery.R;

public class IntroIconView extends View {
    private int mBackgroundColor;
    private Drawable mIconDrawable;
    private Paint mLandPaint;
    private Path mLandPath;

    public IntroIconView(Context context) {
        this(context, null);
    }

    public IntroIconView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, -1);
    }

    /* JADX INFO: finally extract failed */
    public IntroIconView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        TypedArray obtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, R.styleable.IntroIconView);
        try {
            this.mIconDrawable = obtainStyledAttributes.getDrawable(1);
            this.mBackgroundColor = obtainStyledAttributes.getColor(0, context.getResources().getColor(R.color.intro_icon_bg));
            int color = obtainStyledAttributes.getColor(2, context.getResources().getColor(R.color.intro_icon_land_color));
            obtainStyledAttributes.recycle();
            this.mLandPaint = new Paint();
            this.mLandPaint.setAntiAlias(true);
            this.mLandPaint.setColor(color);
            this.mLandPath = new Path();
        } catch (Throwable th) {
            obtainStyledAttributes.recycle();
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        Canvas canvas2 = canvas;
        int width = canvas.getWidth();
        int height = canvas.getHeight();
        canvas2.drawColor(this.mBackgroundColor);
        float f = (float) height;
        float f2 = 0.75f * f;
        this.mLandPath.reset();
        float f3 = (float) width;
        this.mLandPath.moveTo(f3, f2);
        this.mLandPath.lineTo(f3, f);
        this.mLandPath.lineTo(0.0f, f);
        this.mLandPath.lineTo(0.0f, f2);
        int i = (int) (0.03f * f);
        int i2 = 0;
        while (i2 < width) {
            Path path = this.mLandPath;
            float f4 = (float) i2;
            double d = (double) f2;
            double d2 = (double) i;
            float f5 = f2;
            int i3 = i;
            double d3 = (double) (((float) (i2 + width)) / f3);
            Double.isNaN(d3);
            double cos = Math.cos(((d3 * 0.8d) + 0.6d) * 3.141592653589793d);
            Double.isNaN(d2);
            double d4 = d2 * cos;
            Double.isNaN(d);
            path.lineTo(f4, (float) (d - d4));
            i2++;
            f2 = f5;
            i = i3;
        }
        this.mLandPath.close();
        canvas2.drawPath(this.mLandPath, this.mLandPaint);
        float f6 = 0.68f * f;
        int intrinsicWidth = ((int) (f3 - ((((float) this.mIconDrawable.getIntrinsicWidth()) * f6) / ((float) this.mIconDrawable.getIntrinsicHeight())))) / 2;
        int i4 = ((int) (f - f6)) / 2;
        this.mIconDrawable.setBounds(intrinsicWidth, i4, width - intrinsicWidth, height - i4);
        this.mIconDrawable.draw(canvas2);
    }
}
