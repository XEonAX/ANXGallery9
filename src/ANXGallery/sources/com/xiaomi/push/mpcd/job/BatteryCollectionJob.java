package com.xiaomi.push.mpcd.job;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.text.TextUtils;
import com.xiaomi.xmpush.thrift.ClientCollectionType;
import java.util.Set;
import org.json.JSONObject;

public class BatteryCollectionJob extends CollectionJob {
    public BatteryCollectionJob(Context context, int i) {
        super(context, i);
    }

    private String doFormatData() {
        StringBuilder sb = new StringBuilder();
        try {
            Intent registerReceiver = this.context.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
            if (registerReceiver != null) {
                Bundle extras = registerReceiver.getExtras();
                if (extras != null) {
                    Set<String> keySet = extras.keySet();
                    JSONObject jSONObject = new JSONObject();
                    if (keySet != null && keySet.size() > 0) {
                        for (String str : keySet) {
                            if (!TextUtils.isEmpty(str)) {
                                try {
                                    jSONObject.put(str, String.valueOf(extras.get(str)));
                                } catch (Exception unused) {
                                }
                            }
                        }
                        sb.append(jSONObject);
                    }
                }
            }
        } catch (Exception unused2) {
        }
        return sb.toString();
    }

    public String collectInfo() {
        return doFormatData();
    }

    public ClientCollectionType getCollectionType() {
        return ClientCollectionType.Battery;
    }

    public int getJobId() {
        return 20;
    }
}
