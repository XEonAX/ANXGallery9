package com.miui.gallery.cloud;

import android.content.ContentValues;
import android.content.Context;
import com.miui.gallery.cloud.SpaceFullHandler.SpaceFullListener;
import com.miui.gallery.util.UbiFocusUtils;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

public class MoveItemToSharerAlbum extends MoveItemBase {
    public MoveItemToSharerAlbum(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void appendAlbumIdParameter(ArrayList<NameValuePair> arrayList) throws IllegalBlockSizeException, BadPaddingException, UnsupportedEncodingException {
        arrayList.add(new BasicNameValuePair("toSharedAlbumId", this.mAlbumId));
    }

    /* access modifiers changed from: protected */
    public void appendValues(ContentValues contentValues) {
        contentValues.put("albumId", this.mAlbumId);
        contentValues.putNull("fromLocalGroupId");
    }

    /* access modifiers changed from: protected */
    public String getAlbumId(RequestCloudItem requestCloudItem) {
        return CloudUtils.getShareAlbumIdByLocalId(this.mContext, requestCloudItem);
    }

    /* access modifiers changed from: protected */
    public SpaceFullListener getSpaceFullListener() {
        return SpaceFullHandler.getSharerSpaceFullListener();
    }

    /* access modifiers changed from: protected */
    public String getUrl(CloudUrlProvider cloudUrlProvider, String str, String str2, RequestCloudItem requestCloudItem) {
        return cloudUrlProvider.getMoveUrl(str, str2);
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
