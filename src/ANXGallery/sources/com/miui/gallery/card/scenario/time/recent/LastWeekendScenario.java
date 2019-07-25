package com.miui.gallery.card.scenario.time.recent;

import com.miui.gallery.R;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.time.TimeScenario;
import java.util.Calendar;
import java.util.List;

public class LastWeekendScenario extends TimeScenario {
    public LastWeekendScenario() {
        super(BaiduSceneResult.CASTLE, 2, 6);
    }

    public String generateDescription(Record record, List<MediaFeatureItem> list) {
        return getRecordStartTime(record) > 0 ? getDatePeriodFromRecord(record) : "";
    }

    public String generateTitle(Record record, List<MediaFeatureItem> list) {
        return getRandomArrayString(R.array.last_weekend_title);
    }

    public boolean onPrepare(List<Record> list, List<Card> list2) {
        List recordStartTimesFromRecordAndCards = getRecordStartTimesFromRecordAndCards(list, list2, false);
        long currentTimeMillis = DateUtils.getCurrentTimeMillis();
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(currentTimeMillis);
        if (instance.get(7) != 2) {
            return false;
        }
        long lastWeekDayTime = DateUtils.getLastWeekDayTime(7, currentTimeMillis);
        if (recordStartTimesFromRecordAndCards.contains(Long.valueOf(lastWeekDayTime))) {
            return false;
        }
        setStartTime(lastWeekDayTime);
        setEndTime(lastWeekDayTime + 172800000);
        return true;
    }
}
