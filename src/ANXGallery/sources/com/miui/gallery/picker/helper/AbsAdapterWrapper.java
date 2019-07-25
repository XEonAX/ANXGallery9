package com.miui.gallery.picker.helper;

import android.database.Cursor;
import android.database.DataSetObserver;
import android.widget.BaseAdapter;
import android.widget.CursorAdapter;

abstract class AbsAdapterWrapper extends BaseAdapter {
    private CursorAdapter mWrapped;

    public AbsAdapterWrapper(CursorAdapter cursorAdapter) {
        this.mWrapped = cursorAdapter;
    }

    public boolean areAllItemsEnabled() {
        return this.mWrapped.areAllItemsEnabled();
    }

    public int getCount() {
        return this.mWrapped.getCount();
    }

    public Object getItem(int i) {
        return this.mWrapped.getItem(i);
    }

    public long getItemId(int i) {
        return this.mWrapped.getItemId(i);
    }

    public int getItemViewType(int i) {
        return this.mWrapped.getItemViewType(i);
    }

    public int getViewTypeCount() {
        return this.mWrapped.getViewTypeCount();
    }

    public boolean hasStableIds() {
        return this.mWrapped.hasStableIds();
    }

    public boolean isEmpty() {
        return this.mWrapped.isEmpty();
    }

    public boolean isEnabled(int i) {
        return this.mWrapped.isEnabled(i);
    }

    public void notifyDataSetChanged() {
        this.mWrapped.notifyDataSetChanged();
    }

    public void notifyDataSetInvalidated() {
        this.mWrapped.notifyDataSetInvalidated();
    }

    public void registerDataSetObserver(DataSetObserver dataSetObserver) {
        this.mWrapped.registerDataSetObserver(dataSetObserver);
    }

    public Cursor swapCursor(Cursor cursor) {
        return this.mWrapped.swapCursor(cursor);
    }

    public void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
        this.mWrapped.unregisterDataSetObserver(dataSetObserver);
    }
}
