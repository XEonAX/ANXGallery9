package com.miui.gallery.picker.helper;

import android.database.Cursor;
import android.database.DataSetObserver;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CursorAdapter;
import com.miui.gallery.picker.helper.Picker.Mode;
import com.miui.gallery.ui.Checkable;
import com.miui.gallery.ui.MicroThumbGridItem;

public class PickableSimpleAdapterWrapper extends AbsAdapterWrapper {
    private Picker mPicker;
    private PickerItemCheckedListener mPickerItemCheckedListener = new PickerItemCheckedListener(this.mPicker);
    private CursorAdapter mWrapped;

    public PickableSimpleAdapterWrapper(Picker picker, CursorAdapter cursorAdapter) {
        super(cursorAdapter);
        this.mPicker = picker;
        this.mWrapped = cursorAdapter;
    }

    public /* bridge */ /* synthetic */ boolean areAllItemsEnabled() {
        return super.areAllItemsEnabled();
    }

    public /* bridge */ /* synthetic */ int getCount() {
        return super.getCount();
    }

    public /* bridge */ /* synthetic */ Object getItem(int i) {
        return super.getItem(i);
    }

    public /* bridge */ /* synthetic */ long getItemId(int i) {
        return super.getItemId(i);
    }

    public /* bridge */ /* synthetic */ int getItemViewType(int i) {
        return super.getItemViewType(i);
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        View view2 = this.mWrapped.getView(i, view, viewGroup);
        if (this.mPicker.getMode() == Mode.SINGLE) {
            if (view2 instanceof MicroThumbGridItem) {
                ((MicroThumbGridItem) view2).setSimilarMarkEnable(true);
            }
        } else if (view2 instanceof Checkable) {
            Checkable checkable = (Checkable) view2;
            checkable.setCheckable(true);
            Cursor cursor = this.mWrapped.getCursor();
            cursor.moveToPosition(i);
            checkable.setChecked(this.mPicker.contains(CursorUtils.getSha1(cursor)));
        }
        PickerItemHolder.bindView(i, view2, this.mWrapped, this.mPickerItemCheckedListener);
        return view2;
    }

    public /* bridge */ /* synthetic */ int getViewTypeCount() {
        return super.getViewTypeCount();
    }

    public /* bridge */ /* synthetic */ boolean hasStableIds() {
        return super.hasStableIds();
    }

    public /* bridge */ /* synthetic */ boolean isEmpty() {
        return super.isEmpty();
    }

    public /* bridge */ /* synthetic */ boolean isEnabled(int i) {
        return super.isEnabled(i);
    }

    public /* bridge */ /* synthetic */ void notifyDataSetChanged() {
        super.notifyDataSetChanged();
    }

    public /* bridge */ /* synthetic */ void notifyDataSetInvalidated() {
        super.notifyDataSetInvalidated();
    }

    public /* bridge */ /* synthetic */ void registerDataSetObserver(DataSetObserver dataSetObserver) {
        super.registerDataSetObserver(dataSetObserver);
    }

    public /* bridge */ /* synthetic */ Cursor swapCursor(Cursor cursor) {
        return super.swapCursor(cursor);
    }

    public /* bridge */ /* synthetic */ void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
        super.unregisterDataSetObserver(dataSetObserver);
    }
}
