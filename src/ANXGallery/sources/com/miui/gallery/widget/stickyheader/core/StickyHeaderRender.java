package com.miui.gallery.widget.stickyheader.core;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;

public interface StickyHeaderRender<VH extends ViewHolder> {
    void draw(RecyclerView recyclerView, Canvas canvas, VH vh, Rect rect);
}
