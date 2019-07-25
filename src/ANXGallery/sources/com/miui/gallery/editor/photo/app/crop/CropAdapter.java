package com.miui.gallery.editor.photo.app.crop;

import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.common.model.CropData;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Delegator;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Selector;
import com.miui.gallery.ui.SimpleRecyclerView.Adapter;
import java.util.List;

class CropAdapter extends Adapter<ItemHolder> implements Selectable {
    private List<CropData> mDataList;
    private Delegator mDelegator;

    public CropAdapter(List<CropData> list, Selector selector) {
        this.mDataList = list;
        this.mDelegator = new Delegator(2, selector);
    }

    public int getItemCount() {
        return this.mDataList.size();
    }

    public CropData getSelectedItem() {
        return (CropData) this.mDataList.get(this.mDelegator.getSelection());
    }

    public int getSelection() {
        return this.mDelegator.getSelection();
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mDelegator.onAttachedToRecyclerView(recyclerView);
    }

    public void onBindViewHolder(ItemHolder itemHolder, int i) {
        super.onBindViewHolder(itemHolder, i);
        itemHolder.bind((CropData) this.mDataList.get(i));
        this.mDelegator.onBindViewHolder(itemHolder, i);
    }

    public ItemHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new ItemHolder(getInflater().inflate(R.layout.crop_menu_item, viewGroup, false));
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mDelegator.onDetachedFromRecyclerView(recyclerView);
    }

    public void setSelection(int i) {
        this.mDelegator.setSelection(i);
    }
}
