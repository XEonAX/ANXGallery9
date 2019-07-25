package com.miui.gallery.widget.stickyheader;

import android.content.Context;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.GridLayoutManager.SpanSizeLookup;
import android.util.AttributeSet;

public class StickyGridLayoutManager extends GridLayoutManager {
    private OnLayoutChangedListener mLayoutChangedListener;

    interface OnLayoutChangedListener {
        void onSpanCountChanged(int i, int i2);

        void onSpanSizeLookupChanged(SpanSizeLookup spanSizeLookup, SpanSizeLookup spanSizeLookup2);
    }

    public StickyGridLayoutManager(Context context, int i) {
        super(context, i);
    }

    public StickyGridLayoutManager(Context context, int i, int i2, boolean z) {
        super(context, i, i2, z);
    }

    public StickyGridLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
    }

    public void setLayoutChangedListener(OnLayoutChangedListener onLayoutChangedListener) {
        this.mLayoutChangedListener = onLayoutChangedListener;
    }

    public void setSpanCount(int i) {
        int spanCount = getSpanCount();
        super.setSpanCount(i);
        if (this.mLayoutChangedListener != null && spanCount != i) {
            this.mLayoutChangedListener.onSpanCountChanged(spanCount, i);
        }
    }

    public void setSpanSizeLookup(SpanSizeLookup spanSizeLookup) {
        SpanSizeLookup spanSizeLookup2 = getSpanSizeLookup();
        super.setSpanSizeLookup(spanSizeLookup);
        if (this.mLayoutChangedListener != null && spanSizeLookup2 != spanSizeLookup) {
            this.mLayoutChangedListener.onSpanSizeLookupChanged(spanSizeLookup2, spanSizeLookup);
        }
    }
}
