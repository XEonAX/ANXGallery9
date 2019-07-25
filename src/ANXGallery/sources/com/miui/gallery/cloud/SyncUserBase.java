package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils.SyncTagItem;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.data.DBShareUser;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.SyncLog;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.ArrayList;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class SyncUserBase extends SyncFromServer {
    protected final String mAlbumId;

    public SyncUserBase(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, String str) {
        super(context, account, galleryExtendedAuthToken);
        this.mAlbumId = str;
    }

    private final DBShareUser getInvitedShareUserByRelation(String str, String str2, String str3) {
        return CloudUtils.getInvitedDBShareUserInLocal(getBaseUri(), str, this.mAlbumId, str2, str3);
    }

    private final DBShareUser getShareUserById(Context context, String str) {
        return CloudUtils.getDBShareUserInLocal(getBaseUri(), str, this.mAlbumId);
    }

    private boolean handleUserInvited(JSONObject jSONObject, DBShareUser dBShareUser, String str) throws JSONException {
        if (dBShareUser != null) {
            if (str.equals("normal") || str.equals("invited")) {
                GalleryUtils.safeUpdate(getBaseUri(), DBShareUser.getContentValues(jSONObject), "_id = ? ", new String[]{dBShareUser.getId()});
                return true;
            }
            GalleryUtils.safeDelete(getBaseUri(), "_id = ? ", new String[]{dBShareUser.getId()});
        }
        return false;
    }

    private final void setPhoneNumberNullIfNeeded(String str, String str2) {
        if (getBaseUri() != GalleryCloudUtils.CLOUD_USER_URI) {
            return;
        }
        if (TextUtils.equals(str, "family") || TextUtils.equals(str, "friend")) {
            ContentValues contentValues = new ContentValues();
            contentValues.putNull("phone");
            GalleryUtils.safeUpdate(GalleryCloudUtils.CLOUD_USER_URI, contentValues, String.format(Locale.US, "%s='%s' and %s='%s' and %s='%s' and %s='%s'", new Object[]{"albumId", this.mAlbumId, "relation", str, "relationText", str2, "serverStatus", "invited"}), null);
        }
    }

    /* access modifiers changed from: protected */
    public final boolean addUsers(JSONObject jSONObject) throws JSONException {
        JSONArray optJSONArray = jSONObject.optJSONArray("list");
        if (optJSONArray == null || optJSONArray.length() <= 0) {
            SyncLog.d("SyncUserBase", "changedUserList is empty, return.");
            return false;
        }
        boolean z = false;
        for (int i = 0; i < optJSONArray.length(); i++) {
            if (handleUser(optJSONArray.getJSONObject(i))) {
                z = true;
            }
        }
        return z;
    }

    /* access modifiers changed from: protected */
    public final int getSyncItemLimit() {
        return 0;
    }

    /* access modifiers changed from: protected */
    public boolean handleUser(JSONObject jSONObject) throws JSONException {
        String str;
        String string = jSONObject.getString("status");
        String string2 = jSONObject.getString("userId");
        long longAttributeFromJson = CloudUtils.getLongAttributeFromJson(jSONObject, nexExportFormat.TAG_FORMAT_TAG);
        synchronized (getBaseUri()) {
            DBShareUser shareUserById = getShareUserById(this.mContext, string2);
            if (shareUserById == null) {
                String str2 = null;
                if (jSONObject.has("relation")) {
                    str2 = jSONObject.getString("relation");
                    str = jSONObject.getString("relationText");
                } else {
                    str = null;
                }
                if (!TextUtils.isEmpty(str2) && !TextUtils.isEmpty(str)) {
                    setPhoneNumberNullIfNeeded(str2, str);
                    DBShareUser invitedShareUserByRelation = getInvitedShareUserByRelation(string2, str2, str);
                    if (invitedShareUserByRelation != null) {
                        boolean handleUserInvited = handleUserInvited(jSONObject, invitedShareUserByRelation, string);
                        return handleUserInvited;
                    }
                }
                if (!string.equals("normal")) {
                    return false;
                }
                ContentValues contentValues = DBShareUser.getContentValues(jSONObject);
                contentValues.put("albumId", this.mAlbumId);
                GalleryUtils.safeInsert(getBaseUri(), contentValues);
                return true;
            }
            SyncLog.d("SyncUserBase", "find this user in local, update");
            if (shareUserById.getServerTag() >= longAttributeFromJson) {
                StringBuilder sb = new StringBuilder();
                sb.append("shareUser:");
                sb.append(shareUserById.getId());
                sb.append(" local tag:");
                sb.append(shareUserById.getServerTag());
                sb.append(" >= server tag:");
                sb.append(longAttributeFromJson);
                sb.append(", don't update local.");
                SyncLog.d("SyncUserBase", sb.toString());
                return false;
            } else if (!string.equals("normal")) {
                GalleryUtils.safeDelete(getBaseUri(), "_id = ? ", new String[]{shareUserById.getId()});
                StringBuilder sb2 = new StringBuilder();
                sb2.append("delete share user:");
                sb2.append(shareUserById.getId());
                SyncLog.d("SyncUserBase", sb2.toString());
                return false;
            } else {
                GalleryUtils.safeUpdate(getBaseUri(), DBShareUser.getContentValues(jSONObject), "_id = ? ", new String[]{shareUserById.getId()});
                return false;
            }
        }
    }

    /* access modifiers changed from: protected */
    public final boolean updateSyncTagAndShouldContinue(JSONObject jSONObject, ArrayList<SyncTagItem> arrayList) throws JSONException {
        long longAttributeFromJson = CloudUtils.getLongAttributeFromJson(jSONObject, nexExportFormat.TAG_FORMAT_TAG);
        if (longAttributeFromJson > ((SyncTagItem) arrayList.get(0)).currentValue) {
            StringBuilder sb = new StringBuilder();
            sb.append("update the syncTag:");
            sb.append(longAttributeFromJson);
            SyncLog.d("SyncUserBase", sb.toString());
            ((SyncTagItem) arrayList.get(0)).serverValue = longAttributeFromJson;
            updateSyncTag(arrayList);
        }
        return false;
    }
}
