package com.miui.gallery.assistant.process;

import org.json.JSONObject;

public class ExistImageFeatureChargingTask extends ExistImageFeatureTask {
    public ExistImageFeatureChargingTask(int i) {
        super(i);
    }

    public boolean process(JSONObject jSONObject) throws Exception {
        processInternal(jSONObject, 9, 5);
        return false;
    }

    public boolean requireCharging() {
        return true;
    }
}
