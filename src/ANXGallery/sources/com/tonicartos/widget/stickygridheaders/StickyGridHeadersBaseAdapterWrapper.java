package com.tonicartos.widget.stickygridheaders;

import android.content.Context;
import android.database.DataSetObserver;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import com.miui.gallery.util.Log;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView.FixedViewInfo;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class StickyGridHeadersBaseAdapterWrapper extends BaseAdapter {
    private final Context mContext;
    private DataSetObserver mDataSetObserver = new DataSetObserver() {
        public void onChanged() {
            Log.i("StickyGridHeadersBaseAdapterWrapper", "data changed");
            StickyGridHeadersBaseAdapterWrapper.this.genDataMap();
            StickyGridHeadersBaseAdapterWrapper.this.notifyDataSetChanged();
        }

        public void onInvalidated() {
            Log.i("StickyGridHeadersBaseAdapterWrapper", "data invalidated");
            StickyGridHeadersBaseAdapterWrapper.this.notifyDataSetInvalidated();
            StickyGridHeadersBaseAdapterWrapper.this.mPositionMap.clear();
            StickyGridHeadersBaseAdapterWrapper.this.mSectionMap.clear();
            StickyGridHeadersBaseAdapterWrapper.this.mSectionStartItemIndexMap.clear();
        }
    };
    private final StickyGridHeadersBaseAdapter mDelegate;
    private List<FixedViewInfo> mFooterViewInfos = Collections.emptyList();
    /* access modifiers changed from: private */
    public StickyGridHeadersGridView mGridView;
    private List<FixedViewInfo> mHeaderViewInfos = Collections.emptyList();
    private View mLastHeaderViewSeen;
    private View mLastViewSeen;
    /* access modifiers changed from: private */
    public ArrayList<Integer> mPositionMap;
    /* access modifiers changed from: private */
    public ArrayList<Integer> mSectionMap;
    /* access modifiers changed from: private */
    public ArrayList<Integer> mSectionStartItemIndexMap;

    protected class FillerView extends View {
        private View mMeasureTarget;

        public FillerView(Context context) {
            super(context);
        }

        /* access modifiers changed from: protected */
        public void onMeasure(int i, int i2) {
            super.onMeasure(i, MeasureSpec.makeMeasureSpec(this.mMeasureTarget.getMeasuredHeight(), 1073741824));
        }

        public void setMeasureTarget(View view) {
            this.mMeasureTarget = view;
        }
    }

    protected class HeaderFillerView extends FrameLayout {
        private int mHeaderId;

        public HeaderFillerView(Context context) {
            super(context);
        }

        /* access modifiers changed from: protected */
        public LayoutParams generateDefaultLayoutParams() {
            return new LayoutParams(-1, -1);
        }

        public int getHeaderId() {
            return this.mHeaderId;
        }

        /* access modifiers changed from: protected */
        public void onMeasure(int i, int i2) {
            View view = (View) getTag();
            ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
            if (layoutParams == null) {
                layoutParams = generateDefaultLayoutParams();
                view.setLayoutParams(layoutParams);
            }
            if (view.getVisibility() != 8) {
                view.measure(getChildMeasureSpec(MeasureSpec.makeMeasureSpec(StickyGridHeadersBaseAdapterWrapper.this.mGridView.getWidth(), 1073741824), 0, layoutParams.width), getChildMeasureSpec(MeasureSpec.makeMeasureSpec(0, 0), 0, layoutParams.height));
            }
            setMeasuredDimension(MeasureSpec.getSize(i), view.getMeasuredHeight());
        }

        public void setHeaderId(int i) {
            this.mHeaderId = i;
        }
    }

    protected class Position {
        protected int mHeader;
        protected int mPosition;

        protected Position(int i, int i2) {
            this.mPosition = i;
            this.mHeader = i2;
        }
    }

    protected class VisibleInfo {
        protected final int mFirstPosition;
        protected final int mVisibleCount;

        public VisibleInfo(int i, int i2) {
            this.mFirstPosition = i;
            this.mVisibleCount = i2;
        }
    }

    public StickyGridHeadersBaseAdapterWrapper(Context context, StickyGridHeadersGridView stickyGridHeadersGridView, StickyGridHeadersBaseAdapter stickyGridHeadersBaseAdapter, List<FixedViewInfo> list, List<FixedViewInfo> list2) {
        this.mContext = context;
        this.mDelegate = stickyGridHeadersBaseAdapter;
        this.mGridView = stickyGridHeadersGridView;
        this.mPositionMap = new ArrayList<>();
        this.mSectionMap = new ArrayList<>();
        this.mSectionStartItemIndexMap = new ArrayList<>();
        if (list != null) {
            this.mHeaderViewInfos = list;
        }
        if (list2 != null) {
            this.mFooterViewInfos = list2;
        }
        genDataMap();
        stickyGridHeadersBaseAdapter.registerDataSetObserver(this.mDataSetObserver);
    }

    /* access modifiers changed from: private */
    public void genDataMap() {
        int i;
        Log.d("StickyGridHeadersBaseAdapterWrapper", "generate data map");
        int requestedNumColumns = this.mGridView.getNumColumns() == -1 ? this.mGridView.getRequestedNumColumns() : this.mGridView.getNumColumns();
        int count = this.mDelegate.getCount() + (this.mDelegate.getNumHeaders() * requestedNumColumns) + (Math.max(this.mDelegate.getNumHeaders(), 1) * (requestedNumColumns - 1)) + (this.mFooterViewInfos.size() * requestedNumColumns) + (this.mHeaderViewInfos.size() * requestedNumColumns);
        if (this.mDelegate.shouldDrawDivider()) {
            count += this.mDelegate.getNumHeaders() * requestedNumColumns;
        }
        this.mPositionMap.ensureCapacity(count);
        this.mSectionMap.ensureCapacity(count);
        this.mSectionStartItemIndexMap.ensureCapacity(this.mDelegate.getNumHeaders());
        this.mPositionMap.clear();
        this.mSectionMap.clear();
        this.mSectionStartItemIndexMap.clear();
        int i2 = 0;
        if (!this.mHeaderViewInfos.isEmpty()) {
            int i3 = 0;
            i = 0;
            while (i3 < this.mHeaderViewInfos.size()) {
                this.mPositionMap.add(Integer.valueOf(-4));
                this.mSectionMap.add(Integer.valueOf(i));
                for (int i4 = 1; i4 < requestedNumColumns; i4++) {
                    this.mPositionMap.add(Integer.valueOf(-3));
                    this.mSectionMap.add(Integer.valueOf(i));
                }
                i3++;
                i++;
            }
        } else {
            i = 0;
        }
        if (this.mDelegate.getNumHeaders() == 0) {
            for (int i5 = 0; i5 < this.mDelegate.getCount(); i5++) {
                this.mSectionMap.add(Integer.valueOf(0));
                this.mPositionMap.add(Integer.valueOf(i5));
            }
            this.mSectionStartItemIndexMap.add(Integer.valueOf(0));
        } else {
            int i6 = 0;
            int i7 = 0;
            while (i6 < this.mDelegate.getNumHeaders()) {
                this.mPositionMap.add(Integer.valueOf(-2));
                this.mSectionMap.add(Integer.valueOf(i));
                this.mSectionStartItemIndexMap.add(Integer.valueOf(i7));
                for (int i8 = 1; i8 < requestedNumColumns; i8++) {
                    this.mPositionMap.add(Integer.valueOf(-3));
                    this.mSectionMap.add(Integer.valueOf(i));
                }
                int i9 = i7;
                for (int i10 = 0; i10 < this.mDelegate.getCountForHeader(i6); i10++) {
                    this.mSectionMap.add(Integer.valueOf(i));
                    this.mPositionMap.add(Integer.valueOf(i9));
                    i9++;
                }
                int countForHeader = (((this.mDelegate.getCountForHeader(i6) + requestedNumColumns) - 1) / requestedNumColumns) * requestedNumColumns;
                for (int countForHeader2 = this.mDelegate.getCountForHeader(i6); countForHeader2 < countForHeader; countForHeader2++) {
                    this.mPositionMap.add(Integer.valueOf(-1));
                    this.mSectionMap.add(Integer.valueOf(i));
                }
                if (this.mDelegate.shouldDrawDivider()) {
                    this.mPositionMap.add(Integer.valueOf(-5));
                    this.mSectionMap.add(Integer.valueOf(i));
                    for (int i11 = 1; i11 < requestedNumColumns; i11++) {
                        this.mPositionMap.add(Integer.valueOf(-3));
                        this.mSectionMap.add(Integer.valueOf(i));
                    }
                }
                i++;
                i6++;
                i7 = i9;
            }
        }
        if (!this.mFooterViewInfos.isEmpty()) {
            if (this.mDelegate.getNumHeaders() == 0) {
                int count2 = (((this.mDelegate.getCount() + requestedNumColumns) - 1) / requestedNumColumns) * requestedNumColumns;
                for (int count3 = this.mDelegate.getCount(); count3 < count2; count3++) {
                    this.mPositionMap.add(Integer.valueOf(-1));
                    this.mSectionMap.add(Integer.valueOf(i));
                }
            }
            while (i2 < this.mFooterViewInfos.size()) {
                this.mPositionMap.add(Integer.valueOf(-4));
                this.mSectionMap.add(Integer.valueOf(i));
                for (int i12 = 1; i12 < requestedNumColumns; i12++) {
                    this.mPositionMap.add(Integer.valueOf(-3));
                    this.mSectionMap.add(Integer.valueOf(i));
                }
                i2++;
                i++;
            }
        }
    }

    private FillerView getFillerView(View view, ViewGroup viewGroup, View view2) {
        FillerView fillerView = (FillerView) view;
        if (fillerView == null) {
            fillerView = new FillerView(this.mContext);
        }
        fillerView.setMeasureTarget(view2);
        return fillerView;
    }

    private HeaderFillerView getHeaderFillerView(int i, View view, ViewGroup viewGroup) {
        HeaderFillerView headerFillerView = (HeaderFillerView) view;
        if (headerFillerView == null) {
            headerFillerView = new HeaderFillerView(this.mContext);
        }
        headerFillerView.setHeaderId(i);
        return headerFillerView;
    }

    public boolean areAllItemsEnabled() {
        return false;
    }

    public int getCount() {
        return this.mPositionMap.size();
    }

    public int getCountForHeader(int i) {
        return this.mDelegate.getCountForHeader(i);
    }

    public int getGroupIndexByItemIndex(int i) {
        if (this.mSectionStartItemIndexMap != null) {
            int i2 = 1;
            while (i2 < this.mSectionStartItemIndexMap.size()) {
                if (((Integer) this.mSectionStartItemIndexMap.get(i2)).intValue() > i) {
                    return i2 - 1;
                }
                i2++;
            }
            if (i2 == this.mSectionStartItemIndexMap.size()) {
                return i2 - 1;
            }
        }
        return 0;
    }

    public int getGroupItemStartIndex(int i) {
        return ((Integer) this.mSectionStartItemIndexMap.get(i)).intValue();
    }

    /* access modifiers changed from: protected */
    public long getHeaderId(int i) {
        return (long) translatePosition(i).mHeader;
    }

    public int getHeaderNum() {
        return this.mDelegate.getNumHeaders();
    }

    /* access modifiers changed from: protected */
    public View getHeaderView(int i, View view, ViewGroup viewGroup) {
        if (this.mDelegate.getNumHeaders() == 0) {
            return null;
        }
        return this.mDelegate.getHeaderView(translatePosition(i).mHeader - this.mHeaderViewInfos.size(), view, viewGroup);
    }

    public Object getItem(int i) throws ArrayIndexOutOfBoundsException {
        Position translatePosition = translatePosition(i);
        if (translatePosition.mPosition == -1 || translatePosition.mPosition == -2 || translatePosition.mPosition == -4 || translatePosition.mPosition == -5) {
            return null;
        }
        return this.mDelegate.getItem(translatePosition.mPosition);
    }

    public long getItemId(int i) {
        Position translatePosition = translatePosition(i);
        if (translatePosition.mPosition == -2 || translatePosition.mPosition == -4) {
            return -1;
        }
        if (translatePosition.mPosition == -1) {
            return -2;
        }
        if (translatePosition.mPosition == -3) {
            return -3;
        }
        if (translatePosition.mPosition == -5) {
            return -4;
        }
        return this.mDelegate.getItemId(translatePosition.mPosition);
    }

    public int getItemPositionByItemIndex(int i) {
        if (this.mPositionMap != null) {
            for (int i2 = 0; i2 < this.mPositionMap.size(); i2++) {
                if (((Integer) this.mPositionMap.get(i2)).intValue() == i) {
                    return i2;
                }
            }
        }
        return 0;
    }

    public int getItemViewType(int i) {
        Position translatePosition = translatePosition(i);
        if (translatePosition.mPosition == -4) {
            return 3;
        }
        if (translatePosition.mPosition == -2) {
            return 1;
        }
        if (translatePosition.mPosition == -1) {
            return 0;
        }
        if (translatePosition.mPosition == -3) {
            return 2;
        }
        if (translatePosition.mPosition == -5) {
            return 4;
        }
        int itemViewType = this.mDelegate.getItemViewType(translatePosition.mPosition);
        return itemViewType == -1 ? itemViewType : itemViewType + 5;
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        Position translatePosition = translatePosition(i);
        if (translatePosition.mPosition == -2) {
            HeaderFillerView headerFillerView = getHeaderFillerView(translatePosition.mHeader, view, viewGroup);
            View headerView = this.mDelegate.getHeaderView(translatePosition.mHeader - this.mHeaderViewInfos.size(), (View) headerFillerView.getTag(), viewGroup);
            this.mGridView.detachHeader((View) headerFillerView.getTag());
            headerFillerView.setTag(headerView);
            this.mGridView.attachHeader(headerView);
            this.mLastHeaderViewSeen = headerFillerView;
            headerFillerView.forceLayout();
            return headerFillerView;
        } else if (translatePosition.mPosition == -4) {
            HeaderFillerView headerFillerView2 = getHeaderFillerView(translatePosition.mHeader, view, viewGroup);
            headerFillerView2.setTag(translatePosition.mHeader < this.mHeaderViewInfos.size() ? ((FixedViewInfo) this.mHeaderViewInfos.get(translatePosition.mHeader)).view : ((FixedViewInfo) this.mFooterViewInfos.get((translatePosition.mHeader - this.mDelegate.getNumHeaders()) - this.mHeaderViewInfos.size())).view);
            this.mLastHeaderViewSeen = headerFillerView2;
            headerFillerView2.forceLayout();
            return headerFillerView2;
        } else if (translatePosition.mPosition == -3) {
            FillerView fillerView = getFillerView(view, viewGroup, this.mLastHeaderViewSeen);
            fillerView.forceLayout();
            return fillerView;
        } else if (translatePosition.mPosition == -1) {
            return getFillerView(view, viewGroup, this.mLastViewSeen);
        } else {
            if (translatePosition.mPosition == -5) {
                HeaderFillerView headerFillerView3 = getHeaderFillerView(translatePosition.mHeader - this.mHeaderViewInfos.size(), view, viewGroup);
                View dividerView = this.mDelegate.getDividerView(translatePosition.mHeader, (View) headerFillerView3.getTag(), viewGroup);
                this.mGridView.detachHeader((View) headerFillerView3.getTag());
                headerFillerView3.setTag(dividerView);
                this.mGridView.attachHeader(dividerView);
                this.mLastHeaderViewSeen = headerFillerView3;
                headerFillerView3.forceLayout();
                return headerFillerView3;
            }
            View view2 = this.mDelegate.getView(translatePosition.mPosition, view, viewGroup);
            this.mLastViewSeen = view2;
            return view2;
        }
    }

    public int getViewTypeCount() {
        return this.mDelegate.getViewTypeCount() + 5;
    }

    public boolean hasStableIds() {
        return this.mDelegate.hasStableIds();
    }

    public boolean isEmpty() {
        return this.mDelegate.isEmpty();
    }

    public boolean isEnabled(int i) {
        Position translatePosition = translatePosition(i);
        if (translatePosition.mPosition == -1 || translatePosition.mPosition == -3 || translatePosition.mPosition == -4 || translatePosition.mPosition == -5) {
            return false;
        }
        return this.mDelegate.isEnabled(translatePosition.mPosition);
    }

    /* access modifiers changed from: 0000 */
    public void onColumnChanged() {
        genDataMap();
        notifyDataSetChanged();
    }

    public void setFooter(List<FixedViewInfo> list) {
        if (list != null) {
            this.mFooterViewInfos = list;
        } else {
            this.mFooterViewInfos = Collections.emptyList();
        }
        genDataMap();
    }

    public void setHeader(List<FixedViewInfo> list) {
        if (list != null) {
            this.mHeaderViewInfos = list;
        } else {
            this.mHeaderViewInfos = Collections.emptyList();
        }
        genDataMap();
    }

    /* access modifiers changed from: protected */
    public Position translatePosition(int i) {
        return i >= this.mPositionMap.size() ? new Position(-1, 0) : new Position(((Integer) this.mPositionMap.get(i)).intValue(), ((Integer) this.mSectionMap.get(i)).intValue());
    }

    /* access modifiers changed from: protected */
    public VisibleInfo translateVisibleInfo(int i, int i2) {
        int min = Math.min(i2 + i, this.mPositionMap.size());
        int i3 = -1;
        int i4 = 0;
        while (i < min) {
            int intValue = ((Integer) this.mPositionMap.get(i)).intValue();
            if (intValue >= 0) {
                if (i3 < 0) {
                    i3 = intValue;
                }
                i4++;
            }
            i++;
        }
        return new VisibleInfo(i3, i4);
    }
}
