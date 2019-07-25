package com.miui.gallery.video.editor.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.video.editor.Filter;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter;
import java.util.List;

public class FilterRecyclerViewAdapter extends SingleChoiceRecyclerViewAdapter<FilterViewHolder> {
    private final int ITEM_TYPE_ITEM_NORMAL = 1;
    private List<Filter> filterList;
    private int mFirstMarginLeft = 0;
    private LayoutInflater mLayoutInflater;

    public FilterRecyclerViewAdapter(Context context, List<Filter> list) {
        this.mLayoutInflater = LayoutInflater.from(context);
        this.filterList = list;
    }

    public Filter getFilter(int i) {
        if (this.filterList == null || i >= this.filterList.size()) {
            return null;
        }
        return (Filter) this.filterList.get(i);
    }

    public int getItemCount() {
        if (this.filterList != null) {
            return this.filterList.size();
        }
        return 0;
    }

    public int getItemViewType(int i) {
        return 1;
    }

    public void onBindView(FilterViewHolder filterViewHolder, int i) {
        if (getItemCount() > 0) {
            filterViewHolder.setMarginLeft(i == 0 ? this.mFirstMarginLeft : 0);
            Filter filter = (Filter) this.filterList.get(i);
            filterViewHolder.setName(filter.getNameResId());
            filterViewHolder.setIcon(filter.getIconResId());
        }
    }

    public FilterViewHolder onCreateSingleChoiceViewHolder(ViewGroup viewGroup, int i) {
        return new FilterViewHolder(this.mLayoutInflater.inflate(R.layout.video_editor_filter_item, viewGroup, false));
    }
}
