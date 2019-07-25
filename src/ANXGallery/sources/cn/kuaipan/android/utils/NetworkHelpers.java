package cn.kuaipan.android.utils;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Proxy;
import android.text.TextUtils;
import org.apache.http.HttpHost;

public class NetworkHelpers {
    public static int getCurrentNetType(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        if (connectivityManager != null) {
            NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
            if (activeNetworkInfo != null) {
                return activeNetworkInfo.getType();
            }
        }
        return -1;
    }

    public static HttpHost getCurrentProxy() {
        HttpHost httpHost = null;
        if (getCurrentNetType(ContextUtils.getContext()) != 0) {
            return null;
        }
        String defaultHost = Proxy.getDefaultHost();
        int defaultPort = Proxy.getDefaultPort();
        if (!TextUtils.isEmpty(defaultHost)) {
            httpHost = new HttpHost(defaultHost, defaultPort);
        }
        return httpHost;
    }
}
