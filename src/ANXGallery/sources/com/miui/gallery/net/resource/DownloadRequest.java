package com.miui.gallery.net.resource;

import com.miui.gallery.net.BaseGalleryRequest;
import org.json.JSONObject;

public class DownloadRequest extends BaseGalleryRequest {
    public DownloadRequest(long j) {
        super(0, "https://i.mi.com/gallery/public/resource/download");
        addParam("id", String.valueOf(j));
        setUseCache(false);
    }

    /* access modifiers changed from: protected */
    public void onRequestSuccess(JSONObject jSONObject) throws Exception {
        DownloadInfo downloadInfo = new DownloadInfo();
        downloadInfo.url = jSONObject.getString("url");
        downloadInfo.sha1 = jSONObject.getString("sha1Base16");
        deliverResponse(downloadInfo);
    }
}
