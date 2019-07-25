package com.miui.gallery.provider;

import android.database.Cursor;
import android.os.Bundle;
import com.miui.gallery.data.LocationManager;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class TimelineHeadersGroup {
    public int count;
    public List<String> itemLocations = new LinkedList();
    public int start;
    public String validLocation;

    public static void bindGroup(List<TimelineHeadersGroup> list, Cursor cursor) {
        if (cursor != null && MiscUtil.isValid(list)) {
            ArrayList arrayList = new ArrayList(list.size());
            ArrayList arrayList2 = new ArrayList(list.size());
            ArrayList arrayList3 = new ArrayList(list.size());
            for (TimelineHeadersGroup timelineHeadersGroup : list) {
                arrayList2.add(Integer.valueOf(timelineHeadersGroup.start));
                arrayList.add(Integer.valueOf(timelineHeadersGroup.count));
                arrayList3.add(LocationManager.getInstance().generateTitleLine(timelineHeadersGroup.itemLocations));
            }
            Bundle extras = cursor.getExtras();
            if (extras == null || extras == Bundle.EMPTY) {
                extras = new Bundle();
                cursor.setExtras(extras);
            }
            extras.putIntegerArrayList("extra_timeline_item_count_in_group", arrayList);
            extras.putIntegerArrayList("extra_timeline_group_start_pos", arrayList2);
            extras.putStringArrayList("extra_timeline_group_start_locations", arrayList3);
        }
    }
}
