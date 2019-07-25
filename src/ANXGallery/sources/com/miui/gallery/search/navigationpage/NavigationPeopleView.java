package com.miui.gallery.search.navigationpage;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import android.widget.GridView;

public class NavigationPeopleView extends GridView implements NavigationSectionContentView {
    public NavigationPeopleView(Context context) {
        this(context, null);
    }

    public NavigationPeopleView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public NavigationPeopleView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public NavigationSectionAdapter getContentAdapter() {
        if (getAdapter() == null) {
            return null;
        }
        return (NavigationSectionAdapter) getAdapter();
    }

    public void onMeasure(int i, int i2) {
        super.onMeasure(i, MeasureSpec.makeMeasureSpec(536870911, Integer.MIN_VALUE));
    }

    public void setContentAdapter(NavigationSectionAdapter navigationSectionAdapter) {
        setAdapter(navigationSectionAdapter);
    }
}
