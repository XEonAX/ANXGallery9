package com.xiaomi.clientreport.data;

import com.xiaomi.channel.commonutils.logger.MyLog;
import org.json.JSONException;
import org.json.JSONObject;

public class EventClientReport extends BaseClientReport {
    public String eventContent;
    public String eventId;
    public long eventTime;
    public int eventType;

    public JSONObject toJson() {
        try {
            JSONObject json = super.toJson();
            if (json == null) {
                return null;
            }
            json.put("eventId", this.eventId);
            json.put("eventType", this.eventType);
            json.put("eventTime", this.eventTime);
            json.put("eventContent", this.eventContent);
            return json;
        } catch (JSONException e) {
            MyLog.e((Throwable) e);
            return null;
        }
    }

    public String toJsonString() {
        return super.toJsonString();
    }
}
