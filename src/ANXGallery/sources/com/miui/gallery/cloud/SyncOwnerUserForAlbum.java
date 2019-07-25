package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import android.net.Uri;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils.SyncTagItem;
import com.miui.gallery.cloud.HostManager.SyncPull;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import java.util.ArrayList;
import org.json.JSONException;
import org.json.JSONObject;

public final class SyncOwnerUserForAlbum extends SyncUserBase {
    public SyncOwnerUserForAlbum(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, String str) {
        super(context, account, galleryExtendedAuthToken, str);
    }

    /* access modifiers changed from: protected */
    public Uri getBaseUri() {
        return GalleryCloudUtils.CLOUD_USER_URI;
    }

    /* access modifiers changed from: protected */
    public ArrayList<SyncTagItem> getSyncTagList() {
        ArrayList<SyncTagItem> arrayList = new ArrayList<>();
        arrayList.add(new SyncTagItem(10));
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public String getSyncTagSelection() {
        StringBuilder sb = new StringBuilder();
        sb.append("albumId = '");
        sb.append(this.mAlbumId);
        sb.append("'");
        return sb.toString();
    }

    /* access modifiers changed from: protected */
    public String getSyncUrl() {
        return SyncPull.getPullOwnerShareUserUrl(this.mAlbumId);
    }

    /* access modifiers changed from: protected */
    public String getTagColumnName() {
        return "serverTag";
    }

    /* access modifiers changed from: protected */
    public final boolean handleDataJson(JSONObject jSONObject) throws JSONException {
        return addUsers(jSONObject);
    }
}
