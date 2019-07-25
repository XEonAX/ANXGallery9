package com.miui.gallery.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import com.miui.gallery.R;
import com.miui.gallery.util.Log;

public class AlbumDetailPanoGridItem extends AlbumDetailGridItem {
    public AlbumDetailPanoGridItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    /* access modifiers changed from: protected */
    public boolean isSquareItem() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int integer = getResources().getInteger(R.integer.album_detail_pano_item_height_scale);
        int integer2 = getResources().getInteger(R.integer.album_detail_pano_item_width_scale);
        int size = MeasureSpec.getSize(i);
        int i3 = (integer * size) / integer2;
        super.onMeasure(i, MeasureSpec.makeMeasureSpec(i3, 1073741824));
        Log.d("AlbumDetailPanoGridItem", "onMeasure w: %d, h: %d", Integer.valueOf(size), Integer.valueOf(i3));
    }
}
