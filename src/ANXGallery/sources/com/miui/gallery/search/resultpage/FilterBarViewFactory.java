package com.miui.gallery.search.resultpage;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.miui.gallery.R;
import com.miui.gallery.people.PeopleDisplayHelper;
import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.display.AbstractSuggestionViewFactory;
import com.miui.gallery.search.core.display.BaseSuggestionViewHolder;
import com.miui.gallery.search.core.display.OnActionClickListener;
import com.miui.gallery.search.core.suggestion.Suggestion;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.search.statistics.SearchStatUtils;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class FilterBarViewFactory extends AbstractSuggestionViewFactory {
    private static Map<String, Integer> sViewTypes = new HashMap();
    private DisplayImageOptions mFilterItemDisplayImageOptions;

    static {
        sViewTypes.put("filter_item", Integer.valueOf(R.layout.filter_bar_item));
        sViewTypes.put("filter_item_no_icon", Integer.valueOf(R.layout.filter_bar_item_no_icon));
    }

    public FilterBarViewFactory(Context context) {
        super(context);
    }

    /* access modifiers changed from: private */
    public Suggestion getItem(SuggestionCursor suggestionCursor, int i) {
        suggestionCursor.moveToPosition(i);
        return suggestionCursor.getCurrent();
    }

    public void bindViewHolder(QueryInfo queryInfo, final Suggestion suggestion, final int i, BaseSuggestionViewHolder baseSuggestionViewHolder, final OnActionClickListener onActionClickListener) {
        Suggestion item = getItem((SuggestionCursor) suggestion, i);
        if (item != null) {
            super.bindViewHolder(queryInfo, item, i, baseSuggestionViewHolder, onActionClickListener);
            if (!(item.getIntentActionURI() == null || baseSuggestionViewHolder.getClickView() == null || onActionClickListener == null)) {
                baseSuggestionViewHolder.getClickView().setOnClickListener(new OnClickListener() {
                    public void onClick(View view) {
                        onActionClickListener.onClick(view, 0, FilterBarViewFactory.this.getItem((SuggestionCursor) suggestion, i), SearchStatUtils.buildSearchEventExtras(null, new String[]{"from"}, new String[]{"from_image_result_filter"}));
                    }
                });
            }
        }
    }

    /* access modifiers changed from: protected */
    public DisplayImageOptions getDisplayImageOptionsForViewType(String str) {
        return this.mFilterItemDisplayImageOptions;
    }

    /* access modifiers changed from: protected */
    public int getLayoutIdForViewType(String str) {
        return ((Integer) sViewTypes.get(str)).intValue();
    }

    public Collection<String> getSuggestionViewTypes() {
        return sViewTypes.keySet();
    }

    public String getViewType(QueryInfo queryInfo, SuggestionCursor suggestionCursor, int i) {
        if (queryInfo.getSearchType() != SearchType.SEARCH_TYPE_FILTER) {
            return null;
        }
        return TextUtils.isEmpty(suggestionCursor.getSuggestionIcon()) ? "filter_item_no_icon" : "filter_item";
    }

    /* access modifiers changed from: protected */
    public void initDisplayImageOptions(Context context) {
        super.initDisplayImageOptions(context);
        this.mFilterItemDisplayImageOptions = PeopleDisplayHelper.getDefaultPeopleDisplayOptionsBuilder().build();
    }
}
