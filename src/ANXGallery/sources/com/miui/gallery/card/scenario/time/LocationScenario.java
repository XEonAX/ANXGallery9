package com.miui.gallery.card.scenario.time;

import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.ScenarioConstants;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.data.LocationManager;
import java.util.ArrayList;
import java.util.List;

public abstract class LocationScenario extends TimeScenario {
    protected static final String ALL_IMAGE_SELECTION;
    public static final String[] PROJECTION = {"DISTINCT sha1", "location", "mixedDateTime"};
    protected String mTargetCity;

    public static class MediaItem {
        public String mCity;
        public long mDateTime;
        public String mLocation;
        public String mSha1;
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(ScenarioConstants.CAMERA_BASE_SELECTION);
        sb.append(" AND ");
        sb.append("location");
        sb.append(" is not null");
        ALL_IMAGE_SELECTION = sb.toString();
    }

    protected LocationScenario(int i, int i2, int i3) {
        super(i, i2, i3);
    }

    public static String getCityNameFromLoaction(String str) {
        if (TextUtils.isEmpty(str) || str.indexOf("/") == -1) {
            return "";
        }
        String[] segmentLocation = LocationManager.segmentLocation(str);
        if (segmentLocation != null) {
            if (!TextUtils.isEmpty(segmentLocation[2])) {
                return segmentLocation[2];
            }
            if (!TextUtils.isEmpty(segmentLocation[3])) {
                return segmentLocation[3];
            }
            if (!TextUtils.isEmpty(segmentLocation[1])) {
                return segmentLocation[1];
            }
            if (!TextUtils.isEmpty(segmentLocation[0])) {
                return segmentLocation[0];
            }
        }
        return "";
    }

    public static List<MediaItem> getMediaItemsFromCursor(Cursor cursor, boolean z) {
        ArrayList arrayList = new ArrayList();
        if (cursor != null) {
            while (cursor.moveToNext()) {
                try {
                    MediaItem mediaItem = new MediaItem();
                    mediaItem.mSha1 = cursor.getString(0);
                    mediaItem.mLocation = cursor.getString(1);
                    mediaItem.mDateTime = cursor.getLong(2);
                    mediaItem.mCity = getCityNameFromLoaction(mediaItem.mLocation);
                    if (!z || !TextUtils.isEmpty(mediaItem.mCity)) {
                        arrayList.add(mediaItem);
                    }
                } finally {
                    cursor.close();
                }
            }
        }
        return arrayList;
    }

    public List<Record> findRecords() {
        this.mTargetCity = null;
        Integer[] numArr = {Integer.valueOf(BaiduSceneResult.BRIDGE), Integer.valueOf(201)};
        return GalleryEntityManager.getInstance().query(Record.class, String.format("%s IN (%s) AND %s > %s", new Object[]{"scenarioId", TextUtils.join(",", numArr), "time", String.valueOf(DateUtils.getCurrentTimeMillis() - 15552000000L)}), null, "time ASC", null);
    }

    public String getDatePeriodFromRecord(Record record) {
        return DateUtils.getDatePeriodGraceful(getRecordStartTime(record), getRecordEndTime(record));
    }

    /* access modifiers changed from: protected */
    public String getLocation() {
        return this.mTargetCity;
    }

    /* access modifiers changed from: protected */
    public String getPeopleId() {
        return null;
    }

    public List<Long> loadMediaItem() {
        return super.loadMediaItem();
    }
}
