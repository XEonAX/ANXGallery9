package com.miui.gallery.card.scenario.time.pastyear;

import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.time.TimeScenario;
import java.util.List;

public abstract class DayOfLastYearScenario extends TimeScenario {
    private final int mMaxYear;
    private final Integer[] mTags;
    private int mYear = 1;

    public DayOfLastYearScenario(int i, int i2, Integer[] numArr) {
        super(i, 1, 7);
        if (i2 <= 0) {
            i2 = 1;
        }
        this.mMaxYear = i2;
        this.mTags = numArr;
    }

    public String generateDescription(Record record, List<MediaFeatureItem> list) {
        long recordStartTime = getRecordStartTime(record);
        return recordStartTime > 0 ? DateUtils.getYearMonthDayLocale(recordStartTime) : "";
    }

    /* access modifiers changed from: protected */
    public String getPrimaryKey() {
        return String.valueOf(this.mYear);
    }

    public List<Long> loadMediaItem() {
        long[] eventStartEndTime = getEventStartEndTime(getCameraMediaIdsByStartEndTimeTags(this.mTags, getStartTime(), getEndTime()));
        if (eventStartEndTime == null || eventStartEndTime.length != 2) {
            return null;
        }
        setStartTime(eventStartEndTime[0]);
        setEndTime(eventStartEndTime[1]);
        return super.loadMediaItem();
    }

    public boolean onPrepare(List<Record> list, List<Card> list2) {
        List recordTargetTimesFromRecordAndCards = getRecordTargetTimesFromRecordAndCards(list, list2);
        long currentTimeMillis = DateUtils.getCurrentTimeMillis();
        for (int i = 1; i <= this.mMaxYear; i++) {
            this.mYear = i;
            long lastNYearDateTime = DateUtils.getLastNYearDateTime(this.mYear, currentTimeMillis);
            if (lastNYearDateTime >= 0 && !recordTargetTimesFromRecordAndCards.contains(Long.valueOf(lastNYearDateTime))) {
                setTargetTime(lastNYearDateTime);
                setStartTime(lastNYearDateTime);
                setEndTime(lastNYearDateTime + 86400000);
                List loadMediaItem = loadMediaItem();
                if (loadMediaItem != null && loadMediaItem.size() >= getMinImageCount()) {
                    return true;
                }
            }
        }
        return false;
    }
}
