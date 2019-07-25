package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.cloud.HostManager.ShareAlbum;
import com.miui.gallery.cloud.RequestOperationBase.Request;
import com.miui.gallery.cloud.RequestOperationBase.Request.Builder;
import com.miui.gallery.cloud.baby.BabyAlbumUtils;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.data.DBShareAlbum;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.SyncLog;
import java.util.ArrayList;
import java.util.Locale;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONObject;

public class EditShareAlbum extends RequestOperationBase {
    public EditShareAlbum(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestItemBase requestItemBase) throws Exception {
        DBShareAlbum dBShareAlbum = ((RequestSharerAlbumItem) requestItemBase).mDBItem;
        String editAlbumUrl = ShareAlbum.getEditAlbumUrl();
        JSONObject jSONObject = new JSONObject(dBShareAlbum.getBabyInfoJson());
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("sharedAlbumId", dBShareAlbum.getAlbumId()));
        arrayList.add(new BasicNameValuePair(BabyAlbumUtils.BABY_AUTO_UPDATE, String.valueOf(jSONObject.getBoolean(BabyAlbumUtils.BABY_AUTO_UPDATE))));
        arrayList.add(new BasicNameValuePair(BabyAlbumUtils.BABY_PEOPLE_ID, dBShareAlbum.getPeopleId()));
        return new Builder().setMethod(2).setUrl(editAlbumUrl).setParams(arrayList).setRetryTimes(requestItemBase.otherRetryTimes).setNeedReRequest(requestItemBase.needReRequest).build();
    }

    /* access modifiers changed from: protected */
    public GallerySyncCode onPreRequest(RequestItemBase requestItemBase) {
        if (!(requestItemBase instanceof RequestSharerAlbumItem)) {
            SyncLog.e("EditShareAlbum", "requestItem not instanceof RequestSharerAlbumItem!");
            return GallerySyncCode.NOT_RETRY_ERROR;
        }
        String editedColumns = ((RequestSharerAlbumItem) requestItemBase).mDBItem.getEditedColumns();
        if (!TextUtils.isEmpty(editedColumns) && editedColumns.contains(GalleryCloudUtils.transformToEditedColumnsElement(25))) {
            return GallerySyncCode.OK;
        }
        SyncLog.e("EditShareAlbum", "editedColumns %s not supported!", editedColumns);
        return GallerySyncCode.NOT_RETRY_ERROR;
    }

    /* access modifiers changed from: protected */
    public void onRequestError(GallerySyncCode gallerySyncCode, RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
        if (gallerySyncCode != GallerySyncCode.OK) {
            requestItemBase.otherRetryTimes++;
        }
    }

    /* access modifiers changed from: protected */
    public void onRequestSuccess(RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
        DBShareAlbum dBShareAlbum = ((RequestSharerAlbumItem) requestItemBase).mDBItem;
        ContentValues contentValues = new ContentValues();
        contentValues.putNull("editedColumns");
        GalleryUtils.safeUpdate(GalleryCloudUtils.SHARE_ALBUM_URI, contentValues, String.format(Locale.US, "%s=%s", new Object[]{"_id", dBShareAlbum.getId()}), null);
        SyncLog.d("EditShareAlbum", "edit share album successfully. album name: %s", (Object) dBShareAlbum.getFileName());
    }
}
