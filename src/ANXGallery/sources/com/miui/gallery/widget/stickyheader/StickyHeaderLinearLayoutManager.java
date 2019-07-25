package com.miui.gallery.widget.stickyheader;

import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import com.miui.gallery.util.Log;
import com.miui.gallery.widget.stickyheader.core.HeaderViewHolder;
import com.miui.gallery.widget.stickyheader.core.StickyHeaderLayoutManager;

public class StickyHeaderLinearLayoutManager<VH extends HeaderViewHolder> extends StickyHeaderLayoutManager<VH> {
    public StickyHeaderLinearLayoutManager(RecyclerView recyclerView) {
        super(recyclerView);
    }

    public boolean needOffsetForHeader(ViewHolder viewHolder) {
        if (!isReady()) {
            return false;
        }
        if (viewHolder == null || viewHolder.getAdapterPosition() == -1) {
            Log.w("StickyHeaderLinearLayoutManager", "the holder is invalid");
            return false;
        }
        int adapterPosition = viewHolder.getAdapterPosition();
        return hasDifferentHeader(adapterPosition, adapterPosition - 1);
    }
}
