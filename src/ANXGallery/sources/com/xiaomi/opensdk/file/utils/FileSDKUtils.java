package com.xiaomi.opensdk.file.utils;

import cn.kuaipan.android.exception.KscException;
import cn.kuaipan.android.utils.JsonReader;
import cn.kuaipan.android.utils.JsonToken;
import cn.kuaipan.android.utils.JsonUtils;
import java.io.IOException;
import java.io.StringReader;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class FileSDKUtils {
    public static Map<String, Object> contentKssJsonToMap(JSONObject jSONObject) throws KscException, InterruptedException {
        try {
            JsonReader jsonReader = new JsonReader(new StringReader(jSONObject.toString()));
            Map<String, Object> map = (Map) JsonUtils.parser(jsonReader);
            if (jsonReader.peek() != JsonToken.END_DOCUMENT) {
                throw new JSONException("Document not end of EOF");
            } else if (map != null && !map.isEmpty()) {
                return map;
            } else {
                throw new KscException(501003, jSONObject.toString());
            }
        } catch (IOException e) {
            throw KscException.newException(e, "contentKssJsonToMap failed.");
        } catch (JSONException e2) {
            throw KscException.newException(e2, "contentKssJsonToMap failed.");
        }
    }
}
