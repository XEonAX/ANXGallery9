package com.xiaomi.metoknlp.a;

import android.text.TextUtils;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;
import javax.net.ssl.HttpsURLConnection;

/* compiled from: HttpsUtils */
public class b {
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x0097, code lost:
        r6 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:0x0098, code lost:
        r5 = r7;
        r7 = r6;
        r6 = r5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x00a3, code lost:
        if (r1 != null) goto L_0x00a5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x00a5, code lost:
        r1.disconnect();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:?, code lost:
        r6.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x00b4, code lost:
        r1.disconnect();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:?, code lost:
        r6.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x00be, code lost:
        if (r1 == null) goto L_0x00c1;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x0097 A[ExcHandler: all (r6v6 'th' java.lang.Throwable A[CUSTOM_DECLARE]), Splitter:B:24:0x007c] */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00af A[SYNTHETIC, Splitter:B:48:0x00af] */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x00b4 A[Catch:{ Exception -> 0x00b7 }] */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x00bb A[SYNTHETIC, Splitter:B:58:0x00bb] */
    public static String a(String str, Map map) {
        HttpURLConnection httpURLConnection;
        String stringBuffer;
        String str2 = "";
        if (TextUtils.isEmpty(str)) {
            return str2;
        }
        try {
            URL url = new URL(str);
            BufferedReader bufferedReader = null;
            try {
                httpURLConnection = url.getProtocol().toLowerCase().equals("https") ? (HttpsURLConnection) url.openConnection() : (HttpURLConnection) url.openConnection();
                try {
                    httpURLConnection.setConnectTimeout(30000);
                    httpURLConnection.setReadTimeout(30000);
                    httpURLConnection.setRequestMethod("GET");
                    httpURLConnection.setDoOutput(false);
                    if (map != null && map.size() > 0) {
                        for (String str3 : map.keySet()) {
                            httpURLConnection.addRequestProperty(str3, (String) map.get(str3));
                        }
                    }
                    httpURLConnection.connect();
                    if (httpURLConnection.getResponseCode() == 200) {
                        BufferedReader bufferedReader2 = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
                        try {
                            StringBuffer stringBuffer2 = new StringBuffer();
                            while (true) {
                                String readLine = bufferedReader2.readLine();
                                if (readLine == null) {
                                    break;
                                }
                                stringBuffer2.append(readLine);
                            }
                            stringBuffer = stringBuffer2.toString();
                            bufferedReader2.close();
                            str2 = stringBuffer;
                            bufferedReader = bufferedReader2;
                        } catch (Exception unused) {
                            str2 = stringBuffer;
                            bufferedReader = bufferedReader2;
                            if (bufferedReader != null) {
                            }
                        } catch (Throwable th) {
                        }
                    }
                    if (bufferedReader != null) {
                        try {
                            bufferedReader.close();
                        } catch (Exception unused2) {
                        }
                    }
                } catch (Exception unused3) {
                    if (bufferedReader != null) {
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (bufferedReader != null) {
                    }
                    if (httpURLConnection != null) {
                    }
                    throw th;
                }
            } catch (Exception unused4) {
                httpURLConnection = null;
                if (bufferedReader != null) {
                }
            } catch (Throwable th3) {
                th = th3;
                httpURLConnection = null;
                if (bufferedReader != null) {
                }
                if (httpURLConnection != null) {
                }
                throw th;
            }
        } catch (MalformedURLException unused5) {
            return str2;
        }
        return str2;
    }
}
