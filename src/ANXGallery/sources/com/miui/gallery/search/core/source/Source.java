package com.miui.gallery.search.core.source;

import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.result.SourceResult;

public interface Source extends SuggestionResultProvider<SourceResult> {

    /* renamed from: com.miui.gallery.search.core.source.Source$-CC reason: invalid class name */
    public final /* synthetic */ class CC {
    }

    int getPriority(QueryInfo queryInfo);

    SourceResult getSuggestions(QueryInfo queryInfo);
}
