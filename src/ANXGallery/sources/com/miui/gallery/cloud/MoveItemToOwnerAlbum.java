package com.miui.gallery.cloud;

import android.content.ContentValues;
import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.cloud.SpaceFullHandler.SpaceFullListener;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.UbiFocusUtils;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

public class MoveItemToOwnerAlbum extends MoveItemBase {
    public MoveItemToOwnerAlbum(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void appendAlbumIdParameter(ArrayList<NameValuePair> arrayList) throws IllegalBlockSizeException, BadPaddingException, UnsupportedEncodingException {
        arrayList.add(new BasicNameValuePair("toAlbumId", this.mAlbumId));
    }

    /* access modifiers changed from: protected */
    public void appendValues(ContentValues contentValues) {
        contentValues.putNull("fromLocalGroupId");
    }

    /* access modifiers changed from: protected */
    public String getAlbumId(RequestCloudItem requestCloudItem) {
        return CloudUtils.getServerIdByLocalId(this.mContext, requestCloudItem.dbCloud.getLocalGroupId(), requestCloudItem);
    }

    /* access modifiers changed from: protected */
    public SpaceFullListener getSpaceFullListener() {
        return SpaceFullHandler.getOwnerSpaceFullListener();
    }

    /* access modifiers changed from: protected */
    public String getUrl(CloudUrlProvider cloudUrlProvider, String str, String str2, RequestCloudItem requestCloudItem) {
        boolean isSecretAlbum = CloudTableUtils.isSecretAlbum(this.mAlbumId, null);
        String fromLocalGroupId = requestCloudItem.dbCloud.getFromLocalGroupId();
        if (TextUtils.isEmpty(fromLocalGroupId)) {
            SyncLog.d("MoveItemToOwnerAlbum", "getUrl  fromLocalGroupId does not exist");
            return cloudUrlProvider.getMoveUrl(str, str2);
        }
        boolean isSecretAlbum2 = CloudTableUtils.isSecretAlbum(null, fromLocalGroupId);
        return (isSecretAlbum || isSecretAlbum2) ? (isSecretAlbum || !isSecretAlbum2) ? cloudUrlProvider.getHideMoveUrl(str, str2) : cloudUrlProvider.getUnHideMoveUrl(str, str2) : cloudUrlProvider.getMoveUrl(str, str2);
    }

    /* access modifiers changed from: protected */
    public void handleSubUbiSchema(JSONObject jSONObject, String str) throws JSONException {
        UbiFocusUtils.handleSubUbiImage(jSONObject, false, str);
    }

    /* access modifiers changed from: protected */
    public boolean isToShare() {
        return false;
    }
}
