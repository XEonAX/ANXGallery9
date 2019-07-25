package com.tonicartos.widget.stickygridheaders;

import android.database.DataSetObserver;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;

public class StickyGridHeadersListAdapterWrapper extends BaseAdapter implements StickyGridHeadersBaseAdapter {
    private DataSetObserver mDataSetObserver = new DataSetObserver() {
        public void onChanged() {
            StickyGridHeadersListAdapterWrapper.this.notifyDataSetChanged();
        }

        public void onInvalidated() {
            StickyGridHeadersListAdapterWrapper.this.notifyDataSetInvalidated();
        }
    };
    private ListAdapter mDelegate;

    public StickyGridHeadersListAdapterWrapper(ListAdapter listAdapter) {
        this.mDelegate = listAdapter;
        if (listAdapter != null) {
            listAdapter.registerDataSetObserver(this.mDataSetObserver);
        }
    }

    public int getCount() {
        if (this.mDelegate == null) {
            return 0;
        }
        return this.mDelegate.getCount();
    }

    public int getCountForHeader(int i) {
        return 0;
    }

    public View getDividerView(int i, View view, ViewGroup viewGroup) {
        return null;
    }

    public View getHeaderView(int i, View view, ViewGroup viewGroup) {
        return null;
    }

    public Object getItem(int i) {
        if (this.mDelegate == null) {
            return null;
        }
        return this.mDelegate.getItem(i);
    }

    public long getItemId(int i) {
        return this.mDelegate.getItemId(i);
    }

    public int getItemViewType(int i) {
        return this.mDelegate.getItemViewType(i);
    }

    public int getNumHeaders() {
        return 0;
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        return this.mDelegate.getView(i, view, viewGroup);
    }

    public int getViewTypeCount() {
        return this.mDelegate.getViewTypeCount();
    }

    public boolean hasStableIds() {
        return this.mDelegate.hasStableIds();
    }

    public boolean shouldDrawDivider() {
        return false;
    }
}
