package com.miui.gallery.util;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;

public class BaseNetworkUtils {
    public static NetworkInfo getActiveNetworkInfo() {
        ConnectivityManager connectivityManager = (ConnectivityManager) StaticContext.sGetAndroidContext().getSystemService("connectivity");
        if (connectivityManager == null) {
            return null;
        }
        return connectivityManager.getActiveNetworkInfo();
    }

    public static boolean isActiveNetworkMetered() {
        ConnectivityManager connectivityManager = (ConnectivityManager) StaticContext.sGetAndroidContext().getSystemService("connectivity");
        boolean z = false;
        if (connectivityManager == null) {
            return false;
        }
        if (isNetworkConnected() && connectivityManager.isActiveNetworkMetered()) {
            z = true;
        }
        return z;
    }

    public static boolean isNetworkConnected() {
        ConnectivityManager connectivityManager = (ConnectivityManager) StaticContext.sGetAndroidContext().getSystemService("connectivity");
        if (connectivityManager == null) {
            return false;
        }
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnected();
    }
}
