package com.miui.gallery.collage.core.poster;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import com.miui.gallery.collage.drawable.ColorDrawable;
import com.miui.gallery.collage.drawable.RectTimeDrawable;
import com.miui.gallery.collage.drawable.TimeFormatDrawable;

public class SpecifyDrawableModel extends ElementPositionModel {
    public Extras extras;
    public SpecifyDrawableType specifyDrawableType;

    public static class Extras {
        public String color;
        public float letterSpace;
        public String textColor;
        public float textSize;
    }

    public enum SpecifyDrawableType {
        COLOR,
        TIME_FORMAT,
        TIME_RECT;

        public Drawable getDrawable(Resources resources, SpecifyDrawableModel specifyDrawableModel) {
            Drawable drawable;
            switch (this) {
                case TIME_FORMAT:
                    drawable = new TimeFormatDrawable(resources, specifyDrawableModel);
                    break;
                case TIME_RECT:
                    drawable = new RectTimeDrawable(resources, specifyDrawableModel);
                    break;
                case COLOR:
                    return new ColorDrawable(specifyDrawableModel);
                default:
                    return null;
            }
            return drawable;
        }
    }
}
