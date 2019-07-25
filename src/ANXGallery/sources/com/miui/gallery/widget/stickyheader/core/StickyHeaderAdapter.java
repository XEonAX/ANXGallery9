package com.miui.gallery.widget.stickyheader.core;

import android.view.ViewGroup;
import com.miui.gallery.widget.stickyheader.core.HeaderViewHolder;

public interface StickyHeaderAdapter<VH extends HeaderViewHolder> {
    int getHeaderCount();

    long getHeaderId(int i);

    int getHeaderIndex(int i);

    int getHeaderViewType(int i);

    int[] getItemPositionInterval(int i);

    void onBindHeaderViewHolder(VH vh, int i);

    VH onCreateHeaderViewHolder(ViewGroup viewGroup, int i);
}
