package com.miui.gallery.card.preprocess;

import com.miui.gallery.assistant.process.BaseImageTask;
import com.miui.gallery.pendingtask.PendingTaskManager;
import com.miui.gallery.util.Log;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class ScenarioTask extends BaseImageTask {
    ScenarioTask(int i) {
        super(i);
    }

    private static long parseRecordId(JSONObject jSONObject) throws JSONException {
        if (jSONObject == null) {
            return 0;
        }
        return jSONObject.getLong("recordId");
    }

    public static void post(int i, String str, long j) {
        PendingTaskManager.getInstance().postTask(i, wrapTaskData(j), str);
    }

    private static JSONObject wrapTaskData(long j) {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("recordId", j);
        } catch (JSONException e) {
            Log.e("ScenarioTask", "wrap task data error.\n", (Object) e);
        }
        return jSONObject;
    }

    public int getNetworkType() {
        return 2;
    }

    /* access modifiers changed from: protected */
    public abstract boolean onProcess(JSONObject jSONObject, long j) throws Exception;

    public final boolean process(JSONObject jSONObject) throws Exception {
        long parseRecordId = parseRecordId(jSONObject);
        if (parseRecordId != 0) {
            return onProcess(jSONObject, parseRecordId);
        }
        Log.e("ScenarioTask", "data parse failed");
        return false;
    }

    public boolean requireCharging() {
        return false;
    }

    public boolean requireDeviceIdle() {
        return true;
    }
}
