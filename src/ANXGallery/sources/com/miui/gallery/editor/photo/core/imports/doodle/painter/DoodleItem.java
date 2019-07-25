package com.miui.gallery.editor.photo.core.imports.doodle.painter;

import android.content.res.Resources;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.path.DoodlePathNode;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.shape.DoodleCircularNode;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.shape.DoodleRectangleNode;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.vector.DoodleArrowNode;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.vector.DoodleLineNode;

public enum DoodleItem {
    PATH(R.drawable.doodle_path_icon_n, R.drawable.doodle_path_icon_p, R.string.photo_editor_talkback_doodle_path, 1),
    LINE(R.drawable.doodle_line_icon_n, R.drawable.doodle_line_icon_p, R.string.photo_editor_talkback_doodle_line, 1),
    RECTANGLE(R.drawable.doodle_rectangle_icon_n, R.drawable.doodle_rectangle_icon_p, R.string.photo_editor_talkback_doodle_rectangle, 1),
    CIRCULAR(R.drawable.doodle_circular_icon_n, R.drawable.doodle_circular_icon_p, R.string.photo_editor_talkback_doodle_circular, 1),
    ARROW(R.drawable.doodle_arrow_icon_n, R.drawable.doodle_arrow_icon_p, R.string.photo_editor_talkback_doodle_arrow, 1),
    SCREEN_PATH(R.drawable.doodle_path_icon_n, R.drawable.doodle_path_icon_p, R.string.photo_editor_talkback_doodle_path, 0),
    SCREEN_LINE(R.drawable.doodle_line_icon_n, R.drawable.doodle_line_icon_p, R.string.photo_editor_talkback_doodle_line, 0),
    SCREEN_RECTANGLE(R.drawable.doodle_rectangle_icon_n, R.drawable.doodle_rectangle_icon_p, R.string.photo_editor_talkback_doodle_rectangle, 0),
    SCREEN_CIRCULAR(R.drawable.doodle_circular_icon_n, R.drawable.doodle_circular_icon_p, R.string.photo_editor_talkback_doodle_circular, 0),
    SCREEN_ARROW(R.drawable.doodle_arrow_icon_n, R.drawable.doodle_arrow_icon_p, R.string.photo_editor_talkback_doodle_arrow, 0);
    
    public final int normal;
    public final int selected;
    public final int talkback;
    public final int type;

    private DoodleItem(int i, int i2, int i3, int i4) {
        this.normal = i;
        this.selected = i2;
        this.talkback = i3;
        this.type = i4;
    }

    public DoodleNode getDoodleDrawable(Resources resources) {
        switch (this) {
            case PATH:
            case SCREEN_PATH:
                return new DoodlePathNode(resources);
            case LINE:
            case SCREEN_LINE:
                return new DoodleLineNode(resources);
            case RECTANGLE:
            case SCREEN_RECTANGLE:
                return new DoodleRectangleNode(resources);
            case CIRCULAR:
            case SCREEN_CIRCULAR:
                return new DoodleCircularNode(resources);
            case ARROW:
            case SCREEN_ARROW:
                return new DoodleArrowNode(resources);
            default:
                return null;
        }
    }

    public boolean isScreenData() {
        return this.type == 0;
    }
}
