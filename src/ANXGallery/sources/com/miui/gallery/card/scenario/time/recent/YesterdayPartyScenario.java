package com.miui.gallery.card.scenario.time.recent;

import com.miui.gallery.R;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.ScenarioConstants;
import java.util.List;

public class YesterdayPartyScenario extends YesterdayScenario {
    public YesterdayPartyScenario() {
        super(BaiduSceneResult.BUILDING_OTHER, ScenarioConstants.TAGS_PARTY);
    }

    public String generateTitle(Record record, List<MediaFeatureItem> list) {
        return getRandomArrayString(R.array.parties_title);
    }
}
