package com.miui.gallery.net;

import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.BasicNetwork;
import com.android.volley.toolbox.HurlStack;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.RequestError;
import com.miui.gallery.net.json.JsonObjectRequest;
import com.miui.gallery.util.BaseNetworkUtils;
import com.xiaomi.micloudsdk.exception.CloudServerException;

class GalleryNetwork extends BasicNetwork {
    public GalleryNetwork() {
        super(new HurlStack());
    }

    public NetworkResponse performRequest(Request<?> request) throws VolleyError {
        String str;
        if (BaseNetworkUtils.isNetworkConnected()) {
            int method = request.getMethod();
            if (method < 1001) {
                return super.performRequest(request);
            }
            try {
                if (request instanceof JsonObjectRequest) {
                    JsonObjectRequest jsonObjectRequest = (JsonObjectRequest) request;
                    if (method == 1001) {
                        str = com.xiaomi.micloudsdk.request.utils.Request.secureGet(request.getUrl(), jsonObjectRequest.getParams());
                    } else if (method == 1002) {
                        str = com.xiaomi.micloudsdk.request.utils.Request.securePost(request.getUrl(), jsonObjectRequest.getParams());
                    } else {
                        StringBuilder sb = new StringBuilder();
                        sb.append("No such method ");
                        sb.append(method);
                        throw new VolleyError(sb.toString());
                    }
                    return new NetworkResponse(str.getBytes());
                }
                throw new VolleyError("Not support this request type");
            } catch (CloudServerException e) {
                throw new VolleyError((Throwable) e);
            } catch (Exception e2) {
                throw new VolleyError((Throwable) e2);
            }
        } else {
            throw new RequestError(ErrorCode.NETWORK_NOT_CONNECTED, "Network not connected.", null);
        }
    }
}
