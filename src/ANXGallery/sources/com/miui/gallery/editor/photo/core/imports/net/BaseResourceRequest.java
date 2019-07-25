package com.miui.gallery.editor.photo.core.imports.net;

import android.text.TextUtils;
import com.google.gson.reflect.TypeToken;
import com.miui.gallery.editor.photo.core.imports.text.typeface.TextStyle;
import com.miui.gallery.net.BaseGalleryRequest;
import com.miui.gallery.util.GsonUtils;
import java.util.List;
import org.json.JSONObject;

public abstract class BaseResourceRequest extends BaseGalleryRequest {
    public BaseResourceRequest() {
        super(0, "https://i.mi.com/gallery/public/resource/info");
        addParam("id", Long.toString(getParentId()));
        setUseCache(true);
        setCacheExpires(2592000000L);
        setCacheSoftTtl(System.currentTimeMillis() + 86400000);
    }

    private String filterJsonString(String str) {
        return TextUtils.isEmpty(str) ? "" : str.replace("\"{", "{").replace("}\"", "}").replace("\\", "");
    }

    /* access modifiers changed from: protected */
    public abstract long getParentId();

    /* access modifiers changed from: protected */
    public void onRequestSuccess(JSONObject jSONObject) throws Exception {
        String filterJsonString = filterJsonString(jSONObject.getString("galleryResourceInfoList"));
        long optLong = jSONObject.optLong("expireAt");
        if (optLong != 0) {
            setCacheSoftTtl(optLong);
        }
        deliverResponse((List) GsonUtils.fromJson(filterJsonString, new TypeToken<List<TextStyle>>() {
        }.getType()));
    }
}
