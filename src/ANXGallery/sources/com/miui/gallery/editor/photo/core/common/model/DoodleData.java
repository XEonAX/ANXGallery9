package com.miui.gallery.editor.photo.core.common.model;

import com.miui.gallery.editor.photo.core.Metadata;

public abstract class DoodleData extends Metadata {
    public final int normal;
    public final int selected;
    public final int talkback;

    public DoodleData(short s, String str, int i, int i2, int i3) {
        super(s, str);
        this.normal = i;
        this.selected = i2;
        this.talkback = i3;
    }
}
