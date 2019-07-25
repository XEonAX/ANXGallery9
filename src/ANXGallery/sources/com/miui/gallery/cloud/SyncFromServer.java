package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils.SyncTagItem;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.cloud.base.RetryRequestHelper;
import com.miui.gallery.cloud.base.SyncTask;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.QueryHandler;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deprecated.Preference;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class SyncFromServer {
    protected Account mAccount;
    protected Context mContext;
    protected GalleryExtendedAuthToken mExtendedAuthToken;

    public SyncFromServer(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        this.mContext = context;
        this.mAccount = account;
        this.mExtendedAuthToken = galleryExtendedAuthToken;
    }

    public static ArrayList<SyncTagItem> getCurrentSyncTag(final ArrayList<SyncTagItem> arrayList, String str) {
        GalleryUtils.safeQuery(CloudUtils.getLimitUri(GalleryCloudSyncTagUtils.getUri(((SyncTagItem) arrayList.get(0)).syncTagType), 1), GalleryCloudSyncTagUtils.getSyncTagSelection(arrayList), str, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
            public Void handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToNext()) {
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        SyncTagItem syncTagItem = (SyncTagItem) it.next();
                        syncTagItem.currentValue = (long) GalleryCloudSyncTagUtils.getInitSyncTagValue(syncTagItem.syncTagType);
                    }
                } else {
                    for (int i = 0; i < arrayList.size(); i++) {
                        SyncTagItem syncTagItem2 = (SyncTagItem) arrayList.get(i);
                        syncTagItem2.currentValue = Math.max(cursor.getLong(i), (long) GalleryCloudSyncTagUtils.getInitSyncTagValue(((SyncTagItem) arrayList.get(i)).syncTagType));
                    }
                }
                return null;
            }
        });
        return arrayList;
    }

    /* access modifiers changed from: private */
    public final JSONObject getItemsList(ArrayList<SyncTagItem> arrayList, int i) throws ClientProtocolException, IOException, JSONException, URISyntaxException, IllegalBlockSizeException, BadPaddingException, GalleryMiCloudServerException {
        ArrayList arrayList2 = new ArrayList();
        if (arrayList != null) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                SyncTagItem syncTagItem = (SyncTagItem) it.next();
                if (syncTagItem.shouldSync) {
                    if (TextUtils.isEmpty(GalleryCloudSyncTagUtils.getJsonTagInput(syncTagItem.syncTagType))) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("get input tag is null, syncType:");
                        sb.append(syncTagItem.syncTagType);
                        SyncLog.e("SyncFromServer", sb.toString());
                        return null;
                    }
                    arrayList2.add(new BasicNameValuePair(GalleryCloudSyncTagUtils.getJsonTagInput(syncTagItem.syncTagType), Long.toString(syncTagItem.currentValue)));
                }
            }
            appendSyncInfo(arrayList2, arrayList);
        }
        appendParams(arrayList2, arrayList);
        if (i > 0) {
            arrayList2.add(new BasicNameValuePair("limit", Long.toString((long) i)));
        }
        return CloudUtils.getFromXiaomi(getSyncUrl(), arrayList2, this.mAccount, this.mExtendedAuthToken, 0, false);
    }

    /* access modifiers changed from: protected */
    public void appendParams(ArrayList<NameValuePair> arrayList, ArrayList<SyncTagItem> arrayList2) throws UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException {
    }

    /* access modifiers changed from: protected */
    public void appendSyncInfo(ArrayList<NameValuePair> arrayList, ArrayList<SyncTagItem> arrayList2) throws UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException {
        if (supportSyncInfo(arrayList2)) {
            SyncTagItem syncTagItem = (SyncTagItem) arrayList2.get(0);
            String str = (String) GalleryUtils.safeQuery(CloudUtils.getLimitUri(GalleryCloudSyncTagUtils.getUri(syncTagItem.syncTagType), 1), new String[]{GalleryCloudSyncTagUtils.getSyncInfoColumnName(syncTagItem.syncTagType)}, getSyncTagSelection(), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<String>() {
                public String handle(Cursor cursor) {
                    if (cursor != null && cursor.moveToNext()) {
                        return cursor.getString(0);
                    }
                    return null;
                }
            });
            if (str == null) {
                str = "";
            }
            arrayList.add(new BasicNameValuePair("syncExtraInfo", str));
        }
    }

    /* access modifiers changed from: protected */
    public abstract Uri getBaseUri();

    /* access modifiers changed from: protected */
    public ArrayList<SyncTagItem> getCurrentSyncTag() {
        return getCurrentSyncTag(getSyncTagList(), getSyncTagSelection());
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:21:0x0063  */
    public final long getLargestTagInLocalDB() {
        Cursor cursor = null;
        try {
            ContentResolver contentResolver = this.mContext.getContentResolver();
            Uri baseUri = getBaseUri();
            StringBuilder sb = new StringBuilder();
            sb.append(" Max( ");
            sb.append(getTagColumnName());
            sb.append(" ) ");
            Cursor query = contentResolver.query(baseUri, new String[]{sb.toString()}, null, null, null);
            if (query != null) {
                try {
                    if (query.moveToNext()) {
                        long j = query.getLong(0);
                        if (query != null) {
                            query.close();
                        }
                        return j;
                    }
                } catch (Throwable th) {
                    Cursor cursor2 = query;
                    th = th;
                    cursor = cursor2;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
            long initSyncTagValue = (long) GalleryCloudSyncTagUtils.getInitSyncTagValue(((SyncTagItem) getSyncTagList().get(0)).syncTagType);
            if (query != null) {
                query.close();
            }
            return initSyncTagValue;
        } catch (Throwable th2) {
            th = th2;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public int getSyncItemLimit() {
        return 100;
    }

    /* access modifiers changed from: protected */
    public abstract ArrayList<SyncTagItem> getSyncTagList();

    /* access modifiers changed from: protected */
    public abstract String getSyncTagSelection();

    /* access modifiers changed from: protected */
    public abstract String getSyncUrl();

    /* access modifiers changed from: protected */
    public abstract String getTagColumnName();

    /* access modifiers changed from: protected */
    public boolean handleDataJson(JSONObject jSONObject) throws JSONException {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean handleResultAndShouldContinue(JSONObject jSONObject, ArrayList<SyncTagItem> arrayList) throws JSONException {
        handleDataJson(jSONObject);
        updateSyncInfo(jSONObject, arrayList);
        return updateSyncTagAndShouldContinue(jSONObject, arrayList);
    }

    /* access modifiers changed from: protected */
    public void onSyncSuccess() {
    }

    /* access modifiers changed from: protected */
    public boolean supportSyncInfo(ArrayList<SyncTagItem> arrayList) {
        return GalleryCloudSyncTagUtils.hasSyncInfo(((SyncTagItem) arrayList.get(0)).syncTagType);
    }

    public final GallerySyncResult<JSONObject> sync() throws JSONException {
        GallerySyncResult<JSONObject> retryTask;
        SyncLog.d("SyncFromServer", "sync from server start");
        long currentTimeMillis = System.currentTimeMillis();
        while (true) {
            final ArrayList currentSyncTag = getCurrentSyncTag();
            if (SyncConditionManager.check(0) != 2) {
                retryTask = RetryRequestHelper.retryTask(new SyncTask<JSONObject>() {
                    public String getIdentifier() {
                        return SyncFromServer.this.getSyncUrl();
                    }

                    public GallerySyncResult<JSONObject> run() throws Exception {
                        return CheckResult.checkXMResultCode(SyncFromServer.this.getItemsList(currentSyncTag, SyncFromServer.this.getSyncItemLimit()), null, null);
                    }
                });
                JSONObject jSONObject = (JSONObject) retryTask.data;
                if (retryTask.code != GallerySyncCode.RESET_SYNC_TAG) {
                    if (retryTask.code == GallerySyncCode.OK) {
                        if (jSONObject != null) {
                            JSONObject optJSONObject = jSONObject.optJSONObject("data");
                            if (optJSONObject != null && optJSONObject.length() != 0) {
                                if (!handleResultAndShouldContinue(optJSONObject, currentSyncTag)) {
                                    break;
                                }
                            } else {
                                break;
                            }
                        } else {
                            break;
                        }
                    } else {
                        StringBuilder sb = new StringBuilder();
                        sb.append("sync from server error:");
                        sb.append(jSONObject);
                        SyncLog.e("SyncFromServer", sb.toString());
                        break;
                    }
                } else {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("sync from server error ");
                    sb2.append(GallerySyncCode.RESET_SYNC_TAG);
                    sb2.append(", need clear data");
                    SyncLog.e("SyncFromServer", sb2.toString());
                    Preference.setSyncShouldClearDataBase(true);
                    break;
                }
            } else {
                return new Builder().setCode(GallerySyncCode.CONDITION_INTERRUPTED).build();
            }
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append("sync from server finish: ");
        sb3.append(System.currentTimeMillis() - currentTimeMillis);
        SyncLog.d("SyncFromServer", sb3.toString());
        if (retryTask == null || retryTask.code != GallerySyncCode.OK) {
            HashMap hashMap = new HashMap();
            hashMap.put("className", getClass().getSimpleName());
            hashMap.put("result", retryTask.toString());
            GallerySamplingStatHelper.recordErrorEvent("Sync", "sync_error_class", hashMap);
        } else {
            onSyncSuccess();
        }
        return retryTask;
    }

    /* access modifiers changed from: protected */
    public void updateSyncInfo(String str, ArrayList<SyncTagItem> arrayList) {
        SyncTagItem syncTagItem = (SyncTagItem) arrayList.get(0);
        Uri uri = GalleryCloudSyncTagUtils.getUri(syncTagItem.syncTagType);
        String syncInfoColumnName = GalleryCloudSyncTagUtils.getSyncInfoColumnName(syncTagItem.syncTagType);
        ContentValues contentValues = new ContentValues();
        contentValues.put(syncInfoColumnName, str);
        GalleryUtils.safeUpdate(uri, contentValues, getSyncTagSelection(), null);
        GalleryCloudSyncTagUtils.postUpdateSyncTag(this.mContext, contentValues);
    }

    /* access modifiers changed from: protected */
    public void updateSyncInfo(JSONObject jSONObject, ArrayList<SyncTagItem> arrayList) {
        String optString = jSONObject.optString("syncExtraInfo");
        if (!TextUtils.isEmpty(optString) && supportSyncInfo(arrayList)) {
            updateSyncInfo(optString, arrayList);
        }
    }

    public void updateSyncTag(SyncTagItem syncTagItem) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(syncTagItem);
        updateSyncTag(arrayList);
    }

    /* access modifiers changed from: protected */
    public void updateSyncTag(ArrayList<SyncTagItem> arrayList) {
        Uri uri = GalleryCloudSyncTagUtils.getUri(((SyncTagItem) arrayList.get(0)).syncTagType);
        ContentValues contentValues = new ContentValues();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            SyncTagItem syncTagItem = (SyncTagItem) it.next();
            contentValues.put(GalleryCloudSyncTagUtils.getColumnName(syncTagItem.syncTagType), Long.valueOf(syncTagItem.serverValue));
        }
        GalleryUtils.safeUpdate(uri, contentValues, getSyncTagSelection(), null);
        GalleryCloudSyncTagUtils.postUpdateSyncTag(this.mContext, contentValues);
    }

    /* access modifiers changed from: protected */
    public boolean updateSyncTagAndShouldContinue(JSONObject jSONObject, ArrayList<SyncTagItem> arrayList) throws JSONException {
        boolean z = jSONObject.getBoolean("lastPage");
        long longAttributeFromJson = CloudUtils.getLongAttributeFromJson(jSONObject, "syncTag");
        if (z) {
            long largestTagInLocalDB = getLargestTagInLocalDB();
            longAttributeFromJson = (longAttributeFromJson > ((long) GalleryCloudSyncTagUtils.getInitSyncTagValue(((SyncTagItem) arrayList.get(0)).syncTagType)) || largestTagInLocalDB > ((long) GalleryCloudSyncTagUtils.getInitSyncTagValue(((SyncTagItem) arrayList.get(0)).syncTagType))) ? Math.max(longAttributeFromJson, largestTagInLocalDB) : 0;
        }
        if (longAttributeFromJson > ((SyncTagItem) arrayList.get(0)).currentValue) {
            StringBuilder sb = new StringBuilder();
            sb.append("update the syncTag:");
            sb.append(longAttributeFromJson);
            SyncLog.d("SyncFromServer", sb.toString());
            ((SyncTagItem) arrayList.get(0)).serverValue = longAttributeFromJson;
            updateSyncTag(arrayList);
        }
        if (!z) {
            return true;
        }
        SyncLog.d("SyncFromServer", "last page, break sync from server");
        return false;
    }
}
