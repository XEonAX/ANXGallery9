package com.miui.gallery.movie.ui.view;

import android.content.Context;
import android.util.AttributeSet;
import com.meicam.sdk.NvsMultiThumbnailSequenceView;

public class MultiThumbnailSequenceView extends NvsMultiThumbnailSequenceView {
    public MultiThumbnailSequenceView(Context context) {
        super(context);
    }

    public MultiThumbnailSequenceView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public MultiThumbnailSequenceView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public MultiThumbnailSequenceView(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
    }

    public int getSequenceWidth(long j, double d) {
        double d2 = (double) j;
        Double.isNaN(d2);
        return (int) Math.floor((d2 * d * 1000.0d) + 0.5d);
    }
}
