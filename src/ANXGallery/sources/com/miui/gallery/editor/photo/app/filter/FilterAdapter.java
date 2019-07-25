package com.miui.gallery.editor.photo.app.filter;

import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.common.model.FilterData;
import com.miui.gallery.ui.SimpleRecyclerView.Adapter;
import java.util.List;

class FilterAdapter extends Adapter<FilterMenuItem> {
    private boolean mEditMode = false;
    private List<FilterData> mEffects;
    private int mHighlightColor;
    private int mSelectedIndex = 0;
    private int mSubHighlightColor;
    private int mSubItemSize;

    FilterAdapter(List<FilterData> list, int i, int i2, int i3) {
        this.mEffects = list;
        this.mHighlightColor = i;
        this.mSubHighlightColor = i2;
        this.mSubItemSize = i3;
    }

    /* access modifiers changed from: 0000 */
    public void clearSelected() {
        if (this.mSelectedIndex != -1) {
            int i = this.mSelectedIndex;
            this.mSelectedIndex = -1;
            notifyItemChanged(i);
        }
    }

    /* access modifiers changed from: 0000 */
    public void enterEditMode() {
        this.mEditMode = true;
        notifyItemChanged(this.mSelectedIndex);
    }

    /* access modifiers changed from: 0000 */
    public void exitEditMode() {
        this.mEditMode = false;
        notifyItemChanged(this.mSelectedIndex);
    }

    public int getItemCount() {
        return this.mEffects.size();
    }

    public FilterData getItemData(int i) {
        if (this.mEffects == null || i < 0 || i >= this.mEffects.size()) {
            return null;
        }
        return (FilterData) this.mEffects.get(i);
    }

    /* access modifiers changed from: 0000 */
    public int getValue() {
        return ((FilterData) this.mEffects.get(this.mSelectedIndex)).progress;
    }

    /* access modifiers changed from: 0000 */
    public boolean isInEditMode() {
        return this.mEditMode;
    }

    public void onBindViewHolder(FilterMenuItem filterMenuItem, int i) {
        super.onBindViewHolder(filterMenuItem, i);
        boolean z = i == this.mSelectedIndex;
        filterMenuItem.bindData((FilterData) this.mEffects.get(i));
        filterMenuItem.setState(z, this.mEditMode);
        if (this.mSubItemSize <= 0 || i < getItemCount() - this.mSubItemSize) {
            filterMenuItem.setForegroundColor(this.mHighlightColor);
        } else {
            filterMenuItem.setForegroundColor(this.mSubHighlightColor);
        }
        if (z && this.mEditMode && !((FilterData) this.mEffects.get(i)).isNone()) {
            filterMenuItem.updateIndicator(getValue());
        }
    }

    public FilterMenuItem onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new FilterMenuItem(getInflater().inflate(R.layout.filter_menu_item, viewGroup, false));
    }

    /* access modifiers changed from: 0000 */
    public void setSelectedIndex(int i) {
        if (i != this.mSelectedIndex) {
            int i2 = this.mSelectedIndex;
            this.mSelectedIndex = i;
            if (i2 != -1) {
                notifyItemChanged(i2);
            }
            if (this.mSelectedIndex != -1) {
                notifyItemChanged(this.mSelectedIndex);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void update(int i) {
        if (this.mEditMode && this.mSelectedIndex != -1) {
            ((FilterData) this.mEffects.get(this.mSelectedIndex)).progress = i;
            notifyItemChanged(this.mSelectedIndex);
        }
    }
}
