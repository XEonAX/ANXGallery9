package com.miui.gallery.editor.photo.app.menu;

import android.content.Context;
import android.support.constraint.Guideline;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.app.miuibeautify.DoubleParameterBeautyFragment;
import com.miui.gallery.editor.photo.app.miuibeautify.SingleParameterBeautyFragment;
import com.miui.gallery.editor.photo.app.miuibeautify.SmartBeautyFragment;
import com.miui.gallery.editor.ui.menu.BaseMenuView;

public class MiuiBeautyView extends BaseMenuView {
    public MiuiBeautyView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public View initBottomView() {
        return inflate(this.mContext, R.layout.photo_editor_remover_bottom_layout, null);
    }

    /* access modifiers changed from: protected */
    public View initContentView() {
        return inflate(this.mContext, R.layout.photo_editor_miui_beauty_content_layout, null);
    }

    /* access modifiers changed from: protected */
    public View initTopView() {
        return null;
    }

    /* access modifiers changed from: protected */
    public void modifyBottomGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_bottom_apply_guide_line_end));
    }

    /* access modifiers changed from: protected */
    public void modifyContentGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_content_guide_line_end));
    }

    /* access modifiers changed from: protected */
    public void modifyTopGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_menu_height));
    }

    public void updateGuideLine(Object obj) {
        if (SmartBeautyFragment.class.isInstance(obj)) {
            this.mContentLine.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_beauty_smart_content_line_end));
        } else if (DoubleParameterBeautyFragment.class.isInstance(obj)) {
            this.mContentLine.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_beauty_doubleparameterbeauty_content_line_end));
        } else if (SingleParameterBeautyFragment.class.isInstance(obj)) {
            this.mContentLine.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_beauty_singleparameterbeauty_content_line_end));
        }
    }
}
