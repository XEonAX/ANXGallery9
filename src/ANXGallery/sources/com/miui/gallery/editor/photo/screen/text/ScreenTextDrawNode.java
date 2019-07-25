package com.miui.gallery.editor.photo.screen.text;

import android.graphics.Canvas;
import com.miui.gallery.editor.photo.core.common.model.BaseDrawNode;
import com.miui.gallery.editor.photo.core.imports.text.base.ITextDialogConfig;

public class ScreenTextDrawNode extends BaseDrawNode {
    private boolean mIsSaved;
    private ITextDialogConfig textDialogConfig;

    public void draw(Canvas canvas) {
        if (this.textDialogConfig != null) {
            this.textDialogConfig.draw(canvas);
        }
    }

    public boolean isSaved() {
        return this.mIsSaved;
    }

    public void setSaved(boolean z) {
        this.mIsSaved = z;
    }

    public ScreenTextDrawNode setTextDialogConfig(ITextDialogConfig iTextDialogConfig) {
        this.textDialogConfig = iTextDialogConfig;
        return this;
    }
}
