package com.miui.gallery.card.scenario.time.annual;

import com.miui.gallery.card.Card;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.time.TimeScenario;
import com.miui.gallery.util.MiscUtil;
import java.util.List;

public abstract class AnnualScenario extends TimeScenario {
    public AnnualScenario(int i) {
        super(i, 8, 7);
    }

    public boolean onPrepare(List<Record> list, List<Card> list2) {
        long currentTimeMillis = DateUtils.getCurrentTimeMillis();
        long endDayOfYearTime = DateUtils.getEndDayOfYearTime(currentTimeMillis);
        if (currentTimeMillis <= endDayOfYearTime - 172800000 || currentTimeMillis >= endDayOfYearTime + 86400000 || MiscUtil.isValid(list) || MiscUtil.isValid(list2)) {
            return false;
        }
        setStartTime(DateUtils.getFirstDayOfYearTime(currentTimeMillis));
        setEndTime(DateUtils.getEndDayOfYearTime(currentTimeMillis) + 86400000);
        return true;
    }
}
