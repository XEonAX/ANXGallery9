package com.miui.gallery.editor.ui.menu.type;

import android.content.Context;
import android.support.constraint.Guideline;
import com.miui.gallery.editor.R;

public abstract class BaseMenuTopView extends BaseMenuBottomView {
    public BaseMenuTopView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void modifyContentGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_menu_filter_guide_line_end));
    }

    /* access modifiers changed from: protected */
    public void modifyTopGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_filter_and_adjust_top_guide_line_end));
    }
}
