package com.miui.gallery.cloud.baby;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.cloud.HostManager.Baby;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.cloud.RequestItemBase;
import com.miui.gallery.cloud.RequestOperationBase;
import com.miui.gallery.cloud.RequestOperationBase.Request;
import com.miui.gallery.cloud.RequestOperationBase.Request.Builder;
import com.miui.gallery.cloud.RetryOperation;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.data.DBCloud;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.QueryHandler;
import com.miui.gallery.util.SyncLog;
import java.util.ArrayList;
import org.json.JSONException;
import org.json.JSONObject;

public class SyncBabyInfoFromLocal {
    protected Account mAccount;
    protected Context mContext;
    protected GalleryExtendedAuthToken mExtendedAuthToken;
    /* access modifiers changed from: private */
    public ArrayList<RequestCloudItem> mUpdateBabyInfoItems = new ArrayList<>();

    private class UpdateBabyInfo extends RequestOperationBase {
        public UpdateBabyInfo(Context context) {
            super(context);
        }

        /* access modifiers changed from: protected */
        public Request buildRequest(Account account, RequestItemBase requestItemBase) throws Exception {
            RequestCloudItem requestCloudItem = (RequestCloudItem) requestItemBase;
            String serverId = requestCloudItem.dbCloud.getServerId();
            if (TextUtils.isEmpty(serverId)) {
                return null;
            }
            String updateBabyInfoUrl = Baby.getUpdateBabyInfoUrl(serverId);
            return new Builder().setMethod(2).setUrl(updateBabyInfoUrl).setPostData(new JSONObject().put("content", requestCloudItem.dbCloud.toJSONObject())).setRetryTimes(requestCloudItem.createRetryTimes).setNeedReRequest(requestItemBase.needReRequest).build();
        }

        /* access modifiers changed from: protected */
        public GallerySyncCode onPreRequest(RequestItemBase requestItemBase) {
            return !(requestItemBase instanceof RequestCloudItem) ? GallerySyncCode.NOT_RETRY_ERROR : super.onPreRequest(requestItemBase);
        }

        /* access modifiers changed from: protected */
        public void onRequestError(GallerySyncCode gallerySyncCode, RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
            if (gallerySyncCode != GallerySyncCode.OK) {
                requestItemBase.createRetryTimes++;
            }
        }

        /* access modifiers changed from: protected */
        public void onRequestSuccess(RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
            JSONObject optJSONObject = jSONObject.optJSONObject("content");
            if (optJSONObject == null) {
                SyncLog.e(getTag(), "response content null %s", jSONObject);
                return;
            }
            RequestCloudItem requestCloudItem = (RequestCloudItem) requestItemBase;
            ContentValues contentValuesForAllAndThumbNull = CloudUtils.getContentValuesForAllAndThumbNull(optJSONObject);
            synchronized (GalleryCloudUtils.CLOUD_URI) {
                CloudUtils.updateToLocalDBForSync(GalleryCloudUtils.CLOUD_URI, contentValuesForAllAndThumbNull, requestCloudItem.dbCloud);
            }
        }
    }

    public SyncBabyInfoFromLocal(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        this.mContext = context;
        this.mAccount = account;
        this.mExtendedAuthToken = galleryExtendedAuthToken;
    }

    /* access modifiers changed from: protected */
    public DBImage generateDBImage(Cursor cursor) {
        return new DBCloud(cursor);
    }

    public void sync() throws Exception {
        Uri uri = GalleryCloudUtils.CLOUD_URI;
        String[] projectionAll = CloudUtils.getProjectionAll();
        StringBuilder sb = new StringBuilder();
        sb.append(" not( peopleId is null or peopleId = '')  AND  ");
        sb.append(CloudUtils.photoLocalFlag_Synced);
        sb.append("  AND ");
        sb.append(CloudUtils.itemIsGroup);
        GalleryUtils.safeQuery(uri, projectionAll, sb.toString(), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
            public Void handle(Cursor cursor) {
                if (cursor != null) {
                    while (cursor.moveToNext()) {
                        DBImage generateDBImage = SyncBabyInfoFromLocal.this.generateDBImage(cursor);
                        String babyInfoJson = generateDBImage.getBabyInfoJson();
                        if (!TextUtils.isEmpty(babyInfoJson)) {
                            try {
                                JSONObject jSONObject = new JSONObject(babyInfoJson);
                                if (jSONObject.has("localFlag") && jSONObject.getInt("localFlag") != 0) {
                                    SyncBabyInfoFromLocal.this.mUpdateBabyInfoItems.add(new RequestCloudItem(0, generateDBImage));
                                }
                            } catch (JSONException unused) {
                            }
                        }
                    }
                }
                return null;
            }
        });
        if (this.mUpdateBabyInfoItems.size() > 0) {
            try {
                RetryOperation.doOperation(this.mContext, this.mAccount, this.mExtendedAuthToken, this.mUpdateBabyInfoItems, new UpdateBabyInfo(this.mContext));
            } catch (Exception unused) {
            }
        }
    }
}
