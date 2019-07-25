package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils.SyncTagItem;
import com.miui.gallery.cloud.HostManager.SyncPull;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.download.BatchDownloadManager;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.data.DBShareAlbum;
import com.miui.gallery.preference.GalleryPreferences.Sync;
import com.miui.gallery.provider.GalleryContract.ShareImage;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.UbiFocusUtils;
import com.miui.gallery.util.baby.SendNotificationUtilForSharedBabyAlbum;
import com.miui.gallery.util.deprecated.Preference;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

public final class SyncSharerImageForAlbum extends SyncCloudBase {
    private final String mShareAlbumId;

    public SyncSharerImageForAlbum(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, String str) {
        super(context, account, galleryExtendedAuthToken);
        this.mShareAlbumId = str;
    }

    /* access modifiers changed from: protected */
    public void appendParams(ArrayList<NameValuePair> arrayList, ArrayList<SyncTagItem> arrayList2) throws UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException {
        super.appendParams(arrayList, arrayList2);
        arrayList.add(new BasicNameValuePair("sharedAlbumId", this.mShareAlbumId));
    }

    /* access modifiers changed from: protected */
    public Uri getBaseUri() {
        return GalleryCloudUtils.SHARE_IMAGE_URI;
    }

    /* access modifiers changed from: protected */
    public List<DBImage> getCandidateItemsInAGroup(String str, String str2, String str3) {
        return CloudUtils.getCandidateItemsInAGroup(this.mContext, str, str2, str3, true);
    }

    /* access modifiers changed from: protected */
    public DBImage getItem(String str) {
        return CloudUtils.getItem(GalleryCloudUtils.SHARE_IMAGE_URI, this.mContext, "serverId", str);
    }

    /* access modifiers changed from: protected */
    public String getLocalGroupId(ContentValues contentValues) {
        return CloudUtils.getLocalGroupIdForSharerAlbum(this.mShareAlbumId);
    }

    /* access modifiers changed from: protected */
    public ArrayList<SyncTagItem> getSyncTagList() {
        ArrayList<SyncTagItem> arrayList = new ArrayList<>();
        arrayList.add(new SyncTagItem(8));
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public String getSyncTagSelection() {
        StringBuilder sb = new StringBuilder();
        sb.append("albumId = '");
        sb.append(this.mShareAlbumId);
        sb.append("'");
        return sb.toString();
    }

    /* access modifiers changed from: protected */
    public String getSyncUrl() {
        return SyncPull.getPullShareAlbumImage();
    }

    /* access modifiers changed from: protected */
    public String getTagColumnName() {
        return "serverTag";
    }

    /* access modifiers changed from: protected */
    public String handleNewImage(ContentValues contentValues, String str, String str2, JSONObject jSONObject) {
        if (!str2.equals("custom")) {
            return null;
        }
        contentValues.put("albumId", this.mShareAlbumId);
        String handleNewImage = super.handleNewImage(contentValues, str, str2, jSONObject);
        if (contentValues.getAsLong("serverTag") != null) {
            return handleNewImage;
        }
        SyncLog.e("SyncSharerImageForAlbum", "server tag should not be null");
        return handleNewImage;
    }

    /* access modifiers changed from: protected */
    public void handleUbiSubImage(JSONObject jSONObject, String str) throws JSONException {
        UbiFocusUtils.handleSubUbiImage(jSONObject, true, str);
    }

    /* access modifiers changed from: protected */
    public boolean isCreatedByMySelf(ContentValues contentValues) {
        String asString = contentValues.getAsString("creatorId");
        return !TextUtils.isEmpty(asString) && this.mAccount.name.equalsIgnoreCase(asString);
    }

    /* access modifiers changed from: protected */
    public void onNewImageSynced(ContentValues contentValues, String str) {
        Long asLong = contentValues.getAsLong("serverTag");
        if (asLong == null) {
            SyncLog.e("SyncSharerImageForAlbum", "server tag should not be null");
        } else if (Preference.sIsFirstSynced()) {
            if (!isCreatedByMySelf(contentValues) && belong2BabyAlbum(contentValues, true)) {
                DBShareAlbum dBShareAlbumBySharedId = CloudUtils.getDBShareAlbumBySharedId(this.mShareAlbumId);
                if (dBShareAlbumBySharedId != null) {
                    SendNotificationUtilForSharedBabyAlbum.getInstance().sendNotification(this.mShareAlbumId, Long.parseLong(dBShareAlbumBySharedId.getId()), dBShareAlbumBySharedId.getFileName(), true, asLong.longValue());
                }
            }
            if (Sync.isAutoDownload() && CloudControlStrategyHelper.getSyncStrategy().isAutoDownloadShare()) {
                BatchDownloadManager.getInstance().download(ContentUris.withAppendedId(ShareImage.SHARE_URI, Long.parseLong(str)));
            }
        }
    }

    /* access modifiers changed from: protected */
    public void updateLocalGroupIdInGroup(String str, ContentValues contentValues) {
    }
}
