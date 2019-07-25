package com.miui.gallery.editor.photo.screen.doodle;

import com.miui.gallery.editor.photo.app.doodle.DoodlePaintItem.PaintType;
import com.miui.gallery.editor.photo.core.common.model.DoodleData;
import com.miui.gallery.editor.photo.screen.base.IScreenOperationEditor;

public interface IScreenDoodleOperation extends IScreenOperationEditor {
    int getCurrentMenuItemIndex();

    PaintType getPaintType();

    void setColor(int i);

    void setDoodleData(DoodleData doodleData, int i);

    void setPaintType(PaintType paintType);
}
