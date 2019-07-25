package com.miui.gallery.search.resultpage;

import android.content.Context;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import com.miui.gallery.R;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.ui.MicroThumbGridItem;
import com.miui.gallery.util.Log;
import com.nostra13.universalimageloader.core.DisplayImageOptions;

public class SearchDocumentGridItem extends MicroThumbGridItem {
    public SearchDocumentGridItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void bindImage(String str, Uri uri, DisplayImageOptions displayImageOptions) {
        super.bindImage(str, uri, DownloadType.THUMBNAIL, displayImageOptions);
    }

    /* access modifiers changed from: protected */
    public boolean isSquareItem() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int integer = getResources().getInteger(R.integer.micro_horizontal_document_item_height_scale);
        int integer2 = getResources().getInteger(R.integer.micro_horizontal_document_item_width_scale);
        int size = MeasureSpec.getSize(i);
        int i3 = (integer * size) / integer2;
        super.onMeasure(i, MeasureSpec.makeMeasureSpec(i3, 1073741824));
        Log.d("SearchDocumentGridItem", "onMeasure w: %d, h: %d", Integer.valueOf(size), Integer.valueOf(i3));
    }
}
