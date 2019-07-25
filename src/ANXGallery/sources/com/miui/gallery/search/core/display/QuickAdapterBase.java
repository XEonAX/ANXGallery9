package com.miui.gallery.search.core.display;

import android.content.Context;
import android.support.v7.util.DiffUtil;
import android.support.v7.util.DiffUtil.Callback;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.AdapterDataObserver;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.LinearLayout;
import com.miui.gallery.R;
import com.miui.gallery.search.core.display.BaseSuggestionViewHolder;
import java.util.ArrayList;

public abstract class QuickAdapterBase<VH extends BaseSuggestionViewHolder> extends Adapter<BaseSuggestionViewHolder> implements FullSpanDelegate {
    protected final Context mContext;
    private LinearLayout mCopyFooterLayout = null;
    private LinearLayout mCopyHeaderLayout = null;
    private AdapterDataObserver mDataObserver = new AdapterDataObserver() {
        public void onChanged() {
            QuickAdapterBase.this.genPositionList();
        }
    };
    private View mEmptyView;
    private boolean mFootAndEmptyEnable;
    private LinearLayout mFooterLayout;
    private boolean mHeadAndEmptyEnable;
    private LinearLayout mHeaderLayout;
    protected final LayoutInflater mLayoutInflater;
    private View mLoadCompleteView;
    private int mLoadCompleteViewRes = -1;
    private OnClickListener mLoadFailedViewOnClickListener = new OnClickListener() {
        public void onClick(View view) {
            QuickAdapterBase.this.removeFooterView(QuickAdapterBase.this.mLoadMoreFailedView);
            QuickAdapterBase.this.openLoadMore();
        }
    };
    /* access modifiers changed from: private */
    public View mLoadMoreFailedView;
    private int mLoadMoreFailedViewRes = -1;
    private boolean mLoadMoreRequested = false;
    private View mLoadingView;
    private int mLoadingViewRes = -1;
    private boolean mNextLoadEnable = false;
    private RequestLoadMoreListener mRequestLoadMoreListener;
    private boolean mShowLoadingView = true;
    private final ArrayList<Integer> mViewTypePositionList = new ArrayList<>();

    private static class DataDiffCallback extends Callback {
        Callback mInnerDiffCallback;
        ArrayList<Integer> mNewTypeList;
        ArrayList<Integer> mOldTypeList;

        public DataDiffCallback(ArrayList<Integer> arrayList, ArrayList<Integer> arrayList2, Callback callback) {
            this.mOldTypeList = arrayList;
            this.mNewTypeList = arrayList2;
            this.mInnerDiffCallback = callback;
        }

        private int getItemStartPosition(ArrayList<Integer> arrayList) {
            for (int i = 0; i < arrayList.size(); i++) {
                if (((Integer) arrayList.get(i)).intValue() != 1) {
                    return i;
                }
            }
            return 0;
        }

        public boolean areContentsTheSame(int i, int i2) {
            if (((Integer) this.mOldTypeList.get(i)).intValue() < 16 || ((Integer) this.mNewTypeList.get(i2)).intValue() < 16) {
                return false;
            }
            return this.mInnerDiffCallback.areContentsTheSame(i - getItemStartPosition(this.mOldTypeList), i2 - getItemStartPosition(this.mNewTypeList));
        }

        public boolean areItemsTheSame(int i, int i2) {
            return ((Integer) this.mOldTypeList.get(i)).equals(this.mNewTypeList.get(i2));
        }

        public int getNewListSize() {
            return this.mNewTypeList.size();
        }

        public int getOldListSize() {
            return this.mOldTypeList.size();
        }
    }

    protected static abstract class InnerDiffCallback extends Callback {
        protected InnerDiffCallback() {
        }

        public boolean areItemsTheSame(int i, int i2) {
            return false;
        }

        public int getNewListSize() {
            return 0;
        }

        public int getOldListSize() {
            return 0;
        }
    }

    private static class NonDataDiffCallback extends Callback {
        ArrayList<Integer> mNewTypeList;
        ArrayList<Integer> mOldTypeList;

        public NonDataDiffCallback(ArrayList<Integer> arrayList, ArrayList<Integer> arrayList2) {
            this.mOldTypeList = arrayList;
            this.mNewTypeList = arrayList2;
        }

        public boolean areContentsTheSame(int i, int i2) {
            return ((Integer) this.mOldTypeList.get(i)).equals(this.mNewTypeList.get(i2));
        }

        public boolean areItemsTheSame(int i, int i2) {
            return ((Integer) this.mOldTypeList.get(i)).equals(this.mNewTypeList.get(i2));
        }

        public int getNewListSize() {
            return this.mNewTypeList.size();
        }

        public int getOldListSize() {
            return this.mOldTypeList.size();
        }
    }

    public QuickAdapterBase(Context context) {
        this.mContext = context;
        this.mLayoutInflater = LayoutInflater.from(context);
        registerAdapterDataObserver(this.mDataObserver);
    }

    private void ensureLayoutParams(View view, ViewGroup viewGroup) {
        if (view.getLayoutParams() == null && (viewGroup instanceof RecyclerView)) {
            RecyclerView recyclerView = (RecyclerView) viewGroup;
            if (recyclerView.getLayoutManager() != null) {
                view.setLayoutParams(recyclerView.getLayoutManager().generateLayoutParams(new LayoutParams(-1, -2)));
            }
        }
    }

    /* access modifiers changed from: private */
    public void genPositionList() {
        this.mViewTypePositionList.clear();
        this.mViewTypePositionList.ensureCapacity(getItemCount());
        if (!noItemView() || this.mNextLoadEnable) {
            if (this.mHeaderLayout != null) {
                this.mViewTypePositionList.add(Integer.valueOf(1));
            }
            for (int i = 0; i < getInnerItemViewCount(); i++) {
                this.mViewTypePositionList.add(Integer.valueOf(getInnerItemViewType(i)));
            }
            if (this.mNextLoadEnable && this.mShowLoadingView) {
                this.mViewTypePositionList.add(Integer.valueOf(4));
            }
            if (this.mFooterLayout != null) {
                this.mViewTypePositionList.add(Integer.valueOf(2));
                return;
            }
            return;
        }
        if (this.mHeaderLayout != null && (this.mEmptyView == null || this.mHeadAndEmptyEnable)) {
            this.mViewTypePositionList.add(Integer.valueOf(1));
        }
        if (this.mEmptyView != null) {
            this.mViewTypePositionList.add(Integer.valueOf(3));
        }
        if (this.mFooterLayout == null) {
            return;
        }
        if (this.mEmptyView == null || this.mFootAndEmptyEnable) {
            this.mViewTypePositionList.add(Integer.valueOf(2));
        }
    }

    private BaseSuggestionViewHolder getLoadingView(ViewGroup viewGroup) {
        if (this.mLoadingView == null) {
            this.mLoadingView = this.mLayoutInflater.inflate(this.mLoadingViewRes > 0 ? this.mLoadingViewRes : R.layout.search_item_loading_layout, viewGroup, false);
        }
        return new BaseSuggestionViewHolder(this.mLoadingView);
    }

    private boolean noItemView() {
        return getInnerItemViewCount() == 0;
    }

    private void notifyNonDataChanged() {
        ArrayList arrayList = new ArrayList(this.mViewTypePositionList);
        genPositionList();
        DiffUtil.calculateDiff(new NonDataDiffCallback(arrayList, this.mViewTypePositionList)).dispatchUpdatesTo((Adapter) this);
    }

    private void onBindLoadMore(ViewHolder viewHolder) {
        if (this.mNextLoadEnable && this.mRequestLoadMoreListener != null && !this.mLoadMoreRequested) {
            this.mLoadMoreRequested = true;
            this.mRequestLoadMoreListener.onLoadMoreRequested();
        }
    }

    public void addFooterView(View view) {
        addFooterView(view, -1);
    }

    public void addFooterView(View view, int i) {
        if (this.mFooterLayout == null) {
            if (this.mCopyFooterLayout == null) {
                this.mFooterLayout = new LinearLayout(view.getContext());
                this.mFooterLayout.setOrientation(1);
                this.mCopyFooterLayout = this.mFooterLayout;
            } else {
                this.mFooterLayout = this.mCopyFooterLayout;
            }
        }
        this.mFooterLayout.removeView(view);
        if (i >= this.mFooterLayout.getChildCount()) {
            i = -1;
        }
        this.mFooterLayout.addView(view, i);
        notifyNonDataChanged();
    }

    public void addHeaderView(View view) {
        addHeaderView(view, -1);
    }

    public void addHeaderView(View view, int i) {
        if (this.mHeaderLayout == null) {
            if (this.mCopyHeaderLayout == null) {
                this.mHeaderLayout = new LinearLayout(view.getContext());
                this.mHeaderLayout.setOrientation(1);
                this.mCopyHeaderLayout = this.mHeaderLayout;
            } else {
                this.mHeaderLayout = this.mCopyHeaderLayout;
            }
        }
        if (i >= this.mHeaderLayout.getChildCount()) {
            i = -1;
        }
        this.mHeaderLayout.addView(view, i);
        notifyNonDataChanged();
    }

    /* access modifiers changed from: protected */
    public abstract void bindInnerItemViewHolder(VH vh, int i);

    public void closeLoadMore() {
        if (this.mNextLoadEnable) {
            this.mNextLoadEnable = false;
        }
        this.mLoadMoreRequested = false;
        hideLoadMoreFailedView();
        notifyNonDataChanged();
    }

    /* access modifiers changed from: protected */
    public abstract VH createInnerItemViewHolder(ViewGroup viewGroup, int i);

    /* access modifiers changed from: protected */
    public int getInnerItemPosition(int i) {
        return i - (this.mHeaderLayout == null ? 0 : 1);
    }

    /* access modifiers changed from: protected */
    public abstract int getInnerItemViewCount();

    /* access modifiers changed from: protected */
    public abstract int getInnerItemViewType(int i);

    public int getItemCount() {
        return this.mViewTypePositionList.size();
    }

    public int getItemViewType(int i) {
        return ((Integer) this.mViewTypePositionList.get(i)).intValue();
    }

    public void hideLoadMoreFailedView() {
        if (this.mLoadMoreFailedView != null) {
            removeFooterView(this.mLoadMoreFailedView);
        }
    }

    public boolean isFullSpan(int i) {
        switch (getItemViewType(i)) {
            case 1:
            case 2:
            case 3:
            case 4:
                return true;
            default:
                return false;
        }
    }

    public boolean isLoading() {
        return this.mNextLoadEnable;
    }

    /* access modifiers changed from: protected */
    public void notifyDataChanged(Callback callback) {
        ArrayList arrayList = new ArrayList(this.mViewTypePositionList);
        genPositionList();
        DiffUtil.calculateDiff(new DataDiffCallback(arrayList, this.mViewTypePositionList, callback)).dispatchUpdatesTo((Adapter) this);
    }

    public void onBindViewHolder(BaseSuggestionViewHolder baseSuggestionViewHolder, int i) {
        switch (baseSuggestionViewHolder.getItemViewType()) {
            case 1:
            case 2:
            case 3:
                return;
            case 4:
                onBindLoadMore(baseSuggestionViewHolder);
                return;
            default:
                int innerItemPosition = getInnerItemPosition(baseSuggestionViewHolder.getLayoutPosition());
                bindInnerItemViewHolder(baseSuggestionViewHolder, innerItemPosition);
                if (!this.mShowLoadingView && innerItemPosition == getInnerItemViewCount() - 1) {
                    onBindLoadMore(null);
                    return;
                }
                return;
        }
    }

    public BaseSuggestionViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        switch (i) {
            case 1:
                BaseSuggestionViewHolder baseSuggestionViewHolder = new BaseSuggestionViewHolder(this.mHeaderLayout);
                ensureLayoutParams(this.mHeaderLayout, viewGroup);
                return baseSuggestionViewHolder;
            case 2:
                BaseSuggestionViewHolder baseSuggestionViewHolder2 = new BaseSuggestionViewHolder(this.mFooterLayout);
                ensureLayoutParams(this.mFooterLayout, viewGroup);
                return baseSuggestionViewHolder2;
            case 3:
                BaseSuggestionViewHolder baseSuggestionViewHolder3 = new BaseSuggestionViewHolder(this.mEmptyView);
                ensureLayoutParams(this.mEmptyView, viewGroup);
                return baseSuggestionViewHolder3;
            case 4:
                BaseSuggestionViewHolder loadingView = getLoadingView(viewGroup);
                ensureLayoutParams(loadingView.itemView, viewGroup);
                return loadingView;
            default:
                return createInnerItemViewHolder(viewGroup, i);
        }
    }

    public void openLoadMore() {
        openLoadMore(true);
    }

    public void openLoadMore(boolean z) {
        this.mShowLoadingView = z;
        this.mNextLoadEnable = true;
        this.mLoadMoreRequested = false;
        hideLoadMoreFailedView();
        notifyNonDataChanged();
    }

    public void removeFooterView(View view) {
        if (this.mFooterLayout != null) {
            this.mFooterLayout.removeView(view);
            if (this.mFooterLayout.getChildCount() == 0) {
                this.mFooterLayout = null;
            }
            notifyNonDataChanged();
        }
    }

    public void removeHeaderView(View view) {
        if (this.mHeaderLayout != null) {
            this.mHeaderLayout.removeView(view);
            if (this.mHeaderLayout.getChildCount() == 0) {
                this.mHeaderLayout = null;
            }
            notifyNonDataChanged();
        }
    }

    public void setOnLoadMoreListener(RequestLoadMoreListener requestLoadMoreListener) {
        this.mRequestLoadMoreListener = requestLoadMoreListener;
    }

    public void showLoadCompleteView() {
        closeLoadMore();
        if (this.mLoadCompleteView == null) {
            this.mLoadCompleteView = this.mLayoutInflater.inflate(this.mLoadCompleteViewRes > 0 ? this.mLoadCompleteViewRes : R.layout.search_item_load_complete_layout, null);
        }
        addFooterView(this.mLoadCompleteView, 0);
    }
}
