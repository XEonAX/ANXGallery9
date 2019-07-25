package miui.module.appstore;

import android.util.Log;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONObject;

class NetworkUtils {
    /* JADX WARNING: Removed duplicated region for block: B:24:0x005f  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0065  */
    static boolean downloadFile(String str, File file) {
        HttpURLConnection httpURLConnection = null;
        try {
            HttpURLConnection httpURLConnection2 = (HttpURLConnection) new URL(str).openConnection();
            try {
                httpURLConnection2.setConnectTimeout(10000);
                httpURLConnection2.setReadTimeout(15000);
                BufferedInputStream bufferedInputStream = new BufferedInputStream(httpURLConnection2.getInputStream());
                FileOutputStream fileOutputStream = new FileOutputStream(file);
                byte[] bArr = new byte[4096];
                while (true) {
                    int read = bufferedInputStream.read(bArr);
                    if (read == -1) {
                        break;
                    }
                    fileOutputStream.write(bArr, 0, read);
                }
                fileOutputStream.close();
                if (httpURLConnection2 != null) {
                    httpURLConnection2.disconnect();
                }
                return true;
            } catch (IOException e) {
                e = e;
                httpURLConnection = httpURLConnection2;
                String str2 = "NetworkUtils";
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("error while downloading file ");
                    sb.append(e);
                    Log.e(str2, sb.toString());
                    if (httpURLConnection != null) {
                    }
                    return false;
                } catch (Throwable th) {
                    th = th;
                    if (httpURLConnection != null) {
                        httpURLConnection.disconnect();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                httpURLConnection = httpURLConnection2;
                if (httpURLConnection != null) {
                }
                throw th;
            }
        } catch (IOException e2) {
            e = e2;
            String str22 = "NetworkUtils";
            StringBuilder sb2 = new StringBuilder();
            sb2.append("error while downloading file ");
            sb2.append(e);
            Log.e(str22, sb2.toString());
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
            }
            return false;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x0066  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x006d  */
    static JSONObject downloadMetadata(String str) {
        HttpURLConnection httpURLConnection;
        StringBuilder sb = new StringBuilder();
        try {
            httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            try {
                httpURLConnection.setConnectTimeout(10000);
                httpURLConnection.setReadTimeout(15000);
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new BufferedInputStream(httpURLConnection.getInputStream())));
                while (true) {
                    String readLine = bufferedReader.readLine();
                    if (readLine == null) {
                        break;
                    }
                    sb.append(readLine);
                }
                JSONObject jSONObject = new JSONObject(sb.toString());
                if (httpURLConnection != null) {
                    httpURLConnection.disconnect();
                }
                return jSONObject;
            } catch (Exception e) {
                e = e;
                String str2 = "NetworkUtils";
                try {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("error while downloading metadata ");
                    sb2.append(e);
                    Log.e(str2, sb2.toString());
                    if (httpURLConnection != null) {
                    }
                    return null;
                } catch (Throwable th) {
                    th = th;
                    if (httpURLConnection != null) {
                    }
                    throw th;
                }
            }
        } catch (Exception e2) {
            e = e2;
            httpURLConnection = null;
            String str22 = "NetworkUtils";
            StringBuilder sb22 = new StringBuilder();
            sb22.append("error while downloading metadata ");
            sb22.append(e);
            Log.e(str22, sb22.toString());
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            httpURLConnection = null;
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
            }
            throw th;
        }
    }
}
