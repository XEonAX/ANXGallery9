package com.miui.gallery.editor.ui.menu.type;

import android.content.Context;
import android.support.constraint.Guideline;
import com.miui.gallery.editor.R;

public class BaseMenuContentView extends BaseMenuBottomView {
    public BaseMenuContentView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void modifyContentGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_menu_smart_video_guide_line_end));
    }
}
