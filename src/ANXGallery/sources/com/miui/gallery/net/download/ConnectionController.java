package com.miui.gallery.net.download;

import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.preference.BaseGalleryPreferences.CTA;
import com.miui.gallery.util.BaseNetworkUtils;
import com.miui.gallery.util.Log;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

class ConnectionController {

    static final class Holder<T> {
        public final int reason;
        public final T value;

        public Holder(int i) {
            this.value = null;
            this.reason = i;
        }

        public Holder(T t) {
            this.value = t;
            this.reason = 0;
        }
    }

    static Holder<HttpURLConnection> open(Uri uri, int i) {
        String scheme = uri.getScheme();
        if (TextUtils.equals(scheme, "http") || TextUtils.equals(scheme, "https")) {
            return open(uri.toString(), i);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("not support scheme ");
        sb.append(scheme);
        throw new IllegalArgumentException(sb.toString());
    }

    static Holder<HttpURLConnection> open(String str, int i) {
        int verify = verify(i);
        if (verify != 0) {
            return new Holder<>(verify);
        }
        try {
            Log.d("ConnectionController", "try open http connection");
            return new Holder<>((HttpURLConnection) new URL(str).openConnection());
        } catch (MalformedURLException e) {
            StringBuilder sb = new StringBuilder();
            sb.append("invalid url ");
            sb.append(str);
            throw new IllegalArgumentException(sb.toString(), e);
        } catch (IOException e2) {
            Log.w("ConnectionController", (Throwable) e2);
            return new Holder<>(4);
        }
    }

    private static int verify(int i) {
        Log.d("ConnectionController", "refreshing network state");
        if (!BaseNetworkUtils.isNetworkConnected()) {
            return 1;
        }
        if (!CTA.canConnectNetwork()) {
            return 2;
        }
        return (i != 1 || !BaseNetworkUtils.isActiveNetworkMetered()) ? 0 : 3;
    }
}
