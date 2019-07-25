package com.miui.gallery.cloud;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import com.miui.gallery.cloud.SpaceFullHandler.SpaceFullListener;
import com.miui.gallery.util.UbiFocusUtils;
import org.json.JSONException;
import org.json.JSONObject;

public class CopyImageToSharerAlbum extends CopyImageBase {
    public CopyImageToSharerAlbum(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void appendValues(ContentValues contentValues) {
        contentValues.put("albumId", this.mAlbumId);
    }

    /* access modifiers changed from: protected */
    public String getAlbumId(RequestCloudItem requestCloudItem) {
        return CloudUtils.getShareAlbumIdByLocalId(this.mContext, requestCloudItem);
    }

    /* access modifiers changed from: protected */
    public String getAlbumIdTagName() {
        return "toSharedAlbumId";
    }

    /* access modifiers changed from: protected */
    public Uri getBaseUri() {
        return GalleryCloudUtils.SHARE_IMAGE_URI;
    }

    /* access modifiers changed from: protected */
    public SpaceFullListener getSpaceFullListener() {
        return SpaceFullHandler.getSharerSpaceFullListener();
    }

    /* access modifiers changed from: protected */
    public String getUrl(CloudUrlProvider cloudUrlProvider, String str, String str2, boolean z, RequestCloudItem requestCloudItem) {
        return cloudUrlProvider.getCopyUrl(str, str2);
    }

    /* access modifiers changed from: protected */
    public void handleSubUbiSchema(JSONObject jSONObject, String str) throws JSONException {
        UbiFocusUtils.handleSubUbiImage(jSONObject, true, str);
    }

    /* access modifiers changed from: protected */
    public boolean isToShare() {
        return true;
    }
}
