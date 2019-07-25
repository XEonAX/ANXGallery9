package com.xiaomi.mistatistic.sdk.controller;

import android.annotation.SuppressLint;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiManager;
import android.os.Build.VERSION;
import android.os.IBinder;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import com.xiaomi.mistatistic.sdk.BuildSetting;
import com.xiaomi.mistatistic.sdk.CustomSettings;
import com.xiaomi.xmsf.push.service.a.C0009a;
import java.io.BufferedReader;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Proxy.Type;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import org.keyczar.Keyczar;

/* compiled from: NetworkUtils */
public abstract class l {
    private static boolean a;

    /* compiled from: NetworkUtils */
    public static final class a extends FilterInputStream {
        private boolean a;

        public a(InputStream inputStream) {
            super(inputStream);
        }

        public int read(byte[] bArr, int i, int i2) throws IOException {
            if (!this.a) {
                int read = super.read(bArr, i, i2);
                if (read != -1) {
                    return read;
                }
            }
            this.a = true;
            return -1;
        }
    }

    /* compiled from: NetworkUtils */
    public interface b {
        void a(String str);
    }

    public static String a(URL url) {
        StringBuilder sb = new StringBuilder();
        sb.append(url.getProtocol());
        sb.append("://");
        sb.append("10.0.0.172");
        sb.append(url.getPath());
        if (!TextUtils.isEmpty(url.getQuery())) {
            sb.append("?");
            sb.append(url.getQuery());
        }
        return sb.toString();
    }

    public static HttpURLConnection a(Context context, URL url) throws IOException {
        if (!"http".equals(url.getProtocol())) {
            return (HttpURLConnection) url.openConnection();
        }
        if (e(context)) {
            return (HttpURLConnection) url.openConnection(new Proxy(Type.HTTP, new InetSocketAddress("10.0.0.200", 80)));
        }
        if (!d(context)) {
            return (HttpURLConnection) url.openConnection();
        }
        String host = url.getHost();
        HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(a(url)).openConnection();
        httpURLConnection.addRequestProperty("X-Online-Host", host);
        return httpURLConnection;
    }

    public static void a() {
        a = m.a(d.a(), "enable_network_connection", true);
    }

    /* JADX WARNING: type inference failed for: r7v0, types: [java.lang.CharSequence, java.lang.String] */
    /* JADX WARNING: type inference failed for: r7v2, types: [java.io.BufferedReader] */
    /* JADX WARNING: type inference failed for: r7v4 */
    /* JADX WARNING: type inference failed for: r7v6 */
    /* JADX WARNING: type inference failed for: r7v7 */
    /* JADX WARNING: type inference failed for: r7v8 */
    /* JADX WARNING: type inference failed for: r7v12 */
    /* JADX WARNING: type inference failed for: r7v13 */
    /* JADX WARNING: type inference failed for: r7v16, types: [java.io.BufferedReader] */
    /* JADX WARNING: type inference failed for: r7v18 */
    /* JADX WARNING: type inference failed for: r7v19 */
    /* JADX WARNING: type inference failed for: r7v20 */
    /* JADX WARNING: type inference failed for: r7v21 */
    /* JADX WARNING: Incorrect type for immutable var: ssa=java.lang.String, code=null, for r7v0, types: [java.lang.CharSequence, java.lang.String] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r7v4
  assigns: []
  uses: []
  mth insns count: 110
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x00fa A[SYNTHETIC, Splitter:B:46:0x00fa] */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x0102 A[Catch:{ IOException -> 0x00fe }] */
    /* JADX WARNING: Unknown variable types count: 4 */
    public static void a(Context context, String r7, Map<String, String> map, b bVar) throws IOException {
        if (!b()) {
            j.d("NET", "Network connection is disabled.");
        } else if (!TextUtils.isEmpty(r7)) {
            OutputStream outputStream = null;
            try {
                r7 = r7;
                String a2 = t.a(context, (String) r7);
                HttpURLConnection a3 = a(context, new URL(a2));
                a3.setConnectTimeout(10000);
                a3.setReadTimeout(15000);
                a3.setRequestMethod("POST");
                a3.setRequestProperty("Connection", "close");
                j.b("NET", String.format("paramsMap:%s", new Object[]{map}));
                a(map);
                String b2 = b(map);
                if (!b2.isEmpty()) {
                    a3.setDoOutput(true);
                    byte[] bytes = b2.getBytes();
                    OutputStream outputStream2 = a3.getOutputStream();
                    try {
                        outputStream2.write(bytes, 0, bytes.length);
                        outputStream2.flush();
                        outputStream2.close();
                        j.b("NET", String.format("url:%s, responseCode:%d", new Object[]{a2, Integer.valueOf(a3.getResponseCode())}));
                        r7 = new BufferedReader(new InputStreamReader(new a(a3.getInputStream())));
                    } catch (IOException e) {
                        e = e;
                        OutputStream outputStream3 = outputStream2;
                        Log.d("NET", "IOException:", e);
                        throw e;
                    } catch (Throwable th) {
                        th = th;
                        r7 = 0;
                        outputStream = outputStream2;
                        if (outputStream != null) {
                            try {
                                outputStream.close();
                            } catch (IOException e2) {
                                j.a("NET", "doHttpPost final exception", (Throwable) e2);
                                throw th;
                            }
                        }
                        if (r7 != 0) {
                            r7.close();
                        }
                        throw th;
                    }
                    try {
                        StringBuffer stringBuffer = new StringBuffer();
                        String property = System.getProperty("line.separator");
                        for (String readLine = r7.readLine(); readLine != null; readLine = r7.readLine()) {
                            stringBuffer.append(readLine);
                            stringBuffer.append(property);
                        }
                        bVar.a(stringBuffer.toString());
                        r7.close();
                    } catch (IOException e3) {
                        e = e3;
                        Log.d("NET", "IOException:", e);
                        throw e;
                    } catch (Throwable th2) {
                        th = th2;
                        r7 = r7;
                        r7 = r7;
                        Log.d("NET", "Throwable:", th);
                        throw new IOException(th.getMessage());
                    }
                } else {
                    throw new IllegalArgumentException("The content being uploaded is empty.");
                }
            } catch (IOException e4) {
                e = e4;
                Log.d("NET", "IOException:", e);
                throw e;
            } catch (Throwable th3) {
                th = th3;
                r7 = r7;
                if (outputStream != null) {
                }
                if (r7 != 0) {
                }
                throw th;
            }
        } else {
            throw new IllegalArgumentException("The url is empty.");
        }
    }

    public static void a(String str, Map<String, String> map, b bVar) throws IOException {
        Context a2 = d.a();
        if (!CustomSettings.isDataUploadingEnabled()) {
            j.d("NET", "upload is disabled.");
            bVar.a("");
            return;
        }
        if (map != null) {
            map.put("bc", BuildSetting.getMiuiBuildCode());
        }
        if (!CustomSettings.isUseSystemUploadingService()) {
            a(a2, str, map, bVar);
        } else if (c()) {
            try {
                b(a2, str, map, bVar);
            } catch (Exception e) {
                StringBuilder sb = new StringBuilder();
                sb.append("exception thrown from IPC.");
                sb.append(e.getMessage());
                throw new IOException(sb.toString());
            }
        } else {
            bVar.a(null);
            j.a("NET", "Uploading via sys service, metered network connected, skip");
        }
    }

    protected static void a(Map<String, String> map) {
        try {
            StringBuilder sb = new StringBuilder();
            new HashMap();
            if (map != null) {
                ArrayList<String> arrayList = new ArrayList<>(map.keySet());
                Collections.sort(arrayList);
                if (!arrayList.isEmpty()) {
                    for (String str : arrayList) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(str);
                        sb2.append((String) map.get(str));
                        sb.append(sb2.toString());
                    }
                }
            }
            sb.append("mistats_sdkconfig_jafej!@#)(*e@!#");
            map.put("sign", t.b(sb.toString()).toLowerCase(Locale.getDefault()));
        } catch (Exception e) {
            j.a("NET", "sign exception:", (Throwable) e);
        }
    }

    private static boolean a(int i) {
        return i > 4900 && i < 5900;
    }

    public static boolean a(Context context) {
        if (context != null) {
            try {
                NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
                if (activeNetworkInfo != null) {
                    return activeNetworkInfo.isConnectedOrConnecting();
                }
            } catch (Exception e) {
                j.a("isNetworkConnected", (Throwable) e);
            }
        }
        return false;
    }

    public static String b(Map<String, String> map) {
        if (map == null || map.size() <= 0) {
            return null;
        }
        StringBuffer stringBuffer = new StringBuffer();
        for (Entry entry : map.entrySet()) {
            if (!(entry.getKey() == null || entry.getValue() == null)) {
                try {
                    stringBuffer.append(URLEncoder.encode((String) entry.getKey(), Keyczar.DEFAULT_ENCODING));
                    stringBuffer.append("=");
                    stringBuffer.append(URLEncoder.encode((String) entry.getValue(), Keyczar.DEFAULT_ENCODING));
                    stringBuffer.append("&");
                } catch (UnsupportedEncodingException unused) {
                    return null;
                }
            }
        }
        if (stringBuffer.length() > 0) {
            stringBuffer = stringBuffer.deleteCharAt(stringBuffer.length() - 1);
        }
        return stringBuffer.toString();
    }

    public static void b(final Context context, final String str, final Map<String, String> map, final b bVar) {
        try {
            Intent intent = new Intent();
            intent.setClassName("com.xiaomi.xmsf", "com.xiaomi.xmsf.push.service.HttpService");
            if (!context.bindService(intent, new ServiceConnection() {
                /* access modifiers changed from: private */
                public boolean e = false;

                public void onServiceConnected(ComponentName componentName, final IBinder iBinder) {
                    r.b.execute(new Runnable() {
                        public void run() {
                            try {
                                bVar.a(C0009a.a(iBinder).a(t.a(context, str), map));
                                AnonymousClass1.this.e = true;
                                j.a("NET", "connected, do remote http post");
                                context.unbindService(this);
                            } catch (Throwable th) {
                                j.a("NET", "error while uploading the logs by IPC.", th);
                                bVar.a(null);
                                AnonymousClass1.this.e = true;
                            }
                        }
                    });
                }

                public void onServiceDisconnected(ComponentName componentName) {
                    j.a("NET", "error while perform IPC connection.", (Throwable) null);
                    if (!this.e) {
                        bVar.a(null);
                        j.a("NET", "disconnected, remote http post hasn't not processed");
                    }
                }
            }, 1)) {
                j.a("NET", "Failed to bind IHttpService.");
                bVar.a(null);
            }
        } catch (Exception e) {
            j.a("NET", "uploadDataThroughSystemService", (Throwable) e);
            bVar.a(null);
        }
    }

    public static boolean b() {
        return a;
    }

    private static boolean b(int i) {
        return i > 2400 && i < 2500;
    }

    public static boolean b(Context context) {
        boolean z = false;
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
            if (connectivityManager == null) {
                return false;
            }
            try {
                NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
                if (activeNetworkInfo == null) {
                    return false;
                }
                if (1 == activeNetworkInfo.getType()) {
                    z = true;
                }
                return z;
            } catch (Exception unused) {
                return false;
            }
        } catch (Exception unused2) {
            return false;
        }
    }

    public static String c(Context context) {
        if (b(context)) {
            return "WIFI";
        }
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
            if (connectivityManager == null) {
                return "";
            }
            try {
                NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
                if (activeNetworkInfo == null) {
                    return "";
                }
                StringBuilder sb = new StringBuilder();
                sb.append(activeNetworkInfo.getTypeName());
                sb.append("-");
                sb.append(activeNetworkInfo.getSubtypeName());
                sb.append("-");
                sb.append(activeNetworkInfo.getExtraInfo());
                return sb.toString().toLowerCase();
            } catch (Exception unused) {
                return "";
            }
        } catch (Exception unused2) {
            return "";
        }
    }

    @SuppressLint({"NewApi"})
    public static boolean c() {
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) d.a().getSystemService("connectivity");
            NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
            if (activeNetworkInfo != null) {
                if (activeNetworkInfo.getType() == 1) {
                    return true;
                }
                if (VERSION.SDK_INT >= 16) {
                    return !connectivityManager.isActiveNetworkMetered();
                }
            }
            return false;
        } catch (Exception e) {
            j.a("NET", "isUnmeteredNetworkConnected exception", (Throwable) e);
            return false;
        }
    }

    public static boolean d(Context context) {
        if (!"CN".equalsIgnoreCase(((TelephonyManager) context.getSystemService("phone")).getSimCountryIso())) {
            return false;
        }
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
            if (connectivityManager == null) {
                return false;
            }
            try {
                NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
                if (activeNetworkInfo == null) {
                    return false;
                }
                String extraInfo = activeNetworkInfo.getExtraInfo();
                if (TextUtils.isEmpty(extraInfo) || extraInfo.length() < 3 || extraInfo.contains("ctwap")) {
                    return false;
                }
                return extraInfo.regionMatches(true, extraInfo.length() - 3, "wap", 0, 3);
            } catch (Exception unused) {
                return false;
            }
        } catch (Exception unused2) {
            return false;
        }
    }

    public static boolean e(Context context) {
        if (!"CN".equalsIgnoreCase(((TelephonyManager) context.getSystemService("phone")).getSimCountryIso())) {
            return false;
        }
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
            if (connectivityManager == null) {
                return false;
            }
            try {
                NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
                if (activeNetworkInfo == null) {
                    return false;
                }
                String extraInfo = activeNetworkInfo.getExtraInfo();
                return !TextUtils.isEmpty(extraInfo) && extraInfo.length() >= 3 && extraInfo.contains("ctwap");
            } catch (Exception unused) {
                return false;
            }
        } catch (Exception unused2) {
            return false;
        }
    }

    public static String f(Context context) {
        try {
            if (t.g(context)) {
                return g(context);
            }
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
            if (activeNetworkInfo != null) {
                if (activeNetworkInfo.isConnected()) {
                    if (activeNetworkInfo.getType() == 1) {
                        return "WIFI";
                    }
                    if (activeNetworkInfo.getType() == 0) {
                        switch (activeNetworkInfo.getSubtype()) {
                            case 1:
                            case 2:
                            case 4:
                            case 7:
                            case 11:
                            case 16:
                                return "2G";
                            case 3:
                            case 5:
                            case 6:
                            case 8:
                            case 9:
                            case 10:
                            case 12:
                            case 14:
                            case 15:
                            case 17:
                                return "3G";
                            case 13:
                            case 18:
                            case 19:
                                return "4G";
                            default:
                                return "unknown";
                        }
                    }
                    return "unknown";
                }
            }
            return "unknown";
        } catch (Exception e) {
            j.a("NET", "getNetworkType exception", (Throwable) e);
        }
    }

    public static String g(Context context) {
        String str;
        String str2 = "";
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
            if (connectivityManager == null) {
                return str2;
            }
            NetworkInfo networkInfo = connectivityManager.getNetworkInfo(1);
            NetworkInfo networkInfo2 = connectivityManager.getNetworkInfo(9);
            if (networkInfo != null && networkInfo.isConnected()) {
                StringBuilder sb = new StringBuilder();
                sb.append("WIFI");
                sb.append(h(context));
                str = sb.toString();
            } else if (networkInfo2 == null || !networkInfo2.isConnected()) {
                return str2;
            } else {
                str = "ETHERNET";
            }
            return str;
        } catch (Exception e) {
            j.a("NET", "getNetworkType exception", (Throwable) e);
            return str2;
        }
    }

    public static String h(Context context) {
        String str;
        String str2 = "";
        if (VERSION.SDK_INT >= 22) {
            try {
                int frequency = ((WifiManager) context.getSystemService("wifi")).getConnectionInfo().getFrequency();
                if (a(frequency)) {
                    str = "5G";
                } else if (!b(frequency)) {
                    return str2;
                } else {
                    str = "2G";
                }
            } catch (NoSuchMethodError e) {
                j.a("NET", "getWififreband NoSuchMethodError", (Throwable) e);
                return str2;
            } catch (Exception e2) {
                j.a("NET", "getWififreband exception", (Throwable) e2);
                return str2;
            }
        } else {
            char c = 65535;
            try {
                WifiManager wifiManager = (WifiManager) context.getSystemService("wifi");
                String ssid = wifiManager.getConnectionInfo().getSSID();
                String substring = ssid.substring(1, ssid.length() - 1);
                if (ssid != null && ssid.length() > 2) {
                    Iterator it = wifiManager.getScanResults().iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        ScanResult scanResult = (ScanResult) it.next();
                        if (scanResult.SSID.equals(substring)) {
                            if (a(scanResult.frequency)) {
                                c = 2;
                            } else if (b(scanResult.frequency)) {
                                c = 1;
                            }
                        }
                    }
                }
                if (c == 2) {
                    str = "5G";
                } else if (c != 1) {
                    return str2;
                } else {
                    str = "2G";
                }
            } catch (Exception e3) {
                j.a("NET", "getWififreband exception", (Throwable) e3);
                return str2;
            }
        }
        return str;
    }

    public static int i(Context context) {
        String f = f(context);
        if (TextUtils.isEmpty(f) || f.equals("unknown")) {
            return 0;
        }
        if (f.equals("2G")) {
            return 1;
        }
        if (f.equals("3G")) {
            return 2;
        }
        if (f.equals("4G")) {
            return 4;
        }
        if (f.startsWith("WIFI")) {
            return 8;
        }
        return f.equals("ETHERNET") ? 16 : 0;
    }
}
