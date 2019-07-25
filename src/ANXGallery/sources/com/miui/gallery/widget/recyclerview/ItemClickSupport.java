package com.miui.gallery.widget.recyclerview;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import com.miui.gallery.R;

public class ItemClickSupport {
    /* access modifiers changed from: private */
    public OnItemClickListener mItemClickListener;
    /* access modifiers changed from: private */
    public OnItemLongClickListener mItemLongClickListener;
    private final RecyclerView mRecyclerView;
    private final TouchListener mTouchListener;

    public interface OnItemClickListener {
        boolean onItemClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2);
    }

    public interface OnItemLongClickListener {
        boolean onItemLongClick(RecyclerView recyclerView, View view, int i, long j);
    }

    private class TouchListener extends ClickItemTouchListener {
        TouchListener(RecyclerView recyclerView) {
            super(recyclerView);
        }

        /* access modifiers changed from: 0000 */
        public boolean performItemClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2) {
            if (ItemClickSupport.this.mItemClickListener == null) {
                return false;
            }
            boolean onItemClick = ItemClickSupport.this.mItemClickListener.onItemClick(recyclerView, view, i, j, f, f2);
            if (onItemClick) {
                View view2 = view;
                view.playSoundEffect(0);
            }
            return onItemClick;
        }

        /* access modifiers changed from: 0000 */
        public boolean performItemLongClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2) {
            if (ItemClickSupport.this.mItemLongClickListener == null) {
                return false;
            }
            boolean onItemLongClick = ItemClickSupport.this.mItemLongClickListener.onItemLongClick(recyclerView, view, i, j);
            if (onItemLongClick) {
                view.performHapticFeedback(0);
            }
            return onItemLongClick;
        }
    }

    private ItemClickSupport(RecyclerView recyclerView) {
        this.mRecyclerView = recyclerView;
        this.mTouchListener = new TouchListener(recyclerView);
        recyclerView.addOnItemTouchListener(this.mTouchListener);
    }

    public static ItemClickSupport addTo(RecyclerView recyclerView) {
        ItemClickSupport from = from(recyclerView);
        if (from != null) {
            return from;
        }
        ItemClickSupport itemClickSupport = new ItemClickSupport(recyclerView);
        recyclerView.setTag(R.id.tag_item_click_support, itemClickSupport);
        return itemClickSupport;
    }

    public static ItemClickSupport from(RecyclerView recyclerView) {
        if (recyclerView == null) {
            return null;
        }
        return (ItemClickSupport) recyclerView.getTag(R.id.tag_item_click_support);
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        this.mItemClickListener = onItemClickListener;
    }

    public void setOnItemLongClickListener(OnItemLongClickListener onItemLongClickListener) {
        if (!this.mRecyclerView.isLongClickable()) {
            this.mRecyclerView.setLongClickable(true);
        }
        this.mItemLongClickListener = onItemLongClickListener;
    }
}
