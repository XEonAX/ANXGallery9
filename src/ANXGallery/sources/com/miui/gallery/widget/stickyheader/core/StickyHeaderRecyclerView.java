package com.miui.gallery.widget.stickyheader.core;

import android.content.Context;
import android.util.AttributeSet;
import com.miui.gallery.widget.recyclerview.GalleryRecyclerView;

public class StickyHeaderRecyclerView extends GalleryRecyclerView {
    protected OnHeaderClickListener mHeaderClickListener;
    protected OnHeaderLongClickListener mHeaderLongClickListener;
    private HeaderClickListener mInternalHeaderClickListener;
    protected StickyHeaderDecoration mStickyHeaderDecoration;

    public StickyHeaderRecyclerView(Context context) {
        this(context, null);
    }

    public StickyHeaderRecyclerView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public StickyHeaderRecyclerView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mStickyHeaderDecoration = new StickyHeaderDecoration(this);
        addItemDecoration(this.mStickyHeaderDecoration);
    }

    private void ensureHeaderClickListener() {
        if (this.mInternalHeaderClickListener == null) {
            this.mInternalHeaderClickListener = new HeaderClickListener() {
                public boolean onHeaderClick(HeaderViewHolder headerViewHolder) {
                    if (StickyHeaderRecyclerView.this.mHeaderClickListener != null) {
                        return StickyHeaderRecyclerView.this.mHeaderClickListener.onHeaderClick(StickyHeaderRecyclerView.this, headerViewHolder.itemView, headerViewHolder.getHeaderId());
                    }
                    return false;
                }

                public boolean onHeaderLongClick(HeaderViewHolder headerViewHolder) {
                    if (StickyHeaderRecyclerView.this.mHeaderLongClickListener != null) {
                        return StickyHeaderRecyclerView.this.mHeaderLongClickListener.onHeaderLongClick(StickyHeaderRecyclerView.this, headerViewHolder.itemView, headerViewHolder.getHeaderId());
                    }
                    return false;
                }
            };
        }
    }

    private void registerOrUnregisterHeaderClickListener() {
        if (this.mHeaderClickListener == null && this.mHeaderLongClickListener == null) {
            this.mStickyHeaderDecoration.setHeaderClickListener(null);
            return;
        }
        ensureHeaderClickListener();
        this.mStickyHeaderDecoration.setHeaderClickListener(this.mInternalHeaderClickListener);
    }

    public int getHeaderVisibility() {
        return this.mStickyHeaderDecoration.getHeaderVisibility();
    }

    public StickyHeaderAdapter getStickyHeaderAdapter() {
        return this.mStickyHeaderDecoration.getHeaderAdapter();
    }

    public StickyHeaderLayoutManager getStickyHeaderLayoutManager() {
        return this.mStickyHeaderDecoration.getHeaderLayoutManager();
    }

    public StickyHeaderRender getStickyHeaderRender() {
        return this.mStickyHeaderDecoration.getHeaderRender();
    }

    public void setHeaderVisibility(int i) {
        this.mStickyHeaderDecoration.setHeaderVisibility(this, i);
    }

    public void setOnHeaderClickListener(OnHeaderClickListener onHeaderClickListener) {
        this.mHeaderClickListener = onHeaderClickListener;
        registerOrUnregisterHeaderClickListener();
    }

    public void setOnHeaderLongClickListener(OnHeaderLongClickListener onHeaderLongClickListener) {
        this.mHeaderLongClickListener = onHeaderLongClickListener;
        registerOrUnregisterHeaderClickListener();
    }

    public void setStickyHeaderAdapter(StickyHeaderAdapter stickyHeaderAdapter) {
        this.mStickyHeaderDecoration.setStickyHeaderAdapter(stickyHeaderAdapter);
    }

    public void setStickyHeaderLayoutManager(StickyHeaderLayoutManager stickyHeaderLayoutManager) {
        this.mStickyHeaderDecoration.setStickyHeaderLayoutManager(stickyHeaderLayoutManager);
    }

    public void setStickyHeaderRender(StickyHeaderRender stickyHeaderRender) {
        this.mStickyHeaderDecoration.setStickyHeaderRender(stickyHeaderRender);
    }
}
