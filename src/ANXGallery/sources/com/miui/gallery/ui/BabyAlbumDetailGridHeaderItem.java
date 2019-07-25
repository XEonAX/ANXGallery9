package com.miui.gallery.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.util.GalleryDateUtils;

public class BabyAlbumDetailGridHeaderItem extends TimeLineGridHeaderItem {
    private TextView mAge;

    public BabyAlbumDetailGridHeaderItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void bindData(long j, String str, String str2) {
        bindData(GalleryDateUtils.formatRelativeDate(j), str);
        this.mAge.setText(str2);
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mAge = (TextView) findViewById(R.id.age);
    }

    public void setCheckable(boolean z) {
        super.setCheckable(z);
        if (z) {
            this.mAge.setVisibility(8);
        } else {
            this.mAge.setVisibility(0);
        }
    }
}
