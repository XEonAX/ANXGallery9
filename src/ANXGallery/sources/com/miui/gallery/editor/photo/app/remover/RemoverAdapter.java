package com.miui.gallery.editor.photo.app.remover;

import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.common.model.RemoverData;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Delegator;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Selector;
import com.miui.gallery.ui.SimpleRecyclerView.Adapter;
import java.util.List;

public class RemoverAdapter extends Adapter<RemoverItemHolder> implements Selectable {
    private List<RemoverData> mDataList;
    private Delegator mDelegator;

    public RemoverAdapter(List<RemoverData> list, Selector selector) {
        this.mDataList = list;
        this.mDelegator = new Delegator(-1, selector);
    }

    public int getItemCount() {
        if (this.mDataList == null) {
            return 0;
        }
        return this.mDataList.size();
    }

    public int getSelection() {
        return this.mDelegator.getSelection();
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mDelegator.onAttachedToRecyclerView(recyclerView);
    }

    public void onBindViewHolder(RemoverItemHolder removerItemHolder, int i) {
        super.onBindViewHolder(removerItemHolder, i);
        removerItemHolder.bind((RemoverData) this.mDataList.get(i));
        this.mDelegator.onBindViewHolder(removerItemHolder, i);
    }

    public RemoverItemHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new RemoverItemHolder(getInflater().inflate(R.layout.remover_menu_item, viewGroup, false));
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mDelegator.onDetachedFromRecyclerView(recyclerView);
    }

    public void setSelection(int i) {
        this.mDelegator.setSelection(i);
    }
}
