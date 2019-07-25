package com.miui.gallery.widget.stickyheader.core;

import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import com.miui.gallery.util.Log;
import com.miui.gallery.widget.stickyheader.core.HeaderViewHolder;

public abstract class StickyHeaderLayoutManager<VH extends HeaderViewHolder> {
    private int mAnalysisMinHeaderHeight = 10;
    protected final RecyclerView mRecyclerView;
    protected StickyHeaderAdapter<VH> mStickyHeaderAdapter;
    private final Rect mTempRect = new Rect();
    private final Rect mTempRect1 = new Rect();

    public StickyHeaderLayoutManager(RecyclerView recyclerView) {
        this.mRecyclerView = recyclerView;
    }

    public void getHeaderBounds(Rect rect, View view, View view2) {
        StickyHeaderUtil.extractMargins(view, this.mTempRect);
        StickyHeaderUtil.extractMargins(view2, this.mTempRect1);
        int i = this.mTempRect.left;
        int max = Math.max(((view2.getTop() - this.mTempRect1.top) - view.getHeight()) - this.mTempRect.bottom, StickyHeaderUtil.getListTop(this.mRecyclerView) + this.mTempRect.top);
        rect.set(i, max, view.getWidth() + i, view.getHeight() + max);
    }

    public boolean hasDifferentHeader(int i, int i2) {
        boolean z = false;
        if (i == i2) {
            return false;
        }
        if (StickyHeaderUtil.indexOutOfBounds(this.mRecyclerView.getAdapter(), i) || StickyHeaderUtil.indexOutOfBounds(this.mRecyclerView.getAdapter(), i2)) {
            return true;
        }
        if (this.mStickyHeaderAdapter.getHeaderIndex(i) != this.mStickyHeaderAdapter.getHeaderIndex(i2)) {
            z = true;
        }
        return z;
    }

    public boolean hasStickyHeader(StickyHeaderRecycler stickyHeaderRecycler, ViewHolder viewHolder) {
        int i;
        boolean z = false;
        if (!isReady() || this.mStickyHeaderAdapter.getHeaderCount() <= 0) {
            return false;
        }
        int headerIndex = this.mStickyHeaderAdapter.getHeaderIndex(viewHolder.getAdapterPosition());
        if (!StickyHeaderUtil.isValidHeaderIndex(headerIndex)) {
            return false;
        }
        long headerId = this.mStickyHeaderAdapter.getHeaderId(headerIndex);
        if (!StickyHeaderUtil.isValidHeaderId(headerId)) {
            return false;
        }
        HeaderViewHolder layoutHeader = stickyHeaderRecycler.getLayoutHeader(headerId);
        if (layoutHeader != null) {
            StickyHeaderUtil.extractMargins(layoutHeader.itemView, this.mTempRect1);
            i = layoutHeader.itemView.getHeight() + this.mTempRect1.bottom;
            if (i < this.mAnalysisMinHeaderHeight) {
                this.mAnalysisMinHeaderHeight = i;
            }
        } else {
            i = this.mAnalysisMinHeaderHeight;
            Log.e("StickyHeaderLayoutManager", "holder is null, mAnalysisMinHeaderHeight %d, item top %d", Integer.valueOf(this.mAnalysisMinHeaderHeight), Integer.valueOf(viewHolder.itemView.getTop()));
        }
        StickyHeaderUtil.extractMargins(viewHolder.itemView, this.mTempRect);
        if (viewHolder.itemView.getTop() <= this.mTempRect.top + i) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: protected */
    public boolean isReady() {
        if (this.mStickyHeaderAdapter != null) {
            return true;
        }
        Log.w("StickyHeaderLayoutManager", "sticky header adapter shouldn't　be null");
        return false;
    }

    public abstract boolean needOffsetForHeader(ViewHolder viewHolder);

    public void setStickyHeaderAdapter(StickyHeaderAdapter<VH> stickyHeaderAdapter) {
        this.mStickyHeaderAdapter = stickyHeaderAdapter;
    }
}
