package com.miui.gallery.card.preprocess;

import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.util.Log;
import org.json.JSONObject;

public class ScenarioAlbumChargingTask extends ScenarioAlbumTask {
    public ScenarioAlbumChargingTask(int i) {
        super(i);
    }

    public boolean onProcess(JSONObject jSONObject, long j) throws Exception {
        Record record = (Record) GalleryEntityManager.getInstance().find(Record.class, j);
        if (record == null || record.getState() == 2) {
            return false;
        }
        if (isCancelled()) {
            Log.d("ScenarioAlbumChargingTask", "task is cancelled");
            return false;
        }
        Log.d("ScenarioAlbumChargingTask", "start generate card");
        generateCard(jSONObject, record, true);
        return false;
    }

    public boolean requireCharging() {
        return true;
    }
}
