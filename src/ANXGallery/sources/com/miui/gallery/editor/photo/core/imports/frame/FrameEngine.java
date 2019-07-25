package com.miui.gallery.editor.photo.core.imports.frame;

import android.graphics.Bitmap;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.RenderEngine;

class FrameEngine extends RenderEngine {
    FrameEngine() {
    }

    public Bitmap render(Bitmap bitmap, RenderData renderData) {
        if (renderData instanceof FrameRenderData) {
            return ((FrameRenderData) renderData).mFrameEntry.apply(bitmap);
        }
        return null;
    }
}
