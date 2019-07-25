package com.miui.gallery.card.scenario.time.recent;

import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.time.TimeScenario;
import java.util.List;

public abstract class YesterdayScenario extends TimeScenario {
    private final Integer[] mTags;

    public YesterdayScenario(int i, Integer[] numArr) {
        super(i, 2, 6);
        this.mTags = numArr;
    }

    public String generateDescription(Record record, List<MediaFeatureItem> list) {
        long recordStartTime = getRecordStartTime(record);
        return recordStartTime > 0 ? DateUtils.getYearMonthDayLocale(recordStartTime) : "";
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
        long currentTimeMillis = DateUtils.getCurrentTimeMillis();
        List recordTargetTimesFromRecordAndCards = getRecordTargetTimesFromRecordAndCards(list, list2);
        long dateTime = DateUtils.getDateTime(currentTimeMillis - 86400000);
        if (recordTargetTimesFromRecordAndCards.contains(Long.valueOf(dateTime))) {
            return false;
        }
        setTargetTime(dateTime);
        setStartTime(dateTime);
        setEndTime(dateTime + 86400000);
        return true;
    }
}
