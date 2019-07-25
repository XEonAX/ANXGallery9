package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils.SyncTagItem;
import com.miui.gallery.cloud.HostManager.SyncPull;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.data.DBShareAlbum;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deprecated.Preference;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class SyncSharerAll extends SyncFromServer {
    private Bundle mExtras;

    public SyncSharerAll(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, Bundle bundle) {
        super(context, account, galleryExtendedAuthToken);
        this.mExtras = bundle;
    }

    private void handleAlbumList(JSONObject jSONObject) throws JSONException {
        boolean z;
        JSONArray optJSONArray = jSONObject.optJSONArray("entries");
        for (int i = 0; i < optJSONArray.length(); i++) {
            JSONObject jSONObject2 = optJSONArray.getJSONObject(i);
            String string = jSONObject2.getString("sharedId");
            String optString = jSONObject2.optString("status");
            if (TextUtils.isEmpty(optString)) {
                optString = "normal";
            }
            long longAttributeFromJson = CloudUtils.getLongAttributeFromJson(jSONObject2, nexExportFormat.TAG_FORMAT_TAG);
            JSONObject jSONObject3 = jSONObject2.getJSONObject("content");
            String string2 = jSONObject3.getString("status");
            String string3 = jSONObject3.getString("fileName");
            synchronized (GalleryCloudUtils.SHARE_ALBUM_URI) {
                DBShareAlbum dBShareAlbumBySharedId = CloudUtils.getDBShareAlbumBySharedId(string);
                if (dBShareAlbumBySharedId == null) {
                    if (DBShareAlbum.isNormalStatus(string2, optString)) {
                        Uri safeInsert = GalleryUtils.safeInsert(GalleryCloudUtils.SHARE_ALBUM_URI, DBShareAlbum.getContentValue(jSONObject2, dBShareAlbumBySharedId));
                        if (safeInsert != null) {
                            CloudUtils.updateLocalGroupIdInGroup(GalleryCloudUtils.SHARE_IMAGE_URI, string, safeInsert.getLastPathSegment(), "albumId");
                        }
                        insertCreatorIntoShareUser(jSONObject2);
                    }
                    z = false;
                } else if (!DBShareAlbum.isNormalStatus(string2, optString)) {
                    notifyKicked(string3, string);
                    CloudUtils.deleteShareAlbumInLocal(string, dBShareAlbumBySharedId.getId());
                    StringBuilder sb = new StringBuilder();
                    sb.append("delete share album:");
                    sb.append(string);
                    SyncLog.d("SyncSharerAll", sb.toString());
                    z = false;
                } else if (longAttributeFromJson > dBShareAlbumBySharedId.getServerTag()) {
                    GalleryUtils.safeUpdate(GalleryCloudUtils.SHARE_ALBUM_URI, DBShareAlbum.getContentValue(jSONObject2, dBShareAlbumBySharedId), "albumId = ? ", new String[]{string});
                }
                z = true;
            }
            if (z) {
                SyncSharerImageForAlbum syncSharerImageForAlbum = new SyncSharerImageForAlbum(this.mContext, this.mAccount, this.mExtendedAuthToken, string);
                SyncLog.d("SyncSharerAll", "sync share image when insertCreatorAndSyncImages start");
                syncSharerImageForAlbum.sync();
                SyncLog.d("SyncSharerAll", "sync share image when insertCreatorAndSyncImages end");
                if (Preference.getSyncShouldClearDataBase()) {
                    SyncLog.i("SyncSharerAll", "need clear data");
                    return;
                }
            }
            if (DBShareAlbum.isNormalStatus(string2, optString) && jSONObject3.has("isPublic") && jSONObject3.getBoolean("isPublic")) {
                AlbumShareOperations.requestPublicUrl(jSONObject2.getString("sharedId"), true);
            }
        }
    }

    private void handleImageList(JSONObject jSONObject) throws JSONException {
        JSONArray optJSONArray = jSONObject.optJSONArray("entries");
        for (int i = 0; i < optJSONArray.length(); i++) {
            SyncSharerImageForAlbum syncSharerImageForAlbum = new SyncSharerImageForAlbum(this.mContext, this.mAccount, this.mExtendedAuthToken, optJSONArray.getJSONObject(i).getString("sharedId"));
            SyncLog.d("SyncSharerAll", "sync share image when handleImageList start");
            syncSharerImageForAlbum.sync();
            SyncLog.d("SyncSharerAll", "sync share image when handleImageList end");
            if (Preference.getSyncShouldClearDataBase()) {
                SyncLog.i("SyncSharerAll", "need clear data");
                return;
            }
        }
    }

    private void handleUserList(JSONObject jSONObject) throws JSONException {
        JSONArray optJSONArray = jSONObject.optJSONArray("entries");
        for (int i = 0; i < optJSONArray.length(); i++) {
            JSONObject jSONObject2 = optJSONArray.getJSONObject(i);
            new SyncOwnerUserForAlbum(this.mContext, this.mAccount, this.mExtendedAuthToken, jSONObject2.getString("albumId")).handleDataJson(jSONObject2);
        }
    }

    private void insertCreatorIntoShareUser(JSONObject jSONObject) throws JSONException {
        SyncSharerUserForAlbum.insertCreatorIntoShareUser(jSONObject.getString("creatorId"), jSONObject.getString("sharedId"));
    }

    private void notifyKicked(String str, String str2) {
        CloudUtils.sendShareAlbumNotification(this.mContext, this.mContext.getString(R.string.album_share_kicked, new Object[]{this.mContext.getString(R.string.quotation, new Object[]{str})}), 2, null);
        CloudShareAlbumMediator.getInstance().onShareAlbumExited(str2);
    }

    /* access modifiers changed from: protected */
    public Uri getBaseUri() {
        return null;
    }

    /* access modifiers changed from: protected */
    public ArrayList<SyncTagItem> getCurrentSyncTag() {
        boolean z;
        ArrayList<SyncTagItem> currentSyncTag = super.getCurrentSyncTag();
        Iterator it = currentSyncTag.iterator();
        while (true) {
            if (!it.hasNext()) {
                z = false;
                break;
            }
            SyncTagItem syncTagItem = (SyncTagItem) it.next();
            if (GalleryCloudSyncTagUtils.shouldSyncTagValue(syncTagItem.syncTagType) && syncTagItem.currentValue == ((long) GalleryCloudSyncTagUtils.getInitSyncTagValue(syncTagItem.syncTagType))) {
                z = true;
                break;
            }
        }
        if (z) {
            Iterator it2 = currentSyncTag.iterator();
            while (it2.hasNext()) {
                SyncTagItem syncTagItem2 = (SyncTagItem) it2.next();
                if (GalleryCloudSyncTagUtils.shouldSyncTagValue(syncTagItem2.syncTagType)) {
                    syncTagItem2.currentValue = (long) GalleryCloudSyncTagUtils.getInitSyncTagValue(syncTagItem2.syncTagType);
                }
            }
        }
        return currentSyncTag;
    }

    /* access modifiers changed from: protected */
    public ArrayList<SyncTagItem> getSyncTagList() {
        ArrayList<SyncTagItem> arrayList = new ArrayList<>();
        arrayList.add(new SyncTagItem(4));
        arrayList.add(new SyncTagItem(3));
        arrayList.add(new SyncTagItem(5));
        arrayList.add(new SyncTagItem(2));
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public String getSyncTagSelection() {
        return GalleryCloudSyncTagUtils.getAccountSelections(this.mAccount);
    }

    /* access modifiers changed from: protected */
    public String getSyncUrl() {
        return SyncPull.getPullShareAll();
    }

    /* access modifiers changed from: protected */
    public String getTagColumnName() {
        return null;
    }

    /* access modifiers changed from: protected */
    public boolean handleResultAndShouldContinue(JSONObject jSONObject, ArrayList<SyncTagItem> arrayList) throws JSONException {
        Iterator it = arrayList.iterator();
        boolean z = false;
        while (it.hasNext()) {
            SyncTagItem syncTagItem = (SyncTagItem) it.next();
            String jsonTagOutput = GalleryCloudSyncTagUtils.getJsonTagOutput(syncTagItem.syncTagType);
            if (TextUtils.isEmpty(jsonTagOutput)) {
                StringBuilder sb = new StringBuilder();
                sb.append("get output tag is null, syncType:");
                sb.append(syncTagItem.syncTagType);
                SyncLog.e("SyncSharerAll", sb.toString());
                return false;
            } else if (jSONObject.has(jsonTagOutput)) {
                JSONObject jSONObject2 = jSONObject.getJSONObject(jsonTagOutput);
                boolean z2 = jSONObject2.getBoolean("lastPage");
                long longAttributeFromJson = CloudUtils.getLongAttributeFromJson(jSONObject2, "syncTag");
                if (jSONObject2.has("entries")) {
                    switch (syncTagItem.syncTagType) {
                        case 2:
                            handleUserList(jSONObject2);
                            break;
                        case 3:
                            handleAlbumList(jSONObject2);
                            break;
                        case 4:
                            handleAlbumList(jSONObject2);
                            break;
                        case 5:
                            handleImageList(jSONObject2);
                            break;
                        default:
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("can't handle this syncTag:");
                            sb2.append(syncTagItem.syncTagType);
                            SyncLog.i("SyncSharerAll", sb2.toString());
                            break;
                    }
                } else {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(jsonTagOutput);
                    sb3.append(" entries is null, may be is first sync, just save syncTag:");
                    sb3.append(jSONObject2);
                    SyncLog.d("SyncSharerAll", sb3.toString());
                }
                if (Preference.getSyncShouldClearDataBase()) {
                    SyncLog.i("SyncSharerAll", "need clear data");
                    return false;
                }
                if (longAttributeFromJson > syncTagItem.currentValue) {
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("update the syncTag:");
                    sb4.append(longAttributeFromJson);
                    SyncLog.d("SyncSharerAll", sb4.toString());
                    syncTagItem.serverValue = longAttributeFromJson;
                    updateSyncTag(syncTagItem);
                }
                if (z2) {
                    SyncLog.d("SyncSharerAll", "last page, break sync from server");
                    syncTagItem.shouldSync = false;
                } else {
                    z = true;
                }
            }
        }
        updateSyncInfo(jSONObject, arrayList);
        return z;
    }
}
