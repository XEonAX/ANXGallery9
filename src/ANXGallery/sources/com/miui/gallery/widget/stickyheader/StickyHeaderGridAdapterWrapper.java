package com.miui.gallery.widget.stickyheader;

import android.content.Context;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.AdapterDataObserver;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.util.Log;
import com.miui.gallery.widget.stickyheader.core.HeaderViewHolder;
import com.miui.gallery.widget.stickyheader.core.StickyHeaderAdapter;
import com.miui.gallery.widget.stickyheader.core.StickyHeaderUtil;
import java.util.ArrayList;
import java.util.List;

class StickyHeaderGridAdapterWrapper<ADAPTER extends Adapter<VH>, VH extends ViewHolder, HVH extends HeaderViewHolder> extends Adapter<ViewHolder> implements StickyHeaderAdapter<HVH> {
    private static final SparseArray<Integer> sExtraPositionTypeMap = new SparseArray<>();
    private ADAPTER mAdapter;
    private ArrayList<Integer> mHeaderIndexMap;
    private ArrayList<Integer> mPositionMap;
    private RecyclerView mRecyclerView;
    private StickyHeaderAdapter<HVH> mStickyAdapter;

    private static class FillerViewHolder extends ViewHolder {
        public FillerViewHolder(Context context) {
            super(new View(context));
        }
    }

    static {
        sExtraPositionTypeMap.put(Integer.MIN_VALUE, Integer.valueOf(-1));
    }

    public StickyHeaderGridAdapterWrapper(RecyclerView recyclerView, ADAPTER adapter) {
        this.mRecyclerView = recyclerView;
        this.mAdapter = adapter;
        this.mAdapter.registerAdapterDataObserver(new AdapterDataObserver() {
            private int encryptItemCount(int i, int i2) {
                return (StickyHeaderGridAdapterWrapper.this.encryptPosition((i + i2) - 1) - StickyHeaderGridAdapterWrapper.this.encryptPosition(i)) + 1;
            }

            public void onChanged() {
                StickyHeaderGridAdapterWrapper.this.generateData();
                StickyHeaderGridAdapterWrapper.this.notifyDataSetChanged();
            }

            public void onItemRangeChanged(int i, int i2) {
                int encryptPosition = StickyHeaderGridAdapterWrapper.this.encryptPosition(i);
                int encryptItemCount = encryptItemCount(i, i2);
                StickyHeaderGridAdapterWrapper.this.generateData();
                StickyHeaderGridAdapterWrapper.this.notifyItemRangeChanged(encryptPosition, encryptItemCount);
            }

            public void onItemRangeChanged(int i, int i2, Object obj) {
                int encryptPosition = StickyHeaderGridAdapterWrapper.this.encryptPosition(i);
                int encryptItemCount = encryptItemCount(i, i2);
                StickyHeaderGridAdapterWrapper.this.generateData();
                StickyHeaderGridAdapterWrapper.this.notifyItemRangeChanged(encryptPosition, encryptItemCount, obj);
            }

            public void onItemRangeInserted(int i, int i2) {
                int encryptPosition = StickyHeaderGridAdapterWrapper.this.encryptPosition(i);
                int encryptItemCount = encryptItemCount(i, i2);
                StickyHeaderGridAdapterWrapper.this.generateData();
                StickyHeaderGridAdapterWrapper.this.notifyItemRangeInserted(encryptPosition, encryptItemCount);
            }

            public void onItemRangeMoved(int i, int i2, int i3) {
                int encryptPosition = StickyHeaderGridAdapterWrapper.this.encryptPosition(i);
                int encryptPosition2 = StickyHeaderGridAdapterWrapper.this.encryptPosition(i2);
                StickyHeaderGridAdapterWrapper.this.generateData();
                StickyHeaderGridAdapterWrapper.this.notifyItemMoved(encryptPosition, encryptPosition2);
            }

            public void onItemRangeRemoved(int i, int i2) {
                int encryptPosition = StickyHeaderGridAdapterWrapper.this.encryptPosition(i);
                int encryptItemCount = encryptItemCount(i, i2);
                StickyHeaderGridAdapterWrapper.this.generateData();
                StickyHeaderGridAdapterWrapper.this.notifyItemRangeRemoved(encryptPosition, encryptItemCount);
            }
        });
    }

    private boolean isCustomHolder(ViewHolder viewHolder) {
        int adapterPosition = viewHolder.getAdapterPosition();
        boolean z = false;
        if (adapterPosition == -1) {
            Log.w("StickyHeaderGridAdapterWrapper", "onViewRecycled NO_POSITION %s", viewHolder);
            return false;
        }
        if (!isExtraPosition(decryptPosition(adapterPosition)) && !(viewHolder instanceof FillerViewHolder)) {
            z = true;
        }
        return z;
    }

    private boolean isReady() {
        if (this.mStickyAdapter != null) {
            return true;
        }
        Log.w("StickyHeaderGridAdapterWrapper", "sticky header adapter shouldn't be null");
        return false;
    }

    /* access modifiers changed from: protected */
    public int decryptPosition(int i) {
        if (!isReady()) {
            return i;
        }
        if (i >= 0 && i < this.mPositionMap.size()) {
            return ((Integer) this.mPositionMap.get(i)).intValue();
        }
        Log.e("StickyHeaderGridAdapterWrapper", "position %d out of bounds", (Object) Integer.valueOf(i));
        return i;
    }

    /* access modifiers changed from: protected */
    public int decryptViewType(int i) {
        return i < 1 ? i : i - 1;
    }

    /* access modifiers changed from: protected */
    public int encryptPosition(int i) {
        if (!isReady()) {
            return i;
        }
        for (int i2 = 0; i2 < this.mPositionMap.size(); i2++) {
            if (((Integer) this.mPositionMap.get(i2)).intValue() == i) {
                return i2;
            }
        }
        return i;
    }

    /* access modifiers changed from: protected */
    public int encryptViewType(int i) {
        return i + 1;
    }

    /* access modifiers changed from: protected */
    public void generateData() {
        int i;
        if (this.mHeaderIndexMap == null) {
            this.mHeaderIndexMap = new ArrayList<>();
        }
        if (this.mPositionMap == null) {
            this.mPositionMap = new ArrayList<>();
        }
        this.mHeaderIndexMap.clear();
        this.mPositionMap.clear();
        if (isReady()) {
            if (this.mStickyAdapter.getHeaderCount() <= 0) {
                Log.w("StickyHeaderGridAdapterWrapper", "header count is invalid");
                return;
            }
            int itemCount = this.mAdapter.getItemCount();
            if (itemCount > 0) {
                LayoutManager layoutManager = this.mRecyclerView.getLayoutManager();
                if (layoutManager instanceof GridLayoutManager) {
                    int spanCount = ((GridLayoutManager) layoutManager).getSpanCount();
                    int i2 = -1;
                    int i3 = 0;
                    while (true) {
                        i = itemCount - 1;
                        if (i3 >= i) {
                            break;
                        }
                        int headerIndex = this.mStickyAdapter.getHeaderIndex(i3);
                        if (StickyHeaderUtil.isValidHeaderIndex(headerIndex)) {
                            this.mHeaderIndexMap.add(Integer.valueOf(headerIndex));
                            this.mPositionMap.add(Integer.valueOf(i3));
                            i2 = this.mStickyAdapter.getHeaderIndex(i3 + 1);
                            if (headerIndex != i2) {
                                int size = (this.mPositionMap.size() - 1) % spanCount;
                                while (true) {
                                    size++;
                                    if (size >= spanCount) {
                                        break;
                                    }
                                    this.mHeaderIndexMap.add(Integer.valueOf(headerIndex));
                                    this.mPositionMap.add(Integer.valueOf(Integer.MIN_VALUE));
                                }
                            }
                        }
                        i3++;
                    }
                    this.mHeaderIndexMap.add(Integer.valueOf(i2));
                    this.mPositionMap.add(Integer.valueOf(i));
                }
            }
        }
    }

    public int getHeaderCount() {
        return this.mStickyAdapter.getHeaderCount();
    }

    public long getHeaderId(int i) {
        return this.mStickyAdapter.getHeaderId(i);
    }

    public int getHeaderIndex(int i) {
        return ((Integer) this.mHeaderIndexMap.get(i)).intValue();
    }

    public int getHeaderViewType(int i) {
        return this.mStickyAdapter.getHeaderViewType(i);
    }

    public int getItemCount() {
        return isReady() ? this.mPositionMap.size() : this.mAdapter.getItemCount();
    }

    public long getItemId(int i) {
        int decryptPosition = decryptPosition(i);
        return isExtraPosition(decryptPosition) ? Long.MAX_VALUE - ((long) decryptPosition) : this.mAdapter.getItemId(decryptPosition);
    }

    public int[] getItemPositionInterval(int i) {
        int[] itemPositionInterval = this.mStickyAdapter.getItemPositionInterval(i);
        itemPositionInterval[0] = encryptPosition(itemPositionInterval[0]);
        itemPositionInterval[1] = encryptPosition(itemPositionInterval[1]);
        return itemPositionInterval;
    }

    public int getItemViewType(int i) {
        int decryptPosition = decryptPosition(i);
        return isExtraPosition(decryptPosition) ? ((Integer) sExtraPositionTypeMap.get(decryptPosition)).intValue() : encryptViewType(super.getItemViewType(decryptPosition));
    }

    /* access modifiers changed from: protected */
    public boolean isExtraPosition(int i) {
        return i < 0;
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        this.mAdapter.onAttachedToRecyclerView(recyclerView);
    }

    public void onBindHeaderViewHolder(HVH hvh, int i) {
        this.mStickyAdapter.onBindHeaderViewHolder(hvh, i);
    }

    public void onBindViewHolder(ViewHolder viewHolder, int i) {
        int decryptPosition = decryptPosition(i);
        if (!isExtraPosition(decryptPosition)) {
            this.mAdapter.onBindViewHolder(viewHolder, decryptPosition);
        }
    }

    public void onBindViewHolder(ViewHolder viewHolder, int i, List<Object> list) {
        int decryptPosition = decryptPosition(i);
        if (!isExtraPosition(decryptPosition)) {
            this.mAdapter.onBindViewHolder(viewHolder, decryptPosition, list);
        }
    }

    public HVH onCreateHeaderViewHolder(ViewGroup viewGroup, int i) {
        return this.mStickyAdapter.onCreateHeaderViewHolder(viewGroup, i);
    }

    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        int decryptViewType = decryptViewType(i);
        return decryptViewType == -1 ? new FillerViewHolder(viewGroup.getContext()) : this.mAdapter.onCreateViewHolder(viewGroup, decryptViewType);
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        this.mAdapter.onDetachedFromRecyclerView(recyclerView);
    }

    public boolean onFailedToRecycleView(ViewHolder viewHolder) {
        if (isCustomHolder(viewHolder)) {
            return this.mAdapter.onFailedToRecycleView(viewHolder);
        }
        return true;
    }

    public void onViewAttachedToWindow(ViewHolder viewHolder) {
        if (isCustomHolder(viewHolder)) {
            this.mAdapter.onViewAttachedToWindow(viewHolder);
        }
    }

    public void onViewDetachedFromWindow(ViewHolder viewHolder) {
        if (isCustomHolder(viewHolder)) {
            this.mAdapter.onViewDetachedFromWindow(viewHolder);
        }
    }

    public void onViewRecycled(ViewHolder viewHolder) {
        if (isCustomHolder(viewHolder)) {
            this.mAdapter.onViewRecycled(viewHolder);
        }
    }

    /* access modifiers changed from: 0000 */
    public void setStickyHeaderAdapter(StickyHeaderAdapter<HVH> stickyHeaderAdapter) {
        this.mStickyAdapter = stickyHeaderAdapter;
        generateData();
    }
}
