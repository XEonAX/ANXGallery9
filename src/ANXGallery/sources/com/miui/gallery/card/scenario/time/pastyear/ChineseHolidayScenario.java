package com.miui.gallery.card.scenario.time.pastyear;

import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.time.HolidayConfig;
import com.miui.gallery.card.scenario.time.HolidayScenario;
import com.miui.gallery.util.assistant.HolidaysUtil;
import java.util.LinkedList;
import java.util.List;
import miui.date.Calendar;

public class ChineseHolidayScenario extends HolidayScenario {
    private final List<HolidayConfig> mHolidayConfig = new LinkedList();

    public ChineseHolidayScenario() {
        super(BaiduSceneResult.SHOOTING, 1, 7);
        this.mHolidayConfig.add(new HolidayConfig(100, Integer.MAX_VALUE, 1));
        this.mHolidayConfig.add(new HolidayConfig(BaiduSceneResult.SHOOTING, Integer.MAX_VALUE, 1));
        this.mHolidayConfig.add(new HolidayConfig(BaiduSceneResult.TAEKWONDO, Integer.MAX_VALUE, 1));
        this.mHolidayConfig.add(new HolidayConfig(BaiduSceneResult.MOUNTAINEERING, Integer.MAX_VALUE, 3));
        this.mHolidayConfig.add(new HolidayConfig(BaiduSceneResult.SPORTS_OTHER, Integer.MAX_VALUE, 1));
        this.mHolidayConfig.add(new HolidayConfig(BaiduSceneResult.TEMPLE, Integer.MAX_VALUE, 3));
    }

    public String generateTitle(Record record, List<MediaFeatureItem> list) {
        int holidayFromRecord = getHolidayFromRecord(record, true);
        return holidayFromRecord != -1 ? HolidaysUtil.getChineseHolidayNameForStory(getYearFromRecord(record), holidayFromRecord) : "";
    }

    /* access modifiers changed from: protected */
    public String getPrimaryKey() {
        return Integer.toString(getHolidayFromTargetTime(getTargetTime(), true));
    }

    public boolean onPrepare(List<Record> list, List<Card> list2) {
        long currentTimeMillis = DateUtils.getCurrentTimeMillis();
        Calendar calendar = new Calendar();
        calendar.setTimeInMillis(currentTimeMillis);
        List recordTargetTimesFromRecordAndCards = getRecordTargetTimesFromRecordAndCards(list, list2);
        for (int i = 1; i <= 8; i++) {
            this.mYear = i;
            long chineseHolidayDatetimeOfPastYear = HolidaysUtil.getChineseHolidayDatetimeOfPastYear(calendar, this.mYear);
            if (chineseHolidayDatetimeOfPastYear <= 0) {
                Calendar calendar2 = (Calendar) calendar.clone();
                calendar2.setTimeInMillis(calendar.getTimeInMillis() + 86400000);
                chineseHolidayDatetimeOfPastYear = HolidaysUtil.getChineseHolidayDatetimeOfPastYear(calendar2, this.mYear);
            }
            if (chineseHolidayDatetimeOfPastYear > 0) {
                long[] startEndTime = getStartEndTime(chineseHolidayDatetimeOfPastYear, this.mHolidayConfig, true);
                if (recordTargetTimesFromRecordAndCards.contains(Long.valueOf(chineseHolidayDatetimeOfPastYear))) {
                    continue;
                } else {
                    setStartTime(startEndTime[0]);
                    setEndTime(startEndTime[1]);
                    setTargetTime(chineseHolidayDatetimeOfPastYear);
                    List loadMediaItem = loadMediaItem();
                    if (loadMediaItem != null && loadMediaItem.size() >= getMinImageCount()) {
                        return true;
                    }
                }
            }
        }
        return false;
    }
}
