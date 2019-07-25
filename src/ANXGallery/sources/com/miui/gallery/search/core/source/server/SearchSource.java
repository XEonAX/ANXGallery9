package com.miui.gallery.search.core.source.server;

import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.search.SearchConfig;
import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.util.Log;
import java.util.Map;

public class SearchSource extends SectionedServerSource {
    private static final SearchType[] SUPPORT_SEARCH_TYPE = {SearchType.SEARCH_TYPE_SEARCH, SearchType.SEARCH_TYPE_SUGGESTION};

    public SearchSource(Context context) {
        super(context);
    }

    public String getName() {
        return "server_controlled_search_suggestions";
    }

    /* access modifiers changed from: protected */
    public String getQueryAppendPath(QueryInfo queryInfo) {
        switch (queryInfo.getSearchType()) {
            case SEARCH_TYPE_SUGGESTION:
                return "suggestion";
            case SEARCH_TYPE_SEARCH:
                return "search";
            default:
                return null;
        }
    }

    /* access modifiers changed from: protected */
    public Map<String, String> getQueryParams(QueryInfo queryInfo) {
        Map<String, String> queryParams = super.getQueryParams(queryInfo);
        String str = (String) queryParams.get("query");
        if (!TextUtils.isEmpty(str)) {
            String queryExtras = SearchConfig.get().getSuggestionConfig().getQueryExtras(str);
            if (!TextUtils.isEmpty(queryExtras)) {
                queryParams.put("extraInfo", queryExtras);
                Log.d("SearchSource", "On append extra [%s] to query [%s]", queryExtras, str);
            }
        }
        queryParams.remove("enableShortcut");
        return queryParams;
    }

    public SearchType[] getSupportSearchTypes() {
        return SUPPORT_SEARCH_TYPE;
    }

    /* access modifiers changed from: protected */
    public boolean isFatalCondition(QueryInfo queryInfo, int i) {
        return super.isFatalCondition(queryInfo, i) || i == 14;
    }

    /* access modifiers changed from: protected */
    public boolean useCache(QueryInfo queryInfo) {
        return TextUtils.isEmpty(queryInfo.getParam("extraInfo"));
    }
}
