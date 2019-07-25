package com.miui.gallery.search.core.source.local;

import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.search.SearchConfig;
import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.SearchConstants.SectionType;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.result.BaseSourceResult;
import com.miui.gallery.search.core.result.SourceResult;
import com.miui.gallery.search.core.source.InterceptableSource;
import com.miui.gallery.search.core.suggestion.BaseSuggestionSection;
import com.miui.gallery.search.core.suggestion.ListSuggestionCursor;
import com.miui.gallery.search.core.suggestion.Suggestion;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public abstract class LocalSingleSectionSuggestionSource extends InterceptableSource {
    private static final SearchType[] SUPPORT_SEARCH_TYPE = {SearchType.SEARCH_TYPE_SUGGESTION, SearchType.SEARCH_TYPE_SEARCH};

    public LocalSingleSectionSuggestionSource(Context context) {
        super(context);
    }

    public SourceResult doGetSuggestions(QueryInfo queryInfo) {
        BaseSuggestionSection baseSuggestionSection;
        if (!TextUtils.isEmpty(queryInfo.getParam("query"))) {
            String lowerCase = queryInfo.getParam("query").toLowerCase();
            baseSuggestionSection = generateSection(queryInfo, sortSuggestions(querySuggestion(lowerCase, queryInfo), lowerCase, queryInfo));
        } else {
            baseSuggestionSection = null;
        }
        return new BaseSourceResult(queryInfo, this, baseSuggestionSection);
    }

    /* access modifiers changed from: protected */
    public BaseSuggestionSection generateSection(QueryInfo queryInfo, List<Suggestion> list) {
        if (list == null) {
            return null;
        }
        SectionType sectionType = getSectionType();
        BaseSuggestionSection baseSuggestionSection = new BaseSuggestionSection(queryInfo, sectionType, new ListSuggestionCursor(queryInfo, list), null, getSectionTitle(sectionType), null, null);
        return baseSuggestionSection;
    }

    public int getPriority(QueryInfo queryInfo) {
        return 1;
    }

    /* access modifiers changed from: protected */
    public String getSectionTitle(SectionType sectionType) {
        return SearchConfig.get().getTitleForSection(sectionType);
    }

    /* access modifiers changed from: protected */
    public abstract SectionType getSectionType();

    public SearchType[] getSupportSearchTypes() {
        return SUPPORT_SEARCH_TYPE;
    }

    /* access modifiers changed from: protected */
    public abstract List<Suggestion> querySuggestion(String str, QueryInfo queryInfo);

    /* access modifiers changed from: protected */
    public int sort(Suggestion suggestion, Suggestion suggestion2, String str, QueryInfo queryInfo) {
        int indexOf = suggestion.getSuggestionTitle().toLowerCase().indexOf(str);
        int indexOf2 = suggestion2.getSuggestionTitle().toLowerCase().indexOf(str);
        return indexOf == indexOf2 ? suggestion.getSuggestionTitle().length() - suggestion2.getSuggestionTitle().length() : indexOf - indexOf2;
    }

    /* access modifiers changed from: protected */
    public List<Suggestion> sortSuggestions(List<Suggestion> list, final String str, final QueryInfo queryInfo) {
        Collections.sort(list, new Comparator<Suggestion>() {
            public int compare(Suggestion suggestion, Suggestion suggestion2) {
                return LocalSingleSectionSuggestionSource.this.sort(suggestion, suggestion2, str, queryInfo);
            }
        });
        return list;
    }
}
