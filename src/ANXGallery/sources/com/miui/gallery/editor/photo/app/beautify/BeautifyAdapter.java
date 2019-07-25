package com.miui.gallery.editor.photo.app.beautify;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.common.model.BeautifyData;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Delegator;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Selector;
import com.miui.gallery.ui.SimpleRecyclerView.Adapter;
import java.util.List;

class BeautifyAdapter extends Adapter<BeautifyAdapterItemHolder> implements Selectable {
    private List<BeautifyData> mDataList;
    private Delegator mDelegator;

    static class BeautifyAdapterItemHolder extends ViewHolder {
        private ImageView mIconView;
        private TextView mLabelView;

        public BeautifyAdapterItemHolder(View view) {
            super(view);
            this.mLabelView = (TextView) view.findViewById(R.id.labelView);
            this.mIconView = (ImageView) view.findViewById(R.id.iconView);
        }

        /* access modifiers changed from: 0000 */
        public void bind(BeautifyData beautifyData) {
            this.mIconView.setImageResource(beautifyData.icon);
            this.mLabelView.setText(beautifyData.name);
        }
    }

    public BeautifyAdapter(Context context, List<BeautifyData> list, Selector selector) {
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

    public void onBindViewHolder(BeautifyAdapterItemHolder beautifyAdapterItemHolder, int i) {
        super.onBindViewHolder(beautifyAdapterItemHolder, i);
        beautifyAdapterItemHolder.bind((BeautifyData) this.mDataList.get(i));
        this.mDelegator.onBindViewHolder(beautifyAdapterItemHolder, i);
    }

    public BeautifyAdapterItemHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new BeautifyAdapterItemHolder(getInflater().inflate(R.layout.beautify_menu_item, viewGroup, false));
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mDelegator.onDetachedFromRecyclerView(recyclerView);
    }

    public void setSelection(int i) {
        this.mDelegator.setSelection(i);
    }
}
