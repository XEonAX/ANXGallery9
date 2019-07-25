package com.miui.gallery.collage.app.layout;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import com.miui.gallery.R;
import com.miui.gallery.collage.core.layout.LayoutItemModel;
import com.miui.gallery.collage.core.layout.LayoutModel;

class LayoutPreviewDrawable extends Drawable {
    private int mBackgroundColor;
    private LayoutModel mLayoutModel;
    private Paint mPaint = new Paint(1);
    private Path mPath = new Path();

    LayoutPreviewDrawable(Resources resources) {
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setColor(resources.getColor(R.color.collage_layout_menu_item_paint_color));
        this.mPaint.setStrokeWidth(3.0f);
        this.mBackgroundColor = resources.getColor(R.color.collage_layout_menu_item_background);
    }

    public void draw(Canvas canvas) {
        canvas.drawColor(this.mBackgroundColor);
        if (this.mLayoutModel != null) {
            Rect bounds = getBounds();
            float width = (float) bounds.width();
            float height = (float) bounds.height();
            for (LayoutItemModel layoutItemModel : this.mLayoutModel.items) {
                float[] fArr = layoutItemModel.data;
                this.mPath.reset();
                for (int i = 0; i < fArr.length; i += 2) {
                    float f = fArr[i] * width;
                    float f2 = fArr[i + 1] * height;
                    if (this.mPath.isEmpty()) {
                        this.mPath.moveTo(f, f2);
                    } else {
                        this.mPath.lineTo(f, f2);
                    }
                }
                this.mPath.close();
                canvas.drawPath(this.mPath, this.mPaint);
            }
        }
    }

    public int getOpacity() {
        return -2;
    }

    public void setAlpha(int i) {
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }

    public void setLayoutModel(LayoutModel layoutModel) {
        this.mLayoutModel = layoutModel;
        invalidateSelf();
    }
}
