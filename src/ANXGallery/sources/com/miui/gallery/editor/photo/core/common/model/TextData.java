package com.miui.gallery.editor.photo.core.common.model;

import com.miui.gallery.editor.photo.core.Metadata;

public abstract class TextData extends Metadata {
    public int backgroundColor;
    public final String iconPath;
    public boolean showBackgroundColor;

    public TextData(short s, String str, String str2) {
        super(s, str);
        this.iconPath = str2;
    }

    public TextData(short s, String str, String str2, int i) {
        super(s, str);
        this.iconPath = str2;
        this.backgroundColor = i;
        this.showBackgroundColor = true;
    }
}
