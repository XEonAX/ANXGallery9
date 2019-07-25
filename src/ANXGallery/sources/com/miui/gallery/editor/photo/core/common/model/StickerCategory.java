package com.miui.gallery.editor.photo.core.common.model;

import com.miui.gallery.editor.photo.core.Metadata;

public abstract class StickerCategory extends Metadata {
    public final long id;

    public StickerCategory(long j, short s, String str) {
        super(s, str);
        this.id = j;
    }
}
