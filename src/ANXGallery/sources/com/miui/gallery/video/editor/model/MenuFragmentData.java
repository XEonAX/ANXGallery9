package com.miui.gallery.video.editor.model;

import com.miui.gallery.video.editor.ui.MenuFragment;

public class MenuFragmentData {
    public final int iconId;
    public final Class<? extends MenuFragment> menu;
    public final int module;
    public final int nameId;
    public final String tag;

    public MenuFragmentData(Class<? extends MenuFragment> cls, int i, int i2, int i3) {
        this.menu = cls;
        this.iconId = i;
        this.nameId = i2;
        this.module = i3;
        this.tag = cls == null ? "" : cls.getName();
    }

    public Class<? extends MenuFragment> getMenu() {
        return this.menu;
    }

    public String getTag() {
        return this.tag;
    }

    public boolean isModuleMore() {
        return 22 == this.module;
    }

    public boolean isNavModule() {
        return 16 == this.module;
    }
}
