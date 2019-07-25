package com.xiaomi.network;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.net.Uri.Builder;
import android.net.wifi.WifiManager;
import android.os.Process;
import android.text.TextUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.network.BasicNameValuePair;
import com.xiaomi.channel.commonutils.network.NameValuePair;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import com.xiaomi.push.service.AppRegionStorage;
import com.xiaomi.push.service.module.PushChannelRegion;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.keyczar.Keyczar;

public class HostManager {
    private static HostManagerFactory factory;
    protected static boolean hostLoaded = false;
    protected static Context sAppContext;
    private static String sAppName;
    private static String sAppVersion;
    private static HostManager sInstance;
    protected static Map<String, Fallback> sReservedHosts = new HashMap();
    private final long MAX_REQUEST_FAILURE_CNT;
    private String currentISP;
    private long lastRemoteRequestTimestamp;
    protected Map<String, Fallbacks> mHostsMapping;
    private long remoteRequestFailureCount;
    private HostFilter sHostFilter;
    protected HttpGet sHttpGetter;
    private String sUserId;

    public interface HostManagerFactory {
        HostManager createHostManager(Context context, HostFilter hostFilter, HttpGet httpGet, String str);
    }

    public interface HttpGet {
        String doGet(String str) throws IOException;
    }

    protected HostManager(Context context, HostFilter hostFilter, HttpGet httpGet, String str) {
        this(context, hostFilter, httpGet, str, null, null);
    }

    protected HostManager(Context context, HostFilter hostFilter, HttpGet httpGet, String str, String str2, String str3) {
        this.mHostsMapping = new HashMap();
        this.sUserId = MovieStatUtils.DOWNLOAD_SUCCESS;
        this.remoteRequestFailureCount = 0;
        this.MAX_REQUEST_FAILURE_CNT = 15;
        this.lastRemoteRequestTimestamp = 0;
        this.currentISP = "isp_prov_city_country_ip";
        this.sHttpGetter = httpGet;
        if (hostFilter == null) {
            this.sHostFilter = new HostFilter() {
                public boolean accept(String str) {
                    return true;
                }
            };
        } else {
            this.sHostFilter = hostFilter;
        }
        this.sUserId = str;
        if (str2 == null) {
            str2 = context.getPackageName();
        }
        sAppName = str2;
        if (str3 == null) {
            str3 = getVersionName();
        }
        sAppVersion = str3;
    }

    public static void addReservedHost(String str, String str2) {
        Fallback fallback = (Fallback) sReservedHosts.get(str);
        synchronized (sReservedHosts) {
            if (fallback == null) {
                try {
                    Fallback fallback2 = new Fallback(str);
                    fallback2.setEffectiveDuration(604800000);
                    fallback2.addHost(str2);
                    sReservedHosts.put(str, fallback2);
                } catch (Throwable th) {
                    throw th;
                }
            } else {
                fallback.addHost(str2);
            }
        }
    }

    static String getActiveNetworkLabel() {
        if (sAppContext == null) {
            return "unknown";
        }
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) sAppContext.getSystemService("connectivity");
            if (connectivityManager == null) {
                return "unknown";
            }
            NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
            if (activeNetworkInfo == null) {
                return "unknown";
            }
            if (activeNetworkInfo.getType() == 1) {
                WifiManager wifiManager = (WifiManager) sAppContext.getSystemService("wifi");
                if (!(wifiManager == null || wifiManager.getConnectionInfo() == null)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("WIFI-");
                    sb.append(wifiManager.getConnectionInfo().getSSID());
                    return sb.toString();
                }
                return "unknown";
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append(activeNetworkInfo.getTypeName());
            sb2.append("-");
            sb2.append(activeNetworkInfo.getSubtypeName());
            return sb2.toString();
        } catch (Throwable unused) {
        }
    }

    public static synchronized HostManager getInstance() {
        HostManager hostManager;
        synchronized (HostManager.class) {
            if (sInstance != null) {
                hostManager = sInstance;
            } else {
                throw new IllegalStateException("the host manager is not initialized yet.");
            }
        }
        return hostManager;
    }

    private String getVersionName() {
        try {
            PackageInfo packageInfo = sAppContext.getPackageManager().getPackageInfo(sAppContext.getPackageName(), 16384);
            if (packageInfo != null) {
                return packageInfo.versionName;
            }
        } catch (Exception unused) {
        }
        return MovieStatUtils.DOWNLOAD_SUCCESS;
    }

    public static synchronized void init(Context context, HostFilter hostFilter, HttpGet httpGet, String str, String str2, String str3) {
        synchronized (HostManager.class) {
            sAppContext = context.getApplicationContext();
            if (sAppContext == null) {
                sAppContext = context;
            }
            if (sInstance == null) {
                if (factory == null) {
                    HostManager hostManager = new HostManager(context, hostFilter, httpGet, str, str2, str3);
                    sInstance = hostManager;
                } else {
                    sInstance = factory.createHostManager(context, hostFilter, httpGet, str);
                }
            }
        }
    }

    static String obfuscate(String str) {
        try {
            int length = str.length();
            byte[] bytes = str.getBytes(Keyczar.DEFAULT_ENCODING);
            for (int i = 0; i < bytes.length; i++) {
                byte b = bytes[i];
                byte b2 = b & 240;
                if (b2 != 240) {
                    bytes[i] = (byte) (((b & 15) ^ ((byte) (((b >> 4) + length) & 15))) | b2);
                }
            }
            return new String(bytes);
        } catch (UnsupportedEncodingException unused) {
            return str;
        }
    }

    private ArrayList<Fallback> requestRemoteFallbacks(ArrayList<String> arrayList) {
        boolean z;
        JSONObject jSONObject;
        JSONObject jSONObject2;
        ArrayList<String> arrayList2 = arrayList;
        purge();
        synchronized (this.mHostsMapping) {
            checkHostMapping();
            for (String str : this.mHostsMapping.keySet()) {
                if (!arrayList2.contains(str)) {
                    arrayList2.add(str);
                }
            }
        }
        boolean isEmpty = sReservedHosts.isEmpty();
        synchronized (sReservedHosts) {
            z = isEmpty;
            for (Object obj : sReservedHosts.values().toArray()) {
                Fallback fallback = (Fallback) obj;
                if (!fallback.isEffective()) {
                    sReservedHosts.remove(fallback.host);
                    z = true;
                }
            }
        }
        if (!arrayList2.contains(getHost())) {
            arrayList2.add(getHost());
        }
        ArrayList<Fallback> arrayList3 = new ArrayList<>(arrayList.size());
        for (int i = 0; i < arrayList.size(); i++) {
            arrayList3.add(null);
        }
        try {
            String str2 = Network.isWIFIConnected(sAppContext) ? "wifi" : "wap";
            String remoteFallbackJSON = getRemoteFallbackJSON(arrayList2, str2, this.sUserId, z);
            if (!TextUtils.isEmpty(remoteFallbackJSON)) {
                JSONObject jSONObject3 = new JSONObject(remoteFallbackJSON);
                MyLog.i(remoteFallbackJSON);
                if ("OK".equalsIgnoreCase(jSONObject3.getString("S"))) {
                    JSONObject jSONObject4 = jSONObject3.getJSONObject("R");
                    String string = jSONObject4.getString("province");
                    String string2 = jSONObject4.getString("city");
                    String string3 = jSONObject4.getString("isp");
                    String string4 = jSONObject4.getString("ip");
                    String string5 = jSONObject4.getString("country");
                    JSONObject jSONObject5 = jSONObject4.getJSONObject(str2);
                    StringBuilder sb = new StringBuilder();
                    sb.append("get bucket: ip = ");
                    sb.append(string4);
                    sb.append(" net = ");
                    sb.append(string3);
                    sb.append(" hosts = ");
                    sb.append(jSONObject5.toString());
                    MyLog.v(sb.toString());
                    int i2 = 0;
                    while (i2 < arrayList.size()) {
                        String str3 = (String) arrayList2.get(i2);
                        JSONArray optJSONArray = jSONObject5.optJSONArray(str3);
                        if (optJSONArray == null) {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("no bucket found for ");
                            sb2.append(str3);
                            MyLog.w(sb2.toString());
                            jSONObject = jSONObject5;
                        } else {
                            Fallback fallback2 = new Fallback(str3);
                            int i3 = 0;
                            while (i3 < optJSONArray.length()) {
                                String string6 = optJSONArray.getString(i3);
                                if (!TextUtils.isEmpty(string6)) {
                                    jSONObject2 = jSONObject5;
                                    fallback2.addHost(new WeightedHost(string6, optJSONArray.length() - i3));
                                } else {
                                    jSONObject2 = jSONObject5;
                                }
                                i3++;
                                jSONObject5 = jSONObject2;
                            }
                            jSONObject = jSONObject5;
                            arrayList3.set(i2, fallback2);
                            fallback2.country = string5;
                            fallback2.province = string;
                            fallback2.isp = string3;
                            fallback2.ip = string4;
                            fallback2.city = string2;
                            if (jSONObject4.has("stat-percent")) {
                                fallback2.setPercent(jSONObject4.getDouble("stat-percent"));
                            }
                            if (jSONObject4.has("stat-domain")) {
                                fallback2.setDomainName(jSONObject4.getString("stat-domain"));
                            }
                            if (jSONObject4.has("ttl")) {
                                fallback2.setEffectiveDuration(((long) jSONObject4.getInt("ttl")) * 1000);
                            }
                            setCurrentISP(fallback2.getISP());
                        }
                        i2++;
                        jSONObject5 = jSONObject;
                    }
                    JSONObject optJSONObject = jSONObject4.optJSONObject("reserved");
                    if (optJSONObject != null) {
                        long j = 604800000;
                        if (jSONObject4.has("reserved-ttl")) {
                            j = ((long) jSONObject4.getInt("reserved-ttl")) * 1000;
                        }
                        Iterator keys = optJSONObject.keys();
                        while (keys.hasNext()) {
                            String str4 = (String) keys.next();
                            JSONArray optJSONArray2 = optJSONObject.optJSONArray(str4);
                            if (optJSONArray2 == null) {
                                StringBuilder sb3 = new StringBuilder();
                                sb3.append("no bucket found for ");
                                sb3.append(str4);
                                MyLog.w(sb3.toString());
                            } else {
                                Fallback fallback3 = new Fallback(str4);
                                fallback3.setEffectiveDuration(j);
                                for (int i4 = 0; i4 < optJSONArray2.length(); i4++) {
                                    String string7 = optJSONArray2.getString(i4);
                                    if (!TextUtils.isEmpty(string7)) {
                                        fallback3.addHost(new WeightedHost(string7, optJSONArray2.length() - i4));
                                    }
                                }
                                synchronized (sReservedHosts) {
                                    if (this.sHostFilter.accept(str4)) {
                                        sReservedHosts.put(str4, fallback3);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            StringBuilder sb4 = new StringBuilder();
            sb4.append("failed to get bucket ");
            sb4.append(e.getMessage());
            MyLog.w(sb4.toString());
        }
        for (int i5 = 0; i5 < arrayList.size(); i5++) {
            Fallback fallback4 = (Fallback) arrayList3.get(i5);
            if (fallback4 != null) {
                updateFallbacks((String) arrayList2.get(i5), fallback4);
            }
        }
        persist();
        return arrayList3;
    }

    public static synchronized void setHostManagerFactory(HostManagerFactory hostManagerFactory) {
        synchronized (HostManager.class) {
            factory = hostManagerFactory;
            sInstance = null;
        }
    }

    /* access modifiers changed from: protected */
    public boolean checkHostMapping() {
        synchronized (this.mHostsMapping) {
            if (hostLoaded) {
                return true;
            }
            hostLoaded = true;
            this.mHostsMapping.clear();
            try {
                String loadHosts = loadHosts();
                if (!TextUtils.isEmpty(loadHosts)) {
                    fromJSON(loadHosts);
                    MyLog.i("loading the new hosts succeed");
                    return true;
                }
            } catch (Throwable th) {
                StringBuilder sb = new StringBuilder();
                sb.append("load bucket failure: ");
                sb.append(th.getMessage());
                MyLog.w(sb.toString());
            }
        }
        return false;
    }

    public void clear() {
        synchronized (this.mHostsMapping) {
            this.mHostsMapping.clear();
        }
    }

    public String dump() {
        StringBuilder sb = new StringBuilder();
        synchronized (this.mHostsMapping) {
            for (Entry entry : this.mHostsMapping.entrySet()) {
                sb.append((String) entry.getKey());
                sb.append(":\n");
                sb.append(((Fallbacks) entry.getValue()).toString());
                sb.append("\n");
            }
        }
        return sb.toString();
    }

    /* access modifiers changed from: protected */
    public void fromJSON(String str) throws JSONException {
        synchronized (this.mHostsMapping) {
            this.mHostsMapping.clear();
            JSONObject jSONObject = new JSONObject(str);
            if (jSONObject.optInt("ver") == 2) {
                JSONArray optJSONArray = jSONObject.optJSONArray("data");
                for (int i = 0; i < optJSONArray.length(); i++) {
                    Fallbacks fromJSON = new Fallbacks().fromJSON(optJSONArray.getJSONObject(i));
                    this.mHostsMapping.put(fromJSON.getHost(), fromJSON);
                }
                JSONArray optJSONArray2 = jSONObject.optJSONArray("reserved");
                for (int i2 = 0; i2 < optJSONArray2.length(); i2++) {
                    Fallback fromJSON2 = new Fallback("").fromJSON(optJSONArray2.getJSONObject(i2));
                    sReservedHosts.put(fromJSON2.host, fromJSON2);
                }
            } else {
                throw new JSONException("Bad version");
            }
        }
    }

    public Fallback getFallbacksByHost(String str) {
        return getFallbacksByHost(str, true);
    }

    public Fallback getFallbacksByHost(String str, boolean z) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("the host is empty");
        } else if (!this.sHostFilter.accept(str)) {
            return null;
        } else {
            final Fallback localFallback = getLocalFallback(str);
            if (localFallback != null && localFallback.isEffective()) {
                return localFallback;
            }
            if (z && Network.hasNetwork(sAppContext)) {
                Fallback requestRemoteFallback = requestRemoteFallback(str);
                if (requestRemoteFallback != null) {
                    return requestRemoteFallback;
                }
            }
            return new Fallback(str) {
                Fallback local;

                {
                    this.local = localFallback;
                    this.host = this.host;
                    if (localFallback != null) {
                        this.ip = localFallback.ip;
                    }
                }

                public synchronized void accessHost(String str, AccessHistory accessHistory) {
                    if (this.local != null) {
                        this.local.accessHost(str, accessHistory);
                    }
                }

                public synchronized ArrayList<String> getHosts(boolean z) {
                    ArrayList<String> arrayList;
                    arrayList = new ArrayList<>();
                    if (this.local != null) {
                        arrayList.addAll(this.local.getHosts(true));
                    }
                    synchronized (HostManager.sReservedHosts) {
                        Fallback fallback = (Fallback) HostManager.sReservedHosts.get(this.host);
                        if (fallback != null) {
                            Iterator it = fallback.getHosts(true).iterator();
                            while (it.hasNext()) {
                                String str = (String) it.next();
                                if (arrayList.indexOf(str) == -1) {
                                    arrayList.add(str);
                                }
                            }
                            arrayList.remove(this.host);
                            arrayList.add(this.host);
                        }
                    }
                    return arrayList;
                }

                public boolean isEffective() {
                    return false;
                }
            };
        }
    }

    public Fallback getFallbacksByURL(String str) throws MalformedURLException {
        if (!TextUtils.isEmpty(str)) {
            return getFallbacksByHost(new URL(str).getHost(), true);
        }
        throw new IllegalArgumentException("the url is empty");
    }

    /* access modifiers changed from: protected */
    public String getHost() {
        String region = AppRegionStorage.getInstance(sAppContext).getRegion();
        if (TextUtils.isEmpty(region)) {
            return "resolver.msg.xiaomi.net";
        }
        return PushChannelRegion.China.name().equals(region) ? "resolver.msg.xiaomi.net" : "resolver.msg.global.xiaomi.net";
    }

    /* access modifiers changed from: protected */
    public Fallback getLocalFallback(String str) {
        Fallbacks fallbacks;
        synchronized (this.mHostsMapping) {
            checkHostMapping();
            fallbacks = (Fallbacks) this.mHostsMapping.get(str);
        }
        if (fallbacks != null) {
            Fallback fallback = fallbacks.getFallback();
            if (fallback != null) {
                return fallback;
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public String getProcessName() {
        List<RunningAppProcessInfo> runningAppProcesses = ((ActivityManager) sAppContext.getSystemService("activity")).getRunningAppProcesses();
        if (runningAppProcesses != null) {
            for (RunningAppProcessInfo runningAppProcessInfo : runningAppProcesses) {
                if (runningAppProcessInfo.pid == Process.myPid()) {
                    return runningAppProcessInfo.processName;
                }
            }
        }
        return "com.xiaomi";
    }

    /* access modifiers changed from: protected */
    public String getRemoteFallbackJSON(ArrayList<String> arrayList, String str, String str2, boolean z) throws IOException {
        ArrayList arrayList2 = new ArrayList();
        ArrayList<NameValuePair> arrayList3 = new ArrayList<>();
        arrayList3.add(new BasicNameValuePair(nexExportFormat.TAG_FORMAT_TYPE, str));
        if (str.equals("wap")) {
            arrayList3.add(new BasicNameValuePair("conpt", obfuscate(Network.getActiveConnPoint(sAppContext))));
        }
        if (z) {
            arrayList3.add(new BasicNameValuePair("reserved", "1"));
        }
        arrayList3.add(new BasicNameValuePair(nexExportFormat.TAG_FORMAT_UUID, str2));
        arrayList3.add(new BasicNameValuePair("list", XMStringUtils.join((Collection<?>) arrayList, ",")));
        arrayList3.add(new BasicNameValuePair("countrycode", AppRegionStorage.getInstance(sAppContext).getCountryCode()));
        Fallback localFallback = getLocalFallback(getHost());
        String format = String.format(Locale.US, "http://%1$s/gslb/?ver=4.0", new Object[]{getHost()});
        if (localFallback == null) {
            arrayList2.add(format);
            synchronized (sReservedHosts) {
                Fallback fallback = (Fallback) sReservedHosts.get("resolver.msg.xiaomi.net");
                if (fallback != null) {
                    Iterator it = fallback.getHosts(true).iterator();
                    while (it.hasNext()) {
                        arrayList2.add(String.format(Locale.US, "http://%1$s/gslb/?ver=4.0", new Object[]{(String) it.next()}));
                    }
                }
            }
        } else {
            arrayList2 = localFallback.getUrls(format);
        }
        Iterator it2 = arrayList2.iterator();
        IOException e = null;
        while (it2.hasNext()) {
            Builder buildUpon = Uri.parse((String) it2.next()).buildUpon();
            for (NameValuePair nameValuePair : arrayList3) {
                buildUpon.appendQueryParameter(nameValuePair.getName(), nameValuePair.getValue());
            }
            try {
                return this.sHttpGetter == null ? Network.downloadXml(sAppContext, new URL(buildUpon.toString())) : this.sHttpGetter.doGet(buildUpon.toString());
            } catch (IOException e2) {
                e = e2;
            }
        }
        if (e == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("network exception: ");
        sb.append(e.getMessage());
        MyLog.w(sb.toString());
        throw e;
    }

    /* access modifiers changed from: protected */
    public String loadHosts() {
        BufferedReader bufferedReader;
        try {
            File file = new File(sAppContext.getFilesDir(), getProcessName());
            if (file.isFile()) {
                bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
                try {
                    StringBuilder sb = new StringBuilder();
                    while (true) {
                        String readLine = bufferedReader.readLine();
                        if (readLine != null) {
                            sb.append(readLine);
                        } else {
                            String sb2 = sb.toString();
                            IOUtils.closeQuietly(bufferedReader);
                            return sb2;
                        }
                    }
                } catch (Throwable th) {
                    th = th;
                    try {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("load host exception ");
                        sb3.append(th.getMessage());
                        MyLog.w(sb3.toString());
                        IOUtils.closeQuietly(bufferedReader);
                        return null;
                    } catch (Throwable th2) {
                        th = th2;
                        IOUtils.closeQuietly(bufferedReader);
                        throw th;
                    }
                }
            } else {
                IOUtils.closeQuietly(null);
                return null;
            }
        } catch (Throwable th3) {
            bufferedReader = null;
            th = th3;
            IOUtils.closeQuietly(bufferedReader);
            throw th;
        }
    }

    public void persist() {
        synchronized (this.mHostsMapping) {
            try {
                BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(sAppContext.openFileOutput(getProcessName(), 0)));
                String jSONObject = toJSON().toString();
                if (!TextUtils.isEmpty(jSONObject)) {
                    bufferedWriter.write(jSONObject);
                }
                bufferedWriter.close();
            } catch (Exception e) {
                StringBuilder sb = new StringBuilder();
                sb.append("persist bucket failure: ");
                sb.append(e.getMessage());
                MyLog.w(sb.toString());
            }
        }
    }

    public void purge() {
        synchronized (this.mHostsMapping) {
            for (Fallbacks purge : this.mHostsMapping.values()) {
                purge.purge(true);
            }
            while (true) {
                for (boolean z = false; !z; z = true) {
                    for (String str : this.mHostsMapping.keySet()) {
                        if (((Fallbacks) this.mHostsMapping.get(str)).getFallbacks().isEmpty()) {
                            this.mHostsMapping.remove(str);
                        }
                    }
                }
            }
        }
    }

    public void refreshFallbacks() {
        ArrayList arrayList;
        synchronized (this.mHostsMapping) {
            checkHostMapping();
            arrayList = new ArrayList(this.mHostsMapping.keySet());
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                Fallbacks fallbacks = (Fallbacks) this.mHostsMapping.get(arrayList.get(size));
                if (!(fallbacks == null || fallbacks.getFallback() == null)) {
                    arrayList.remove(size);
                }
            }
        }
        ArrayList requestRemoteFallbacks = requestRemoteFallbacks(arrayList);
        for (int i = 0; i < arrayList.size(); i++) {
            if (requestRemoteFallbacks.get(i) != null) {
                updateFallbacks((String) arrayList.get(i), (Fallback) requestRemoteFallbacks.get(i));
            }
        }
    }

    /* access modifiers changed from: protected */
    public Fallback requestRemoteFallback(String str) {
        if (System.currentTimeMillis() - this.lastRemoteRequestTimestamp > this.remoteRequestFailureCount * 60 * 1000) {
            this.lastRemoteRequestTimestamp = System.currentTimeMillis();
            ArrayList arrayList = new ArrayList();
            arrayList.add(str);
            Fallback fallback = (Fallback) requestRemoteFallbacks(arrayList).get(0);
            if (fallback != null) {
                this.remoteRequestFailureCount = 0;
                return fallback;
            } else if (this.remoteRequestFailureCount < 15) {
                this.remoteRequestFailureCount++;
            }
        }
        return null;
    }

    public void setCurrentISP(String str) {
        this.currentISP = str;
    }

    /* access modifiers changed from: protected */
    public JSONObject toJSON() throws JSONException {
        JSONObject jSONObject;
        synchronized (this.mHostsMapping) {
            jSONObject = new JSONObject();
            jSONObject.put("ver", 2);
            JSONArray jSONArray = new JSONArray();
            for (Fallbacks json : this.mHostsMapping.values()) {
                jSONArray.put(json.toJSON());
            }
            jSONObject.put("data", jSONArray);
            JSONArray jSONArray2 = new JSONArray();
            for (Fallback json2 : sReservedHosts.values()) {
                jSONArray2.put(json2.toJSON());
            }
            jSONObject.put("reserved", jSONArray2);
        }
        return jSONObject;
    }

    public void updateFallbacks(String str, Fallback fallback) {
        if (TextUtils.isEmpty(str) || fallback == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("the argument is invalid ");
            sb.append(str);
            sb.append(", ");
            sb.append(fallback);
            throw new IllegalArgumentException(sb.toString());
        } else if (this.sHostFilter.accept(str)) {
            synchronized (this.mHostsMapping) {
                checkHostMapping();
                if (this.mHostsMapping.containsKey(str)) {
                    ((Fallbacks) this.mHostsMapping.get(str)).addFallback(fallback);
                } else {
                    Fallbacks fallbacks = new Fallbacks(str);
                    fallbacks.addFallback(fallback);
                    this.mHostsMapping.put(str, fallbacks);
                }
            }
        }
    }
}
