package com.miui.gallery.collage.app.stitching;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.miui.gallery.collage.core.stitching.StitchingModel;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Delegator;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Selector;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.Adapter;
import java.util.List;

class StitchingAdapter extends Adapter<StitchingHolder> implements Selectable {
    private Context mContext;
    private Delegator mDelegator;
    private List<StitchingModel> mStitchingModelList;

    StitchingAdapter(Context context, List<StitchingModel> list, Selector selector) {
        this.mStitchingModelList = list;
        this.mContext = context;
        this.mDelegator = new Delegator(0, selector);
    }

    public int getItemCount() {
        return this.mStitchingModelList.size();
    }

    public int getSelection() {
        return this.mDelegator.getSelection();
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mDelegator.onAttachedToRecyclerView(recyclerView);
    }

    public void onBindViewHolder(StitchingHolder stitchingHolder, int i) {
        super.onBindViewHolder(stitchingHolder, i);
        stitchingHolder.setStitchingModel(this.mContext.getResources(), (StitchingModel) this.mStitchingModelList.get(i), i);
        this.mDelegator.onBindViewHolder(stitchingHolder, i);
    }

    public StitchingHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new StitchingHolder(viewGroup, this.mContext);
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mDelegator.onDetachedFromRecyclerView(recyclerView);
    }

    public void setSelection(int i) {
        this.mDelegator.setSelection(i);
    }
}
