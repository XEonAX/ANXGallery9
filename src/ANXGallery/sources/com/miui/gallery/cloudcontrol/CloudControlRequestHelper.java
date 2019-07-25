package com.miui.gallery.cloudcontrol;

import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.agreement.AgreementsUtils;
import com.miui.gallery.cloud.HostManager.CloudControl;
import com.miui.gallery.cloudcontrol.CloudControlRequest.Builder;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.RequestError;
import com.miui.gallery.preference.GalleryPreferences;
import com.miui.gallery.ui.AIAlbumStatusHelper;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.PrivacyAgreementUtils;
import com.miui.gallery.util.SyncUtil;
import java.util.Iterator;
import java.util.Map;

public class CloudControlRequestHelper {
    private Context mContext;

    public CloudControlRequestHelper(Context context) {
        this.mContext = context;
    }

    private void doPostJobs() {
        AIAlbumStatusHelper.doPostCloudControlJob();
    }

    private boolean execRequestSyncInternal(boolean z) {
        if (!PrivacyAgreementUtils.isCloudServiceAgreementEnable(this.mContext)) {
            Log.w("CloudControlRequestHelper", "Request failed: privacy agreement disabled");
            return false;
        } else if (!AgreementsUtils.isNetworkingAgreementAccepted()) {
            Log.e("CloudControlRequestHelper", "Request failed: CTA not confirmed.");
            return false;
        } else {
            try {
                CloudControlResponse cloudControlResponse = (CloudControlResponse) new Builder().setMethod(z ? 1002 : 1).setUrl(z ? CloudControl.getUrl() : CloudControl.getAnonymousUrl()).setSyncToken(GalleryPreferences.CloudControl.getSyncToken()).build().simpleExecuteSync();
                if (cloudControlResponse == null) {
                    handleError(ErrorCode.BODY_EMPTY, "Response is empty", "Response is empty", z);
                    GalleryPreferences.CloudControl.setLastRequestTime(System.currentTimeMillis());
                    return false;
                }
                handleResponse(cloudControlResponse);
                GalleryPreferences.CloudControl.setLastRequestSucceedTime(System.currentTimeMillis());
                GalleryPreferences.CloudControl.setLastRequestTime(System.currentTimeMillis());
                return true;
            } catch (RequestError e) {
                handleError(e.getErrorCode(), e.getMessage(), e.getResponseData(), z);
            } catch (Throwable th) {
                GalleryPreferences.CloudControl.setLastRequestTime(System.currentTimeMillis());
                throw th;
            }
        }
    }

    private int getRequestIntervalMinutes() {
        long lastRequestTime = GalleryPreferences.CloudControl.getLastRequestTime();
        if (lastRequestTime == 0) {
            return Integer.MAX_VALUE;
        }
        return (int) (((System.currentTimeMillis() - lastRequestTime) / 1000) / 60);
    }

    private void handleError(ErrorCode errorCode, String str, Object obj, boolean z) {
        String name = errorCode != null ? errorCode.name() : "UNKNOWN";
        Log.e("CloudControlRequestHelper", "Request failed, errorCode: %s, errorMessage: %s, responseData: %s, isLoggedIn: %b.", name, str, String.valueOf(obj), Boolean.valueOf(z));
        Map generatorCommonParams = GallerySamplingStatHelper.generatorCommonParams();
        generatorCommonParams.put("request_interval(minutes)", String.valueOf(getRequestIntervalMinutes()));
        generatorCommonParams.put("error_code", name);
        generatorCommonParams.put("error_message", str);
        generatorCommonParams.put("response", String.valueOf(obj));
        GallerySamplingStatHelper.recordErrorEvent("cloud_control", z ? "cloud_control_real_name_request_error" : "cloud_control_anonymous_request_error", generatorCommonParams);
    }

    private void handleResponse(CloudControlResponse cloudControlResponse) {
        if (MiscUtil.isValid(cloudControlResponse.getFeatureProfiles())) {
            boolean z = false;
            Iterator it = cloudControlResponse.getFeatureProfiles().iterator();
            while (it.hasNext()) {
                FeatureProfile featureProfile = (FeatureProfile) it.next();
                CloudControlManager.getInstance().insertToCache(featureProfile);
                if (CloudControlDBHelper.tryInsertToDB(this.mContext, featureProfile) == 0) {
                    z = true;
                    Log.e("CloudControlRequestHelper", "Persist error: %s", (Object) String.valueOf(featureProfile));
                }
            }
            if (z) {
                Map generatorCommonParams = GallerySamplingStatHelper.generatorCommonParams();
                generatorCommonParams.put("response", String.valueOf(cloudControlResponse));
                GallerySamplingStatHelper.recordErrorEvent("cloud_control", "cloud_control_persist_error", generatorCommonParams);
            }
        }
        if (!TextUtils.isEmpty(cloudControlResponse.getSyncToken())) {
            GalleryPreferences.CloudControl.setSyncToken(cloudControlResponse.getSyncToken());
        }
    }

    public boolean execRequestSync() {
        return execRequestSync(SyncUtil.existXiaomiAccount(this.mContext));
    }

    public boolean execRequestSync(boolean z) {
        boolean execRequestSyncInternal = execRequestSyncInternal(z);
        if (execRequestSyncInternal) {
            try {
                doPostJobs();
            } catch (Exception e) {
                Log.e("CloudControlRequestHelper", "Error occurred while executing post cloud control request job, %s", (Object) e);
            }
        }
        return execRequestSyncInternal;
    }
}
