package com.miui.gallery.widget;

import android.content.Context;
import android.database.DataSetObservable;
import android.database.DataSetObserver;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.GridView;
import android.widget.ListAdapter;
import java.util.ArrayList;
import java.util.Iterator;

public class HeaderGridView extends GridView {
    private ArrayList<FixedViewInfo> mFooterViewInfos = new ArrayList<>();
    private ArrayList<FixedViewInfo> mHeaderViewInfos = new ArrayList<>();

    private static class FixedViewInfo {
        public Object data;
        public boolean isSelectable;
        public ViewGroup viewContainer;

        private FixedViewInfo() {
        }
    }

    private static class HeaderViewGridAdapter extends BaseAdapter implements Filterable {
        static final ArrayList<FixedViewInfo> EMPTY_INFO_LIST = new ArrayList<>();
        private final ListAdapter mAdapter;
        boolean mAreAllFixedViewsSelectable;
        private final DataSetObservable mDataSetObservable = new DataSetObservable();
        ArrayList<FixedViewInfo> mFooterViewInfos;
        ArrayList<FixedViewInfo> mHeaderViewInfos;
        private final boolean mIsFilterable;
        private int mLastVisibleItemHeight;
        private int mNumColumns;

        public HeaderViewGridAdapter(ArrayList<FixedViewInfo> arrayList, ArrayList<FixedViewInfo> arrayList2, ListAdapter listAdapter) {
            boolean z = true;
            this.mNumColumns = 1;
            this.mAdapter = listAdapter;
            this.mIsFilterable = listAdapter instanceof Filterable;
            if (arrayList != null) {
                if (arrayList == null) {
                    this.mHeaderViewInfos = EMPTY_INFO_LIST;
                } else {
                    this.mHeaderViewInfos = arrayList;
                }
                if (arrayList2 == null) {
                    this.mFooterViewInfos = EMPTY_INFO_LIST;
                } else {
                    this.mFooterViewInfos = arrayList2;
                }
                if (!areAllListInfosSelectable(this.mHeaderViewInfos) || !areAllListInfosSelectable(this.mFooterViewInfos)) {
                    z = false;
                }
                this.mAreAllFixedViewsSelectable = z;
                return;
            }
            throw new IllegalArgumentException("headerViewInfos cannot be null");
        }

        private boolean areAllListInfosSelectable(ArrayList<FixedViewInfo> arrayList) {
            if (arrayList != null) {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    if (!((FixedViewInfo) it.next()).isSelectable) {
                        return false;
                    }
                }
            }
            return true;
        }

        private int getAlignedAdapterCount() {
            int count = this.mAdapter.getCount();
            if (count > 0) {
                return ((this.mNumColumns + count) - 1) - ((count - 1) % this.mNumColumns);
            }
            return 0;
        }

        private View getPlaceholderView(View view, ViewGroup viewGroup, int i) {
            if (view == null) {
                view = new View(viewGroup.getContext());
            }
            view.setVisibility(4);
            view.setMinimumHeight(i);
            return view;
        }

        public boolean areAllItemsEnabled() {
            boolean z = true;
            if (this.mAdapter == null) {
                return true;
            }
            if (!this.mAreAllFixedViewsSelectable || !this.mAdapter.areAllItemsEnabled()) {
                z = false;
            }
            return z;
        }

        public int getCount() {
            int headersCount = (getHeadersCount() + getFootersCount()) * this.mNumColumns;
            return this.mAdapter != null ? headersCount + getAlignedAdapterCount() : headersCount;
        }

        public Filter getFilter() {
            if (this.mIsFilterable) {
                return ((Filterable) this.mAdapter).getFilter();
            }
            return null;
        }

        public int getFootersCount() {
            return this.mFooterViewInfos.size();
        }

        public int getHeadersCount() {
            return this.mHeaderViewInfos.size();
        }

        public Object getItem(int i) {
            int headersCount = getHeadersCount() * this.mNumColumns;
            if (i >= headersCount) {
                int i2 = i - headersCount;
                int alignedAdapterCount = getAlignedAdapterCount();
                if (this.mAdapter != null) {
                    if (i2 < this.mAdapter.getCount()) {
                        return this.mAdapter.getItem(i2);
                    }
                    if (i2 < alignedAdapterCount) {
                        return null;
                    }
                }
                int i3 = i2 - alignedAdapterCount;
                if (i3 >= getFootersCount() * this.mNumColumns) {
                    throw new ArrayIndexOutOfBoundsException(i3);
                } else if (i3 % this.mNumColumns == 0) {
                    return ((FixedViewInfo) this.mFooterViewInfos.get(i3 / this.mNumColumns)).data;
                } else {
                    return null;
                }
            } else if (i % this.mNumColumns == 0) {
                return ((FixedViewInfo) this.mHeaderViewInfos.get(i / this.mNumColumns)).data;
            } else {
                return null;
            }
        }

        public long getItemId(int i) {
            int headersCount = getHeadersCount() * this.mNumColumns;
            if (this.mAdapter != null && i >= headersCount) {
                int i2 = i - headersCount;
                if (i2 < this.mAdapter.getCount()) {
                    return this.mAdapter.getItemId(i2);
                }
            }
            return -1;
        }

        public int getItemViewType(int i) {
            int headersCount = getHeadersCount() * this.mNumColumns;
            int i2 = 1;
            if (i >= headersCount || i % this.mNumColumns == 0) {
                if (this.mAdapter != null && i >= headersCount) {
                    int i3 = i - headersCount;
                    if (i3 < this.mAdapter.getCount()) {
                        return this.mAdapter.getItemViewType(i3);
                    }
                    if (i3 < getAlignedAdapterCount()) {
                        return this.mAdapter.getViewTypeCount();
                    }
                }
                int alignedAdapterCount = i - (headersCount + getAlignedAdapterCount());
                if (alignedAdapterCount >= getFootersCount() * this.mNumColumns || alignedAdapterCount % this.mNumColumns == 0) {
                    return -2;
                }
                if (this.mAdapter != null) {
                    i2 = this.mAdapter.getViewTypeCount();
                }
                return i2;
            }
            if (this.mAdapter != null) {
                i2 = this.mAdapter.getViewTypeCount();
            }
            return i2;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            int headersCount = getHeadersCount() * this.mNumColumns;
            if (i < headersCount) {
                ViewGroup viewGroup2 = ((FixedViewInfo) this.mHeaderViewInfos.get(i / this.mNumColumns)).viewContainer;
                if (i % this.mNumColumns != 0) {
                    return getPlaceholderView(view, viewGroup, viewGroup2.getHeight());
                }
                viewGroup2.setVisibility(0);
                return viewGroup2;
            }
            int i2 = i - headersCount;
            int alignedAdapterCount = getAlignedAdapterCount();
            if (this.mAdapter != null) {
                if (i2 < this.mAdapter.getCount()) {
                    View view2 = this.mAdapter.getView(i2, view, viewGroup);
                    if (i2 % this.mNumColumns == 0) {
                        view2.measure(MeasureSpec.makeMeasureSpec(-1, 0), MeasureSpec.makeMeasureSpec(-2, 0));
                        this.mLastVisibleItemHeight = view2.getMeasuredHeight();
                    }
                    return view2;
                } else if (i2 < alignedAdapterCount) {
                    return getPlaceholderView(view, viewGroup, this.mLastVisibleItemHeight);
                }
            }
            int i3 = i2 - alignedAdapterCount;
            if (i3 < getFootersCount() * this.mNumColumns) {
                ViewGroup viewGroup3 = ((FixedViewInfo) this.mFooterViewInfos.get(i3 / this.mNumColumns)).viewContainer;
                if (i3 % this.mNumColumns != 0) {
                    return getPlaceholderView(view, viewGroup, viewGroup3.getHeight());
                }
                viewGroup3.setVisibility(0);
                return viewGroup3;
            }
            throw new ArrayIndexOutOfBoundsException(i3);
        }

        public int getViewTypeCount() {
            if (this.mAdapter != null) {
                return this.mAdapter.getViewTypeCount() + 1;
            }
            return 2;
        }

        public boolean hasStableIds() {
            if (this.mAdapter != null) {
                return this.mAdapter.hasStableIds();
            }
            return false;
        }

        public boolean isEmpty() {
            return (this.mAdapter == null || this.mAdapter.isEmpty()) && getHeadersCount() == 0 && getFootersCount() == 0;
        }

        public boolean isEnabled(int i) {
            int headersCount = getHeadersCount() * this.mNumColumns;
            boolean z = true;
            if (i < headersCount) {
                if (i % this.mNumColumns != 0 || !((FixedViewInfo) this.mHeaderViewInfos.get(i / this.mNumColumns)).isSelectable) {
                    z = false;
                }
                return z;
            }
            int i2 = i - headersCount;
            int alignedAdapterCount = getAlignedAdapterCount();
            if (this.mAdapter != null) {
                if (i2 < this.mAdapter.getCount()) {
                    return this.mAdapter.isEnabled(i2);
                }
                if (i2 < alignedAdapterCount) {
                    return false;
                }
            }
            int i3 = i2 - alignedAdapterCount;
            if (i3 < getFootersCount() * this.mNumColumns) {
                if (i3 % this.mNumColumns != 0 || !((FixedViewInfo) this.mFooterViewInfos.get(i3 / this.mNumColumns)).isSelectable) {
                    z = false;
                }
                return z;
            }
            throw new ArrayIndexOutOfBoundsException(i3);
        }

        public void notifyDataSetChanged() {
            this.mDataSetObservable.notifyChanged();
        }

        public void registerDataSetObserver(DataSetObserver dataSetObserver) {
            this.mDataSetObservable.registerObserver(dataSetObserver);
            if (this.mAdapter != null) {
                this.mAdapter.registerDataSetObserver(dataSetObserver);
            }
        }

        public void setNumColumns(int i) {
            if (i < 1) {
                throw new IllegalArgumentException("Number of columns must be 1 or more");
            } else if (this.mNumColumns != i) {
                this.mNumColumns = i;
                notifyDataSetChanged();
            }
        }

        public void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
            this.mDataSetObservable.unregisterObserver(dataSetObserver);
            if (this.mAdapter != null) {
                this.mAdapter.unregisterDataSetObserver(dataSetObserver);
            }
        }
    }

    public HeaderGridView(Context context) {
        super(context);
        initHeaderGridView();
    }

    public HeaderGridView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initHeaderGridView();
    }

    public HeaderGridView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initHeaderGridView();
    }

    private void initHeaderGridView() {
        super.setClipChildren(false);
        setGravity(3);
    }

    public int getFooterViewCount() {
        return this.mFooterViewInfos.size();
    }

    public int getHeaderViewCount() {
        return this.mHeaderViewInfos.size();
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        ListAdapter adapter = getAdapter();
        if (adapter != null && (adapter instanceof HeaderViewGridAdapter)) {
            ((HeaderViewGridAdapter) adapter).setNumColumns(getNumColumns());
        }
    }

    public void setAdapter(ListAdapter listAdapter) {
        if (this.mHeaderViewInfos.size() > 0 || this.mFooterViewInfos.size() > 0) {
            HeaderViewGridAdapter headerViewGridAdapter = new HeaderViewGridAdapter(this.mHeaderViewInfos, this.mFooterViewInfos, listAdapter);
            int numColumns = getNumColumns();
            if (numColumns > 1) {
                headerViewGridAdapter.setNumColumns(numColumns);
            }
            super.setAdapter(headerViewGridAdapter);
            return;
        }
        super.setAdapter(listAdapter);
    }

    public void setClipChildren(boolean z) {
    }
}
