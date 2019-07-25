package com.miui.gallery.editor.photo.app.menu;

import android.content.Context;
import android.support.constraint.Guideline;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.editor.ui.menu.content.SimpleRecyclerViewContentView;
import com.miui.gallery.editor.ui.menu.type.BaseMenuBottomView;

public class FrameView extends BaseMenuBottomView {
    public FrameView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public View initContentView() {
        return new SimpleRecyclerViewContentView(this.mContext);
    }

    /* access modifiers changed from: protected */
    public View initTopView() {
        return inflate(this.mContext, R.layout.photo_editor_frame_top_layout, null);
    }

    /* access modifiers changed from: protected */
    public void modifyContentGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_menu_frame_content_guide_line_end));
    }

    /* access modifiers changed from: protected */
    public void modifyTopGuideline(Guideline guideline) {
        guideline.setGuidelineEnd(getResources().getDimensionPixelSize(R.dimen.editor_menu_frame_top_guide_line_end));
    }
}
