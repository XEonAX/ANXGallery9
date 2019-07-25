package com.miui.gallery.search.core.source.server;

import android.content.Context;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.result.SourceResult;
import com.miui.gallery.search.core.source.Source;
import com.miui.gallery.search.core.suggestion.GroupedSuggestionCursor;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import java.util.ArrayList;
import java.util.List;

public abstract class SectionedServerSource extends ServerSource {
    public SectionedServerSource(Context context) {
        super(context);
    }

    static SuggestionCursor createResultData(QueryInfo queryInfo, List<SectionedSuggestion> list, Source source) {
        GroupedSuggestionCursor groupedSuggestionCursor = null;
        if (list == null || list.isEmpty()) {
            return null;
        }
        ArrayList arrayList = new ArrayList(list.size());
        for (SectionedSuggestion createSuggestionSection : list) {
            arrayList.add(ConvertUtil.createSuggestionSection(queryInfo, createSuggestionSection, source));
        }
        if (!arrayList.isEmpty()) {
            groupedSuggestionCursor = new GroupedSuggestionCursor(queryInfo, arrayList);
        }
        return groupedSuggestionCursor;
    }

    /* access modifiers changed from: protected */
    public boolean canCarryLog() {
        return true;
    }

    /* access modifiers changed from: protected */
    public boolean isPersistable(QueryInfo queryInfo) {
        return true;
    }

    /* access modifiers changed from: protected */
    public SourceResult onResponse(QueryInfo queryInfo, ServerSearchRequest serverSearchRequest, Object obj) {
        return generateDefaultResult(queryInfo, createResultData(queryInfo, obj instanceof SectionedResponseData ? ((SectionedResponseData) obj).sections : null, this));
    }
}
