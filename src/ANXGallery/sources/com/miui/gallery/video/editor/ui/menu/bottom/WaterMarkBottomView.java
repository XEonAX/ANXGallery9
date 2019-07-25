package com.miui.gallery.video.editor.ui.menu.bottom;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.editor.ui.menu.bottom.BaseEditBottomView;

public class WaterMarkBottomView extends BaseEditBottomView {
    public WaterMarkBottomView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void init(Context context) {
        inflate(context, R.layout.video_editor_water_mark_bottom_view, this);
    }
}
