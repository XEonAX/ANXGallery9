package com.xiaomi.micloudsdk.request.utils;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;
import com.xiaomi.micloudsdk.data.ExtendedAuthToken;
import com.xiaomi.micloudsdk.exception.CipherException;
import com.xiaomi.micloudsdk.exception.CloudServerException;
import com.xiaomi.micloudsdk.provider.GdprUtils;
import com.xiaomi.micloudsdk.request.utils.HttpUtils.HttpMethod;
import com.xiaomi.micloudsdk.request.utils.RequestConstants.URL;
import com.xiaomi.micloudsdk.utils.CloudCoder;
import com.xiaomi.micloudsdk.utils.CryptCoder;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.Header;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.entity.StringEntity;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;
import org.keyczar.Keyczar;

public class Request {
    private static Context sContext;
    private static String sRegion;
    private static RequestEnv sRequestEnv = new DefaultRequestEnv();

    public interface RequestEnv {
        String getAccountName();

        String getUserAgent();

        void invalidateAuthToken();

        ExtendedAuthToken queryAuthToken();

        String queryEncryptedAccountName();
    }

    public static void addFilterTagsToParams(String str, Map<String, String> map, String str2, Set<String> set, long j) throws UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException {
        String str3;
        String str4 = str;
        String str5 = str2;
        ArrayList arrayList = new ArrayList();
        for (Entry entry : map.entrySet()) {
            arrayList.add(new BasicNameValuePair((String) entry.getKey(), (String) entry.getValue()));
        }
        StringBuilder sb = new StringBuilder();
        StringBuilder sb2 = new StringBuilder();
        int i = 0;
        for (String str6 : set) {
            if (Long.parseLong(str6) > j) {
                if (i < 100) {
                    if (sb2.length() > 0) {
                        sb2.append(",");
                    }
                    sb2.append(str6);
                    i++;
                    if (!(i % 10 == 0 || i == set.size())) {
                    }
                }
                String str7 = "filterTag";
                if (sb.length() == 0) {
                    str3 = sb2.toString();
                } else {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(sb);
                    sb3.append(",");
                    sb3.append(sb2);
                    str3 = sb3.toString();
                }
                BasicNameValuePair basicNameValuePair = new BasicNameValuePair(str7, CloudRequestHelper.encodeData(str, str2, str3));
                arrayList.add(basicNameValuePair);
                BasicNameValuePair basicNameValuePair2 = new BasicNameValuePair("signature", HttpUtils.getSignature(HttpMethod.GET, str, arrayList, str2));
                arrayList.add(basicNameValuePair2);
                int length = HttpUtils.appendUrl(str, arrayList).length();
                arrayList.remove(basicNameValuePair);
                arrayList.remove(basicNameValuePair2);
                if (length >= 1024) {
                    break;
                }
                if (sb.length() > 0) {
                    sb.append(",");
                }
                sb.append(sb2);
                sb2.setLength(0);
                if (i >= 100) {
                    break;
                }
            }
        }
        String sb4 = sb.toString();
        if (Log.isLoggable("Request", 3)) {
            StringBuilder sb5 = new StringBuilder();
            sb5.append("The filterTag is :");
            sb5.append(sb4);
            Log.d("Request", sb5.toString());
        }
        Map<String, String> map2 = map;
        map.put("filterTag", sb4);
    }

    private static void addSignatureParam(HttpMethod httpMethod, String str, ArrayList<NameValuePair> arrayList, String str2) throws UnsupportedEncodingException {
        arrayList.add(new BasicNameValuePair("signature", HttpUtils.getSignature(httpMethod, str, arrayList, str2)));
    }

    private static String checkHostLocation(String str) throws CloudServerException {
        return !str.startsWith(URL.URL_RELOCATION_BASE) ? CloudUtils.updateRequestHost(str, false) : str;
    }

    private static void checkResponse(Context context, String str) {
        Log.d("Request", "checkResponse");
        if (str != null && isPrivacyError(str) && GdprUtils.isGdprAvailable(context)) {
            Log.d("Request", "notify privacy denied!");
            notifyMiCloudPrivacyDenied(context);
        }
    }

    private static ArrayList<NameValuePair> encodeParameters(CryptCoder cryptCoder, String str, Map<String, String> map) throws CipherException {
        ArrayList<NameValuePair> arrayList;
        if (map == null) {
            map = new HashMap<>();
        }
        if (str == null || map.containsKey("_nonce")) {
            arrayList = new ArrayList<>(map.size());
        } else {
            arrayList = new ArrayList<>(map.size() + 1);
            arrayList.add(new BasicNameValuePair("_nonce", str));
        }
        for (Entry entry : map.entrySet()) {
            String str2 = (String) entry.getKey();
            String str3 = (String) entry.getValue();
            if (!str2.startsWith("_")) {
                if (str3 == null) {
                    str3 = "";
                }
                arrayList.add(new BasicNameValuePair(str2, cryptCoder.encrypt(str3)));
            } else {
                arrayList.add(new BasicNameValuePair(str2, str3));
            }
        }
        return arrayList;
    }

    private static String execute(String str, HttpMethod httpMethod, Map<String, String> map, Map<String, String> map2) throws IOException, CloudServerException, IllegalBlockSizeException, BadPaddingException {
        String str2;
        try {
            String checkHostLocation = checkHostLocation(str);
            String str3 = "";
            boolean isV4Url = CloudRequestHelper.isV4Url(checkHostLocation);
            int i = 0;
            while (true) {
                if (i >= 2) {
                    str2 = str3;
                    break;
                }
                ExtendedAuthToken queryAuthToken = queryAuthToken();
                CryptCoder cryptCoder = CloudRequestHelper.getCryptCoder(checkHostLocation, queryAuthToken.security);
                ArrayList encodeParameters = encodeParameters(cryptCoder, isV4Url ? CloudCoder.generateNonce() : null, map);
                addSignatureParam(httpMethod, checkHostLocation, encodeParameters, queryAuthToken.security);
                Header cookies = getCookies(sRequestEnv.getAccountName(), sRequestEnv.queryEncryptedAccountName(), queryAuthToken.authToken, map2);
                try {
                    if (HttpMethod.GET.equals(httpMethod)) {
                        str2 = CloudRequestHelper.httpGetRequestWithDecodeData(HttpUtils.appendUrl(checkHostLocation, encodeParameters), cookies, cryptCoder);
                        break;
                    } else if (HttpMethod.POST.equals(httpMethod)) {
                        str2 = CloudRequestHelper.httpPostRequestWithDecodeData(checkHostLocation, new UrlEncodedFormEntity(encodeParameters, Keyczar.DEFAULT_ENCODING), cookies, cryptCoder);
                        break;
                    } else if (HttpMethod.POST_JSON.equals(httpMethod)) {
                        JSONObject jSONObject = new JSONObject();
                        for (int i2 = 0; i2 < encodeParameters.size(); i2++) {
                            jSONObject.put(((NameValuePair) encodeParameters.get(i2)).getName(), ((NameValuePair) encodeParameters.get(i2)).getValue());
                        }
                        str2 = CloudRequestHelper.httpPostJSONRequestWithDecodeData(checkHostLocation, new StringEntity(jSONObject.toString(), "utf-8"), cookies, cryptCoder);
                        break;
                    } else {
                        throw new IllegalArgumentException("http method not supported.");
                    }
                } catch (JSONException e) {
                    throw new CloudServerException(0, e.toString());
                } catch (CloudServerException e2) {
                    Log.e("Request", "CloudServer Exception: ", e2);
                    if (e2.getStatusCode() == 401) {
                        if (i == 0) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("CloudServer 401 Exception: retry=");
                            sb.append(i);
                            Log.e("Request", sb.toString(), e2);
                            sRequestEnv.invalidateAuthToken();
                            CloudCoder.setServerDateOffset(e2.serverDate - System.currentTimeMillis());
                        } else if (i == 1) {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("CloudServer 401 Exception: retry=");
                            sb2.append(i);
                            Log.e("Request", sb2.toString(), e2);
                            throw e2;
                        }
                        i++;
                    } else {
                        handleCloudServerException(getContext(), e2);
                        throw e2;
                    }
                }
            }
            checkResponse(getContext(), str2);
            CloudNetworkAvailabilityManager.setRequestResult(getContext(), true);
            return str2;
        } catch (CipherException e3) {
            Log.e("Request", "CipherException", e3);
            throw new CloudServerException(0, e3.toString());
        } catch (IOException e4) {
            CloudNetworkAvailabilityManager.setRequestResult(getContext(), false);
            throw e4;
        }
    }

    public static Context getContext() {
        if (sContext != null) {
            return sContext;
        }
        throw new IllegalStateException("sContext=null! Please call Request.init(Context) at Application onCreate");
    }

    private static Header getCookies(String str, String str2, String str3, Map<String, String> map) {
        StringBuilder sb = new StringBuilder();
        sb.append("serviceToken=");
        sb.append(str3);
        if (str2 != null) {
            sb.append("; cUserId=");
            sb.append(str2);
        }
        if (map != null && map.size() > 0) {
            for (String str4 : map.keySet()) {
                if (!"cUserId".equals(str4) && !"userId".equals(str4) && !"serviceToken".equals(str4) && !TextUtils.isEmpty(str4)) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("; ");
                    sb2.append(str4);
                    sb2.append("=");
                    sb.append(sb2.toString());
                    sb.append((String) map.get(str4));
                }
            }
        }
        return new BasicHeader("Cookie", sb.toString());
    }

    public static String getRegion() {
        return sRegion;
    }

    public static RequestEnv getRequestEnv() {
        return sRequestEnv;
    }

    private static void handleCloudServerException(Context context, CloudServerException cloudServerException) {
        if (cloudServerException.code == 503 && cloudServerException.retryTime > 0) {
            Intent intent = new Intent("com.xiaomi.action.DATA_IN_TRANSFER");
            intent.putExtra("retryTime", cloudServerException.retryTime);
            intent.setPackage("com.miui.cloudservice");
            context.sendBroadcast(intent);
        } else if (cloudServerException.code == 52003 && GdprUtils.isGdprAvailable(context)) {
            notifyMiCloudPrivacyDenied(context);
        }
    }

    public static void init(Context context) {
        sContext = context;
    }

    private static boolean isPrivacyError(String str) {
        try {
            if (new JSONObject(str).optInt("code", 0) == 52003) {
                return true;
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return false;
    }

    private static void notifyMiCloudPrivacyDenied(Context context) {
        Intent intent = new Intent("com.xiaomi.action.PRIVACY_DENIED");
        intent.setPackage("com.miui.cloudservice");
        if (context.getPackageManager().resolveService(intent, 0) != null) {
            try {
                context.startService(intent);
            } catch (Exception unused) {
                Log.e("Request", "startservice error possibly due to backgroundservice limitation");
            }
        } else {
            context.sendBroadcast(intent);
        }
    }

    public static ExtendedAuthToken queryAuthToken() throws CloudServerException {
        ExtendedAuthToken queryAuthToken = sRequestEnv.queryAuthToken();
        if (queryAuthToken != null) {
            return queryAuthToken;
        }
        throw new CloudServerException(0, "execute() : queryAuthToken == null");
    }

    public static String secureGet(String str, Map<String, String> map) throws IllegalBlockSizeException, BadPaddingException, IOException, CloudServerException {
        return secureGet(str, map, null);
    }

    public static String secureGet(String str, Map<String, String> map, Map<String, String> map2) throws IllegalBlockSizeException, BadPaddingException, IOException, CloudServerException {
        return execute(str, HttpMethod.GET, map, map2);
    }

    public static String securePost(String str, Map<String, String> map) throws IllegalBlockSizeException, BadPaddingException, IOException, CloudServerException {
        return securePost(str, map, null);
    }

    public static String securePost(String str, Map<String, String> map, Map<String, String> map2) throws IllegalBlockSizeException, BadPaddingException, IOException, CloudServerException {
        return execute(str, HttpMethod.POST, map, map2);
    }

    public static void setRegion(String str) {
        sRegion = str;
    }
}
