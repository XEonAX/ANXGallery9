package com.miui.gallery.editor.photo.core.imports.longcrop;

import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.imports.longcrop.LongScreenshotCropEditorView.Entry;

public class CropRenderData extends RenderData {
    public final Entry mEntry;

    public CropRenderData(Entry entry) {
        this.mEntry = entry;
    }
}
