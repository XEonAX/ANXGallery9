package com.miui.gallery.editor.photo.app.frame;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.miui.gallery.editor.photo.core.common.model.FrameData;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Delegator;
import com.miui.gallery.ui.SimpleRecyclerView.Adapter;
import java.util.List;

class FrameAdapter extends Adapter<FrameItemHolder> implements Selectable {
    private Context mContext;
    private Delegator mDelegator = new Delegator(0);
    private List<FrameData> mFrameDataList;

    FrameAdapter(List<FrameData> list, Context context) {
        this.mFrameDataList = list;
        this.mContext = context;
    }

    public int getItemCount() {
        if (this.mFrameDataList == null) {
            return 0;
        }
        return this.mFrameDataList.size();
    }

    public int getSelection() {
        return this.mDelegator.getSelection();
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mDelegator.onAttachedToRecyclerView(recyclerView);
    }

    public void onBindViewHolder(FrameItemHolder frameItemHolder, int i) {
        super.onBindViewHolder(frameItemHolder, i);
        frameItemHolder.setFrameData((FrameData) this.mFrameDataList.get(i));
        this.mDelegator.onBindViewHolder(frameItemHolder, i);
    }

    public FrameItemHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new FrameItemHolder(this.mContext, viewGroup);
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mDelegator.onDetachedFromRecyclerView(recyclerView);
    }

    public void setSelection(int i) {
        this.mDelegator.setSelection(i);
    }
}
