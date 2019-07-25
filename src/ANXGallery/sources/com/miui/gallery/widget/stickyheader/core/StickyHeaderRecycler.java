package com.miui.gallery.widget.stickyheader.core;

import android.support.v7.widget.RecyclerView;
import android.util.LongSparseArray;
import android.util.SparseArray;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import com.miui.gallery.util.Log;
import com.miui.gallery.widget.stickyheader.core.HeaderViewHolder;
import java.util.LinkedList;

public final class StickyHeaderRecycler<VH extends HeaderViewHolder> {
    private final StickyHeaderAdapter<VH> mHeaderAdapter;
    private final LongSparseArray<VH> mLayoutHeaders = new LongSparseArray<>();
    private final SparseArray<LinkedList<VH>> mRecycleHeaders = new SparseArray<>();

    public StickyHeaderRecycler(StickyHeaderAdapter<VH> stickyHeaderAdapter) {
        this.mHeaderAdapter = stickyHeaderAdapter;
    }

    private void addHeaderToRecycler(VH vh) {
        LinkedList linkedList = (LinkedList) this.mRecycleHeaders.get(vh.getHeaderViewType());
        if (linkedList == null) {
            linkedList = new LinkedList();
            this.mRecycleHeaders.put(vh.getHeaderViewType(), linkedList);
        }
        linkedList.add(vh);
    }

    private VH pollHeaderFromRecycler(int i) {
        LinkedList linkedList = (LinkedList) this.mRecycleHeaders.get(i);
        if (linkedList == null || linkedList.size() <= 0) {
            return null;
        }
        return (HeaderViewHolder) linkedList.remove();
    }

    public VH getHeaderView(RecyclerView recyclerView, int i) {
        if (!StickyHeaderUtil.isValidHeaderIndex(i)) {
            Log.w("StickyHeaderRecycler", "getHeaderView: header index %d is invalid", Integer.valueOf(i));
            return null;
        }
        long headerId = this.mHeaderAdapter.getHeaderId(i);
        int headerViewType = this.mHeaderAdapter.getHeaderViewType(i);
        if (!StickyHeaderUtil.isValidHeaderId(headerId)) {
            Log.w("StickyHeaderRecycler", "getHeaderView: header id is invalid, index %d", Integer.valueOf(i));
            return null;
        }
        VH vh = (HeaderViewHolder) this.mLayoutHeaders.get(headerId);
        boolean z = vh != null;
        if (vh == null) {
            vh = pollHeaderFromRecycler(headerViewType);
        }
        if (vh == null) {
            long currentTimeMillis = System.currentTimeMillis();
            vh = this.mHeaderAdapter.onCreateHeaderViewHolder(recyclerView, headerViewType);
            vh.mHeaderViewType = headerViewType;
            Log.d("StickyHeaderRecycler", "create header cost %s", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        }
        this.mHeaderAdapter.onBindHeaderViewHolder(vh, i);
        vh.mHeaderId = headerId;
        vh.mHeaderIndex = i;
        if (vh.itemView.getLayoutParams() == null) {
            vh.itemView.setLayoutParams(new LayoutParams(-2, -2));
        }
        vh.itemView.measure(ViewGroup.getChildMeasureSpec(MeasureSpec.makeMeasureSpec(recyclerView.getWidth(), 1073741824), recyclerView.getPaddingStart() + recyclerView.getPaddingEnd(), vh.itemView.getLayoutParams().width), ViewGroup.getChildMeasureSpec(MeasureSpec.makeMeasureSpec(recyclerView.getHeight(), 0), recyclerView.getPaddingTop() + recyclerView.getPaddingBottom(), vh.itemView.getLayoutParams().height));
        vh.itemView.layout(0, 0, vh.itemView.getMeasuredWidth(), vh.itemView.getMeasuredHeight());
        if (!z) {
            this.mLayoutHeaders.put(vh.getHeaderId(), vh);
            Log.d("StickyHeaderRecycler", "layout header %s", (Object) Long.valueOf(vh.getHeaderId()));
        }
        return vh;
    }

    /* access modifiers changed from: 0000 */
    public VH getLayoutHeader(long j) {
        return (HeaderViewHolder) this.mLayoutHeaders.get(j);
    }

    /* access modifiers changed from: 0000 */
    public LongSparseArray<VH> getLayoutHeaders() {
        return this.mLayoutHeaders.clone();
    }

    public void recycleHeader(VH vh) {
        Log.d("StickyHeaderRecycler", "recycle header %s", (Object) Long.valueOf(vh.getHeaderId()));
        this.mLayoutHeaders.remove(vh.getHeaderId());
        addHeaderToRecycler(vh);
    }
}
