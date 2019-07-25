package com.miui.gallery.video.editor.net;

import com.google.gson.JsonParseException;
import com.miui.gallery.net.BaseGalleryRequest;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.video.editor.model.LocalResource;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

public abstract class VideoEditorBaseResourceRequest extends BaseGalleryRequest {
    protected int type;

    public VideoEditorBaseResourceRequest(int i) {
        super(0, "https://i.mi.com/gallery/public/resource/info");
        this.type = i;
        addParam("id", Long.toString(getParentId()));
        setUseCache(true);
        setCacheExpires(2592000000L);
        setCacheSoftTtl(System.currentTimeMillis() + 86400000);
    }

    /* access modifiers changed from: protected */
    public abstract long getParentId();

    /* access modifiers changed from: protected */
    public abstract LocalResource newLocalResource();

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
                    LocalResource newLocalResource = newLocalResource();
                    newLocalResource.id = jSONObject2.optLong("id");
                    newLocalResource.parent = jSONObject2.optLong("id");
                    newLocalResource.icon = jSONObject2.optString("icon");
                    newLocalResource.label = jSONObject2.optString("text");
                    newLocalResource.extra = jSONObject2.optString("extraInfo");
                    newLocalResource.type = jSONObject2.optString(nexExportFormat.TAG_FORMAT_TYPE);
                    newLocalResource.nameKey = new JSONObject(newLocalResource.extra).optString("nameKey");
                    setResult(newLocalResource);
                    arrayList.add(newLocalResource);
                }
            }
            deliverResponse(arrayList);
        } catch (JsonParseException e) {
            e.printStackTrace();
            deliverError(ErrorCode.PARSE_ERROR, e.getMessage(), jSONObject);
        } catch (Exception e2) {
            e2.printStackTrace();
            deliverError(ErrorCode.HANDLE_ERROR, e2.getMessage(), jSONObject);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void setResult(LocalResource localResource);
}
