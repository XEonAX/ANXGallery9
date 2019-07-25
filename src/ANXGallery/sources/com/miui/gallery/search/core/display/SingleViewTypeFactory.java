package com.miui.gallery.search.core.display;

import android.content.Context;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import java.util.Collection;
import java.util.Collections;

public class SingleViewTypeFactory extends AbstractSuggestionViewFactory {
    private final int mLayoutId;
    protected final String mViewType;

    public SingleViewTypeFactory(String str, int i, Context context) {
        super(context);
        this.mViewType = str;
        this.mLayoutId = i;
        initDisplayImageOptions(context);
    }

    /* access modifiers changed from: protected */
    public int getLayoutIdForViewType(String str) {
        return this.mLayoutId;
    }

    public Collection<String> getSuggestionViewTypes() {
        return Collections.singletonList(this.mViewType);
    }

    public String getViewType(QueryInfo queryInfo, SuggestionCursor suggestionCursor, int i) {
        return this.mViewType;
    }
}
