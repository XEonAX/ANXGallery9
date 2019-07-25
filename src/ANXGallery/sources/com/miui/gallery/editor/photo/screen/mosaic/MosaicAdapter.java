package com.miui.gallery.editor.photo.screen.mosaic;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicData;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Delegator;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.Adapter;
import java.util.ArrayList;
import java.util.List;

public class MosaicAdapter extends Adapter<MosaicHolder> implements Selectable {
    private Context mContext;
    private Delegator mDelegator;
    private List<MosaicData> mMosaicDataList;

    public MosaicAdapter(Context context, List<MosaicData> list, int i) {
        this.mContext = context;
        this.mMosaicDataList = new ArrayList(list);
        this.mDelegator = new Delegator(i);
    }

    public int getItemCount() {
        if (this.mMosaicDataList == null) {
            return 0;
        }
        return this.mMosaicDataList.size();
    }

    public int getSelection() {
        return this.mDelegator.getSelection();
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mDelegator.onAttachedToRecyclerView(recyclerView);
    }

    public void onBindViewHolder(MosaicHolder mosaicHolder, int i) {
        super.onBindViewHolder(mosaicHolder, i);
        mosaicHolder.setIconPath(((MosaicData) this.mMosaicDataList.get(i)).iconPath, i);
        this.mDelegator.onBindViewHolder(mosaicHolder, i);
    }

    public MosaicHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new MosaicHolder(this.mContext, viewGroup);
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mDelegator.onDetachedFromRecyclerView(recyclerView);
    }

    public void setSelection(int i) {
        this.mDelegator.setSelection(i);
    }
}
