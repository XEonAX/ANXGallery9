package com.miui.gallery.widget.stickyheader;

import android.view.View;
import com.miui.gallery.widget.recyclerview.GridItemSpacingDecoration;
import com.miui.gallery.widget.stickyheader.core.StickyHeaderRecyclerView;

public class StickyHeaderSpacingDecoration extends GridItemSpacingDecoration<StickyHeaderRecyclerView> {
    public StickyHeaderSpacingDecoration(StickyHeaderRecyclerView stickyHeaderRecyclerView, boolean z) {
        super(stickyHeaderRecyclerView, z);
    }

    /* access modifiers changed from: protected */
    public boolean hasHeader(StickyHeaderRecyclerView stickyHeaderRecyclerView, View view) {
        if (stickyHeaderRecyclerView == null) {
            return false;
        }
        return stickyHeaderRecyclerView.getStickyHeaderLayoutManager().needOffsetForHeader(stickyHeaderRecyclerView.getChildViewHolder(view));
    }
}
