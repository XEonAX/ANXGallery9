package com.miui.gallery.editor.ui.menu.content;

import android.content.Context;
import android.support.constraint.ConstraintLayout;

public abstract class BaseEditContentView extends ConstraintLayout {
    public BaseEditContentView(Context context) {
        super(context);
        init(context);
    }

    private void init(Context context) {
        inflateContentView(context);
    }

    /* access modifiers changed from: protected */
    public abstract void inflateContentView(Context context);
}
