package com.miui.gallery.video.editor.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import com.nexstreaming.nexeditorsdk.nexEngineView;

public class NexDisplayWrapper extends DisplayWrapper {
    public NexDisplayWrapper(Context context) {
        super(context);
    }

    public NexDisplayWrapper(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public NexDisplayWrapper(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    /* access modifiers changed from: protected */
    public View createDisplayView() {
        return new nexEngineView(getContext());
    }
}
