package com.miui.gallery.widget.recyclerview;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.AdapterDataObserver;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.OnItemTouchListener;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.util.AttributeSet;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.util.photoview.ScrollableView;
import com.miui.gallery.widget.recyclerview.ItemClickSupport.OnItemClickListener;
import com.miui.gallery.widget.recyclerview.ItemClickSupport.OnItemLongClickListener;
import java.util.LinkedList;
import java.util.List;

public class GalleryRecyclerView extends RecyclerView implements ScrollableView, OnItemLongClickListener {
    private boolean isHideViewCalled;
    private ContextMenuInfo mContextMenuInfo;
    protected FastScroller mCustomFastScroller;
    private View mEmptyView;
    private boolean mEnableCustomFastScroller;
    private int mFastScrollStyle;
    protected ItemClickSupport mItemClickSupport;
    private final RecyclerViewDataObserver mObserver;
    private OnItemLongClickListener mOnItemLongClickListener;
    private List<OnItemTouchListener> mOnItemTouchListeners;

    public static class RecyclerContextMenuInfo implements ContextMenuInfo {
        public int position;

        public RecyclerContextMenuInfo(int i) {
            setValues(i);
        }

        public void setValues(int i) {
            this.position = i;
        }
    }

    private class RecyclerViewDataObserver extends AdapterDataObserver {
        private RecyclerViewDataObserver() {
        }

        public void onChanged() {
            super.onChanged();
            GalleryRecyclerView.this.updateEmptyStatus();
        }

        public void onItemRangeChanged(int i, int i2) {
            super.onItemRangeChanged(i, i2);
            GalleryRecyclerView.this.updateEmptyStatus();
        }

        public void onItemRangeChanged(int i, int i2, Object obj) {
            super.onItemRangeChanged(i, i2, obj);
            GalleryRecyclerView.this.updateEmptyStatus();
        }

        public void onItemRangeInserted(int i, int i2) {
            super.onItemRangeInserted(i, i2);
            GalleryRecyclerView.this.updateEmptyStatus();
        }

        public void onItemRangeMoved(int i, int i2, int i3) {
            super.onItemRangeMoved(i, i2, i3);
            GalleryRecyclerView.this.updateEmptyStatus();
        }

        public void onItemRangeRemoved(int i, int i2) {
            super.onItemRangeRemoved(i, i2);
            GalleryRecyclerView.this.updateEmptyStatus();
        }
    }

    public GalleryRecyclerView(Context context) {
        this(context, null);
    }

    public GalleryRecyclerView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public GalleryRecyclerView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mContextMenuInfo = null;
        this.mOnItemTouchListeners = new LinkedList();
        this.isHideViewCalled = false;
        this.mObserver = new RecyclerViewDataObserver();
        if (attributeSet != null) {
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.RecyclerView, i, 0);
            this.mEnableCustomFastScroller = obtainStyledAttributes.getBoolean(2, false);
            this.mFastScrollStyle = obtainStyledAttributes.getResourceId(3, 0);
            obtainStyledAttributes.recycle();
        }
        initItemClick();
    }

    private void bringFastScrollerToFront() {
        removeItemDecoration(this.mCustomFastScroller);
        super.addItemDecoration(this.mCustomFastScroller, -1);
    }

    private boolean openContextMenu(int i) {
        if (i >= 0) {
            createContextMenuInfo(i);
        }
        return showContextMenu();
    }

    private void setAdapterInternal(Adapter adapter, boolean z, boolean z2) {
        Adapter adapter2 = getAdapter();
        if (adapter2 != null) {
            adapter2.unregisterAdapterDataObserver(this.mObserver);
        }
        adapter.registerAdapterDataObserver(this.mObserver);
        if (z) {
            super.swapAdapter(adapter, z2);
        } else {
            super.setAdapter(adapter);
        }
        updateEmptyStatus();
    }

    /* access modifiers changed from: private */
    public void updateEmptyStatus() {
        Adapter adapter = getAdapter();
        if (!(adapter == null || adapter.getItemCount() == 0)) {
            if (this.mEmptyView != null) {
                this.mEmptyView.setVisibility(8);
            }
            if (!this.isHideViewCalled) {
                super.setVisibility(0);
            }
        } else if (this.mEmptyView != null) {
            this.mEmptyView.setVisibility(0);
            super.setVisibility(8);
        } else if (!this.isHideViewCalled) {
            super.setVisibility(0);
        }
    }

    public void addItemDecoration(ItemDecoration itemDecoration, int i) {
        super.addItemDecoration(itemDecoration, i);
        if (this.mCustomFastScroller != null) {
            bringFastScrollerToFront();
        }
    }

    public void addOnItemTouchListener(OnItemTouchListener onItemTouchListener) {
        super.addOnItemTouchListener(onItemTouchListener);
        this.mOnItemTouchListeners.add(onItemTouchListener);
    }

    /* access modifiers changed from: protected */
    public void createContextMenuInfo(int i) {
        if (this.mContextMenuInfo == null) {
            this.mContextMenuInfo = new RecyclerContextMenuInfo(i);
        } else {
            ((RecyclerContextMenuInfo) this.mContextMenuInfo).setValues(i);
        }
    }

    public View findChildViewUnderForExternal(float f, float f2) {
        return findChildViewUnder(f, f2);
    }

    public int findFirstVisibleItemPosition() {
        LayoutManager layoutManager = getLayoutManager();
        if (layoutManager == null || layoutManager.getChildCount() <= 0) {
            return -1;
        }
        return getChildAdapterPosition(layoutManager.getChildAt(0));
    }

    public int findLastVisibleItemPosition() {
        LayoutManager layoutManager = getLayoutManager();
        if (layoutManager == null || layoutManager.getChildCount() <= 0) {
            return -1;
        }
        return getChildAdapterPosition(layoutManager.getChildAt(layoutManager.getChildCount() - 1));
    }

    public ViewHolder findViewHolderForAdapterPositionForExternal(int i) {
        return findViewHolderForAdapterPosition(i);
    }

    public int getChildAdapterPositionForExternal(View view) {
        return getChildAdapterPosition(view);
    }

    /* access modifiers changed from: protected */
    public ContextMenuInfo getContextMenuInfo() {
        return this.mContextMenuInfo;
    }

    /* access modifiers changed from: 0000 */
    public OnItemTouchListener getItemTouchListenerAt(int i) {
        int size = this.mOnItemTouchListeners.size();
        if (i > -1 && i < size) {
            return (OnItemTouchListener) this.mOnItemTouchListeners.get(i);
        }
        StringBuilder sb = new StringBuilder();
        sb.append(i);
        sb.append(" is an invalid index for size ");
        sb.append(size);
        throw new IndexOutOfBoundsException(sb.toString());
    }

    /* access modifiers changed from: 0000 */
    public int getItemTouchListenerCount() {
        return this.mOnItemTouchListeners.size();
    }

    /* access modifiers changed from: protected */
    public void initItemClick() {
        this.mItemClickSupport = ItemClickSupport.addTo(this);
        this.mItemClickSupport.setOnItemLongClickListener(this);
    }

    public boolean onItemLongClick(RecyclerView recyclerView, View view, int i, long j) {
        return (this.mOnItemLongClickListener != null ? this.mOnItemLongClickListener.onItemLongClick(recyclerView, view, i, j) : false) || openContextMenu(i);
    }

    public void removeOnItemTouchListener(OnItemTouchListener onItemTouchListener) {
        super.removeOnItemTouchListener(onItemTouchListener);
        this.mOnItemTouchListeners.remove(onItemTouchListener);
    }

    public void scrollToPosition(int i) {
        super.scrollToPosition(i);
    }

    public void scrollToPositionWithOffset(int i, int i2) {
        LayoutManager layoutManager = getLayoutManager();
        if (layoutManager == null || !(layoutManager instanceof LinearLayoutManager)) {
            scrollToPosition(i);
        } else {
            ((LinearLayoutManager) layoutManager).scrollToPositionWithOffset(i, i2);
        }
    }

    public void setAdapter(Adapter adapter) {
        setAdapterInternal(adapter, false, true);
    }

    public void setEmptyView(View view) {
        this.mEmptyView = view;
        if (view != null && view.getImportantForAccessibility() == 0) {
            view.setImportantForAccessibility(1);
        }
        updateEmptyStatus();
    }

    public void setFastScrollEnabled(boolean z) {
        if (this.mEnableCustomFastScroller != z) {
            this.mEnableCustomFastScroller = z;
            if (z) {
                if (this.mCustomFastScroller == null) {
                    this.mCustomFastScroller = new FastScroller(this);
                    this.mCustomFastScroller.setStyle(this.mFastScrollStyle);
                }
                this.mCustomFastScroller.attach();
            } else if (this.mCustomFastScroller != null) {
                this.mCustomFastScroller.detach();
            }
        }
    }

    public void setFastScrollStyle(int i) {
        if (this.mCustomFastScroller == null) {
            this.mFastScrollStyle = i;
        } else {
            this.mCustomFastScroller.setStyle(i);
        }
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        this.mItemClickSupport.setOnItemClickListener(onItemClickListener);
    }

    public void setOnItemLongClickListener(OnItemLongClickListener onItemLongClickListener) {
        this.mOnItemLongClickListener = onItemLongClickListener;
    }

    public void setVisibility(int i) {
        this.isHideViewCalled = i != 0;
        super.setVisibility(i);
    }

    public void swapAdapter(Adapter adapter, boolean z) {
        setAdapterInternal(adapter, true, z);
    }

    public void viewToPosition(int i) {
        scrollToPositionWithOffset(i, getHeight() / 2);
    }
}
