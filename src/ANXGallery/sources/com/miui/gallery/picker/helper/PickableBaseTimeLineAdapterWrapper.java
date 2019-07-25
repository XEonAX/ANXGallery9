package com.miui.gallery.picker.helper;

import android.view.View;
import android.view.ViewGroup;
import android.widget.CursorAdapter;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersBaseAdapter;

public class PickableBaseTimeLineAdapterWrapper extends PickableSimpleAdapterWrapper implements StickyGridHeadersBaseAdapter {
    private StickyGridHeadersBaseAdapter mBaseAdapter;

    public PickableBaseTimeLineAdapterWrapper(Picker picker, CursorAdapter cursorAdapter) {
        super(picker, cursorAdapter);
        if (cursorAdapter instanceof StickyGridHeadersBaseAdapter) {
            this.mBaseAdapter = (StickyGridHeadersBaseAdapter) cursorAdapter;
            return;
        }
        throw new IllegalArgumentException("Adapter must be a StickyGridHeadersBaseAdapter");
    }

    public int getCountForHeader(int i) {
        return this.mBaseAdapter.getCountForHeader(i);
    }

    public View getDividerView(int i, View view, ViewGroup viewGroup) {
        return null;
    }

    public View getHeaderView(int i, View view, ViewGroup viewGroup) {
        if (this.mBaseAdapter != null) {
            return this.mBaseAdapter.getHeaderView(i, view, viewGroup);
        }
        return null;
    }

    public int getNumHeaders() {
        return this.mBaseAdapter.getNumHeaders();
    }

    public boolean shouldDrawDivider() {
        return false;
    }
}
