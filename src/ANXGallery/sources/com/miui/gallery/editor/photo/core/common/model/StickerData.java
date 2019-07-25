package com.miui.gallery.editor.photo.core.common.model;

import com.miui.gallery.editor.photo.core.Metadata;

public abstract class StickerData extends Metadata {
    public final String icon;

    public StickerData(short s, String str, String str2) {
        super(s, str);
        this.icon = str2;
    }
}
