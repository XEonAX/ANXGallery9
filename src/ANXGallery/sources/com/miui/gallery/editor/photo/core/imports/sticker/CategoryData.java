package com.miui.gallery.editor.photo.core.imports.sticker;

import com.miui.gallery.editor.photo.core.common.model.StickerCategory;
import com.miui.gallery.editor.photo.core.common.model.StickerData;
import java.util.List;

class CategoryData extends StickerCategory {
    List<StickerData> stickerList;

    public CategoryData(int i, short s, String str, List<StickerData> list) {
        super((long) i, s, str);
        this.stickerList = list;
    }
}
