package com.miui.gallery.editor.photo.app.menu;

import android.content.Context;
import android.support.constraint.Guideline;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.editor.ui.menu.content.SimpleRecyclerViewContentView;
import com.miui.gallery.editor.ui.menu.type.BaseMenuContentView;

public class RemoverView extends BaseMenuContentView {
    public RemoverView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public View initBottomView() {
        return inflate(this.mContext, R.layout.photo_editor_remover_bottom_layout, null);
    }

    /* access modifiers changed from: protected */
    public View initContentView() {
        return new SimpleRecyclerViewContentView(this.mContext);
    }

    /* access modifiers changed from: protected */
    public View initTopView() {
        return inflate(this.mContext, R.layout.photo_editor_seek_bar_top_layout, null);
    }

    /* access modifiers changed from: protected */
    public void modifyTopGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_menu_remove_top_guide_line_end));
    }
}
