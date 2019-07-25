package com.miui.gallery.card.scenario.time.free;

import android.database.Cursor;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.ScenarioConstants;
import com.miui.gallery.card.scenario.time.TimeScenario;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

public class PastWeekendScenario extends TimeScenario {
    protected static final String SELECTION;
    protected final String[] PROJECTION = {"DISTINCT sha1", "mixedDateTime"};

    private static class MediaItem {
        public long mDateTime;
        public String mSha1;

        private MediaItem() {
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(ScenarioConstants.CAMERA_BASE_SELECTION);
        sb.append(" AND ");
        sb.append("mixedDateTime");
        sb.append(" > %s");
        sb.append(" AND ");
        sb.append("mixedDateTime");
        sb.append(" < %s");
        SELECTION = sb.toString();
    }

    public PastWeekendScenario() {
        super(404, 4, 4);
    }

    /* access modifiers changed from: private */
    public List<MediaItem> getMediaItemsFromCursor(Cursor cursor) {
        ArrayList arrayList = new ArrayList();
        if (cursor != null) {
            while (cursor.moveToNext()) {
                try {
                    MediaItem mediaItem = new MediaItem();
                    mediaItem.mSha1 = cursor.getString(0);
                    mediaItem.mDateTime = cursor.getLong(1);
                    arrayList.add(mediaItem);
                } finally {
                    cursor.close();
                }
            }
        }
        return arrayList;
    }

    private long getWeekendStart(MediaItem mediaItem) {
        if (mediaItem != null && mediaItem.mDateTime > 0) {
            Calendar instance = Calendar.getInstance();
            instance.setTimeInMillis(mediaItem.mDateTime);
            int i = instance.get(7);
            if (i == 7 || i == 1) {
                instance.set(7, 7);
                instance.set(11, 0);
                instance.set(12, 0);
                instance.set(13, 0);
                instance.set(14, 0);
                return instance.getTimeInMillis();
            }
        }
        return -1;
    }

    public String generateDescription(Record record, List<MediaFeatureItem> list) {
        return getRecordStartTime(record) > 0 ? getDatePeriodFromRecord(record) : "";
    }

    public String generateTitle(Record record, List<MediaFeatureItem> list) {
        return getRandomArrayString(R.array.weekend_title);
    }

    public boolean onPrepare(List<Record> list, List<Card> list2) {
        long currentTimeMillis = DateUtils.getCurrentTimeMillis();
        List<Long> recordStartTimesFromRecordAndCards = getRecordStartTimesFromRecordAndCards(list, list2, false);
        long j = 0;
        for (Long l : recordStartTimesFromRecordAndCards) {
            if (l.longValue() > j) {
                j = l.longValue();
            }
        }
        List<MediaItem> list3 = (List) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Cloud.CLOUD_URI, this.PROJECTION, String.format(Locale.US, SELECTION, new Object[]{Long.valueOf(j), Long.valueOf(currentTimeMillis - 15552000000L)}), (String[]) null, "mixedDateTime ASC", (QueryHandler<T>) new QueryHandler<List<MediaItem>>() {
            public List<MediaItem> handle(Cursor cursor) {
                return PastWeekendScenario.this.getMediaItemsFromCursor(cursor);
            }
        });
        if (MiscUtil.isValid(list3)) {
            long j2 = 0;
            for (MediaItem mediaItem : list3) {
                if (mediaItem.mDateTime >= j2) {
                    long weekendStart = getWeekendStart(mediaItem);
                    if (weekendStart > 0) {
                        long j3 = 172800000 + weekendStart;
                        List mediaIdsByStartEndTime = getMediaIdsByStartEndTime(weekendStart, j3);
                        if (mediaIdsByStartEndTime == null || mediaIdsByStartEndTime.size() <= getMinImageCount() || recordStartTimesFromRecordAndCards.contains(Long.valueOf(weekendStart))) {
                            j2 = weekendStart + 604800000;
                        } else {
                            setStartTime(weekendStart);
                            setEndTime(j3);
                            return true;
                        }
                    } else {
                        continue;
                    }
                }
            }
        }
        return false;
    }
}
