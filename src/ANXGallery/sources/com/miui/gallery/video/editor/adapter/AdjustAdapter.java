package com.miui.gallery.video.editor.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Delegator;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Selector;
import com.miui.gallery.util.ScreenUtils;
import com.miui.gallery.video.editor.model.AdjustData;
import com.miui.gallery.video.editor.ui.SimpleRecyclerView.Adapter;
import java.util.List;

public class AdjustAdapter extends Adapter<AdjustAdapterItemHolder> implements Selectable {
    private List<AdjustData> mDataList;
    private Delegator mDelegator;
    private int mItemWidth;

    static class AdjustAdapterItemHolder extends ViewHolder {
        private ImageView mIconView;
        private TextView mLabelView;

        public AdjustAdapterItemHolder(View view) {
            super(view);
            this.mLabelView = (TextView) view.findViewById(R.id.labelView);
            this.mIconView = (ImageView) view.findViewById(R.id.iconView);
        }

        /* access modifiers changed from: 0000 */
        public void bind(AdjustData adjustData) {
            this.mIconView.setImageResource(adjustData.icon);
            this.mLabelView.setText(adjustData.name);
        }
    }

    public AdjustAdapter(Context context, List<AdjustData> list, Selector selector) {
        this.mDataList = list;
        this.mDelegator = new Delegator(-1, selector);
        this.mItemWidth = (int) ((((float) ScreenUtils.getScreenWidth()) - (context.getResources().getDimension(R.dimen.photo_editor_menu_bound_padding) * 2.0f)) / ((float) getItemCount()));
    }

    public int getItemCount() {
        return this.mDataList.size();
    }

    public int getSelection() {
        return this.mDelegator.getSelection();
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mDelegator.onAttachedToRecyclerView(recyclerView);
    }

    public void onBindViewHolder(AdjustAdapterItemHolder adjustAdapterItemHolder, int i) {
        super.onBindViewHolder(adjustAdapterItemHolder, i);
        adjustAdapterItemHolder.bind((AdjustData) this.mDataList.get(i));
        this.mDelegator.onBindViewHolder(adjustAdapterItemHolder, i);
    }

    public AdjustAdapterItemHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View inflate = getInflater().inflate(R.layout.adjust_menu_item, viewGroup, false);
        inflate.getLayoutParams().width = this.mItemWidth;
        return new AdjustAdapterItemHolder(inflate);
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mDelegator.onDetachedFromRecyclerView(recyclerView);
    }

    public void setSelection(int i) {
        this.mDelegator.setSelection(i);
    }
}
