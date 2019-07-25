package com.xiaomi.micloudsdk.utils;

import android.util.ArrayMap;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

public class JsonUtils {
    private static Object convertObj(Object obj) {
        if (obj instanceof JSONObject) {
            return jsonToMap((JSONObject) obj);
        }
        if (obj instanceof JSONArray) {
            JSONArray jSONArray = (JSONArray) obj;
            int length = jSONArray.length();
            ArrayList arrayList = new ArrayList();
            for (int i = 0; i < length; i++) {
                arrayList.add(convertObj(jSONArray.opt(i)));
            }
            return arrayList;
        } else if (obj == JSONObject.NULL) {
            return null;
        } else {
            return obj;
        }
    }

    public static Map<String, Object> jsonToMap(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        ArrayMap arrayMap = new ArrayMap();
        Iterator keys = jSONObject.keys();
        while (keys.hasNext()) {
            String str = (String) keys.next();
            arrayMap.put(str, convertObj(jSONObject.opt(str)));
        }
        return arrayMap;
    }
}
