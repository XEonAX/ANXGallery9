package com.miui.gallery.search.navigationpage;

import android.content.Context;
import android.util.AttributeSet;

public class NavigationTagView extends SuggestionTagView implements NavigationSectionContentView {
    public NavigationTagView(Context context) {
        this(context, null);
    }

    public NavigationTagView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public NavigationTagView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public NavigationSectionAdapter getContentAdapter() {
        if (getAdapter() == null) {
            return null;
        }
        return (NavigationSectionAdapter) getAdapter();
    }

    public void setContentAdapter(NavigationSectionAdapter navigationSectionAdapter) {
        setAdapter(navigationSectionAdapter);
    }
}
