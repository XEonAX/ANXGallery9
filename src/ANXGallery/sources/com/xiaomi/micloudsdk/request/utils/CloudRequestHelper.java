package com.xiaomi.micloudsdk.request.utils;

import android.text.TextUtils;
import android.util.Log;
import com.xiaomi.micloudsdk.exception.CipherException;
import com.xiaomi.micloudsdk.exception.CloudServerException;
import com.xiaomi.micloudsdk.stat.MiCloudStatManager;
import com.xiaomi.micloudsdk.utils.AESCoder;
import com.xiaomi.micloudsdk.utils.CryptCoder;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.zip.GZIPInputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.StringEntity;
import org.keyczar.Keyczar;

public class CloudRequestHelper {
    static InputStream decodeGZip(HttpResponse httpResponse) throws IllegalStateException, IOException {
        Header firstHeader = httpResponse.getFirstHeader("Content-Encoding");
        return (firstHeader == null || !firstHeader.getValue().equalsIgnoreCase("gzip")) ? httpResponse.getEntity().getContent() : new GZIPInputStream(httpResponse.getEntity().getContent());
    }

    static String decodeGZipToString(HttpResponse httpResponse) throws IllegalStateException, IOException {
        InputStream decodeGZip = decodeGZip(httpResponse);
        try {
            return inputStreamToString(decodeGZip);
        } finally {
            if (decodeGZip != null) {
                decodeGZip.close();
            }
        }
    }

    public static String encodeData(String str, String str2, String str3) {
        if (TextUtils.isEmpty(str2)) {
            throw new IllegalArgumentException("security is empty.");
        } else if (TextUtils.isEmpty(str3)) {
            return "";
        } else {
            try {
                return getCryptCoder(str, str2).encrypt(str3);
            } catch (CipherException e) {
                StringBuilder sb = new StringBuilder();
                sb.append("encodeData failed:");
                sb.append(str3);
                Log.e("CloudRequestHelper", sb.toString(), e);
                return "";
            }
        }
    }

    private static HttpResponse excuteInternal(HttpRequestBase httpRequestBase) throws IOException {
        try {
            long currentTimeMillis = System.currentTimeMillis();
            HttpResponse execute = HttpUtils.getHttpClient().execute(httpRequestBase);
            long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
            long j = 0;
            if (execute.getEntity() != null) {
                j = execute.getEntity().getContentLength();
            }
            MiCloudStatManager.getInstance().addHttpEvent(httpRequestBase.getURI().toString(), currentTimeMillis2, j, execute.getStatusLine().getStatusCode(), null);
            return execute;
        } catch (IOException e) {
            MiCloudStatManager.getInstance().addHttpEvent(httpRequestBase.getURI().toString(), -1, 0, -1, e.getClass().getSimpleName());
            throw e;
        }
    }

    public static CryptCoder getCryptCoder(String str, String str2) {
        return isV4Url(str) ? new CloudAESWithIVCoder(str2) : new AESCoder(str2);
    }

    private static String httpGetRequest(String str, Header header, CryptCoder cryptCoder, int i) throws IOException, CloudServerException {
        HttpGet httpGet = new HttpGet(str);
        if (header != null) {
            httpGet.setHeader(header);
        }
        httpGet.setHeader("Accept", "application/json");
        httpGet.setHeader("Accept-Encoding", "gzip");
        if (i > 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(i);
            sb.append("");
            httpGet.setHeader("X-XIAOMI-REDIRECT-COUNT", sb.toString());
        }
        httpGet.setHeader("X-XIAOMI-SUPPORT-REDIRECT", "true, https");
        if (Log.isLoggable("CloudRequestHelper", 3)) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("http get url : ");
            sb2.append(str);
            Log.d("CloudRequestHelper", sb2.toString());
            StringBuilder sb3 = new StringBuilder();
            sb3.append("http get cookies : ");
            sb3.append(header.toString());
            Log.d("CloudRequestHelper", sb3.toString());
        }
        HttpResponse excuteInternal = excuteInternal(httpGet);
        int statusCode = excuteInternal.getStatusLine().getStatusCode();
        if (statusCode == 200) {
            try {
                String decrypt = cryptCoder.decrypt(decodeGZipToString(excuteInternal));
                String checkRedirect = CloudUtils.checkRedirect(decrypt, i);
                return !TextUtils.isEmpty(checkRedirect) ? httpGetRequest(checkRedirect, header, cryptCoder, i + 1) : decrypt;
            } catch (CipherException e) {
                Log.e("CloudRequestHelper", "MiCloudServerException", e);
                throw new CloudServerException(0, excuteInternal);
            }
        } else if (CloudServerException.isMiCloudServerException(statusCode)) {
            StringBuilder sb4 = new StringBuilder();
            sb4.append("MiCloudServerException: ");
            sb4.append(statusCode);
            sb4.append(" ");
            sb4.append(excuteInternal.getStatusLine());
            Log.e("CloudRequestHelper", sb4.toString());
            throw new CloudServerException(statusCode, excuteInternal);
        } else {
            StringBuilder sb5 = new StringBuilder();
            sb5.append("Server error: ");
            sb5.append(statusCode);
            sb5.append(" ");
            sb5.append(excuteInternal.getStatusLine());
            Log.e("CloudRequestHelper", sb5.toString());
            StringBuilder sb6 = new StringBuilder();
            sb6.append("Server error: ");
            sb6.append(statusCode);
            sb6.append(" ");
            sb6.append(excuteInternal.getStatusLine());
            throw new IOException(sb6.toString());
        }
    }

    public static String httpGetRequestWithDecodeData(String str, Header header, CryptCoder cryptCoder) throws CloudServerException, IOException {
        String httpGetRequest = httpGetRequest(str, header, cryptCoder, 0);
        if (Log.isLoggable("CloudRequestHelper", 3)) {
            Log.d("CloudRequestHelper", httpGetRequest);
        }
        return httpGetRequest;
    }

    public static String httpPostJSONRequestWithDecodeData(String str, StringEntity stringEntity, Header header, CryptCoder cryptCoder) throws CloudServerException, IOException {
        String httpPostRequest = httpPostRequest(str, stringEntity, "application/json", header, cryptCoder, 0);
        if (Log.isLoggable("CloudRequestHelper", 3)) {
            Log.d("CloudRequestHelper", httpPostRequest);
        }
        return httpPostRequest;
    }

    private static String httpPostRequest(String str, HttpEntity httpEntity, String str2, Header header, CryptCoder cryptCoder, int i) throws IOException, CloudServerException {
        HttpPost httpPost = new HttpPost(str);
        if (httpEntity != null) {
            httpPost.setEntity(httpEntity);
        }
        if (!TextUtils.isEmpty(str2)) {
            httpPost.setHeader("Content-Type", str2);
        }
        if (header != null) {
            httpPost.setHeader(header);
        }
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Accept-Encoding", "gzip");
        if (i > 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(i);
            sb.append("");
            httpPost.setHeader("X-XIAOMI-REDIRECT-COUNT", sb.toString());
        }
        httpPost.setHeader("X-XIAOMI-SUPPORT-REDIRECT", "true, https");
        if (Log.isLoggable("CloudRequestHelper", 3)) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("http post url : ");
            sb2.append(str);
            Log.d("CloudRequestHelper", sb2.toString());
            StringBuilder sb3 = new StringBuilder();
            sb3.append("http post cookies : ");
            sb3.append(header.toString());
            Log.d("CloudRequestHelper", sb3.toString());
        }
        HttpResponse excuteInternal = excuteInternal(httpPost);
        int statusCode = excuteInternal.getStatusLine().getStatusCode();
        if (statusCode == 200) {
            try {
                String decrypt = cryptCoder.decrypt(decodeGZipToString(excuteInternal));
                String checkRedirect = CloudUtils.checkRedirect(decrypt, i);
                if (TextUtils.isEmpty(checkRedirect)) {
                    return decrypt;
                }
                return httpPostRequest(checkRedirect, httpEntity, str2, header, cryptCoder, i + 1);
            } catch (CipherException e) {
                Log.e("CloudRequestHelper", "MiCloudServerException", e);
                throw new CloudServerException(0, excuteInternal);
            }
        } else if (CloudServerException.isMiCloudServerException(statusCode)) {
            StringBuilder sb4 = new StringBuilder();
            sb4.append("MiCloudServerException: ");
            sb4.append(statusCode);
            sb4.append(" ");
            sb4.append(excuteInternal.getStatusLine());
            Log.e("CloudRequestHelper", sb4.toString());
            throw new CloudServerException(statusCode, excuteInternal);
        } else {
            StringBuilder sb5 = new StringBuilder();
            sb5.append("Server error: ");
            sb5.append(statusCode);
            sb5.append(" ");
            sb5.append(excuteInternal.getStatusLine());
            Log.e("CloudRequestHelper", sb5.toString());
            StringBuilder sb6 = new StringBuilder();
            sb6.append("Server error: ");
            sb6.append(statusCode);
            sb6.append(" ");
            sb6.append(excuteInternal.getStatusLine());
            throw new IOException(sb6.toString());
        }
    }

    public static String httpPostRequestWithDecodeData(String str, UrlEncodedFormEntity urlEncodedFormEntity, Header header, CryptCoder cryptCoder) throws CloudServerException, IOException {
        String httpPostRequest = httpPostRequest(str, urlEncodedFormEntity, urlEncodedFormEntity.getContentType().getValue(), header, cryptCoder, 0);
        if (Log.isLoggable("CloudRequestHelper", 3)) {
            Log.d("CloudRequestHelper", httpPostRequest);
        }
        return httpPostRequest;
    }

    public static String inputStreamToString(InputStream inputStream) throws IOException {
        StringBuffer stringBuffer = new StringBuffer();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, Keyczar.DEFAULT_ENCODING));
        char[] cArr = new char[2048];
        while (true) {
            int read = bufferedReader.read(cArr, 0, 2048);
            if (read == -1) {
                return stringBuffer.toString();
            }
            stringBuffer.append(cArr, 0, read);
        }
    }

    public static boolean isV4Url(String str) {
        return str.indexOf("/v4") != -1;
    }
}
