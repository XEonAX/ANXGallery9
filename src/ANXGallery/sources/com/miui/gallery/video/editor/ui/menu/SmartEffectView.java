package com.miui.gallery.video.editor.ui.menu;

import android.content.Context;
import android.view.View;
import com.miui.gallery.editor.ui.menu.type.BaseMenuContentView;
import com.miui.gallery.video.editor.ui.menu.content.BaseContentView;

public class SmartEffectView extends BaseMenuContentView {
    public SmartEffectView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public View initContentView() {
        return new BaseContentView(this.mContext);
    }
}
