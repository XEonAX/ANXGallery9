package com.miui.gallery.video.editor.ui.menu.content;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.editor.ui.menu.content.BaseEditContentView;

public class BaseContentView extends BaseEditContentView {
    public BaseContentView(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void inflateContentView(Context context) {
        inflate(context, R.layout.video_editor_smart_video_content_layout, this);
    }
}
