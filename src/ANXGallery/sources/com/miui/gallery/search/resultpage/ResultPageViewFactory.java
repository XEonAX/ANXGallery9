package com.miui.gallery.search.resultpage;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.display.AbstractSuggestionViewFactory;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.search.widget.RoundedCornerRectBitmapDisplayer;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class ResultPageViewFactory extends AbstractSuggestionViewFactory {
    private static Map<String, Integer> sViewTypes = new HashMap();
    private DisplayImageOptions mTagItemDisplayImageOptions;

    static {
        sViewTypes.put("result_tag_item", Integer.valueOf(R.layout.result_tag_item));
    }

    public ResultPageViewFactory(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public DisplayImageOptions getDisplayImageOptionsForViewType(String str) {
        return str.equals("result_tag_item") ? this.mTagItemDisplayImageOptions : super.getDisplayImageOptionsForViewType(str);
    }

    /* access modifiers changed from: protected */
    public int getLayoutIdForViewType(String str) {
        return ((Integer) sViewTypes.get(str)).intValue();
    }

    public Collection<String> getSuggestionViewTypes() {
        return sViewTypes.keySet();
    }

    public String getViewType(QueryInfo queryInfo, SuggestionCursor suggestionCursor, int i) {
        if (queryInfo.getSearchType() != SearchType.SEARCH_TYPE_RESULT || i < 0) {
            return null;
        }
        return "result_tag_item";
    }

    /* access modifiers changed from: protected */
    public void initDisplayImageOptions(Context context) {
        super.initDisplayImageOptions(context);
        this.mTagItemDisplayImageOptions = this.mDisplayImageOptionBuilder.displayer(new RoundedCornerRectBitmapDisplayer(context.getResources().getDimensionPixelSize(R.dimen.search_radius_middle))).build();
    }
}
