package com.miui.gallery.video.editor.ui.menu;

import android.content.Context;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.editor.ui.menu.type.BaseMenuTopView;

public class FilterAdjustView extends BaseMenuTopView {
    public FilterAdjustView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public View initContentView() {
        return inflate(this.mContext, R.layout.video_editor_filter_content_layout, null);
    }

    /* access modifiers changed from: protected */
    public View initTopView() {
        return inflate(this.mContext, R.layout.video_editor_filter_top_layout, null);
    }
}
