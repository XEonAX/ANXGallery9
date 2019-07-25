package com.miui.gallery.movie.net;

import com.google.gson.JsonParseException;
import com.miui.gallery.movie.entity.MovieResource;
import com.miui.gallery.net.BaseGalleryRequest;
import com.miui.gallery.net.base.ErrorCode;
import java.util.ArrayList;
import java.util.Collections;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class LocalResourceRequest extends BaseGalleryRequest {
    public LocalResourceRequest() {
        super(0, "https://i.mi.com/gallery/public/resource/info");
        addParam("id", Long.toString(getParentId()));
        setUseCache(true);
        setCacheExpires(2592000000L);
        setCacheSoftTtl(System.currentTimeMillis() + 86400000);
    }

    /* access modifiers changed from: protected */
    public abstract long getParentId();

    /* access modifiers changed from: protected */
    public abstract MovieResource newLocalResource();

    /* access modifiers changed from: protected */
    public void onRequestSuccess(JSONObject jSONObject) throws Exception {
        try {
            ArrayList arrayList = new ArrayList();
            JSONArray jSONArray = jSONObject.getJSONArray("galleryResourceInfoList");
            long optLong = jSONObject.optLong("expireAt");
            if (optLong != 0) {
                setCacheSoftTtl(optLong);
            }
            if (jSONArray != null) {
                for (int i = 0; i < jSONArray.length(); i++) {
                    JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                    MovieResource newLocalResource = newLocalResource();
                    newLocalResource.id = jSONObject2.optLong("id");
                    newLocalResource.icon = jSONObject2.optString("icon");
                    newLocalResource.label = jSONObject2.optString("text");
                    newLocalResource.extra = jSONObject2.optString("extraInfo");
                    try {
                        JSONObject jSONObject3 = new JSONObject(newLocalResource.extra);
                        newLocalResource.enName = jSONObject3.optString("enName");
                        newLocalResource.nameKey = jSONObject3.optString("nameKey");
                        newLocalResource.index = jSONObject3.optInt("index");
                        newLocalResource.pathKey = newLocalResource.nameKey;
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    arrayList.add(newLocalResource);
                }
            }
            Collections.sort(arrayList);
            deliverResponse(arrayList);
        } catch (JsonParseException e2) {
            e2.printStackTrace();
            deliverError(ErrorCode.PARSE_ERROR, e2.getMessage(), jSONObject);
        } catch (Exception e3) {
            e3.printStackTrace();
            deliverError(ErrorCode.HANDLE_ERROR, e3.getMessage(), jSONObject);
        }
    }
}
