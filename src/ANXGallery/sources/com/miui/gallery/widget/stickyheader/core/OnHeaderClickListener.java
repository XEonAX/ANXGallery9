package com.miui.gallery.widget.stickyheader.core;

import android.support.v7.widget.RecyclerView;
import android.view.View;

public interface OnHeaderClickListener {
    boolean onHeaderClick(RecyclerView recyclerView, View view, long j);
}
