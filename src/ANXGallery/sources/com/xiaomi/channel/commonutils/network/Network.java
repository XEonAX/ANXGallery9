package com.xiaomi.channel.commonutils.network;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.string.MD5;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.net.Proxy.Type;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Pattern;
import org.keyczar.Keyczar;

public class Network {
    public static final Pattern ContentTypePattern_Charset = Pattern.compile("(.*?charset\\s*=[^a-zA-Z0-9]*)([-a-zA-Z0-9]+)(.*)", 2);
    public static final Pattern ContentTypePattern_MimeType = Pattern.compile("([^\\s;]+)(.*)");
    public static final Pattern ContentTypePattern_XmlEncoding = Pattern.compile("(\\<\\?xml\\s+.*?encoding\\s*=[^a-zA-Z0-9]*)([-a-zA-Z0-9]+)(.*)", 2);

    public static final class DoneHandlerInputStream extends FilterInputStream {
        private boolean done;

        public DoneHandlerInputStream(InputStream inputStream) {
            super(inputStream);
        }

        public int read(byte[] bArr, int i, int i2) throws IOException {
            if (!this.done) {
                int read = super.read(bArr, i, i2);
                if (read != -1) {
                    return read;
                }
            }
            this.done = true;
            return -1;
        }
    }

    public static class HttpHeaderInfo {
        public Map<String, String> AllHeaders;
        public int ResponseCode;

        public String toString() {
            return String.format("resCode = %1$d, headers = %2$s", new Object[]{Integer.valueOf(this.ResponseCode), this.AllHeaders.toString()});
        }
    }

    public static HttpResponse doHttpPost(Context context, String str, Map<String, String> map) throws IOException {
        return httpRequest(context, str, "POST", null, fromParamsMapToString(map));
    }

    public static String downloadXml(Context context, URL url) throws IOException {
        return downloadXml(context, url, false, null, Keyczar.DEFAULT_ENCODING, null);
    }

    public static String downloadXml(Context context, URL url, boolean z, String str, String str2, String str3) throws IOException {
        InputStream inputStream;
        try {
            inputStream = downloadXmlAsStream(context, url, z, str, str3);
            try {
                StringBuilder sb = new StringBuilder(1024);
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, str2));
                char[] cArr = new char[4096];
                while (true) {
                    int read = bufferedReader.read(cArr);
                    if (-1 != read) {
                        sb.append(cArr, 0, read);
                    } else {
                        IOUtils.closeQuietly(inputStream);
                        return sb.toString();
                    }
                }
            } catch (Throwable th) {
                th = th;
                IOUtils.closeQuietly(inputStream);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            inputStream = null;
            IOUtils.closeQuietly(inputStream);
            throw th;
        }
    }

    public static InputStream downloadXmlAsStream(Context context, URL url, boolean z, String str, String str2) throws IOException {
        return downloadXmlAsStream(context, url, z, str, str2, null, null);
    }

    public static InputStream downloadXmlAsStream(Context context, URL url, boolean z, String str, String str2, Map<String, String> map, HttpHeaderInfo httpHeaderInfo) throws IOException {
        if (context == null) {
            throw new IllegalArgumentException("context");
        } else if (url != null) {
            URL url2 = !z ? new URL(encryptURL(url.toString())) : url;
            try {
                HttpURLConnection.setFollowRedirects(true);
                HttpURLConnection httpUrlConnection = getHttpUrlConnection(context, url2);
                httpUrlConnection.setConnectTimeout(10000);
                httpUrlConnection.setReadTimeout(15000);
                if (!TextUtils.isEmpty(str)) {
                    httpUrlConnection.setRequestProperty("User-Agent", str);
                }
                if (str2 != null) {
                    httpUrlConnection.setRequestProperty("Cookie", str2);
                }
                if (map != null) {
                    for (String str3 : map.keySet()) {
                        httpUrlConnection.setRequestProperty(str3, (String) map.get(str3));
                    }
                }
                if (httpHeaderInfo != null && (url.getProtocol().equals("http") || url.getProtocol().equals("https"))) {
                    httpHeaderInfo.ResponseCode = httpUrlConnection.getResponseCode();
                    if (httpHeaderInfo.AllHeaders == null) {
                        httpHeaderInfo.AllHeaders = new HashMap();
                    }
                    int i = 0;
                    while (true) {
                        String headerFieldKey = httpUrlConnection.getHeaderFieldKey(i);
                        String headerField = httpUrlConnection.getHeaderField(i);
                        if (headerFieldKey == null && headerField == null) {
                            break;
                        }
                        if (!TextUtils.isEmpty(headerFieldKey)) {
                            if (!TextUtils.isEmpty(headerField)) {
                                httpHeaderInfo.AllHeaders.put(headerFieldKey, headerField);
                            }
                        }
                        i++;
                    }
                }
                return new DoneHandlerInputStream(httpUrlConnection.getInputStream());
            } catch (IOException e) {
                StringBuilder sb = new StringBuilder();
                sb.append("IOException:");
                sb.append(e.getClass().getSimpleName());
                throw new IOException(sb.toString());
            } catch (Throwable th) {
                throw new IOException(th.getMessage());
            }
        } else {
            throw new IllegalArgumentException("url");
        }
    }

    public static String encryptURL(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        new String();
        return String.format("%s&key=%s", new Object[]{str, MD5.MD5_32(String.format("%sbe988a6134bc8254465424e5a70ef037", new Object[]{str}))});
    }

    public static String fromParamsMapToString(Map<String, String> map) {
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
                } catch (UnsupportedEncodingException e) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed to convert from params map to string: ");
                    sb.append(e.toString());
                    Log.d("com.xiaomi.common.Network", sb.toString());
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("map: ");
                    sb2.append(map.toString());
                    Log.d("com.xiaomi.common.Network", sb2.toString());
                    return null;
                }
            }
        }
        if (stringBuffer.length() > 0) {
            stringBuffer = stringBuffer.deleteCharAt(stringBuffer.length() - 1);
        }
        return stringBuffer.toString();
    }

    public static String getActiveConnPoint(Context context) {
        if (isWIFIConnected(context)) {
            return "wifi";
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

    public static int getActiveNetworkType(Context context) {
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
            if (connectivityManager == null) {
                return -1;
            }
            try {
                NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
                if (activeNetworkInfo == null) {
                    return -1;
                }
                return activeNetworkInfo.getType();
            } catch (Exception unused) {
                return -1;
            }
        } catch (Exception unused2) {
            return -1;
        }
    }

    private static URL getDefaultStreamHandlerURL(String str) throws MalformedURLException {
        return new URL(str);
    }

    public static HttpURLConnection getHttpUrlConnection(Context context, URL url) throws IOException {
        return !"http".equals(url.getProtocol()) ? (HttpURLConnection) url.openConnection() : isCtwap(context) ? (HttpURLConnection) url.openConnection(new Proxy(Type.HTTP, new InetSocketAddress("10.0.0.200", 80))) : (HttpURLConnection) url.openConnection();
    }

    public static NetworkInfo getNetworkInfo(Context context) {
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
            if (connectivityManager == null) {
                return null;
            }
            return connectivityManager.getActiveNetworkInfo();
        } catch (Exception unused) {
            return null;
        }
    }

    public static boolean hasNetwork(Context context) {
        return getActiveNetworkType(context) >= 0;
    }

    /* JADX WARNING: type inference failed for: r6v0, types: [java.lang.String] */
    /* JADX WARNING: type inference failed for: r6v1, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r6v2 */
    /* JADX WARNING: type inference failed for: r6v4 */
    /* JADX WARNING: type inference failed for: r6v5 */
    /* JADX WARNING: type inference failed for: r6v6 */
    /* JADX WARNING: type inference failed for: r6v7, types: [java.lang.String] */
    /* JADX WARNING: type inference failed for: r6v12, types: [java.io.BufferedReader] */
    /* JADX WARNING: type inference failed for: r6v13, types: [java.io.BufferedReader] */
    /* JADX WARNING: type inference failed for: r6v14, types: [java.io.BufferedReader] */
    /* JADX WARNING: type inference failed for: r6v17 */
    /* JADX WARNING: type inference failed for: r6v18 */
    /* JADX WARNING: type inference failed for: r6v21, types: [java.lang.String] */
    /* JADX WARNING: type inference failed for: r6v22 */
    /* JADX WARNING: type inference failed for: r6v23 */
    /* JADX WARNING: type inference failed for: r6v24 */
    /* JADX WARNING: type inference failed for: r6v25 */
    /* JADX WARNING: type inference failed for: r6v26 */
    /* JADX WARNING: type inference failed for: r6v27 */
    /* JADX WARNING: type inference failed for: r6v28 */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x00f6, code lost:
        r4 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x00f7, code lost:
        r6 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x00f9, code lost:
        r4 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:46:0x00fa, code lost:
        r6 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x0105, code lost:
        r4 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x012e, code lost:
        r4 = th;
        r6 = r6;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Incorrect type for immutable var: ssa=java.lang.String, code=null, for r6v0, types: [java.lang.String] */
    /* JADX WARNING: Missing exception handler attribute for start block: B:29:0x00aa */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r6v2
  assigns: []
  uses: []
  mth insns count: 114
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
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x00f6 A[ExcHandler: all (th java.lang.Throwable), Splitter:B:22:0x006c] */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x00f9 A[ExcHandler: Throwable (th java.lang.Throwable), Splitter:B:1:0x0006] */
    /* JADX WARNING: Unknown variable types count: 7 */
    public static HttpResponse httpRequest(Context context, String str, String r6, Map<String, String> map, String str2) throws IOException {
        HttpURLConnection httpUrlConnection;
        HttpResponse httpResponse = new HttpResponse();
        OutputStream outputStream = null;
        try {
            r6 = r6;
            httpUrlConnection = getHttpUrlConnection(context, getDefaultStreamHandlerURL(str));
            httpUrlConnection.setConnectTimeout(10000);
            httpUrlConnection.setReadTimeout(15000);
            if (r6 == 0) {
                r6 = "GET";
            }
            httpUrlConnection.setRequestMethod(r6);
            if (map != null) {
                for (String str3 : map.keySet()) {
                    httpUrlConnection.setRequestProperty(str3, (String) map.get(str3));
                }
            }
            int i = 0;
            if (!TextUtils.isEmpty(str2)) {
                httpUrlConnection.setDoOutput(true);
                byte[] bytes = str2.getBytes();
                OutputStream outputStream2 = httpUrlConnection.getOutputStream();
                try {
                    outputStream2.write(bytes, 0, bytes.length);
                    outputStream2.flush();
                    outputStream2.close();
                } catch (IOException e) {
                    e = e;
                    OutputStream outputStream3 = outputStream2;
                } catch (Throwable th) {
                    th = th;
                    r6 = 0;
                    outputStream = outputStream2;
                    IOUtils.closeQuietly(outputStream);
                    IOUtils.closeQuietly(r6);
                    throw th;
                }
            }
            httpResponse.responseCode = httpUrlConnection.getResponseCode();
            StringBuilder sb = new StringBuilder();
            sb.append("Http POST Response Code: ");
            sb.append(httpResponse.responseCode);
            Log.d("com.xiaomi.common.Network", sb.toString());
            while (true) {
                String headerFieldKey = httpUrlConnection.getHeaderFieldKey(i);
                String headerField = httpUrlConnection.getHeaderField(i);
                if (headerFieldKey == null && headerField == null) {
                    r6 = new BufferedReader(new InputStreamReader(new DoneHandlerInputStream(httpUrlConnection.getInputStream())));
                    r6 = new BufferedReader(new InputStreamReader(new DoneHandlerInputStream(httpUrlConnection.getErrorStream())));
                    try {
                        StringBuffer stringBuffer = new StringBuffer();
                        String property = System.getProperty("line.separator");
                        for (String readLine = r6.readLine(); readLine != null; readLine = r6.readLine()) {
                            stringBuffer.append(readLine);
                            stringBuffer.append(property);
                        }
                        httpResponse.responseString = stringBuffer.toString();
                        r6.close();
                        IOUtils.closeQuietly(null);
                        IOUtils.closeQuietly(null);
                        return httpResponse;
                    } catch (IOException e2) {
                        e = e2;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("err while request ");
                        sb2.append(str);
                        sb2.append(":");
                        sb2.append(e.getClass().getSimpleName());
                        throw new IOException(sb2.toString());
                    } catch (Throwable th2) {
                        th = th2;
                        r6 = r6;
                        r6 = r6;
                        throw new IOException(th.getMessage());
                    }
                } else {
                    httpResponse.headers.put(headerFieldKey, headerField);
                    i = i + 1 + 1;
                }
            }
        } catch (IOException ) {
            r6 = new BufferedReader(new InputStreamReader(new DoneHandlerInputStream(httpUrlConnection.getErrorStream())));
        } catch (Throwable th3) {
        }
    }

    public static boolean is2GConnected(Context context) {
        NetworkInfo networkInfo = getNetworkInfo(context);
        if (networkInfo == null || networkInfo.getType() != 0) {
            return false;
        }
        int subtype = networkInfo.getSubtype();
        if (!(subtype == 4 || subtype == 7 || subtype == 11)) {
            switch (subtype) {
                case 1:
                case 2:
                    break;
                default:
                    return false;
            }
        }
        return true;
    }

    public static boolean is3GConnected(Context context) {
        NetworkInfo networkInfo = getNetworkInfo(context);
        if (networkInfo == null || networkInfo.getType() != 0) {
            return false;
        }
        String subtypeName = networkInfo.getSubtypeName();
        if ("TD-SCDMA".equalsIgnoreCase(subtypeName) || "CDMA2000".equalsIgnoreCase(subtypeName) || "WCDMA".equalsIgnoreCase(subtypeName)) {
            return true;
        }
        switch (networkInfo.getSubtype()) {
            case 3:
            case 5:
            case 6:
            case 8:
            case 9:
            case 10:
            case 12:
            case 14:
            case 15:
                return true;
            default:
                return false;
        }
    }

    public static boolean is4GConnected(Context context) {
        NetworkInfo networkInfo = getNetworkInfo(context);
        boolean z = false;
        if (networkInfo == null || networkInfo.getType() != 0) {
            return false;
        }
        if (13 == networkInfo.getSubtype()) {
            z = true;
        }
        return z;
    }

    public static boolean isConnected(Context context) {
        NetworkInfo networkInfo;
        try {
            networkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        } catch (Exception unused) {
            networkInfo = null;
        }
        return networkInfo != null && networkInfo.isConnected();
    }

    public static boolean isCtwap(Context context) {
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

    public static boolean isUsingMobileDataConnection(Context context) {
        return is4GConnected(context) || is3GConnected(context) || is2GConnected(context);
    }

    public static boolean isWIFIConnected(Context context) {
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

    /* JADX WARNING: type inference failed for: r7v0, types: [java.io.File] */
    /* JADX WARNING: type inference failed for: r7v1, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r7v2 */
    /* JADX WARNING: type inference failed for: r7v4 */
    /* JADX WARNING: type inference failed for: r7v5 */
    /* JADX WARNING: type inference failed for: r7v6 */
    /* JADX WARNING: type inference failed for: r7v9 */
    /* JADX WARNING: type inference failed for: r7v10 */
    /* JADX WARNING: type inference failed for: r7v11 */
    /* JADX WARNING: type inference failed for: r7v12 */
    /* JADX WARNING: type inference failed for: r7v19, types: [java.io.Closeable, java.io.BufferedReader] */
    /* JADX WARNING: type inference failed for: r7v20 */
    /* JADX WARNING: type inference failed for: r7v21 */
    /* JADX WARNING: type inference failed for: r7v22 */
    /* JADX WARNING: type inference failed for: r7v23 */
    /* JADX WARNING: type inference failed for: r7v24 */
    /* JADX WARNING: type inference failed for: r7v25 */
    /* JADX WARNING: type inference failed for: r7v26 */
    /* JADX WARNING: Incorrect type for immutable var: ssa=java.io.File, code=null, for r7v0, types: [java.io.File] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r7v2
  assigns: []
  uses: []
  mth insns count: 133
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
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 6 */
    public static String uploadFile(String str, Map<String, String> map, File r7, String str2) throws IOException {
        FileInputStream fileInputStream = null;
        if (!r7.exists()) {
            return null;
        }
        String name = r7.getName();
        try {
            r7 = r7;
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            httpURLConnection.setReadTimeout(15000);
            httpURLConnection.setConnectTimeout(10000);
            httpURLConnection.setDoInput(true);
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setUseCaches(false);
            httpURLConnection.setRequestMethod("POST");
            httpURLConnection.setRequestProperty("Connection", "Keep-Alive");
            httpURLConnection.setRequestProperty("Content-Type", "multipart/form-data;boundary=*****");
            if (map != null) {
                for (Entry entry : map.entrySet()) {
                    httpURLConnection.setRequestProperty((String) entry.getKey(), (String) entry.getValue());
                }
            }
            httpURLConnection.setFixedLengthStreamingMode(name.length() + 77 + ((int) r7.length()) + str2.length());
            DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream());
            dataOutputStream.writeBytes("--*****\r\n");
            StringBuilder sb = new StringBuilder();
            sb.append("Content-Disposition: form-data; name=\"");
            sb.append(str2);
            sb.append("\";filename=\"");
            sb.append(r7.getName());
            sb.append("\"");
            sb.append("\r\n");
            dataOutputStream.writeBytes(sb.toString());
            dataOutputStream.writeBytes("\r\n");
            FileInputStream fileInputStream2 = new FileInputStream(r7);
            try {
                byte[] bArr = new byte[1024];
                while (true) {
                    int read = fileInputStream2.read(bArr);
                    if (read == -1) {
                        break;
                    }
                    dataOutputStream.write(bArr, 0, read);
                    dataOutputStream.flush();
                }
                dataOutputStream.writeBytes("\r\n");
                dataOutputStream.writeBytes("--");
                dataOutputStream.writeBytes("*****");
                dataOutputStream.writeBytes("--");
                dataOutputStream.writeBytes("\r\n");
                dataOutputStream.flush();
                StringBuffer stringBuffer = new StringBuffer();
                r7 = new BufferedReader(new InputStreamReader(new DoneHandlerInputStream(httpURLConnection.getInputStream())));
                while (true) {
                    try {
                        String readLine = r7.readLine();
                        if (readLine != null) {
                            stringBuffer.append(readLine);
                        } else {
                            String stringBuffer2 = stringBuffer.toString();
                            IOUtils.closeQuietly(fileInputStream2);
                            IOUtils.closeQuietly(r7);
                            return stringBuffer2;
                        }
                    } catch (IOException e) {
                        e = e;
                        FileInputStream fileInputStream3 = fileInputStream2;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("IOException:");
                        sb2.append(e.getClass().getSimpleName());
                        throw new IOException(sb2.toString());
                    } catch (Throwable th) {
                        th = th;
                        r7 = r7;
                        fileInputStream = fileInputStream2;
                        r7 = r7;
                        IOUtils.closeQuietly(fileInputStream);
                        IOUtils.closeQuietly(r7);
                        throw th;
                    }
                }
            } catch (IOException e2) {
                e = e2;
                FileInputStream fileInputStream32 = fileInputStream2;
                StringBuilder sb22 = new StringBuilder();
                sb22.append("IOException:");
                sb22.append(e.getClass().getSimpleName());
                throw new IOException(sb22.toString());
            } catch (Throwable th2) {
                th = th2;
                r7 = 0;
                fileInputStream = fileInputStream2;
                r7 = r7;
                IOUtils.closeQuietly(fileInputStream);
                IOUtils.closeQuietly(r7);
                throw th;
            }
        } catch (IOException e3) {
            e = e3;
            StringBuilder sb222 = new StringBuilder();
            sb222.append("IOException:");
            sb222.append(e.getClass().getSimpleName());
            throw new IOException(sb222.toString());
        } catch (Throwable th3) {
            th = th3;
            r7 = r7;
            IOUtils.closeQuietly(fileInputStream);
            IOUtils.closeQuietly(r7);
            throw th;
        }
    }
}
