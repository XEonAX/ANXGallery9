package com.miui.gallery.widget.stickyheader.core;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import com.miui.gallery.widget.stickyheader.core.HeaderViewHolder;

public class DefaultStickyHeaderRender<VH extends HeaderViewHolder> implements StickyHeaderRender<VH> {
    private final Rect mTemp = new Rect();

    private void initClipRectForHeader(Rect rect, RecyclerView recyclerView, View view) {
        StickyHeaderUtil.extractMargins(view, rect);
        rect.set(recyclerView.getPaddingLeft(), recyclerView.getPaddingTop(), (recyclerView.getWidth() - recyclerView.getPaddingRight()) - rect.right, recyclerView.getHeight() - recyclerView.getPaddingBottom());
    }

    public void draw(RecyclerView recyclerView, Canvas canvas, VH vh, Rect rect) {
        canvas.save();
        if (recyclerView.getLayoutManager().getClipToPadding()) {
            initClipRectForHeader(this.mTemp, recyclerView, vh.itemView);
            canvas.clipRect(this.mTemp);
        }
        canvas.translate((float) rect.left, (float) rect.top);
        vh.itemView.draw(canvas);
        canvas.restore();
    }
}
