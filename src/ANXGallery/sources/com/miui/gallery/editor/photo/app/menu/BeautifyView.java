package com.miui.gallery.editor.photo.app.menu;

import android.content.Context;
import android.support.constraint.Guideline;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.editor.ui.menu.type.BaseMenuBottomView;

public class BeautifyView extends BaseMenuBottomView {
    public BeautifyView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public View initContentView() {
        return inflate(this.mContext, R.layout.common_edit_menu_content_view, null);
    }

    /* access modifiers changed from: protected */
    public void modifyTopGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_menu_height));
    }
}
