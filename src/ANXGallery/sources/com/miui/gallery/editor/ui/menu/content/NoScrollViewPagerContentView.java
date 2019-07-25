package com.miui.gallery.editor.ui.menu.content;

import android.content.Context;
import com.miui.gallery.editor.R;

public class NoScrollViewPagerContentView extends BaseEditContentView {
    public NoScrollViewPagerContentView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void inflateContentView(Context context) {
        inflate(context, R.layout.common_edit_view_pager_layout, this);
    }
}
