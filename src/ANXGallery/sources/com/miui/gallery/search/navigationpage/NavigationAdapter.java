package com.miui.gallery.search.navigationpage;

import android.app.Activity;
import com.miui.gallery.search.SearchConfig;
import com.miui.gallery.search.SearchConstants.SectionType;
import com.miui.gallery.search.core.display.SectionedSuggestionAdapter;
import com.miui.gallery.search.core.display.SuggestionViewFactory;

public class NavigationAdapter extends SectionedSuggestionAdapter {
    public NavigationAdapter(Activity activity, SuggestionViewFactory suggestionViewFactory, String str) {
        super(activity, suggestionViewFactory, str);
    }

    /* access modifiers changed from: protected */
    public int getSectionItemCount(int i) {
        if (getSection(i).getSectionType() == SectionType.SECTION_TYPE_WARNING) {
            return 0;
        }
        return super.getSectionItemCount(i);
    }

    /* access modifiers changed from: protected */
    public boolean useBatchContent(int i) {
        return SearchConfig.get().getNavigationConfig().useBatchContent(getSection(i).getSectionType());
    }
}
