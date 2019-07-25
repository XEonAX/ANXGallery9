package com.miui.gallery.widget.stickyheader;

import android.content.Context;
import android.support.v7.widget.GridLayoutManager.SpanSizeLookup;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.RecycledViewPool;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.util.AttributeSet;
import android.view.View;
import com.miui.gallery.util.Log;
import com.miui.gallery.widget.recyclerview.GridItemSpacingDecoration;
import com.miui.gallery.widget.recyclerview.ItemClickSupport.OnItemClickListener;
import com.miui.gallery.widget.recyclerview.ItemClickSupport.OnItemLongClickListener;
import com.miui.gallery.widget.stickyheader.core.StickyHeaderAdapter;
import com.miui.gallery.widget.stickyheader.core.StickyHeaderLayoutManager;
import com.miui.gallery.widget.stickyheader.core.StickyHeaderRecyclerView;

public class StickyHeaderGridRecyclerView extends StickyHeaderRecyclerView implements OnLayoutChangedListener {
    protected StickyHeaderGridAdapterWrapper mAdapter;
    /* access modifiers changed from: private */
    public OnItemClickListener mItemClickDelegate;
    /* access modifiers changed from: private */
    public OnItemLongClickListener mItemLongClickDelegate;
    private GridItemSpacingDecoration mItemSpacingDecoration;
    private StickyGridLayoutManager mLayout;
    private StickyHeaderAdapter mStickyAdapterDelegate;

    private class RecycledViewPoolWrapper extends RecycledViewPool {
        private RecycledViewPoolWrapper() {
        }
    }

    public StickyHeaderGridRecyclerView(Context context) {
        this(context, null);
    }

    public StickyHeaderGridRecyclerView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public StickyHeaderGridRecyclerView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        super.setOnItemClickListener(new OnItemClickListener() {
            public boolean onItemClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2) {
                int i2 = i;
                int decryptPosition = StickyHeaderGridRecyclerView.this.mAdapter.decryptPosition(i);
                if (!StickyHeaderGridRecyclerView.this.mAdapter.isExtraPosition(decryptPosition) && StickyHeaderGridRecyclerView.this.mItemClickDelegate != null) {
                    return StickyHeaderGridRecyclerView.this.mItemClickDelegate.onItemClick(recyclerView, view, decryptPosition, j, f, f2);
                }
                return false;
            }
        });
        super.setOnItemLongClickListener(new OnItemLongClickListener() {
            public boolean onItemLongClick(RecyclerView recyclerView, View view, int i, long j) {
                int decryptPosition = StickyHeaderGridRecyclerView.this.mAdapter.decryptPosition(i);
                if (!StickyHeaderGridRecyclerView.this.mAdapter.isExtraPosition(decryptPosition) && StickyHeaderGridRecyclerView.this.mItemLongClickDelegate != null) {
                    return StickyHeaderGridRecyclerView.this.mItemLongClickDelegate.onItemLongClick(recyclerView, view, decryptPosition, j);
                }
                return false;
            }
        });
        setRecycledViewPool(new RecycledViewPoolWrapper());
        this.mItemSpacingDecoration = new StickyHeaderSpacingDecoration(this, false);
        addItemDecoration(this.mItemSpacingDecoration);
    }

    public View findChildViewUnderForExternal(float f, float f2) {
        View findChildViewUnderForExternal = super.findChildViewUnderForExternal(f, f2);
        int childAdapterPosition = getChildAdapterPosition(findChildViewUnderForExternal);
        if (findChildViewUnderForExternal == null) {
            return findChildViewUnderForExternal;
        }
        if (childAdapterPosition == -1 || this.mAdapter.isExtraPosition(this.mAdapter.decryptPosition(childAdapterPosition))) {
            return null;
        }
        return findChildViewUnderForExternal;
    }

    public int findFirstVisibleItemPosition() {
        if (this.mLayout == null || this.mAdapter == null) {
            return -1;
        }
        int findFirstVisibleItemPosition = this.mLayout.findFirstVisibleItemPosition();
        int i = -1;
        while (findFirstVisibleItemPosition != -1 && findFirstVisibleItemPosition < this.mAdapter.getItemCount()) {
            i = this.mAdapter.decryptPosition(findFirstVisibleItemPosition);
            if (!this.mAdapter.isExtraPosition(i)) {
                return i;
            }
            findFirstVisibleItemPosition++;
        }
        return i;
    }

    public int findLastVisibleItemPosition() {
        if (this.mLayout == null || this.mAdapter == null) {
            return -1;
        }
        int findLastVisibleItemPosition = this.mLayout.findLastVisibleItemPosition();
        int i = -1;
        while (findLastVisibleItemPosition != -1 && findLastVisibleItemPosition > -1) {
            i = this.mAdapter.decryptPosition(findLastVisibleItemPosition);
            if (!this.mAdapter.isExtraPosition(i)) {
                return i;
            }
            findLastVisibleItemPosition--;
        }
        return i;
    }

    public ViewHolder findViewHolderForAdapterPositionForExternal(int i) {
        return super.findViewHolderForAdapterPositionForExternal(this.mAdapter.encryptPosition(i));
    }

    public int getChildAdapterPositionForExternal(View view) {
        int childAdapterPositionForExternal = super.getChildAdapterPositionForExternal(view);
        int decryptPosition = this.mAdapter.decryptPosition(childAdapterPositionForExternal);
        if (childAdapterPositionForExternal == -1 || this.mAdapter.isExtraPosition(decryptPosition)) {
            return -1;
        }
        return decryptPosition;
    }

    public void onSpanCountChanged(int i, int i2) {
        if (this.mAdapter != null) {
            this.mAdapter.generateData();
        }
        Log.d("StickyHeaderGridRecyclerView", "span count changed from %d to %d", Integer.valueOf(i), Integer.valueOf(i2));
    }

    public void onSpanSizeLookupChanged(SpanSizeLookup spanSizeLookup, SpanSizeLookup spanSizeLookup2) {
        if (this.mAdapter != null) {
            this.mAdapter.generateData();
        }
        Log.d("StickyHeaderGridRecyclerView", "span size lookup changed from %d to %d", spanSizeLookup, spanSizeLookup2);
    }

    public void scrollToPosition(int i) {
        if (this.mAdapter != null) {
            i = this.mAdapter.encryptPosition(i);
        }
        super.scrollToPosition(i);
    }

    public void scrollToPositionWithOffset(int i, int i2) {
        if (this.mAdapter != null) {
            i = this.mAdapter.encryptPosition(i);
        }
        this.mLayout.scrollToPositionWithOffset(i, i2);
    }

    public void setAdapter(Adapter adapter) {
        this.mAdapter = new StickyHeaderGridAdapterWrapper(this, adapter);
        this.mAdapter.setStickyHeaderAdapter(this.mStickyAdapterDelegate);
        if (getStickyHeaderLayoutManager() != null) {
            getStickyHeaderLayoutManager().setStickyHeaderAdapter(this.mAdapter);
        }
        this.mAdapter.setHasStableIds(adapter.hasStableIds());
        super.setStickyHeaderAdapter(this.mAdapter);
        super.setAdapter(this.mAdapter);
    }

    public void setHorizontalSpacing(int i) {
        this.mItemSpacingDecoration.setHorizontalSpacing(i);
    }

    public void setLayoutManager(LayoutManager layoutManager) {
        if (layoutManager instanceof StickyGridLayoutManager) {
            this.mLayout = (StickyGridLayoutManager) layoutManager;
            this.mLayout.setLayoutChangedListener(this);
            super.setLayoutManager(layoutManager);
            return;
        }
        throw new IllegalArgumentException("the layout manager must extends StickyGridLayoutManager");
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        this.mItemClickDelegate = onItemClickListener;
    }

    public void setOnItemLongClickListener(OnItemLongClickListener onItemLongClickListener) {
        this.mItemLongClickDelegate = onItemLongClickListener;
    }

    public void setStickyHeaderAdapter(StickyHeaderAdapter stickyHeaderAdapter) {
        this.mStickyAdapterDelegate = stickyHeaderAdapter;
        if (this.mAdapter != null) {
            this.mAdapter.setStickyHeaderAdapter(stickyHeaderAdapter);
            super.setStickyHeaderAdapter(this.mAdapter);
        }
    }

    public void setStickyHeaderLayoutManager(StickyHeaderLayoutManager stickyHeaderLayoutManager) {
        if (stickyHeaderLayoutManager != null) {
            stickyHeaderLayoutManager.setStickyHeaderAdapter(this.mAdapter);
        }
        super.setStickyHeaderLayoutManager(stickyHeaderLayoutManager);
    }

    public void setVerticalSpacing(int i) {
        this.mItemSpacingDecoration.setVerticalSpacing(i);
    }
}
