package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils.SyncTagItem;
import com.miui.gallery.cloud.HostManager.SyncPull;
import com.miui.gallery.cloud.baby.BabyAlbumUtils;
import com.miui.gallery.cloud.baby.BabyInfo;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.data.DBShareAlbum;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.SyncLog;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Locale;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

public final class SyncSharerUserForAlbum extends SyncUserBase {
    public SyncSharerUserForAlbum(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, String str) {
        super(context, account, galleryExtendedAuthToken, str);
    }

    private boolean cleanAllUsersInLocalDB() {
        return GalleryUtils.safeDelete(getBaseUri(), "albumId = ? ", new String[]{this.mAlbumId}) > 0;
    }

    public static void insertCreatorIntoShareUser(String str, String str2) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            SyncLog.d("SyncSharerUserForAlbum", "reset users, creator id or album id is null.");
            return;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("albumId", str2);
        contentValues.put("userId", str);
        GalleryUtils.safeInsert(GalleryCloudUtils.SHARE_USER_URI, contentValues);
    }

    private void resetUsersInLocalDB() {
        cleanAllUsersInLocalDB();
        insertCreatorIntoShareUser(CloudUtils.getCreatorIdByAlbumId(this.mAlbumId), this.mAlbumId);
    }

    /* access modifiers changed from: protected */
    public void appendParams(ArrayList<NameValuePair> arrayList, ArrayList<SyncTagItem> arrayList2) throws UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException {
        super.appendParams(arrayList, arrayList2);
        arrayList.add(new BasicNameValuePair("sharedAlbumId", this.mAlbumId));
    }

    /* access modifiers changed from: protected */
    public Uri getBaseUri() {
        return GalleryCloudUtils.SHARE_USER_URI;
    }

    /* access modifiers changed from: protected */
    public ArrayList<SyncTagItem> getSyncTagList() {
        ArrayList<SyncTagItem> arrayList = new ArrayList<>();
        arrayList.add(new SyncTagItem(9));
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
        return SyncPull.getPullShareUserUrl();
    }

    /* access modifiers changed from: protected */
    public String getTagColumnName() {
        return "serverTag";
    }

    /* access modifiers changed from: protected */
    public final boolean handleDataJson(JSONObject jSONObject) throws JSONException {
        if (CloudUtils.getLongAttributeFromJson(jSONObject, nexExportFormat.TAG_FORMAT_TAG) > ((SyncTagItem) getCurrentSyncTag().get(0)).currentValue) {
            resetUsersInLocalDB();
        }
        return addUsers(jSONObject);
    }

    /* access modifiers changed from: protected */
    public final boolean handleUser(JSONObject jSONObject) throws JSONException {
        if ("normal".equals(jSONObject.getString("status"))) {
            String optString = jSONObject.optString(BabyAlbumUtils.BABY_PEOPLE_ID);
            String optString2 = jSONObject.optString("userId");
            if (!TextUtils.isEmpty(optString) && !TextUtils.isEmpty(optString2) && optString2.equals(GalleryCloudUtils.getAccountName())) {
                DBShareAlbum dBShareAlbumBySharedId = CloudUtils.getDBShareAlbumBySharedId(this.mAlbumId);
                BabyInfo fromJSON = dBShareAlbumBySharedId == null ? null : BabyInfo.fromJSON(dBShareAlbumBySharedId.getBabyInfoJson());
                if (fromJSON != null) {
                    fromJSON.mAutoupdate = jSONObject.optBoolean(BabyAlbumUtils.BABY_AUTO_UPDATE);
                    fromJSON.mPeopleId = optString;
                    ContentValues contentValues = new ContentValues();
                    contentValues.putNull("editedColumns");
                    contentValues.put("babyInfoJson", fromJSON.toJSON());
                    contentValues.put("peopleId", optString);
                    GalleryUtils.safeUpdate(GalleryCloudUtils.SHARE_ALBUM_URI, contentValues, String.format(Locale.US, "%s=?", new Object[]{"albumId"}), new String[]{this.mAlbumId});
                }
            }
        }
        return super.handleUser(jSONObject);
    }

    /* access modifiers changed from: protected */
    public void updateSyncTag(ArrayList<SyncTagItem> arrayList) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(GalleryCloudSyncTagUtils.getColumnName(((SyncTagItem) arrayList.get(0)).syncTagType), Long.valueOf(((SyncTagItem) arrayList.get(0)).serverValue));
        GalleryUtils.safeUpdate(GalleryCloudUtils.SHARE_ALBUM_URI, contentValues, "albumId = ? ", new String[]{this.mAlbumId});
    }
}
