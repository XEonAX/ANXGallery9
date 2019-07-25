package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils.SyncTagItem;
import com.miui.gallery.cloud.HostManager.Upgrade;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.RetryRequestHelper;
import com.miui.gallery.cloud.base.SyncTask;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deprecated.Preference;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Iterator;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

public class FetchSyncExtraInfoTask {
    protected Account mAccount;
    protected Context mContext;
    protected GalleryExtendedAuthToken mExtendedAuthToken;

    public FetchSyncExtraInfoTask(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        this.mContext = context;
        this.mAccount = account;
        this.mExtendedAuthToken = galleryExtendedAuthToken;
    }

    /* access modifiers changed from: private */
    public JSONObject callAPI(ArrayList<SyncTagItem> arrayList) throws ClientProtocolException, IOException, JSONException, URISyntaxException, IllegalBlockSizeException, BadPaddingException, GalleryMiCloudServerException {
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            SyncTagItem syncTagItem = (SyncTagItem) it.next();
            if (TextUtils.isEmpty(GalleryCloudSyncTagUtils.getJsonTagInput(syncTagItem.syncTagType))) {
                StringBuilder sb = new StringBuilder();
                sb.append("get input tag is null, syncType:");
                sb.append(syncTagItem.syncTagType);
                SyncLog.e("FetchSyncExtraInfoTask", sb.toString());
                return null;
            }
            arrayList2.add(new BasicNameValuePair(GalleryCloudSyncTagUtils.getJsonTagInput(syncTagItem.syncTagType), Long.toString(syncTagItem.currentValue)));
        }
        JSONObject fromXiaomi = CloudUtils.getFromXiaomi(getUrl(), arrayList2, this.mAccount, this.mExtendedAuthToken, 0, false);
        StringBuilder sb2 = new StringBuilder();
        sb2.append("allJson=");
        sb2.append(fromXiaomi);
        SyncLog.d("FetchSyncExtraInfoTask", sb2.toString());
        return fromXiaomi;
    }

    private ArrayList<SyncTagItem> getCurrentSyncTag() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new SyncTagItem(1));
        arrayList.add(new SyncTagItem(4));
        arrayList.add(new SyncTagItem(3));
        arrayList.add(new SyncTagItem(5));
        arrayList.add(new SyncTagItem(2));
        return SyncFromServer.getCurrentSyncTag(arrayList, GalleryCloudSyncTagUtils.getAccountSelections(this.mAccount));
    }

    /* access modifiers changed from: private */
    public String getUrl() {
        return Upgrade.getUpgradeUrl();
    }

    private void handleResult(JSONObject jSONObject) throws JSONException {
        JSONObject jSONObject2 = jSONObject.getJSONObject("data");
        String string = jSONObject2.getString("full");
        String string2 = jSONObject2.getString("share");
        String string3 = jSONObject2.getString("oneshare");
        ContentValues contentValues = new ContentValues();
        contentValues.put("syncInfo", string);
        contentValues.put("shareSyncInfo", string2);
        GalleryUtils.safeUpdate(GalleryCloudUtils.CLOUD_SETTING_URI, contentValues, GalleryCloudSyncTagUtils.getAccountSelections(this.mAccount), null);
        ContentValues contentValues2 = new ContentValues();
        contentValues2.put("syncInfo", string3);
        GalleryUtils.safeUpdate(GalleryCloudUtils.SHARE_ALBUM_URI, contentValues2, null, null);
        Preference.setSyncFetchSyncExtraInfoFromV2ToV3(false);
    }

    public final void run() throws ClientProtocolException, IOException, JSONException, URISyntaxException, IllegalBlockSizeException, BadPaddingException, GalleryMiCloudServerException {
        SyncLog.d("FetchSyncExtraInfoTask", "start");
        long currentTimeMillis = System.currentTimeMillis();
        final ArrayList currentSyncTag = getCurrentSyncTag();
        GallerySyncResult retryTask = RetryRequestHelper.retryTask(new SyncTask<JSONObject>() {
            public String getIdentifier() {
                return FetchSyncExtraInfoTask.this.getUrl();
            }

            public GallerySyncResult<JSONObject> run() throws Exception {
                return CheckResult.checkXMResultCode(FetchSyncExtraInfoTask.this.callAPI(currentSyncTag), null, null);
            }
        });
        JSONObject jSONObject = (JSONObject) retryTask.data;
        if (retryTask.code != GallerySyncCode.OK) {
            StringBuilder sb = new StringBuilder();
            sb.append("sync from server error:");
            sb.append(jSONObject);
            SyncLog.e("FetchSyncExtraInfoTask", sb.toString());
        } else {
            handleResult(jSONObject);
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("finish: ");
        sb2.append(System.currentTimeMillis() - currentTimeMillis);
        SyncLog.d("FetchSyncExtraInfoTask", sb2.toString());
    }
}
