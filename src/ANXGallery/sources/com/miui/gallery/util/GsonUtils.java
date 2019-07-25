package com.miui.gallery.util;

import com.google.gson.Gson;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;

public class GsonUtils {
    private static final Gson GSON = new Gson();

    public static <T> T fromJson(String str, Type type) {
        return GSON.fromJson(str, type);
    }

    public static ArrayList getArray(String str, Type type) throws JSONException {
        return getArray(new JSONArray(str), type);
    }

    public static ArrayList getArray(JSONArray jSONArray, Type type) throws JSONException {
        if (jSONArray == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i = 0; i < length; i++) {
            arrayList.add(GSON.fromJson(jSONArray.get(i).toString(), type));
        }
        return arrayList;
    }

    public static String toJson(Map map) throws JSONException {
        if (map == null) {
            return null;
        }
        return GSON.toJson((Object) map);
    }

    public static String toString(Object obj) {
        return GSON.toJson(obj);
    }
}
