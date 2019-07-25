package miui.module.appstore;

import org.json.JSONException;
import org.json.JSONObject;

class Metadata {
    public String mFileHash;
    public String mHost;
    public String mResourceId;
    public String mUrl;

    Metadata() {
    }

    static Metadata parse(JSONObject jSONObject) {
        Metadata metadata = new Metadata();
        try {
            metadata.mResourceId = jSONObject.getString("resourceId");
            metadata.mHost = jSONObject.getString("host");
            metadata.mUrl = jSONObject.getString("url");
            metadata.mFileHash = jSONObject.getString("fileHash");
            return metadata;
        } catch (JSONException e) {
            e.printStackTrace();
            return null;
        }
    }
}
