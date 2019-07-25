package com.miui.gallery.picker.helper;

import android.database.Cursor;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ListAdapter;
import com.miui.gallery.R;
import com.miui.gallery.adapter.CheckableAdapter;
import com.miui.gallery.util.ScalableTouchDelegate;

public class PickerItemHolder implements OnClickListener {
    private ListAdapter mAdapter;
    private PickerItemCheckedListener mCheckListener;
    private int mPosition;

    public PickerItemHolder(View view, ListAdapter listAdapter, PickerItemCheckedListener pickerItemCheckedListener) {
        this.mAdapter = listAdapter;
        this.mCheckListener = pickerItemCheckedListener;
        if (listAdapter instanceof CheckableAdapter) {
            View checkableView = ((CheckableAdapter) listAdapter).getCheckableView(view);
            if (checkableView != null) {
                checkableView.setOnClickListener(this);
                view.setTouchDelegate(new ScalableTouchDelegate(1.8f, view, checkableView));
            }
        }
    }

    public static void bindView(int i, View view, ListAdapter listAdapter, PickerItemCheckedListener pickerItemCheckedListener) {
        PickerItemHolder pickerItemHolder = (PickerItemHolder) view.getTag(R.id.tag_picker_item_holder);
        if (pickerItemHolder == null) {
            pickerItemHolder = new PickerItemHolder(view, listAdapter, pickerItemCheckedListener);
            view.setTag(R.id.tag_picker_item_holder, pickerItemHolder);
        }
        pickerItemHolder.setPosition(i);
    }

    public void onClick(View view) {
        if (this.mCheckListener != null) {
            this.mCheckListener.onItemChecked((Cursor) this.mAdapter.getItem(this.mPosition), view);
        }
    }

    public void setPosition(int i) {
        this.mPosition = i;
    }
}
