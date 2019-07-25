package com.miui.gallery.card.scenario.time.pastyear;

import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.CardUtil;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.ScenarioConstants;
import com.miui.gallery.card.scenario.time.TimeScenario;
import java.util.List;

public class PastYearMonthScenario extends TimeScenario {
    public PastYearMonthScenario() {
        super(BaiduSceneResult.MOUNTAINEERING, 1, 7);
    }

    public String generateDescription(Record record, List<MediaFeatureItem> list) {
        return DateUtils.getYearMonthLocale(getRecordStartTime(record));
    }

    public String generateTitle(Record record, List<MediaFeatureItem> list) {
        int month = DateUtils.getMonth(getRecordStartTime(record));
        String[] stringArray = GalleryApp.sGetAndroidContext().getResources().getStringArray(R.array.month_last_year);
        return (stringArray.length <= 0 || stringArray.length <= month) ? "" : stringArray[month];
    }

    public List<Long> loadMediaItem() {
        return getImageIdsFromImageFeatures(getCameraMediaIdsByStartEndTimeTags(CardUtil.concat(CardUtil.concat(ScenarioConstants.TAGS_PARTY, ScenarioConstants.TAGS_FOODS), CardUtil.concat(ScenarioConstants.TAGS_ACTIVITY, ScenarioConstants.TAGS_SPORTS)), getStartTime(), getEndTime()));
    }

    public boolean onPrepare(List<Record> list, List<Card> list2) {
        List recordStartTimesFromRecordAndCards = getRecordStartTimesFromRecordAndCards(list, list2, false);
        long currentTimeMillis = DateUtils.getCurrentTimeMillis();
        long firstDayOfMonthTime = DateUtils.getFirstDayOfMonthTime(currentTimeMillis);
        if (currentTimeMillis <= firstDayOfMonthTime || currentTimeMillis - firstDayOfMonthTime >= 172800000) {
            return false;
        }
        long lastNYearMonthTime = DateUtils.getLastNYearMonthTime(1, currentTimeMillis, true);
        long lastNYearMonthTime2 = DateUtils.getLastNYearMonthTime(1, currentTimeMillis, false);
        if (lastNYearMonthTime < 0 || lastNYearMonthTime2 < 0 || recordStartTimesFromRecordAndCards.contains(Long.valueOf(lastNYearMonthTime))) {
            return false;
        }
        setStartTime(lastNYearMonthTime);
        setEndTime(lastNYearMonthTime2);
        return true;
    }
}
