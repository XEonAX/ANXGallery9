package com.miui.gallery.editor.photo.core.imports.text;

import android.graphics.Bitmap;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.RenderEngine;

class TextEngine extends RenderEngine {
    TextEngine() {
    }

    public Bitmap render(Bitmap bitmap, RenderData renderData) {
        if (renderData instanceof TextRenderData) {
            return ((TextRenderData) renderData).mTextEntry.apply(bitmap);
        }
        return null;
    }
}
