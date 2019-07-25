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

public class PastYearSeasonScenario extends TimeScenario {
    public PastYearSeasonScenario() {
        super(BaiduSceneResult.SPORTS_OTHER, 1, 7);
    }

    public String generateDescription(Record record, List<MediaFeatureItem> list) {
        return getRecordStartTime(record) > 0 ? getMonthPeriodFromRecord(record) : "";
    }

    public String generateTitle(Record record, List<MediaFeatureItem> list) {
        int season = DateUtils.getSeason(getRecordStartTime(record));
        String[] stringArray = GalleryApp.sGetAndroidContext().getResources().getStringArray(R.array.season_last_year);
        return (stringArray.length <= 0 || stringArray.length <= season) ? "" : stringArray[season];
    }

    public List<Long> loadMediaItem() {
        return getImageIdsFromImageFeatures(getCameraMediaIdsByStartEndTimeTags(CardUtil.concat(CardUtil.concat(ScenarioConstants.TAGS_PARTY, ScenarioConstants.TAGS_FOODS), CardUtil.concat(ScenarioConstants.TAGS_ACTIVITY, ScenarioConstants.TAGS_SPORTS)), getStartTime(), getEndTime()));
    }

    public boolean onPrepare(List<Record> list, List<Card> list2) {
        List recordStartTimesFromRecordAndCards = getRecordStartTimesFromRecordAndCards(list, list2, false);
        long currentTimeMillis = DateUtils.getCurrentTimeMillis();
        long seasonStartTime = DateUtils.getSeasonStartTime(currentTimeMillis);
        if (currentTimeMillis <= seasonStartTime || currentTimeMillis - seasonStartTime >= 172800000) {
            return false;
        }
        long lastNYearDateTime = DateUtils.getLastNYearDateTime(1, currentTimeMillis);
        long seasonStartTime2 = DateUtils.getSeasonStartTime(lastNYearDateTime);
        long seasonEndTime = DateUtils.getSeasonEndTime(lastNYearDateTime);
        if (seasonStartTime2 < 0 || seasonEndTime < 0 || recordStartTimesFromRecordAndCards.contains(Long.valueOf(seasonStartTime2))) {
            return false;
        }
        setStartTime(seasonStartTime2);
        setEndTime(seasonEndTime);
        return true;
    }
}
