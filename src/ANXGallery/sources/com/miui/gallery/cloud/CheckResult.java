package com.miui.gallery.cloud;

import com.miui.gallery.cloud.ServerErrorCode.GalleryErrorCodeItem;
import com.miui.gallery.cloud.SpaceFullHandler.SpaceFullListener;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.util.GallerySamplingStatHelper;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

public class CheckResult {
    private static GallerySyncResult checkErrorCode(int i, JSONObject jSONObject, RequestItemBase requestItemBase, SpaceFullListener spaceFullListener) throws JSONException {
        GalleryErrorCodeItem galleryErrorCodeItem = (GalleryErrorCodeItem) ServerErrorCode.sGalleryServerErrors.get(Integer.valueOf(i));
        Builder builder = new Builder();
        if (galleryErrorCodeItem == null) {
            HashMap hashMap = new HashMap();
            hashMap.put("function", "checkErrorCode");
            hashMap.put("unknow error", jSONObject == null ? "null" : jSONObject.toString());
            GallerySamplingStatHelper.recordErrorEvent("Sync", "check_result", hashMap);
            builder.setCode(GallerySyncCode.NOT_RETRY_ERROR);
        } else {
            if (galleryErrorCodeItem.errorHandler != null) {
                galleryErrorCodeItem.errorHandler.onError(jSONObject, requestItemBase, spaceFullListener);
            }
            JSONObject optJSONObject = jSONObject.optJSONObject("data");
            if (optJSONObject != null && optJSONObject.has("retryAfter")) {
                builder.setRetryAfter(CloudUtils.getLongAttributeFromJson(optJSONObject, "retryAfter"));
            }
            builder.setCode(galleryErrorCodeItem.result);
        }
        return builder.setData(jSONObject).build();
    }

    public static GallerySyncCode checkKSSThumbnailResult(int i) {
        if (!(i == 404 || i == 516)) {
            switch (i) {
                case 519:
                case 520:
                    break;
                default:
                    return GallerySyncCode.RETRY_ERROR;
            }
        }
        return GallerySyncCode.NOT_RETRY_ERROR;
    }

    public static GallerySyncResult<JSONObject> checkXMResultCode(JSONObject jSONObject, RequestItemBase requestItemBase, SpaceFullListener spaceFullListener) throws JSONException {
        Builder builder = new Builder();
        if (jSONObject == null) {
            HashMap hashMap = new HashMap();
            hashMap.put("function", "checkXMResultCode");
            hashMap.put("message", "result is null");
            GallerySamplingStatHelper.recordErrorEvent("Sync", "check_result", hashMap);
            builder.setCode(GallerySyncCode.NOT_RETRY_ERROR);
        } else if (!jSONObject.has("code")) {
            HashMap hashMap2 = new HashMap();
            hashMap2.put("function", "checkXMResultCode");
            hashMap2.put("message", "result has no code");
            GallerySamplingStatHelper.recordErrorEvent("Sync", "check_result", hashMap2);
            builder.setCode(GallerySyncCode.RETRY_ERROR).setRetryAfter(0);
        } else {
            builder.clone(checkErrorCode(jSONObject.getInt("code"), jSONObject, requestItemBase, spaceFullListener));
        }
        return builder.setData(jSONObject).build();
    }

    public static GallerySyncResult<JSONObject> checkXMResultCodeForFaceRequest(JSONObject jSONObject, RequestItemBase requestItemBase) throws JSONException {
        Builder builder = new Builder();
        if (jSONObject == null) {
            builder.setCode(GallerySyncCode.NOT_RETRY_ERROR);
        } else if (!jSONObject.has("code")) {
            builder.setCode(GallerySyncCode.RETRY_ERROR);
        } else {
            int i = jSONObject.getInt("code");
            if (i == 52000) {
                builder.setCode(GallerySyncCode.RESET_FACE_TAG);
            } else {
                builder.clone(checkErrorCode(i, jSONObject, requestItemBase, null));
            }
        }
        return builder.setData(jSONObject).build();
    }

    public static boolean isNotRetryCode(int i) {
        return i / 100 == 4;
    }

    public static int parseErrorCode(JSONObject jSONObject) throws JSONException {
        int i = jSONObject == null ? -6 : jSONObject.getInt("code");
        if (i != 0) {
            HashMap hashMap = new HashMap();
            hashMap.put("function", "parseErrorCode");
            hashMap.put("code", String.valueOf(i));
            hashMap.put("message", jSONObject == null ? "null" : jSONObject.toString());
            GallerySamplingStatHelper.recordErrorEvent("Sync", "check_result", hashMap);
        }
        return i;
    }
}
