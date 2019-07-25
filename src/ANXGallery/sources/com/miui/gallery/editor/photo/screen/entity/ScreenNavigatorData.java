package com.miui.gallery.editor.photo.screen.entity;

import com.miui.gallery.R;
import java.util.ArrayList;
import java.util.List;

public class ScreenNavigatorData {
    public final int icon;
    public final int id;
    public final int name;

    public ScreenNavigatorData(int i, int i2, int i3) {
        this.icon = i;
        this.name = i2;
        this.id = i3;
    }

    public static List<ScreenNavigatorData> getNavData(boolean z) {
        ArrayList arrayList = new ArrayList(5);
        arrayList.add(new ScreenNavigatorData(R.drawable.screen_nav_send, R.string.screen_editor_send, 1));
        if (z) {
            arrayList.add(new ScreenNavigatorData(R.drawable.screen_nav_crop, R.string.screen_editor_crop, 5));
        }
        arrayList.add(new ScreenNavigatorData(R.drawable.screen_nav_doodle, R.string.screen_editor_doodle, 2));
        arrayList.add(new ScreenNavigatorData(R.drawable.screen_nav_text, R.string.screen_editor_text, 3));
        arrayList.add(new ScreenNavigatorData(R.drawable.screen_nav_mosaic, R.string.screen_editor_mosaic, 4));
        return arrayList;
    }
}
