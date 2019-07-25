package com.miui.gallery.editor.photo.core.imports.doodle;

import android.graphics.Bitmap;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.RenderEngine;

class DoodleEngine extends RenderEngine {
    DoodleEngine() {
    }

    public Bitmap render(Bitmap bitmap, RenderData renderData) {
        if (renderData instanceof DoodleRenderData) {
            return ((DoodleRenderData) renderData).mDoodleEntry.apply(bitmap);
        }
        return null;
    }
}
