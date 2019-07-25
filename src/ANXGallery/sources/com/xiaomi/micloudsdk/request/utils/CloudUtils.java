package com.xiaomi.micloudsdk.request.utils;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.annotation.SuppressLint;
import android.content.Context;
import android.net.Uri;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.Log;
import com.nexstreaming.nexeditorsdk.nexProject;
import com.xiaomi.micloudsdk.exception.CloudServerException;
import com.xiaomi.micloudsdk.provider.MiCloudSettings;
import com.xiaomi.micloudsdk.request.utils.RequestConstants.URL;
import com.xiaomi.micloudsdk.utils.JsonUtils;
import com.xiaomi.micloudsdk.utils.NetworkUtils;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.client.ClientProtocolException;
import org.json.JSONException;
import org.json.JSONObject;

@SuppressLint({"NewApi"})
public class CloudUtils {
    private static final int[] SERVER_RETRY_INTERVALS = {1000, nexProject.kAutoThemeTransitionDuration, 5000, 10000};
    private static final String URL_RELOCATION_QUERY;
    private static volatile Map<String, Object> sHostsCacheInner = new HashMap();
    private static volatile boolean sNeedUpdateHosts = TextUtils.isEmpty(getHostList());
    private static Object sUpdateMiCloudHostsLock = new Object();
    private static UpdateStatus sUpdateStatus;

    private enum UpdateStatus {
        UPDATING,
        SUCCESS,
        FAILED
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(URL.URL_RELOCATION_BASE);
        sb.append("/mic/relocation/v3/user/record");
        URL_RELOCATION_QUERY = sb.toString();
    }

    public static String checkRedirect(String str, int i) throws CloudServerException {
        if (i < 15) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.getInt("code") == 308) {
                    if (jSONObject.getJSONObject("data").optBoolean("isPermanent")) {
                        sNeedUpdateHosts = true;
                    }
                    return jSONObject.getJSONObject("data").getString("redirectUrl");
                } else if (jSONObject.getInt("code") == 503) {
                    throw new CloudServerException(503, 503, jSONObject.getJSONObject("data").getInt("retryAfter"));
                } else if (jSONObject.getInt("code") != 10034) {
                    return null;
                } else {
                    throw new CloudServerException(503, 10034, jSONObject.getJSONObject("data").getInt("retryAfter"));
                }
            } catch (JSONException e) {
                StringBuilder sb = new StringBuilder();
                sb.append("JSONException in checkRedirect():");
                sb.append(str);
                Log.e("CloudUtils", sb.toString(), e);
            }
        } else {
            throw new CloudServerException(503, 10034, 10);
        }
    }

    private static Map<String, Object> getHostCache() {
        return new HashMap(sHostsCacheInner);
    }

    private static String getHostList() {
        if (getPersistHostsFromSp()) {
            if (Log.isLoggable("CloudUtils", 3)) {
                Log.d("CloudUtils", "get hostlist from sp");
            }
            return PreferenceManager.getDefaultSharedPreferences(Request.getContext()).getString("pref_micloud_hosts_v2", "");
        }
        if (Log.isLoggable("CloudUtils", 3)) {
            Log.d("CloudUtils", "get hostlist from settings");
        }
        return MiCloudSettings.getString(Request.getContext(), "micloud_hosts_v2");
    }

    private static String getHostWithScheme(String str) {
        if (Log.isLoggable("CloudUtils", 3)) {
            StringBuilder sb = new StringBuilder();
            sb.append("Enter getHost key=");
            sb.append(str);
            Log.d("CloudUtils", sb.toString());
        }
        Object obj = getHostCache().get(str);
        String str2 = (obj == null || !(obj instanceof String)) ? null : (String) obj;
        if (!TextUtils.isEmpty(str2)) {
            if (Log.isLoggable("CloudUtils", 3)) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Hit host cache directly return host = ");
                sb2.append(str2);
                Log.d("CloudUtils", sb2.toString());
            }
            return str2;
        }
        String hostList = getHostList();
        if (TextUtils.isEmpty(hostList)) {
            if (Log.isLoggable("CloudUtils", 3)) {
                Log.d("CloudUtils", "Hosts in SystemSettings/sp = null, return null");
            }
            return null;
        }
        try {
            updateHostCache(JsonUtils.jsonToMap(new JSONObject(hostList)));
            Object obj2 = getHostCache().get(str);
            if (obj2 != null && (obj2 instanceof String)) {
                str2 = (String) obj2;
            }
            if (Log.isLoggable("CloudUtils", 3)) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("find host in SystemSettings/sp return host = ");
                sb3.append(str2);
                Log.d("CloudUtils", sb3.toString());
            }
            return str2;
        } catch (JSONException e) {
            Log.e("CloudUtils", "JSONException in getHost, return null", e);
            return null;
        }
    }

    private static boolean getPersistHostsFromSp() {
        return "true".equals(MiCloudSettings.getString(Request.getContext(), "micloud_updatehosts_third_party"));
    }

    public static String getUserAgent() {
        return Request.getRequestEnv().getUserAgent();
    }

    public static Account getXiaomiAccount() {
        return getXiaomiAccount(Request.getContext());
    }

    public static Account getXiaomiAccount(Context context) {
        Account[] accountsByType = AccountManager.get(context).getAccountsByType("com.xiaomi");
        if (accountsByType.length > 0) {
            return accountsByType[0];
        }
        return null;
    }

    private static String getXiaomiAccountName() {
        if (getPersistHostsFromSp()) {
            if (Log.isLoggable("CloudUtils", 3)) {
                Log.d("CloudUtils", "get accountName from sp");
            }
            return PreferenceManager.getDefaultSharedPreferences(Request.getContext()).getString("pref_micloud_accountname_v2", "");
        }
        if (Log.isLoggable("CloudUtils", 3)) {
            Log.d("CloudUtils", "get accountName from settings");
        }
        return MiCloudSettings.getString(Request.getContext(), "micloud_accountname_v2");
    }

    public static int isInternationalAccount(boolean z) {
        if (z) {
            updateHostCache(new HashMap());
        }
        if (getHostCache().isEmpty()) {
            sNeedUpdateHosts = true;
            try {
                updateMiCloudHosts(z);
                if (getHostCache().isEmpty()) {
                    return 2;
                }
            } catch (CloudServerException e) {
                Log.e("CloudUtils", "CloudServerException in isInternationalAccount", e);
                return 2;
            }
        }
        for (Entry entry : getHostCache().entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            if (value instanceof String) {
                String host = Uri.parse((String) value).getHost();
                if (host != null) {
                    return host.equals(str) ? 0 : 1;
                }
            }
        }
        return 2;
    }

    private static void setHostList(String str) {
        if (getPersistHostsFromSp()) {
            if (Log.isLoggable("CloudUtils", 3)) {
                Log.d("CloudUtils", "set hostlist to sp");
            }
            PreferenceManager.getDefaultSharedPreferences(Request.getContext()).edit().putString("pref_micloud_hosts_v2", str).commit();
            return;
        }
        if (Log.isLoggable("CloudUtils", 3)) {
            Log.d("CloudUtils", "set hostlist to settings");
        }
        MiCloudSettings.putString(Request.getContext(), "micloud_hosts_v2", str);
    }

    private static void setXiaomiAccountName(String str) {
        if (getPersistHostsFromSp()) {
            if (Log.isLoggable("CloudUtils", 3)) {
                StringBuilder sb = new StringBuilder();
                sb.append("set accountName: ");
                sb.append(str);
                sb.append(" to sp");
                Log.d("CloudUtils", sb.toString());
            }
            PreferenceManager.getDefaultSharedPreferences(Request.getContext()).edit().putString("pref_micloud_accountname_v2", str).commit();
            return;
        }
        if (Log.isLoggable("CloudUtils", 3)) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("set accountName: ");
            sb2.append(str);
            sb2.append(" to settings");
            Log.d("CloudUtils", sb2.toString());
        }
        MiCloudSettings.putString(Request.getContext(), "micloud_accountname_v2", str);
    }

    private static void updateHostCache(Map<String, Object> map) {
        sHostsCacheInner = new HashMap(map);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0097, code lost:
        if (r2 == false) goto L_0x009d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x0099, code lost:
        sUpdateStatus = com.xiaomi.micloudsdk.request.utils.CloudUtils.UpdateStatus.UPDATING;
     */
    private static void updateMiCloudHosts(boolean z) throws CloudServerException {
        boolean z2;
        HashMap hashMap;
        if (Log.isLoggable("CloudUtils", 3)) {
            StringBuilder sb = new StringBuilder();
            sb.append("enter updateMiCloudHosts, sNeedUpdateHosts: ");
            sb.append(sNeedUpdateHosts);
            Log.d("CloudUtils", sb.toString());
        }
        if (getXiaomiAccountName() != null && !getXiaomiAccountName().equals(Request.getRequestEnv().getAccountName())) {
            sNeedUpdateHosts = true;
        }
        if (sNeedUpdateHosts || z) {
            try {
                synchronized (sUpdateMiCloudHostsLock) {
                    loop0:
                    while (true) {
                        z2 = true;
                        while (sUpdateStatus == UpdateStatus.UPDATING) {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Waiting for an existing updateMiCloudHosts to finish ");
                            sb2.append(Thread.currentThread().getName());
                            Log.v("CloudUtils", sb2.toString());
                            sUpdateMiCloudHostsLock.wait();
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("The existing updateMiCloudHosts finished ");
                            sb3.append(Thread.currentThread().getName());
                            Log.v("CloudUtils", sb3.toString());
                            if (sUpdateStatus == UpdateStatus.SUCCESS) {
                                z2 = false;
                            }
                        }
                        break loop0;
                    }
                }
                if (z2) {
                    String str = "CloudUtils";
                    try {
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("updateMiCloudHosts ");
                        sb4.append(Thread.currentThread().getName());
                        Log.d(str, sb4.toString());
                        hashMap = new HashMap();
                        String str2 = (String) Class.forName("miui.os.Build").getDeclaredMethod("getRegion", new Class[0]).invoke(null, new Object[0]);
                        Request.setRegion(str2);
                        hashMap.put("romCountry", str2);
                    } catch (JSONException e) {
                        Log.e("CloudUtils", "JSONException in updateMiCloudHosts", e);
                        throw new CloudServerException(0, (Throwable) e);
                    } catch (IllegalBlockSizeException e2) {
                        Log.e("CloudUtils", "IllegalBlockSizeException in updateMiCloudHosts", e2);
                        throw new CloudServerException(0, (Throwable) e2);
                    } catch (BadPaddingException e3) {
                        Log.e("CloudUtils", "BadPaddingException in updateMiCloudHosts", e3);
                        throw new CloudServerException(0, (Throwable) e3);
                    } catch (ClientProtocolException e4) {
                        Log.e("CloudUtils", "ClientProtocolException in updateMiCloudHosts", e4);
                        throw new CloudServerException(0, (Throwable) e4);
                    } catch (IOException e5) {
                        e = e5;
                        Log.e("CloudUtils", "IOException in updateMiCloudHosts", e);
                        if (!NetworkUtils.isNetworkAvailable(Request.getContext())) {
                            Log.d("CloudUtils", "No network in IOException");
                            throw new CloudServerException(0, e);
                        }
                    } catch (Exception e6) {
                        Log.e("CloudUtils", "Exception in updateMiCloudHosts()", e6);
                        hashMap.put("romCountry", Request.getRegion());
                    } catch (Throwable th) {
                        synchronized (sUpdateMiCloudHostsLock) {
                            sUpdateStatus = UpdateStatus.FAILED;
                            sUpdateMiCloudHostsLock.notifyAll();
                            throw th;
                        }
                    }
                    if (TextUtils.isEmpty((CharSequence) hashMap.get("romCountry"))) {
                        Log.d("CloudUtils", "request romCountry null, thirdparty app");
                        MiCloudSettings.putString(Request.getContext(), "micloud_updatehosts_third_party", "true");
                    } else {
                        Log.d("CloudUtils", "request romCountry not null, system app");
                        MiCloudSettings.putString(Request.getContext(), "micloud_updatehosts_third_party", "false");
                    }
                    int i = 0;
                    while (!Thread.currentThread().isInterrupted()) {
                        String accountName = Request.getRequestEnv().getAccountName();
                        if (TextUtils.isEmpty(accountName)) {
                            synchronized (sUpdateMiCloudHostsLock) {
                                sUpdateStatus = UpdateStatus.SUCCESS;
                                sUpdateMiCloudHostsLock.notifyAll();
                            }
                            return;
                        }
                        JSONObject jSONObject = new JSONObject(Request.securePost(URL_RELOCATION_QUERY, hashMap));
                        if (jSONObject.getInt("code") == 0) {
                            JSONObject jSONObject2 = jSONObject.getJSONObject("data").getJSONObject("hostList");
                            if (jSONObject2 != null) {
                                StringBuilder sb5 = new StringBuilder();
                                sb5.append("getHostList set sNeedUpdateHosts to false ");
                                sb5.append(Thread.currentThread().getName());
                                Log.d("CloudUtils", sb5.toString());
                                setHostList(jSONObject2.toString());
                                updateHostCache(JsonUtils.jsonToMap(jSONObject2));
                                sNeedUpdateHosts = false;
                                if (!TextUtils.isEmpty(accountName)) {
                                    setXiaomiAccountName(accountName);
                                }
                            }
                            synchronized (sUpdateMiCloudHostsLock) {
                                sUpdateStatus = UpdateStatus.SUCCESS;
                                sUpdateMiCloudHostsLock.notifyAll();
                            }
                        } else {
                            e = null;
                            if (i < SERVER_RETRY_INTERVALS.length) {
                                StringBuilder sb6 = new StringBuilder();
                                sb6.append("Wait ");
                                sb6.append(SERVER_RETRY_INTERVALS[i]);
                                sb6.append(" ms for retry");
                                Log.e("CloudUtils", sb6.toString());
                                Thread.sleep((long) SERVER_RETRY_INTERVALS[i]);
                                i++;
                            } else if (e != null) {
                                throw new CloudServerException(0, e);
                            } else {
                                throw new CloudServerException(0);
                            }
                        }
                    }
                    throw new InterruptedException();
                }
            } catch (InterruptedException e7) {
                Log.e("CloudUtils", "InterruptedException in updateMiCloudHosts", e7);
                throw new CloudServerException(0, (Throwable) e7);
            }
        }
    }

    public static String updateRequestHost(String str, boolean z) throws CloudServerException {
        updateMiCloudHosts(z);
        String str2 = "CloudUtils";
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("Original URL: ");
            sb.append(str);
            sb.append(". ");
            Log.i(str2, sb.toString());
            java.net.URL url = new java.net.URL(str);
            String hostWithScheme = getHostWithScheme(url.getHost());
            if (!TextUtils.isEmpty(hostWithScheme)) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("New URL: ");
                sb2.append(hostWithScheme);
                sb2.append(". ");
                Log.i("CloudUtils", sb2.toString());
                java.net.URL url2 = new java.net.URL(hostWithScheme);
                str = new java.net.URL(url2.getProtocol(), url2.getHost(), url.getFile()).toString();
            }
        } catch (MalformedURLException e) {
            Log.e("CloudUtils", "MalformedURLException in updateHost", e);
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append("Final URL: ");
        sb3.append(str);
        sb3.append(". ");
        Log.i("CloudUtils", sb3.toString());
        return str;
    }
}
