package com.miui.gallery.editor.photo.app.menu;

import android.content.Context;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.editor.ui.menu.content.NoScrollViewPagerContentView;
import com.miui.gallery.editor.ui.menu.type.BaseMenuTopView;

public class WaterMarkView extends BaseMenuTopView {
    public WaterMarkView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public View initContentView() {
        return new NoScrollViewPagerContentView(this.mContext);
    }

    /* access modifiers changed from: protected */
    public View initTopView() {
        return inflate(this.mContext, R.layout.photo_editor_text_top_layout, null);
    }
}
