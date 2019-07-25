package com.miui.gallery.adapter;

import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.AdapterDataObserver;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.ViewGroup;

public abstract class RecyclerAdapterWrapper<T extends Adapter<VH>, VH extends ViewHolder> extends Adapter<VH> {
    protected final T mWrapped;

    public RecyclerAdapterWrapper(T t) {
        if (t != null) {
            this.mWrapped = t;
            this.mWrapped.registerAdapterDataObserver(new AdapterDataObserver() {
                public void onChanged() {
                    RecyclerAdapterWrapper.this.notifyDataSetChanged();
                }

                public void onItemRangeChanged(int i, int i2) {
                    RecyclerAdapterWrapper.this.onHandleWrappedAdapterItemRangeChanged(i, i2);
                }

                public void onItemRangeInserted(int i, int i2) {
                    RecyclerAdapterWrapper.this.onHandleWrappedAdapterItemRangeInserted(i, i2);
                }

                public void onItemRangeMoved(int i, int i2, int i3) {
                    RecyclerAdapterWrapper.this.onHandleWrappedAdapterItemRangeMoved(i, i2, i3);
                }

                public void onItemRangeRemoved(int i, int i2) {
                    RecyclerAdapterWrapper.this.onHandleWrappedAdapterItemRangeRemoved(i, i2);
                }
            });
            return;
        }
        throw new RuntimeException("The wrapped adapter can't be null!");
    }

    public int getItemCount() {
        return this.mWrapped.getItemCount();
    }

    public long getItemId(int i) {
        return this.mWrapped.getItemId(i);
    }

    public int getItemViewType(int i) {
        return this.mWrapped.getItemViewType(i);
    }

    public final Adapter getWrappedAdapter() {
        return this.mWrapped;
    }

    public final int getWrappedAdapterItemCount() {
        return this.mWrapped.getItemCount();
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        this.mWrapped.onAttachedToRecyclerView(recyclerView);
    }

    public void onBindViewHolder(VH vh, int i) {
        this.mWrapped.onBindViewHolder(vh, i);
    }

    public VH onCreateViewHolder(ViewGroup viewGroup, int i) {
        return this.mWrapped.onCreateViewHolder(viewGroup, i);
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        this.mWrapped.onDetachedFromRecyclerView(recyclerView);
    }

    public boolean onFailedToRecycleView(VH vh) {
        return this.mWrapped.onFailedToRecycleView(vh);
    }

    /* access modifiers changed from: protected */
    public abstract void onHandleWrappedAdapterItemRangeChanged(int i, int i2);

    /* access modifiers changed from: protected */
    public abstract void onHandleWrappedAdapterItemRangeInserted(int i, int i2);

    /* access modifiers changed from: protected */
    public abstract void onHandleWrappedAdapterItemRangeMoved(int i, int i2, int i3);

    /* access modifiers changed from: protected */
    public abstract void onHandleWrappedAdapterItemRangeRemoved(int i, int i2);

    public void onViewAttachedToWindow(VH vh) {
        this.mWrapped.onViewAttachedToWindow(vh);
    }

    public void onViewDetachedFromWindow(VH vh) {
        this.mWrapped.onViewDetachedFromWindow(vh);
    }

    public void onViewRecycled(VH vh) {
        this.mWrapped.onViewRecycled(vh);
    }

    public void setHasStableIds(boolean z) {
        this.mWrapped.setHasStableIds(z);
    }
}
