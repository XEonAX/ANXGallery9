package com.miui.gallery.card.scenario.time.recent;

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

public class LastSeasonScenario extends TimeScenario {
    public LastSeasonScenario() {
        super(BaiduSceneResult.ANCIENT_CHINESE_ARCHITECTURE, 2, 6);
    }

    public String generateDescription(Record record, List<MediaFeatureItem> list) {
        return getRecordStartTime(record) > 0 ? getMonthPeriodFromRecord(record) : "";
    }

    public String generateTitle(Record record, List<MediaFeatureItem> list) {
        long recordStartTime = getRecordStartTime(record);
        if (recordStartTime > 0) {
            int season = DateUtils.getSeason(recordStartTime);
            String[] stringArray = GalleryApp.sGetAndroidContext().getResources().getStringArray(R.array.season);
            if (stringArray.length > 0 && stringArray.length > season) {
                return stringArray[season];
            }
        }
        return "";
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
        long j = seasonStartTime - 86400000;
        long seasonStartTime2 = DateUtils.getSeasonStartTime(j);
        long seasonEndTime = DateUtils.getSeasonEndTime(j);
        if (seasonStartTime2 < 0 || seasonEndTime < 0 || recordStartTimesFromRecordAndCards.contains(Long.valueOf(seasonStartTime2))) {
            return false;
        }
        setStartTime(seasonStartTime2);
        setEndTime(seasonEndTime);
        return true;
    }
}
