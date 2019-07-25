package com.miui.gallery.share;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.GridLayout;
import com.miui.gallery.R;

public class GridPreference extends GridPreferenceBase {
    public GridPreference(Context context) {
        this(context, null);
    }

    public GridPreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public GridPreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.share_album_user_grid_pref_view;
    }

    /* access modifiers changed from: protected */
    public void updateGrid(View view) {
        GridLayout gridLayout = (GridLayout) view.findViewById(16908298);
        gridLayout.setColumnCount(this.mColumnCount);
        if (this.mAdapter == null || gridLayout.getColumnCount() == 0) {
            gridLayout.removeAllViews();
            return;
        }
        int count = this.mAdapter.getCount();
        int childCount = gridLayout.getChildCount();
        int min = Math.min(count, childCount);
        int i = 0;
        while (i < min) {
            View childAt = gridLayout.getChildAt(i);
            if (childAt == this.mAdapter.getView(i, childAt, gridLayout)) {
                childAt.getLayoutParams().width = this.mColumnWidth;
                childAt.setTag(getTagInfo(), Integer.valueOf(i));
                i++;
            } else {
                throw new UnsupportedOperationException("convert view must be reused!");
            }
        }
        while (i < count) {
            View view2 = this.mAdapter.getView(i, null, gridLayout);
            gridLayout.addView(view2);
            view2.setOnClickListener(this.mClickListener);
            view2.setTag(getTagInfo(), Integer.valueOf(i));
            view2.getLayoutParams().width = this.mColumnWidth;
            i++;
        }
        if (i < childCount) {
            gridLayout.removeViews(i, childCount - i);
        }
        gridLayout.getLayoutParams().width = this.mColumnWidth * this.mColumnCount;
        gridLayout.requestLayout();
    }
}
