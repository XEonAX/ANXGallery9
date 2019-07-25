package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CloudUtils.SecretAlbumUtils;
import com.miui.gallery.cloud.SpaceFullHandler.SpaceFullListener;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.data.DBImage.SubUbiImage;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.Log2File;
import com.miui.gallery.util.SyncLog;
import com.xiaomi.micloudsdk.file.MiCloudFileRequestor;
import com.xiaomi.opensdk.exception.AuthenticationException;
import com.xiaomi.opensdk.exception.RetriableException;
import com.xiaomi.opensdk.exception.UnretriableException;
import com.xiaomi.opensdk.file.model.CommitParameter;
import com.xiaomi.opensdk.file.model.RequestUploadParameter;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class CloudGalleryRequestorBase extends MiCloudFileRequestor<RequestCloudItem> {
    protected Account mAccount;
    private final CloudUrlProvider mUrlProvider;

    public CloudGalleryRequestorBase(Account account, CloudUrlProvider cloudUrlProvider) {
        super(GalleryApp.sGetAndroidContext());
        this.mAccount = account;
        this.mUrlProvider = cloudUrlProvider;
    }

    private void addExtraParameters(Map<String, String> map, int i, boolean z, int i2) {
        if (i > 0) {
            map.put("retry", Integer.toString(i));
        }
        if (z) {
            map.put("needReRequest", String.valueOf(z));
        }
        if (i2 >= 0) {
            map.put("ubiIndex", String.valueOf(i2));
        }
    }

    private void addRetryParameters(Map<String, String> map, int i, boolean z) {
        addExtraParameters(map, i, z, -1);
    }

    private void addUbiParam(Map<String, String> map, RequestCloudItem requestCloudItem) {
        if (requestCloudItem.dbCloud.isUbiFocus()) {
            map.put("isUbiImage", String.valueOf(true));
        }
        if (requestCloudItem.dbCloud.isSubUbiFocus()) {
            map.put("ubiIndex", String.valueOf(requestCloudItem.dbCloud.getSubUbiIndex()));
        }
    }

    private void encodeSecretFiles(DBImage dBImage, ContentValues contentValues) {
        if (isSynced(contentValues)) {
            SecretAlbumUtils.encryptFiles(dBImage, contentValues);
        }
    }

    private static boolean isSynced(ContentValues contentValues) {
        return "custom".equalsIgnoreCase(contentValues.getAsString("serverStatus"));
    }

    private void putCommitResult(JSONObject jSONObject, RequestCloudItem requestCloudItem) throws JSONException {
        ContentValues contentValuesForAll = CloudUtils.getContentValuesForAll(jSONObject, requestCloudItem.dbCloud.isShareItem());
        putAlbumIdInValues(requestCloudItem, jSONObject, contentValuesForAll);
        if (requestCloudItem.isSecretItem()) {
            encodeSecretFiles(requestCloudItem.dbCloud, contentValuesForAll);
        }
        if (!requestCloudItem.dbCloud.isSubUbiFocus()) {
            updateLocalDBForSyncAndConnectUbi(requestCloudItem, contentValuesForAll);
            return;
        }
        CloudUtils.updateToLocalDBForSync(requestCloudItem.dbCloud.isShareItem() ? GalleryCloudUtils.SHARE_IMAGE_URI : GalleryCloudUtils.CLOUD_URI, contentValuesForAll, ((SubUbiImage) requestCloudItem.dbCloud).getUbiLocalId());
        JSONObject optJSONObject = jSONObject.getJSONObject("content").getJSONObject("ubiSubImageContentMap").optJSONObject(String.valueOf(requestCloudItem.dbCloud.getSubUbiIndex()));
        if (optJSONObject != null) {
            ContentValues contentValuesForAll2 = CloudUtils.getContentValuesForAll(optJSONObject, requestCloudItem.dbCloud.isShareItem());
            putAlbumIdInValues(requestCloudItem, optJSONObject, contentValuesForAll2);
            CloudUtils.updateToLocalDBForSync(requestCloudItem.dbCloud.getBaseUri(), contentValuesForAll2, requestCloudItem.dbCloud);
        }
    }

    private void updateLocalDBForSyncAndConnectUbi(RequestCloudItem requestCloudItem, ContentValues contentValues) throws JSONException {
        CloudUtils.updateToLocalDBForSync(requestCloudItem.dbCloud.getBaseUri(), contentValues, requestCloudItem.dbCloud);
        if (requestCloudItem.dbCloud.isUbiFocus()) {
            connectSubUbi(requestCloudItem);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void connectSubUbi(RequestCloudItem requestCloudItem);

    /* access modifiers changed from: protected */
    public abstract String getAlbumId(RequestCloudItem requestCloudItem);

    /* access modifiers changed from: protected */
    public Map<String, String> getCommitUploadParams(RequestCloudItem requestCloudItem, CommitParameter commitParameter) throws JSONException {
        HashMap hashMap = new HashMap();
        addRetryParameters(hashMap, requestCloudItem.commitRetryTimes, requestCloudItem.needReRequest);
        hashMap.put("data", getCommitUploadPostString(requestCloudItem, commitParameter));
        return hashMap;
    }

    /* access modifiers changed from: protected */
    public String getCommitUploadPostString(RequestCloudItem requestCloudItem, CommitParameter commitParameter) throws JSONException {
        return new JSONObject().put("kss", new JSONObject(commitParameter.getKssString())).toString();
    }

    /* access modifiers changed from: protected */
    public final String getCommitUploadURL(RequestCloudItem requestCloudItem, CommitParameter commitParameter) {
        return requestCloudItem.dbCloud.isSubUbiFocus() ? this.mUrlProvider.getCommitSubUbiUrl(this.mAccount.name, requestCloudItem.dbCloud.getUbiServerId(), requestCloudItem.dbCloud.getSubUbiIndex()) : this.mUrlProvider.getCommitUrl(this.mAccount.name, commitParameter.getUploadId());
    }

    /* access modifiers changed from: protected */
    public final String getCreateSubUbiUrl(String str, String str2, int i) {
        return this.mUrlProvider.getCreateSubUbiUrl(str, str2, i);
    }

    /* access modifiers changed from: protected */
    public final String getCreateUrl(String str, String str2) {
        return this.mUrlProvider.getCreateUrl(str, str2);
    }

    /* access modifiers changed from: protected */
    public abstract DBImage getItemByRequestId(String str, RequestCloudItem requestCloudItem);

    /* access modifiers changed from: protected */
    public Map<String, String> getRequestDownloadParams(RequestCloudItem requestCloudItem) {
        HashMap hashMap = new HashMap();
        addExtraParameters(hashMap, requestCloudItem.otherRetryTimes, requestCloudItem.needReRequest, (requestCloudItem.getDownloadType() != 3 || (!requestCloudItem.dbCloud.isUbiFocus() && !requestCloudItem.dbCloud.isSubUbiFocus())) ? -1 : requestCloudItem.dbCloud.getSubUbiIndex());
        return hashMap;
    }

    /* access modifiers changed from: protected */
    public final String getRequestDownloadURL(RequestCloudItem requestCloudItem) {
        return this.mUrlProvider.getRequestDownloadUrl(this.mAccount.name, requestCloudItem.dbCloud.getRequestId());
    }

    /* access modifiers changed from: protected */
    public Map<String, String> getRequestUploadParams(RequestCloudItem requestCloudItem, RequestUploadParameter requestUploadParameter) throws JSONException {
        HashMap hashMap = new HashMap();
        addRetryParameters(hashMap, requestCloudItem.createRetryTimes, requestCloudItem.needReRequest);
        addUbiParam(hashMap, requestCloudItem);
        hashMap.put("data", getRequestUploadPostString(requestCloudItem, requestUploadParameter));
        return hashMap;
    }

    /* access modifiers changed from: protected */
    public String getRequestUploadPostString(RequestCloudItem requestCloudItem, RequestUploadParameter requestUploadParameter) throws JSONException {
        JSONObject jSONObject = new JSONObject(requestUploadParameter.getKssString());
        requestCloudItem.dbCloud.setSha1(requestUploadParameter.getFileSHA1());
        JSONObject jSONObject2 = requestCloudItem.dbCloud.toJSONObject();
        jSONObject2.remove("creatorId");
        jSONObject2.remove("shareId");
        if (!TextUtils.isEmpty(requestCloudItem.dbCloud.getLocalFile())) {
            jSONObject2.put("isFrontCamera", ExifUtil.isFromFrontCamera(requestCloudItem.dbCloud.getLocalFile()));
        }
        jSONObject.put("content", jSONObject2);
        return jSONObject.toString();
    }

    /* access modifiers changed from: protected */
    public String getRequestUploadURL(RequestCloudItem requestCloudItem, RequestUploadParameter requestUploadParameter) {
        String albumId = getAlbumId(requestCloudItem);
        if (TextUtils.isEmpty(albumId)) {
            return null;
        }
        if (!requestCloudItem.dbCloud.isSubUbiFocus()) {
            return getCreateUrl(this.mAccount.name, albumId);
        }
        if (TextUtils.isEmpty(requestCloudItem.dbCloud.getUbiServerId()) || requestCloudItem.dbCloud.getSubUbiIndex() == -1) {
            return null;
        }
        return getCreateSubUbiUrl(this.mAccount.name, requestCloudItem.dbCloud.getUbiServerId(), requestCloudItem.dbCloud.getSubUbiIndex());
    }

    /* access modifiers changed from: protected */
    public abstract SpaceFullListener getSpaceFullListener();

    /* access modifiers changed from: protected */
    public RequestCloudItem handleCommitUploadResult(RequestCloudItem requestCloudItem, JSONObject jSONObject) throws UnretriableException, RetriableException, AuthenticationException {
        try {
            GallerySyncResult checkXMResultCode = CheckResult.checkXMResultCode(jSONObject, requestCloudItem, getSpaceFullListener());
            if (checkXMResultCode.code != GallerySyncCode.OK) {
                Log.d("CloudGalleryRequestorBase", "upload commit error %s", (Object) jSONObject);
                requestCloudItem.result = checkXMResultCode.code;
                requestCloudItem.commitRetryTimes++;
                return null;
            }
            putCommitResult(jSONObject.getJSONObject("data"), requestCloudItem);
            if (Log2File.getInstance().canLog()) {
                StringBuilder sb = new StringBuilder();
                sb.append("upload a pic:");
                sb.append(requestCloudItem.dbCloud.getFileName());
                Log2File.getInstance().flushLog("CloudGalleryRequestorBase", sb.toString(), null);
            }
            return requestCloudItem;
        } catch (JSONException e) {
            throw new UnretriableException((Throwable) e);
        }
    }

    /* access modifiers changed from: protected */
    public boolean handleRequestDownloadResultJson(RequestCloudItem requestCloudItem, JSONObject jSONObject) throws UnretriableException, RetriableException, AuthenticationException {
        try {
            GallerySyncResult checkXMResultCode = CheckResult.checkXMResultCode(jSONObject, requestCloudItem, getSpaceFullListener());
            if (checkXMResultCode.code == GallerySyncCode.OK) {
                return true;
            }
            requestCloudItem.result = checkXMResultCode.code;
            requestCloudItem.otherRetryTimes++;
            return false;
        } catch (JSONException e) {
            throw new UnretriableException((Throwable) e);
        }
    }

    /* access modifiers changed from: protected */
    public RequestCloudItem handleRequestUploadResultJson(RequestCloudItem requestCloudItem, JSONObject jSONObject) throws UnretriableException, RetriableException, AuthenticationException {
        try {
            GallerySyncResult checkXMResultCode = CheckResult.checkXMResultCode(jSONObject, requestCloudItem, getSpaceFullListener());
            boolean z = true;
            if (checkXMResultCode.code != GallerySyncCode.OK) {
                Log.d("CloudGalleryRequestorBase", "upload request error %s", (Object) jSONObject);
                requestCloudItem.result = checkXMResultCode.code;
                requestCloudItem.createRetryTimes++;
                return requestCloudItem;
            }
            JSONObject jSONObject2 = jSONObject.getJSONObject("data");
            JSONObject jSONObject3 = jSONObject2.getJSONObject("content");
            String parseRequestId = parseRequestId(jSONObject3, requestCloudItem);
            jSONObject2.put("upload_id", parseRequestId);
            String string = jSONObject3.getString("fileName");
            if (!string.equals(requestCloudItem.dbCloud.getFileName())) {
                StringBuilder sb = new StringBuilder();
                sb.append("create image name changed from:");
                sb.append(requestCloudItem.dbCloud.getFileName());
                sb.append(" to:");
                sb.append(string);
                SyncLog.d("CloudGalleryRequestorBase", sb.toString());
            }
            synchronized (requestCloudItem.dbCloud.getBaseUri()) {
                if (!requestCloudItem.dbCloud.isSubUbiFocus()) {
                    DBImage itemByRequestId = getItemByRequestId(parseRequestId, requestCloudItem);
                    if (itemByRequestId != null && !itemByRequestId.getId().equals(requestCloudItem.dbCloud.getId())) {
                        CloudUtils.deleteDirty(itemByRequestId);
                    }
                }
                new ContentValues();
                ContentValues contentValuesForAll = CloudUtils.getContentValuesForAll(jSONObject3, requestCloudItem.dbCloud.isShareItem());
                putAlbumIdInValues(requestCloudItem, jSONObject, contentValuesForAll);
                if (jSONObject2.has("kss") || !jSONObject2.has("fileExists") || !jSONObject2.getBoolean("fileExists")) {
                    z = false;
                    CloudUtils.updateToLocalDB(requestCloudItem.dbCloud.getBaseUri(), contentValuesForAll, requestCloudItem.dbCloud);
                } else {
                    if (requestCloudItem.isSecretItem()) {
                        encodeSecretFiles(requestCloudItem.dbCloud, contentValuesForAll);
                    }
                    updateLocalDBForSyncAndConnectUbi(requestCloudItem, contentValuesForAll);
                }
            }
            if (z) {
                return requestCloudItem;
            }
            return null;
        } catch (JSONException e) {
            throw new UnretriableException((Throwable) e);
        }
    }

    /* access modifiers changed from: protected */
    public abstract String parseRequestId(JSONObject jSONObject, RequestCloudItem requestCloudItem) throws JSONException;

    /* access modifiers changed from: protected */
    public void putAlbumIdInValues(RequestCloudItem requestCloudItem, JSONObject jSONObject, ContentValues contentValues) {
    }
}
