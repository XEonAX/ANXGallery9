package com.miui.gallery.editor.photo.screen.longcrop;

import com.miui.gallery.editor.photo.core.imports.longcrop.LongScreenshotCropEditorView.Entry;
import com.miui.gallery.editor.photo.screen.core.ScreenDrawEntry;
import com.miui.gallery.editor.photo.screen.longcrop.ScreenLongCropFragment.ScreenLongCropCallback;

public interface ILongCropEditorController {
    boolean isModifiedBaseLast();

    Entry onExport();

    void setScreenDrawEntry(ScreenDrawEntry screenDrawEntry);

    void setScreenLongCropCallback(ScreenLongCropCallback screenLongCropCallback);
}
