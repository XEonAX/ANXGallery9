package com.miui.gallery.editor.photo.core.common.model;

import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.Metadata;

public abstract class CropData extends Metadata {
    public static CropData MIRROR = new CropData(-2, "mirror", R.drawable.crop_menu_item_horizontal_mirror, R.string.photo_editor_talkback_crop_mirror) {
    };
    public static CropData ROTATE = new CropData(-1, "rotate", R.drawable.crop_menu_item_rotate, R.string.photo_editor_talkback_crop_rotate) {
    };
    public final int icon;
    public final int talkbackName;

    public static class AspectRatio extends CropData {
        public final int height;
        public final int width;

        public AspectRatio(short s, String str, int i, int i2, int i3, int i4) {
            super(s, str, i, i2);
            this.width = i3;
            this.height = i4;
        }
    }

    CropData(short s, String str, int i, int i2) {
        super(s, str);
        this.icon = i;
        this.talkbackName = i2;
    }
}
