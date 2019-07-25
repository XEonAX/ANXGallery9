package com.xiaomi.micloudsdk.file;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.xiaomi.micloudsdk.exception.CloudServerException;
import com.xiaomi.micloudsdk.request.utils.Request;
import com.xiaomi.opensdk.exception.AuthenticationException;
import com.xiaomi.opensdk.exception.RetriableException;
import com.xiaomi.opensdk.exception.UnretriableException;
import com.xiaomi.opensdk.file.model.CommitParameter;
import com.xiaomi.opensdk.file.model.RequestUploadParameter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.client.ClientProtocolException;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class MiCloudFileRequestor<T> {
    public MiCloudFileRequestor(Context context) {
        Request.init(context);
    }

    private String getHttpResopnse(String str, Map<String, String> map, boolean z) throws UnretriableException, RetriableException, AuthenticationException {
        try {
            if (Log.isLoggable("MiCloudFileRequestor", 3)) {
                StringBuilder sb = new StringBuilder();
                sb.append("url:");
                sb.append(str);
                sb.append("\nparmas:");
                sb.append(map);
                Log.d("MiCloudFileRequestor", sb.toString());
            }
            String securePost = z ? Request.securePost(str, map) : Request.secureGet(str, map);
            if (Log.isLoggable("MiCloudFileRequestor", 3)) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("resultString:");
                sb2.append(securePost);
                Log.d("MiCloudFileRequestor", sb2.toString());
            }
            return securePost;
        } catch (UnsupportedEncodingException e) {
            Log.e("MiCloudFileRequestor", "requestServer error", e);
            StringBuilder sb3 = new StringBuilder();
            sb3.append("requestServer error:");
            sb3.append(e);
            throw new UnretriableException(sb3.toString());
        } catch (IllegalBlockSizeException e2) {
            Log.e("MiCloudFileRequestor", "requestServer error", e2);
            StringBuilder sb4 = new StringBuilder();
            sb4.append("requestServer error:");
            sb4.append(e2);
            throw new UnretriableException(sb4.toString());
        } catch (BadPaddingException e3) {
            Log.e("MiCloudFileRequestor", "requestServer error", e3);
            StringBuilder sb5 = new StringBuilder();
            sb5.append("requestServer error:");
            sb5.append(e3);
            throw new UnretriableException(sb5.toString());
        } catch (ClientProtocolException e4) {
            Log.e("MiCloudFileRequestor", "requestServer error", e4);
            StringBuilder sb6 = new StringBuilder();
            sb6.append("requestServer error:");
            sb6.append(e4);
            throw new UnretriableException(sb6.toString());
        } catch (IOException e5) {
            Log.e("MiCloudFileRequestor", "requestServer error", e5);
            if (RetriableException.isRetriableException(e5)) {
                StringBuilder sb7 = new StringBuilder();
                sb7.append("IOException:");
                sb7.append(e5);
                throw new RetriableException(sb7.toString(), 300000);
            }
            StringBuilder sb8 = new StringBuilder();
            sb8.append("requestServer error:");
            sb8.append(e5);
            throw new UnretriableException(sb8.toString());
        } catch (CloudServerException e6) {
            int statusCode = e6.getStatusCode();
            if (statusCode == 401 || statusCode == 403) {
                throw new AuthenticationException();
            } else if (statusCode == 500) {
                StringBuilder sb9 = new StringBuilder();
                sb9.append("IOException:");
                sb9.append(e6);
                throw new RetriableException(sb9.toString(), 300000);
            } else if (statusCode != 503) {
                StringBuilder sb10 = new StringBuilder();
                sb10.append("requestServer error:");
                sb10.append(e6);
                throw new UnretriableException(sb10.toString());
            } else {
                StringBuilder sb11 = new StringBuilder();
                sb11.append("IOException:");
                sb11.append(e6);
                throw new RetriableException(sb11.toString(), (long) e6.retryTime);
            }
        }
    }

    public JSONObject commitUpload(T t, CommitParameter commitParameter) throws RetriableException, UnretriableException, AuthenticationException {
        String commitUploadURL = getCommitUploadURL(t, commitParameter);
        if (!TextUtils.isEmpty(commitUploadURL)) {
            try {
                Map commitUploadParams = getCommitUploadParams(t, commitParameter);
                if (commitUploadParams != null) {
                    return new JSONObject(getHttpResopnse(commitUploadURL, commitUploadParams, true));
                }
                throw new UnretriableException("getCommitUploadParams() can't return null.");
            } catch (JSONException e) {
                StringBuilder sb = new StringBuilder();
                sb.append("Http 200 返回的不是JSON格式:");
                sb.append(e);
                throw new UnretriableException(sb.toString());
            } catch (JSONException e2) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("error in getCommitUploadParams():");
                sb2.append(e2);
                throw new UnretriableException(sb2.toString());
            }
        } else {
            throw new UnretriableException("commitUploadUrl is null or empty.");
        }
    }

    /* access modifiers changed from: protected */
    public abstract Map<String, String> getCommitUploadParams(T t, CommitParameter commitParameter) throws JSONException;

    /* access modifiers changed from: protected */
    public abstract String getCommitUploadURL(T t, CommitParameter commitParameter);

    /* access modifiers changed from: protected */
    public abstract Map<String, String> getRequestDownloadParams(T t) throws JSONException;

    /* access modifiers changed from: protected */
    public abstract String getRequestDownloadURL(T t);

    /* access modifiers changed from: protected */
    public abstract Map<String, String> getRequestUploadParams(T t, RequestUploadParameter requestUploadParameter) throws JSONException;

    /* access modifiers changed from: protected */
    public abstract String getRequestUploadURL(T t, RequestUploadParameter requestUploadParameter);

    /* access modifiers changed from: protected */
    public abstract T handleCommitUploadResult(T t, JSONObject jSONObject) throws UnretriableException, RetriableException, AuthenticationException;

    /* access modifiers changed from: protected */
    public abstract boolean handleRequestDownloadResultJson(T t, JSONObject jSONObject) throws UnretriableException, RetriableException, AuthenticationException;

    /* access modifiers changed from: protected */
    public abstract T handleRequestUploadResultJson(T t, JSONObject jSONObject) throws UnretriableException, RetriableException, AuthenticationException;

    public JSONObject requestDownload(T t) throws RetriableException, UnretriableException, AuthenticationException {
        String requestDownloadURL = getRequestDownloadURL(t);
        if (!TextUtils.isEmpty(requestDownloadURL)) {
            try {
                Map requestDownloadParams = getRequestDownloadParams(t);
                if (requestDownloadParams != null) {
                    return new JSONObject(getHttpResopnse(requestDownloadURL, requestDownloadParams, false));
                }
                throw new UnretriableException("getRequestDownloadParams() can't return null.");
            } catch (JSONException e) {
                StringBuilder sb = new StringBuilder();
                sb.append("Http 200 返回的不是JSON格式:");
                sb.append(e);
                throw new UnretriableException(sb.toString());
            } catch (JSONException e2) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("error in getRequestDownloadParams():");
                sb2.append(e2);
                throw new UnretriableException(sb2.toString());
            }
        } else {
            throw new UnretriableException("requestDownloadUrl is null or empty.");
        }
    }

    public JSONObject requestUpload(T t, RequestUploadParameter requestUploadParameter) throws RetriableException, UnretriableException, AuthenticationException {
        String requestUploadURL = getRequestUploadURL(t, requestUploadParameter);
        if (!TextUtils.isEmpty(requestUploadURL)) {
            try {
                Map requestUploadParams = getRequestUploadParams(t, requestUploadParameter);
                if (requestUploadParams != null) {
                    return new JSONObject(getHttpResopnse(requestUploadURL, requestUploadParams, true));
                }
                throw new UnretriableException("getRequestUploadParams() can't return null.");
            } catch (JSONException e) {
                StringBuilder sb = new StringBuilder();
                sb.append("Http 200 返回的不是JSON格式:");
                sb.append(e);
                throw new UnretriableException(sb.toString());
            } catch (JSONException e2) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("error in getRequestUploadParams():");
                sb2.append(e2);
                throw new UnretriableException(sb2.toString());
            }
        } else {
            throw new UnretriableException("requestUploadUrl is null or empty.");
        }
    }
}
