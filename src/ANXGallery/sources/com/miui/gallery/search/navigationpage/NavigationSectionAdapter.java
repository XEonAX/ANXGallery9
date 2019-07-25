package com.miui.gallery.search.navigationpage;

import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.miui.gallery.search.SearchConfig;
import com.miui.gallery.search.core.display.BaseSuggestionViewHolder;
import com.miui.gallery.search.core.display.OnActionClickListener;
import com.miui.gallery.search.core.display.SuggestionViewFactory;
import com.miui.gallery.search.core.suggestion.Suggestion;
import com.miui.gallery.search.core.suggestion.SuggestionExtras;
import com.miui.gallery.search.core.suggestion.SuggestionSection;
import com.miui.gallery.search.navigationpage.SuggestionTagView.SuggestionTagViewAdapter;
import com.miui.gallery.search.statistics.SearchStatUtils;

public class NavigationSectionAdapter extends BaseAdapter implements SuggestionTagViewAdapter {
    protected OnActionClickListener mActionClickListener;
    protected boolean mAppendMoreItemToItems;
    protected Context mContext;
    protected String mFrom;
    protected LayoutInflater mInflater = LayoutInflater.from(this.mContext);
    protected SuggestionSection mSection;
    protected SuggestionViewFactory mViewFactory;

    public NavigationSectionAdapter(Context context, SuggestionViewFactory suggestionViewFactory, SuggestionSection suggestionSection, String str, boolean z) {
        this.mContext = context;
        this.mViewFactory = suggestionViewFactory;
        this.mSection = suggestionSection;
        this.mFrom = str;
        this.mAppendMoreItemToItems = z;
    }

    private boolean getFixedMoreItemValue(boolean z, SuggestionExtras suggestionExtras) {
        if (suggestionExtras == null) {
            return z;
        }
        String extra = suggestionExtras.getExtra("fixed");
        if (!TextUtils.isEmpty(extra)) {
            z = Boolean.valueOf(extra).booleanValue();
        }
        return z;
    }

    public void changeSectionData(SuggestionSection suggestionSection) {
        if (suggestionSection != this.mSection) {
            this.mSection = suggestionSection;
            notifyDataSetChanged();
        }
    }

    public int getCount() {
        return getItemCount() + ((!this.mAppendMoreItemToItems || !hasMoreItem()) ? 0 : 1);
    }

    public Suggestion getItem(int i) {
        if (i == -3) {
            return this.mSection.moveToMore();
        }
        if (i < 0) {
            return null;
        }
        this.mSection.moveToPosition(i);
        return this.mSection.getCurrent();
    }

    /* access modifiers changed from: protected */
    public int getItemCount() {
        return Math.min(this.mSection.getCount(), SearchConfig.get().getNavigationConfig().getSectionMaxItemCount(this.mSection.getSectionType()));
    }

    public long getItemId(int i) {
        return (long) i;
    }

    public View getMoreItemView(View view, ViewGroup viewGroup) {
        return getView(getItemCount(), view, viewGroup);
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        BaseSuggestionViewHolder baseSuggestionViewHolder;
        final int i2 = i == getItemCount() ? -3 : i;
        if (view == null) {
            baseSuggestionViewHolder = this.mViewFactory.createViewHolder(viewGroup, this.mViewFactory.getViewType(this.mSection.getQueryInfo(), this.mSection, i2));
            baseSuggestionViewHolder.itemView.setTag(baseSuggestionViewHolder);
        } else {
            baseSuggestionViewHolder = (BaseSuggestionViewHolder) view.getTag();
        }
        if (!((i2 < 0 && i2 != -3) || getItem(i2).getIntentActionURI() == null || baseSuggestionViewHolder.getClickView() == null)) {
            baseSuggestionViewHolder.getClickView().setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    if (NavigationSectionAdapter.this.mActionClickListener != null) {
                        NavigationSectionAdapter.this.mActionClickListener.onClick(view, 0, NavigationSectionAdapter.this.getItem(i2), SearchStatUtils.buildSearchEventExtras(null, new String[]{"from", "sectionType"}, new String[]{NavigationSectionAdapter.this.mFrom, NavigationSectionAdapter.this.mSection.getSectionTypeString()}));
                    }
                }
            });
        }
        this.mViewFactory.bindViewHolder(this.mSection.getQueryInfo(), this.mSection, i2, baseSuggestionViewHolder, this.mActionClickListener);
        return baseSuggestionViewHolder.itemView;
    }

    public boolean hasMoreItem() {
        return this.mSection.moveToMore() != null;
    }

    public boolean isFixedMoreItem() {
        return hasMoreItem() && getFixedMoreItemValue(true, this.mSection.moveToMore().getSuggestionExtras());
    }

    public void setActionClickListener(OnActionClickListener onActionClickListener) {
        this.mActionClickListener = onActionClickListener;
    }
}
