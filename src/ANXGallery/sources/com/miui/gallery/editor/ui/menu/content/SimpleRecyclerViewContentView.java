package com.miui.gallery.editor.ui.menu.content;

import android.content.Context;
import com.miui.gallery.editor.R;

public class SimpleRecyclerViewContentView extends BaseEditContentView {
    public SimpleRecyclerViewContentView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void inflateContentView(Context context) {
        inflate(context, R.layout.common_edit_menu_content_view, this);
    }
}
