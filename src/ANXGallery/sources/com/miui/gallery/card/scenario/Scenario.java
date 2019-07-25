package com.miui.gallery.card.scenario;

import android.database.Cursor;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.Card;
import com.miui.gallery.cloudcontrol.strategies.AssistantScenarioStrategy.ScenarioRule;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public abstract class Scenario implements Comparable<Scenario> {
    protected static final String[] PROJECTION = {"cloud._id"};
    protected static int sDefaultMaxImageCount = 500;
    protected static int sDefaultMinImageCount = 20;
    protected static int sDefaultSelectedMaxImageCount = 80;
    protected static int sDefaultSelectedMinImageCount = 6;
    protected static int sDuplicateRemovalInterval = 180;
    protected final String TAG = getClass().getSimpleName();
    private final int mFlag;
    private final int mFlagDisableMask;
    protected int mMaxImageCount;
    protected int mMaxSelectedImageCount;
    protected int mMinImageCount;
    protected int mMinSelectedImageCount;
    protected int mPriority;
    private final int mScenarioId;
    protected int mTriggerInterval;

    public Scenario(int i, int i2, int i3) {
        this.mScenarioId = i;
        this.mFlag = i2;
        this.mFlagDisableMask = i3;
    }

    public static void setDefaultMaxImageCount(int i) {
        sDefaultMaxImageCount = i;
    }

    public static void setDefaultMinImageCount(int i) {
        sDefaultMinImageCount = i;
    }

    public static void setDefaultSelectedMaxImageCount(int i) {
        sDefaultSelectedMaxImageCount = i;
    }

    public static void setDefaultSelectedMinImageCount(int i) {
        sDefaultSelectedMinImageCount = i;
    }

    public static void setDuplicateRemovalInterval(int i) {
        sDuplicateRemovalInterval = i;
    }

    public int compareTo(Scenario scenario) {
        int compare = Integer.compare(scenario.mPriority, this.mPriority);
        return compare == 0 ? Integer.compare(scenario.mScenarioId, this.mScenarioId) : compare;
    }

    /* access modifiers changed from: protected */
    public List<Long> cursorToImageIdList(Cursor cursor) {
        ArrayList arrayList = new ArrayList();
        if (cursor == null || !cursor.moveToFirst()) {
            return arrayList;
        }
        do {
            arrayList.add(Long.valueOf(cursor.getLong(0)));
        } while (cursor.moveToNext());
        return arrayList;
    }

    public List<Card> findCards() {
        GalleryEntityManager instance = GalleryEntityManager.getInstance();
        StringBuilder sb = new StringBuilder();
        sb.append("ignored = 0 AND ");
        sb.append(String.format("%s = %s AND %s > %s", new Object[]{"scenarioId", String.valueOf(getScenarioId()), "createTime", String.valueOf(DateUtils.getCurrentTimeMillis() - 15552000000L)}));
        return instance.query(Card.class, sb.toString(), null, "createTime ASC", null);
    }

    public List<Record> findRecords() {
        return GalleryEntityManager.getInstance().query(Record.class, String.format("%s = %s AND %s > %s", new Object[]{"scenarioId", String.valueOf(getScenarioId()), "time", String.valueOf(DateUtils.getCurrentTimeMillis() - 15552000000L)}), null, "time ASC", null);
    }

    public abstract String generateDescription(Record record, List<MediaFeatureItem> list);

    public abstract String generateTitle(Record record, List<MediaFeatureItem> list);

    /* access modifiers changed from: protected */
    public abstract long getEndTime();

    public int getFlag() {
        return this.mFlag;
    }

    public int getFlagDisableMask() {
        return this.mFlagDisableMask;
    }

    /* access modifiers changed from: protected */
    public abstract String getLocation();

    public int getMaxImageCount() {
        return this.mMaxImageCount > 0 ? this.mMaxImageCount : sDefaultMaxImageCount;
    }

    public int getMaxSelectedImageCount() {
        return this.mMaxSelectedImageCount > 0 ? this.mMaxSelectedImageCount : sDefaultSelectedMaxImageCount;
    }

    public List<Long> getMediaIdsFromCursor(Cursor cursor) {
        int maxImageCount = getMaxImageCount();
        ArrayList arrayList = new ArrayList();
        if (cursor != null) {
            int count = cursor.getCount();
            if (count <= maxImageCount) {
                return cursorToImageIdList(cursor);
            }
            float f = ((float) count) / ((float) maxImageCount);
            while (cursor.moveToNext()) {
                double random = Math.random();
                double d = (double) f;
                Double.isNaN(d);
                if (random * d < 1.0d) {
                    arrayList.add(Long.valueOf(cursor.getLong(0)));
                }
            }
        }
        if (arrayList.size() > maxImageCount) {
            int size = arrayList.size() - maxImageCount;
            while (true) {
                int i = size - 1;
                if (size <= 0) {
                    break;
                }
                double size2 = (double) (arrayList.size() - 1);
                double random2 = Math.random();
                Double.isNaN(size2);
                arrayList.remove((int) (size2 * random2));
                size = i;
            }
        }
        return arrayList;
    }

    public int getMinImageCount() {
        return this.mMinImageCount > 0 ? this.mMinImageCount : sDefaultMinImageCount;
    }

    public int getMinSelectedImageCount() {
        return this.mMinSelectedImageCount > 0 ? this.mMinSelectedImageCount : sDefaultSelectedMinImageCount;
    }

    public String getName() {
        return getClass().getSimpleName();
    }

    /* access modifiers changed from: protected */
    public abstract String getPeopleId();

    /* access modifiers changed from: protected */
    public abstract String getPrimaryKey();

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

    public int getScenarioId() {
        return this.mScenarioId;
    }

    /* access modifiers changed from: protected */
    public abstract String getSecondary();

    /* access modifiers changed from: protected */
    public abstract long getStartTime();

    /* access modifiers changed from: protected */
    public abstract long getTargetTime();

    /* access modifiers changed from: protected */
    public abstract String getTertiaryKey();

    public int getTriggerInterval() {
        return this.mTriggerInterval;
    }

    /* access modifiers changed from: protected */
    public boolean isCardRecentlyCreated(List<Card> list, long j) {
        boolean z = false;
        if (!MiscUtil.isValid(list)) {
            return false;
        }
        Collections.sort(list);
        if (DateUtils.getCurrentTimeMillis() - j < ((Card) list.get(0)).getCreateTime()) {
            z = true;
        }
        return z;
    }

    public boolean isDeletable() {
        return true;
    }

    /* access modifiers changed from: protected */
    public boolean isRecentlyTriggerd(List<Record> list, long j) {
        Record record = null;
        if (MiscUtil.isValid(list)) {
            for (Record record2 : list) {
                if (record == null || record2.getTime() > record.getTime()) {
                    record = record2;
                }
            }
        }
        return record != null && DateUtils.getCurrentTimeMillis() - j < record.getTime();
    }

    public abstract List<Long> loadMediaItem();

    public abstract void onFillScenarioRule(ScenarioRule scenarioRule);

    public abstract boolean onPrepare(List<Record> list, List<Card> list2);

    public boolean prepare(List<Record> list, List<Card> list2) {
        if (getTriggerInterval() <= 0 || (!isRecentlyTriggerd(list, ((long) getTriggerInterval()) * 86400000) && !isCardRecentlyCreated(list2, ((long) getTriggerInterval()) * 86400000))) {
            return onPrepare(list, list2);
        }
        return false;
    }
}
