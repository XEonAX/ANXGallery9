package com.miui.gallery.editor.photo.core.imports.doodle;

import com.miui.gallery.editor.photo.core.common.model.DoodleData;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleItem;
import java.util.ArrayList;
import java.util.List;

public class DoodleManager {
    public static DoodleData getDefaultScreenDoodleData() {
        DoodleItem doodleItem = DoodleItem.SCREEN_PATH;
        return new DoodleConfig(0, doodleItem.name(), doodleItem);
    }

    public static List<DoodleData> getDoodleData() {
        DoodleItem[] values;
        ArrayList arrayList = new ArrayList();
        for (DoodleItem doodleItem : DoodleItem.values()) {
            if (!doodleItem.isScreenData()) {
                arrayList.add(new DoodleConfig(0, doodleItem.name(), doodleItem));
            }
        }
        return arrayList;
    }

    public static List<DoodleData> getScreenDoodleData() {
        DoodleItem[] values;
        ArrayList arrayList = new ArrayList();
        for (DoodleItem doodleItem : DoodleItem.values()) {
            if (doodleItem.isScreenData()) {
                arrayList.add(new DoodleConfig(0, doodleItem.name(), doodleItem));
            }
        }
        return arrayList;
    }
}
