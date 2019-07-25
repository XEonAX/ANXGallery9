package com.miui.gallery.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import com.miui.gallery.BaseConfig.ScreenConfig;
import com.miui.gallery.util.Log;

public class AlbumDetailScreenshotGridItem extends AlbumDetailGridItem {
    public AlbumDetailScreenshotGridItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    /* access modifiers changed from: protected */
    public boolean isSquareItem() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int max = Math.max(ScreenConfig.getRealScreenHeight(), ScreenConfig.getRealScreenWidth());
        int min = Math.min(ScreenConfig.getRealScreenHeight(), ScreenConfig.getRealScreenWidth());
        int size = MeasureSpec.getSize(i);
        int i3 = (max * size) / min;
        super.onMeasure(i, MeasureSpec.makeMeasureSpec(i3, 1073741824));
        Log.d("AlbumDetailScreenshotGridItem", "onMeasure w: %d, h: %d", Integer.valueOf(size), Integer.valueOf(i3));
    }
}
