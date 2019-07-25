package com.miui.gallery.card.scenario.time;

import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.assistant.model.ImageFeature;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.Scenario;
import com.miui.gallery.card.scenario.ScenarioConstants;
import com.miui.gallery.cloudcontrol.strategies.AssistantScenarioStrategy.ScenarioRule;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Random;

public abstract class TimeScenario extends Scenario {
    protected static final String NON_CAMERA_SELECTION;
    protected static final String TIME_SELECTION;
    private long mEndTime;
    private long mStartTime;
    private long mTargetTime;

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(ScenarioConstants.CAMERA_BASE_SELECTION);
        sb.append(" AND ");
        sb.append("mixedDateTime");
        sb.append(" > %s AND ");
        sb.append("mixedDateTime");
        sb.append(" < %s");
        TIME_SELECTION = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(ScenarioConstants.NON_CAMERA_BASE_SELECTION);
        sb2.append(" AND ");
        sb2.append("_id");
        sb2.append(" IN (%s)");
        NON_CAMERA_SELECTION = sb2.toString();
    }

    public TimeScenario(int i, int i2, int i3) {
        super(i, i2, i3);
    }

    /* access modifiers changed from: protected */
    public List<ImageFeature> getCameraMediaIdsByStartEndTimeTags(Integer[] numArr, long j, long j2) {
        GalleryEntityManager instance = GalleryEntityManager.getInstance();
        String join = TextUtils.join(",", numArr);
        List<ImageFeature> query = instance.query(ImageFeature.class, String.format(ImageFeature.SCENE_TAG_SELECTION, new Object[]{join, join, join}), new String[]{Long.toString(j), Long.toString(j2)}, "imageDatetime asc", null);
        if (MiscUtil.isValid(query)) {
            List imageIdsFromImageFeatures = getImageIdsFromImageFeatures(query);
            List list = (List) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Cloud.CLOUD_URI, PROJECTION, String.format(NON_CAMERA_SELECTION, new Object[]{TextUtils.join(",", imageIdsFromImageFeatures)}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<List<Long>>() {
                public List<Long> handle(Cursor cursor) {
                    return TimeScenario.this.getMediaIdsFromCursor(cursor);
                }
            });
            if (MiscUtil.isValid(list)) {
                Iterator it = query.iterator();
                while (it.hasNext()) {
                    if (list.contains(Long.valueOf(((ImageFeature) it.next()).getImageId()))) {
                        it.remove();
                    }
                }
            }
        }
        return query;
    }

    /* access modifiers changed from: protected */
    public String getDatePeriodFromRecord(Record record) {
        return DateUtils.getDatePeriodGraceful(getRecordStartTime(record), getRecordEndTime(record) - 3600000);
    }

    /* access modifiers changed from: protected */
    public long getEndTime() {
        return this.mEndTime;
    }

    /* access modifiers changed from: protected */
    public long[] getEventStartEndTime(List<ImageFeature> list) {
        if (list == null || list.size() < 3) {
            return null;
        }
        long imageDateTime = ((ImageFeature) list.get(0)).getImageDateTime();
        long imageDateTime2 = ((ImageFeature) list.get(list.size() - 1)).getImageDateTime();
        long dateTime = DateUtils.getDateTime(imageDateTime);
        return new long[]{Math.max(imageDateTime - 10800000, dateTime), Math.min(imageDateTime2 + 10800000, 86400000 + dateTime)};
    }

    /* access modifiers changed from: protected */
    public List<Long> getImageIdsFromImageFeatures(List<ImageFeature> list) {
        ArrayList arrayList = new ArrayList();
        if (MiscUtil.isValid(list)) {
            for (ImageFeature imageId : list) {
                arrayList.add(Long.valueOf(imageId.getImageId()));
            }
        }
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public String getLocation() {
        return null;
    }

    public List<Long> getMediaIdsByStartEndTime(long j, long j2) {
        return (List) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Cloud.CLOUD_URI, PROJECTION, String.format(Locale.US, TIME_SELECTION, new Object[]{Long.valueOf(j), Long.valueOf(j2)}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<List<Long>>() {
            public List<Long> handle(Cursor cursor) {
                return TimeScenario.this.getMediaIdsFromCursor(cursor);
            }
        });
    }

    /* access modifiers changed from: protected */
    public String getMonthPeriodFromRecord(Record record) {
        return DateUtils.getMonthPeriodGraceful(getRecordStartTime(record), getRecordEndTime(record) - 3600000);
    }

    /* access modifiers changed from: protected */
    public String getPeopleId() {
        return null;
    }

    /* access modifiers changed from: protected */
    public String getPrimaryKey() {
        return null;
    }

    /* access modifiers changed from: protected */
    public String getRandomArrayString(int i) {
        String[] stringArray = GalleryApp.sGetAndroidContext().getResources().getStringArray(i);
        return stringArray.length > 0 ? stringArray[new Random().nextInt(stringArray.length)] : "";
    }

    /* access modifiers changed from: protected */
    public long getRecordEndTime(Record record) {
        if (record != null) {
            return record.getEndTime();
        }
        return -1;
    }

    /* access modifiers changed from: protected */
    public long getRecordStartTime(Record record) {
        if (record != null) {
            return record.getStartTime();
        }
        return -1;
    }

    /* access modifiers changed from: protected */
    public List<Long> getRecordStartTimesFromRecordAndCards(List<Record> list, List<Card> list2, boolean z) {
        ArrayList arrayList = new ArrayList();
        if (MiscUtil.isValid(list)) {
            for (Record recordStartTime : list) {
                arrayList.add(Long.valueOf(getRecordStartTime(recordStartTime)));
            }
        }
        if (MiscUtil.isValid(list2)) {
            for (Card recordStartTime2 : list2) {
                long recordStartTime3 = recordStartTime2.getRecordStartTime();
                if (z) {
                    recordStartTime3 = DateUtils.getDateTime(recordStartTime3);
                }
                if (!arrayList.contains(Long.valueOf(recordStartTime3))) {
                    arrayList.add(Long.valueOf(recordStartTime3));
                }
            }
        }
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public long getRecordTargetTime(Record record) {
        if (record != null) {
            return record.getTargetTime();
        }
        return -1;
    }

    /* access modifiers changed from: protected */
    public List<Long> getRecordTargetTimesFromRecordAndCards(List<Record> list, List<Card> list2) {
        ArrayList arrayList = new ArrayList();
        if (MiscUtil.isValid(list)) {
            for (Record recordTargetTime : list) {
                arrayList.add(Long.valueOf(getRecordTargetTime(recordTargetTime)));
            }
        }
        if (MiscUtil.isValid(list2)) {
            for (Card recordTargetTime2 : list2) {
                long recordTargetTime3 = recordTargetTime2.getRecordTargetTime();
                if (!arrayList.contains(Long.valueOf(recordTargetTime3))) {
                    arrayList.add(Long.valueOf(recordTargetTime3));
                }
            }
        }
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public String getSecondary() {
        return null;
    }

    /* access modifiers changed from: protected */
    public long getStartTime() {
        return this.mStartTime;
    }

    /* access modifiers changed from: protected */
    public long getTargetTime() {
        return this.mTargetTime;
    }

    /* access modifiers changed from: protected */
    public String getTertiaryKey() {
        return null;
    }

    public List<Long> loadMediaItem() {
        return getMediaIdsByStartEndTime(this.mStartTime, this.mEndTime);
    }

    public void onFillScenarioRule(ScenarioRule scenarioRule) {
        if (scenarioRule != null) {
            this.mPriority = scenarioRule.getPriority();
            this.mMinImageCount = scenarioRule.getMinImageCount();
            this.mMaxImageCount = scenarioRule.getMaxImageCount();
            this.mMinSelectedImageCount = scenarioRule.getMinSelectedImageCount();
            this.mMaxSelectedImageCount = scenarioRule.getMaxSelectedImageCount();
            this.mTriggerInterval = scenarioRule.getTriggerInterval();
        }
    }

    /* access modifiers changed from: protected */
    public void setEndTime(long j) {
        this.mEndTime = j;
    }

    /* access modifiers changed from: protected */
    public void setStartTime(long j) {
        this.mStartTime = j;
    }

    public void setTargetTime(long j) {
        this.mTargetTime = j;
    }
}
