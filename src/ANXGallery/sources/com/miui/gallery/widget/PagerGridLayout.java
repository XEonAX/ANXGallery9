package com.miui.gallery.widget;

import android.content.Context;
import android.database.DataSetObservable;
import android.database.DataSetObserver;
import android.support.v7.widget.GridLayout;
import android.support.v7.widget.GridLayout.LayoutParams;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class PagerGridLayout extends GridLayout {
    private BaseAdapter mAdapter;
    private int mColumnCount;
    private int mCount;
    private DataSetObserver mDataSetObserver;
    private int mItemCount;
    private OnPageChangedListener mListener;
    private int mPageCount;
    /* access modifiers changed from: private */
    public int mPageIndex;
    private int mRowCount;

    public static abstract class BaseAdapter {
        private final DataSetObservable mDataSetObservable = new DataSetObservable();

        public abstract void bindData(int i, View view);

        public abstract void freshView(View view);

        public abstract int getColumnsCount();

        public abstract int getCount();

        public abstract int getRowsCount();

        public abstract View getView(LayoutInflater layoutInflater, ViewGroup viewGroup);

        public void notifyDataSetChanged() {
            this.mDataSetObservable.notifyChanged();
        }

        public abstract void onPageChanged();

        public void registerDataSetObserver(DataSetObserver dataSetObserver) {
            this.mDataSetObservable.registerObserver(dataSetObserver);
        }

        public void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
            this.mDataSetObservable.unregisterObserver(dataSetObserver);
        }
    }

    public interface OnPageChangedListener {
        void onPageChanged(int i, int i2, boolean z);
    }

    public PagerGridLayout(Context context) {
        this(context, null);
    }

    public PagerGridLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public PagerGridLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mDataSetObserver = new DataSetObserver() {
            public void onChanged() {
                PagerGridLayout.this.bindPage(PagerGridLayout.this.mPageIndex);
            }

            public void onInvalidated() {
            }
        };
    }

    /* access modifiers changed from: private */
    public void bindPage(int i) {
        boolean z = false;
        if (i < this.mPageCount) {
            int i2 = this.mItemCount * i;
            int childCount = getChildCount();
            for (int i3 = 0; i3 < childCount; i3++) {
                View childAt = getChildAt(i3);
                int i4 = i2 + i3;
                if (i4 >= this.mCount) {
                    childAt.setVisibility(4);
                } else {
                    childAt.setVisibility(0);
                    this.mAdapter.bindData(i4, childAt);
                }
            }
        }
        if (this.mListener != null) {
            OnPageChangedListener onPageChangedListener = this.mListener;
            int i5 = this.mPageIndex;
            int i6 = this.mPageCount;
            if (i == this.mPageCount) {
                z = true;
            }
            onPageChangedListener.onPageChanged(i5, i6, z);
        }
    }

    public void changeToNextPage() {
        if (this.mPageIndex + 1 <= this.mPageCount) {
            this.mPageIndex++;
            this.mAdapter.onPageChanged();
            bindPage(this.mPageIndex);
        }
    }

    public void freshCurrentPage() {
        if (this.mAdapter != null) {
            int i = this.mPageIndex;
            int i2 = this.mItemCount;
            int childCount = getChildCount();
            for (int i3 = 0; i3 < childCount; i3++) {
                View childAt = getChildAt(i3);
                if (childAt.getVisibility() == 0) {
                    this.mAdapter.freshView(childAt);
                }
            }
        }
    }

    public void setAdapter(BaseAdapter baseAdapter) {
        setAdapter(baseAdapter, 0);
    }

    public void setAdapter(BaseAdapter baseAdapter, int i) {
        if (this.mAdapter != null) {
            this.mAdapter.unregisterDataSetObserver(this.mDataSetObserver);
        }
        this.mAdapter = baseAdapter;
        baseAdapter.registerDataSetObserver(this.mDataSetObserver);
        LayoutInflater from = LayoutInflater.from(getContext());
        int columnsCount = baseAdapter.getColumnsCount();
        int rowsCount = baseAdapter.getRowsCount();
        this.mRowCount = rowsCount;
        this.mColumnCount = columnsCount;
        this.mItemCount = columnsCount * rowsCount;
        this.mCount = baseAdapter.getCount();
        this.mPageIndex = i;
        this.mPageCount = (this.mCount + (this.mItemCount - 1)) / this.mItemCount;
        for (int i2 = 0; i2 < rowsCount; i2++) {
            for (int i3 = 0; i3 < columnsCount; i3++) {
                addView(this.mAdapter.getView(from, this), new LayoutParams(GridLayout.spec(i2, 1.0f), GridLayout.spec(i3, 1.0f)));
            }
        }
        bindPage(this.mPageIndex);
    }

    public void setOnPageChangedListener(OnPageChangedListener onPageChangedListener) {
        this.mListener = onPageChangedListener;
    }
}
