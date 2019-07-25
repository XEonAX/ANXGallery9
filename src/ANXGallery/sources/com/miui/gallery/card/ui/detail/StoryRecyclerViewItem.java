package com.miui.gallery.card.ui.detail;

import android.content.Context;
import android.util.AttributeSet;
import com.miui.gallery.ui.MicroThumbGridItem;

public class StoryRecyclerViewItem extends MicroThumbGridItem {
    public StoryRecyclerViewItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    /* access modifiers changed from: protected */
    public boolean isSquareItem() {
        return false;
    }
}
