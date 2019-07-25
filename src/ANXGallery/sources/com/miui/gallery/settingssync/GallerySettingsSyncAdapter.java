package com.miui.gallery.settingssync;

import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.agreement.AgreementsUtils;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.HostManager.Setting;
import com.miui.gallery.net.BaseGalleryRequest;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.RequestError;
import com.miui.gallery.settingssync.GallerySettingsSyncContract.Model;
import com.miui.gallery.settingssync.GallerySettingsSyncContract.SyncAdapter;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.PrivacyAgreementUtils;
import com.miui.gallery.util.SyncUtil;
import org.json.JSONObject;

public class GallerySettingsSyncAdapter implements SyncAdapter {
    private Context mContext;
    private Model mModel;

    private static class GallerySettingDownloadRequest extends BaseGalleryRequest {
        GallerySettingDownloadRequest() {
            super(1001, Setting.getSyncUrl());
        }

        /* access modifiers changed from: protected */
        public void onRequestSuccess(JSONObject jSONObject) throws Exception {
            deliverResponse(jSONObject);
        }
    }

    private static class GallerySettingUploadRequest extends BaseGalleryRequest {
        GallerySettingUploadRequest(JSONObject jSONObject) {
            super(1002, Setting.getSyncUrl());
            addParam("data", jSONObject.toString());
        }

        public void onRequestError(ErrorCode errorCode, String str, Object obj) {
            if (errorCode == ErrorCode.BODY_EMPTY) {
                deliverResponse(Boolean.valueOf(true));
                return;
            }
            deliverError(errorCode, str, obj);
        }

        /* access modifiers changed from: protected */
        public void onRequestSuccess(JSONObject jSONObject) throws Exception {
            Log.w("GallerySettingsSyncAdapter", "No data is expected here, what are you [%s]", jSONObject);
            deliverResponse(Boolean.valueOf(true));
        }
    }

    public GallerySettingsSyncAdapter(Context context, Model model) {
        this.mContext = context;
        this.mModel = model;
    }

    private boolean doDownload() {
        JSONObject jSONObject = null;
        try {
            Object[] executeSync = new GallerySettingDownloadRequest().executeSync();
            if (executeSync != null && executeSync.length > 0 && (executeSync[0] instanceof JSONObject)) {
                jSONObject = (JSONObject) executeSync[0];
            }
        } catch (RequestError e) {
            Log.e("GallerySettingsSyncAdapter", "Get setting failed, %s", (Object) e);
        }
        if (jSONObject != null) {
            return this.mModel.onDownloadSettings(jSONObject);
        }
        Log.w("GallerySettingsSyncAdapter", "No syncable settings found to update");
        return true;
    }

    private boolean doUpload() {
        JSONObject uploadSettings = this.mModel.getUploadSettings();
        if (uploadSettings == null) {
            Log.w("GallerySettingsSyncAdapter", "No syncable settings found to upload");
            return true;
        }
        try {
            Object[] executeSync = new GallerySettingUploadRequest(uploadSettings).executeSync();
            if (executeSync != null && executeSync.length > 0 && (executeSync[0] instanceof Boolean)) {
                return ((Boolean) executeSync[0]).booleanValue();
            }
        } catch (RequestError e) {
            Log.e("GallerySettingsSyncAdapter", "Post setting failed, %s", (Object) e);
        }
        return false;
    }

    public void performSync(Bundle bundle) {
        if (!AgreementsUtils.isNetworkingAgreementAccepted()) {
            Log.e("GallerySettingsSyncAdapter", "Sync settings failed: CTA not confirmed");
        } else if (!CloudUtils.checkAccount(null, true, null)) {
            Log.e("GallerySettingsSyncAdapter", "Sync settings failed: check account failed");
        } else if (!PrivacyAgreementUtils.isCloudServiceAgreementEnable(GalleryApp.sGetAndroidContext())) {
            Log.e("GallerySettingsSyncAdapter", "Sync settings failed: cloud service agreement disabled");
        } else if (!SyncUtil.isGalleryCloudSyncable(this.mContext)) {
            Log.e("GallerySettingsSyncAdapter", "Sync settings failed: sync off");
        } else {
            if (this.mModel.isDirty()) {
                boolean doUpload = doUpload();
                if (doUpload) {
                    this.mModel.markDirty(false);
                }
                Log.d("GallerySettingsSyncAdapter", "Upload settings result %s", (Object) Boolean.valueOf(doUpload));
            } else {
                Log.d("GallerySettingsSyncAdapter", "Download settings result %s", (Object) Boolean.valueOf(doDownload()));
            }
        }
    }
}
