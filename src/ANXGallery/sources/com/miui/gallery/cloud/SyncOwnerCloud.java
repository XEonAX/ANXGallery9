package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils.SyncTagItem;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.download.BatchDownloadManager;
import com.miui.gallery.cloud.download.MicroBatchDownloadManager;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.preference.GalleryPreferences.Sync;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.Favorites;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.QueryHandler;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.UbiFocusUtils;
import com.miui.gallery.util.baby.SendNotificationUtilForSharedBabyAlbum;
import com.miui.gallery.util.deprecated.Preference;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class SyncOwnerCloud extends SyncCloudBase {
    public SyncOwnerCloud(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        super(context, account, galleryExtendedAuthToken);
    }

    /* access modifiers changed from: protected */
    public void appendParams(ArrayList<NameValuePair> arrayList, ArrayList<SyncTagItem> arrayList2) throws UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException {
        super.appendParams(arrayList, arrayList2);
        arrayList.add(new BasicNameValuePair("returnSystemAlbum", String.valueOf(true)));
    }

    /* access modifiers changed from: protected */
    public Uri getBaseUri() {
        return GalleryCloudUtils.CLOUD_URI;
    }

    /* access modifiers changed from: protected */
    public List<DBImage> getCandidateItemsInAGroup(String str, String str2, String str3) {
        return CloudUtils.getCandidateItemsInAGroup(this.mContext, str, str2, str3, false);
    }

    /* access modifiers changed from: protected */
    public DBImage getItem(String str) {
        return CloudUtils.getItemByServerID(this.mContext, str);
    }

    /* access modifiers changed from: protected */
    public String getLocalGroupId(ContentValues contentValues) {
        String asString = contentValues.getAsString("groupId");
        DBImage itemByServerID = CloudUtils.getItemByServerID(this.mContext, asString);
        if (itemByServerID == null && CloudTableUtils.isGroupWithoutRecord(Long.valueOf(asString).longValue())) {
            return String.valueOf(CloudTableUtils.getCloudIdForGroupWithoutRecord(Long.valueOf(asString).longValue()));
        }
        String str = null;
        if (itemByServerID == null) {
            Uri uri = CloudTableUtils.isCameraGroup(asString) ? GalleryUtils.safeInsert(GalleryCloudUtils.CLOUD_URI, CloudUtils.getCameraRecordValues()) : CloudTableUtils.isScreenshotGroup(asString) ? GalleryUtils.safeInsert(GalleryCloudUtils.CLOUD_URI, CloudUtils.getScreenshotsRecordValues()) : null;
            if (uri != null) {
                long parseId = ContentUris.parseId(uri);
                if (parseId > 0) {
                    HashMap hashMap = new HashMap();
                    hashMap.put("serverId", asString);
                    GallerySamplingStatHelper.recordCountEvent("Sync", "sync_try_insert_system_album", hashMap);
                    return String.valueOf(parseId);
                }
            }
        }
        if (itemByServerID != null) {
            str = itemByServerID.getId();
        }
        return str;
    }

    /* access modifiers changed from: protected */
    public ArrayList<SyncTagItem> getSyncTagList() {
        ArrayList<SyncTagItem> arrayList = new ArrayList<>();
        arrayList.add(new SyncTagItem(1));
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public String getSyncTagSelection() {
        return GalleryCloudSyncTagUtils.getAccountSelections(this.mAccount);
    }

    /* access modifiers changed from: protected */
    public String getTagColumnName() {
        return "serverTag";
    }

    /* access modifiers changed from: protected */
    public void handleFavoriteInfo(JSONObject jSONObject, String str) throws JSONException {
        if (jSONObject.has("isFavorite")) {
            boolean z = jSONObject.getBoolean("isFavorite");
            Boolean bool = (Boolean) GalleryUtils.safeQuery(Favorites.URI, new String[]{"_id"}, "sha1 = ?", new String[]{str}, (String) null, (QueryHandler<T>) new QueryHandler<Boolean>() {
                public Boolean handle(Cursor cursor) {
                    return Boolean.valueOf(cursor != null && cursor.getCount() > 0);
                }
            });
            ContentValues contentValues = new ContentValues();
            contentValues.put("isFavorite", Integer.valueOf(z ? 1 : 0));
            if (bool != null && bool.booleanValue()) {
                GalleryUtils.safeUpdate(Favorites.DELAY_NOTIFY_URI, contentValues, "sha1 = ?", new String[]{str});
            } else if (z) {
                contentValues.put("sha1", str);
                contentValues.put("dateFavorite", Long.valueOf(System.currentTimeMillis()));
                contentValues.put("source", Integer.valueOf(1));
                GalleryUtils.safeInsert(Favorites.DELAY_NOTIFY_URI, contentValues);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void handleUbiSubImage(JSONObject jSONObject, String str) throws JSONException {
        UbiFocusUtils.handleSubUbiImage(jSONObject, false, str);
    }

    /* access modifiers changed from: protected */
    public boolean isCreatedByMySelf(ContentValues contentValues) {
        String asString = contentValues.getAsString("creatorId");
        return TextUtils.isEmpty(asString) || this.mAccount.name.equalsIgnoreCase(asString);
    }

    /* access modifiers changed from: protected */
    public void onNewImageSynced(ContentValues contentValues, String str) {
        Long asLong = contentValues.getAsLong("serverTag");
        if (asLong == null) {
            SyncLog.e("SyncOwnerCloud", "server tag should not be null");
        } else if (Preference.sIsFirstSynced()) {
            if (!isCreatedByMySelf(contentValues)) {
                String asString = contentValues.getAsString("groupId");
                if (belong2BabyAlbum(contentValues, false)) {
                    DBImage item = CloudUtils.getItem(GalleryCloudUtils.CLOUD_URI, this.mContext, "serverId", asString);
                    if (item != null) {
                        SendNotificationUtilForSharedBabyAlbum.getInstance().sendNotification(asString, Long.parseLong(item.getId()), item.getFileName(), false, asLong.longValue());
                    }
                }
            }
            if (Sync.isAutoDownload()) {
                BatchDownloadManager.getInstance().download(ContentUris.withAppendedId(Cloud.CLOUD_URI, Long.parseLong(str)));
            }
        } else {
            MicroBatchDownloadManager.getInstance().download(ContentUris.withAppendedId(Cloud.CLOUD_URI, Long.parseLong(str)));
        }
    }

    /* access modifiers changed from: protected */
    public void updateLocalGroupIdInGroup(String str, ContentValues contentValues) {
        CloudUtils.updateLocalGroupIdInGroup(getBaseUri(), contentValues.getAsString("serverId"), str, "groupId");
    }
}
