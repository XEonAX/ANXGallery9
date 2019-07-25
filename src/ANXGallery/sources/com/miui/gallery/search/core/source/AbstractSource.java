package com.miui.gallery.search.core.source;

import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.result.SuggestionResult;

public abstract class AbstractSource implements Source {
    public int getPriority(QueryInfo queryInfo) {
        return 4;
    }

    public /* bridge */ /* synthetic */ SuggestionResult getSuggestions(QueryInfo queryInfo) {
        return getSuggestions(queryInfo);
    }

    public abstract SearchType[] getSupportSearchTypes();

    public boolean match(QueryInfo queryInfo) {
        if (queryInfo == null || queryInfo.getSearchType() == null) {
            return false;
        }
        SearchType[] supportSearchTypes = getSupportSearchTypes();
        if (supportSearchTypes != null && supportSearchTypes.length > 0) {
            for (SearchType searchType : supportSearchTypes) {
                if (searchType == queryInfo.getSearchType()) {
                    return true;
                }
            }
        }
        return false;
    }
}
