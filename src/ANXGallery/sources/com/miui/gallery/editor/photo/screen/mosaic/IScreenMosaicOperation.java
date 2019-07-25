package com.miui.gallery.editor.photo.screen.mosaic;

import com.miui.gallery.editor.photo.screen.base.IScreenOperationEditor;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicData;

public interface IScreenMosaicOperation extends IScreenOperationEditor {
    int getCurrentMenuItemIndex();

    void setMosaicData(MosaicData mosaicData, int i);

    void setMosaicPaintSize(int i);
}
