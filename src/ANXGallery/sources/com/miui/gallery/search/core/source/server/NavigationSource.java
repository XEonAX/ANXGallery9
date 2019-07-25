package com.miui.gallery.search.core.source.server;

import android.content.Context;
import com.miui.gallery.search.SearchConfig;
import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.core.QueryInfo;

public class NavigationSource extends SectionedServerSource {
    private static final SearchType[] SUPPORT_SEARCH_TYPE = {SearchType.SEARCH_TYPE_NAVIGATION};

    public NavigationSource(Context context) {
        super(context);
    }

    public String getName() {
        return "server_controlled_navigations";
    }

    /* access modifiers changed from: protected */
    public String getQueryAppendPath(QueryInfo queryInfo) {
        return "navigation";
    }

    public SearchType[] getSupportSearchTypes() {
        return SUPPORT_SEARCH_TYPE;
    }

    /* access modifiers changed from: protected */
    public boolean isFatalCondition(QueryInfo queryInfo, int i) {
        return SearchConfig.get().getNavigationConfig().isFatalCondition(i);
    }

    /* access modifiers changed from: protected */
    public boolean useCache(QueryInfo queryInfo) {
        return true;
    }
}
