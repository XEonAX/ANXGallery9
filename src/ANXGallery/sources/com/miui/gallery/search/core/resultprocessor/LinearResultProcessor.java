package com.miui.gallery.search.core.resultprocessor;

import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.result.BaseSuggestionResult;
import com.miui.gallery.search.core.result.ErrorInfo;
import com.miui.gallery.search.core.result.SourceResult;
import com.miui.gallery.search.core.result.SuggestionResult;
import com.miui.gallery.search.core.suggestion.ListSuggestionCursor;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import java.util.ArrayList;
import java.util.List;

public class LinearResultProcessor extends ResultProcessor<SuggestionResult> {
    /* access modifiers changed from: protected */
    public SuggestionResult getMergedResult(List<SourceResult> list) {
        ErrorInfo mergedErrorInfo = getMergedErrorInfo(list);
        ArrayList arrayList = new ArrayList();
        QueryInfo queryInfo = null;
        for (SourceResult sourceResult : list) {
            if (queryInfo == null && sourceResult.getQueryInfo() != null) {
                queryInfo = sourceResult.getQueryInfo();
            }
            SuggestionCursor data = sourceResult.getData();
            if (data != null) {
                for (int i = 0; i < data.getCount(); i++) {
                    if (data.moveToPosition(i)) {
                        arrayList.add(toSuggestion(data.getCurrent()));
                    }
                }
            }
        }
        return new BaseSuggestionResult(queryInfo, new ListSuggestionCursor(queryInfo, arrayList), mergedErrorInfo);
    }
}
