package com.miui.gallery.editor.photo.core.imports.doodle;

import com.miui.gallery.editor.photo.core.common.model.DoodleData;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleItem;

public class DoodleConfig extends DoodleData {
    private DoodleItem mDoodleItem;

    public DoodleConfig(short s, String str, DoodleItem doodleItem) {
        super(s, str, doodleItem.normal, doodleItem.selected, doodleItem.talkback);
        this.mDoodleItem = doodleItem;
    }

    public DoodleItem getDoodleItem() {
        return this.mDoodleItem;
    }
}
