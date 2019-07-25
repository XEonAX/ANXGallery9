package com.miui.gallery.ui;

import android.content.Context;
import android.util.AttributeSet;

public class HorizontalCenterRecyclerView extends SimpleRecyclerView {
    private int mLastWidth;

    public HorizontalCenterRecyclerView(Context context) {
        super(context);
    }

    public HorizontalCenterRecyclerView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public HorizontalCenterRecyclerView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        if (getChildCount() > 0) {
            int i5 = 0;
            for (int i6 = 0; i6 < getChildCount(); i6++) {
                i5 += getChildAt(i6).getMeasuredWidth();
            }
            if (this.mLastWidth != i5) {
                this.mLastWidth = i5;
                int measuredWidth = getMeasuredWidth() - i5;
                if (measuredWidth > 0) {
                    int i7 = measuredWidth / 2;
                    if (getPaddingLeft() != i7) {
                        setPadding(i7, 0, i7, 0);
                        super.onLayout(z, i, i2, i3, i4);
                    }
                }
            }
        }
    }
}
