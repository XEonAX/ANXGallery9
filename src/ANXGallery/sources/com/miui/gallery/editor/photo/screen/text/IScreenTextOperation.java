package com.miui.gallery.editor.photo.screen.text;

import com.miui.gallery.editor.photo.core.imports.text.TextConfig;
import com.miui.gallery.editor.photo.screen.base.IScreenOperationEditor;

public interface IScreenTextOperation extends IScreenOperationEditor {
    void add(TextConfig textConfig, int i);

    int getCurrentMenuItemIndex();
}
