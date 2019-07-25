package com.miui.gallery.editor.photo.app.menu;

import android.content.Context;
import android.support.constraint.Guideline;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.editor.ui.menu.type.BaseMenuBottomView;

public class DoodleView extends BaseMenuBottomView {
    public DoodleView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public View initBottomView() {
        return inflate(this.mContext, R.layout.common_editor_title_operation_layout, null);
    }

    /* access modifiers changed from: protected */
    public View initContentView() {
        return inflate(this.mContext, R.layout.photo_editor_doodle_content_layout, null);
    }

    /* access modifiers changed from: protected */
    public View initTopView() {
        return inflate(this.mContext, R.layout.photo_editor_doodle_top_view, null);
    }

    /* access modifiers changed from: protected */
    public void modifyContentGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_menu_doodle_content_guide_end));
    }

    /* access modifiers changed from: protected */
    public void modifyTopGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_menu_doodle_top_guide_end));
    }
}
