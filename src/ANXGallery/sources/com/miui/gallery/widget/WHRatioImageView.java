package com.miui.gallery.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import com.miui.gallery.R;

public class WHRatioImageView extends ForegroundImageView {
    private float mWHRatio;

    public WHRatioImageView(Context context) {
        super(context);
        this.mWHRatio = 0.0f;
    }

    public WHRatioImageView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public WHRatioImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mWHRatio = 0.0f;
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.WHRatioImageView, i, 0);
        if (obtainStyledAttributes != null) {
            this.mWHRatio = obtainStyledAttributes.getFloat(2, 0.0f);
            obtainStyledAttributes.recycle();
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        if (this.mWHRatio > 0.0f) {
            int mode = MeasureSpec.getMode(i);
            int size = MeasureSpec.getSize(i);
            int mode2 = MeasureSpec.getMode(i2);
            int size2 = MeasureSpec.getSize(i2);
            if (mode == 1073741824) {
                size2 = (int) (((float) size) / this.mWHRatio);
                mode2 = 1073741824;
            } else if (mode2 == 1073741824) {
                size = (int) (((float) size2) * this.mWHRatio);
                mode = 1073741824;
            }
            i = MeasureSpec.makeMeasureSpec(size, mode);
            i2 = MeasureSpec.makeMeasureSpec(size2, mode2);
        }
        super.onMeasure(i, i2);
    }

    public void setWHRatio(float f) {
        if (Float.compare(f, this.mWHRatio) != 0) {
            this.mWHRatio = f;
            requestLayout();
        }
    }
}
