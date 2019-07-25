package com.miui.gallery.editor.ui.menu.type;

import android.content.Context;
import android.support.constraint.Guideline;
import android.view.View;
import com.miui.gallery.editor.R;
import com.miui.gallery.editor.ui.menu.BaseMenuView;
import com.miui.gallery.editor.ui.menu.content.SimpleRecyclerViewContentView;

public class EditNavMenuView extends BaseMenuView {
    public EditNavMenuView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public View initBottomView() {
        return inflate(this.mContext, R.layout.common_edit_menu_confirm_layout, null);
    }

    /* access modifiers changed from: protected */
    public View initContentView() {
        return new SimpleRecyclerViewContentView(this.mContext);
    }

    /* access modifiers changed from: protected */
    public View initTopView() {
        return null;
    }

    /* access modifiers changed from: protected */
    public void modifyBottomGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_nav_bottom_guide_line_end));
    }

    /* access modifiers changed from: protected */
    public void modifyContentGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_content_guide_line_end));
    }

    /* access modifiers changed from: protected */
    public void modifyTopGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_menu_height));
    }
}
