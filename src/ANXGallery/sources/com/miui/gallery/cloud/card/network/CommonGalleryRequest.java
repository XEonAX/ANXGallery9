package com.miui.gallery.cloud.card.network;

import com.google.gson.JsonParseException;
import com.miui.gallery.net.BaseGalleryRequest;
import com.miui.gallery.net.base.ErrorCode;
import java.lang.reflect.Type;
import org.json.JSONObject;

public class CommonGalleryRequest extends BaseGalleryRequest {
    private Type mDataType;

    public CommonGalleryRequest(int i, String str, Type type) {
        super(i, str);
        this.mDataType = type;
    }

    /* access modifiers changed from: protected */
    public void onRequestSuccess(JSONObject jSONObject) throws Exception {
        if (jSONObject != null) {
            try {
                deliverResponse(fromJson(jSONObject.toString(), this.mDataType));
            } catch (JsonParseException e) {
                e.printStackTrace();
                deliverError(ErrorCode.PARSE_ERROR, e.getMessage(), jSONObject);
            } catch (Exception e2) {
                e2.printStackTrace();
                deliverError(ErrorCode.HANDLE_ERROR, e2.getMessage(), jSONObject);
            }
        } else {
            deliverError(ErrorCode.BODY_EMPTY, null, null);
        }
    }
}
