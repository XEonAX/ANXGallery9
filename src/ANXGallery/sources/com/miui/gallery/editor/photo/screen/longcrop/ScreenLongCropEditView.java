package com.miui.gallery.editor.photo.screen.longcrop;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.AttributeSet;
import com.miui.gallery.editor.photo.core.imports.longcrop.LongScreenshotCropEditorView;
import com.miui.gallery.editor.photo.screen.core.ScreenDrawEntry;

public class ScreenLongCropEditView extends LongScreenshotCropEditorView {
    private ScreenDrawEntry mScreenDrawEntry;

    public ScreenLongCropEditView(Context context) {
        super(context);
    }

    public ScreenLongCropEditView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    /* access modifiers changed from: protected */
    public void drawChild(Canvas canvas, Rect rect) {
        if (this.mScreenDrawEntry != null) {
            this.mScreenDrawEntry.draw(canvas, new RectF(rect));
        }
    }

    public void setScreenDrawEntry(ScreenDrawEntry screenDrawEntry) {
        this.mScreenDrawEntry = screenDrawEntry;
    }
}
