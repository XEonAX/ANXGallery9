package com.miui.gallery.editor.photo.app.doodle;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.miui.gallery.editor.photo.core.common.model.DoodleData;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Delegator;
import com.miui.gallery.ui.SimpleRecyclerView.Adapter;
import java.util.ArrayList;
import java.util.List;

class DoodleAdapter extends Adapter<DoodleHolder> implements Selectable {
    private Context mContext;
    private List<DoodleData> mDataList;
    private Delegator mDelegator = new Delegator(0);

    DoodleAdapter(Context context, List<DoodleData> list) {
        this.mContext = context;
        this.mDataList = new ArrayList(list);
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

    public void onBindViewHolder(DoodleHolder doodleHolder, int i) {
        super.onBindViewHolder(doodleHolder, i);
        doodleHolder.setIconPath(i != getSelection() ? ((DoodleData) this.mDataList.get(i)).normal : ((DoodleData) this.mDataList.get(i)).selected, i);
        this.mDelegator.onBindViewHolder(doodleHolder, i);
    }

    public DoodleHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new DoodleHolder(this.mContext, viewGroup);
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mDelegator.onDetachedFromRecyclerView(recyclerView);
    }

    public void setSelection(int i) {
        this.mDelegator.setSelection(i);
    }
}
