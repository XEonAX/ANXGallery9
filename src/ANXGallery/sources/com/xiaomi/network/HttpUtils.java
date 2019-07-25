package com.xiaomi.network;

import android.content.Context;
import android.net.Uri;
import android.net.Uri.Builder;
import android.text.TextUtils;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.xiaomi.channel.commonutils.network.NameValuePair;
import com.xiaomi.channel.commonutils.network.Network;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.keyczar.Keyczar;

public abstract class HttpUtils {

    public static class DefaultHttpGetProcessor extends HttpProcessor {
        public DefaultHttpGetProcessor() {
            super(1);
        }

        public String visit(Context context, String str, List<NameValuePair> list) throws IOException {
            if (list == null) {
                return Network.downloadXml(context, new URL(str));
            }
            Builder buildUpon = Uri.parse(str).buildUpon();
            for (NameValuePair nameValuePair : list) {
                buildUpon.appendQueryParameter(nameValuePair.getName(), nameValuePair.getValue());
            }
            return Network.downloadXml(context, new URL(buildUpon.toString()));
        }
    }

    public static String get(Context context, String str, List<NameValuePair> list) {
        return httpRequest(context, str, list, new DefaultHttpGetProcessor(), true);
    }

    static int getHttpGetTxtTraffic(int i, int i2) {
        return (((i2 + 243) / 1448) * BaiduSceneResult.VARIOUS_TICKETS) + 1080 + i + i2;
    }

    static int getHttpPostTxtTraffic(int i, int i2, int i3) {
        return (((i2 + 200) / 1448) * BaiduSceneResult.VARIOUS_TICKETS) + 1011 + i2 + i + i3;
    }

    static int getPostDataLength(List<NameValuePair> list) {
        int i = 0;
        for (NameValuePair nameValuePair : list) {
            if (!TextUtils.isEmpty(nameValuePair.getName())) {
                i += nameValuePair.getName().length();
            }
            if (!TextUtils.isEmpty(nameValuePair.getValue())) {
                i += nameValuePair.getValue().length();
            }
        }
        return i * 2;
    }

    static int getStringUTF8Length(String str) {
        if (TextUtils.isEmpty(str)) {
            return 0;
        }
        try {
            return str.getBytes(Keyczar.DEFAULT_ENCODING).length;
        } catch (UnsupportedEncodingException unused) {
            return 0;
        }
    }

    private static int getTraffic(HttpProcessor httpProcessor, String str, List<NameValuePair> list, String str2) {
        if (httpProcessor.getRequestType() == 1) {
            return getHttpGetTxtTraffic(str.length(), getStringUTF8Length(str2));
        }
        if (httpProcessor.getRequestType() != 2) {
            return -1;
        }
        return getHttpPostTxtTraffic(str.length(), getPostDataLength(list), getStringUTF8Length(str2));
    }

    /* JADX WARNING: Removed duplicated region for block: B:47:0x009f A[SYNTHETIC, Splitter:B:47:0x009f] */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x00b4 A[Catch:{ MalformedURLException -> 0x00bf }] */
    public static String httpRequest(Context context, String str, List<NameValuePair> list, HttpProcessor httpProcessor, boolean z) {
        Fallback fallback;
        String str2;
        String str3;
        Context context2 = context;
        String str4 = str;
        List<NameValuePair> list2 = list;
        HttpProcessor httpProcessor2 = httpProcessor;
        if (Network.hasNetwork(context)) {
            try {
                ArrayList arrayList = new ArrayList();
                if (z) {
                    Fallback fallbacksByURL = HostManager.getInstance().getFallbacksByURL(str4);
                    if (fallbacksByURL != null) {
                        arrayList = fallbacksByURL.getUrls(str4);
                    }
                    fallback = fallbacksByURL;
                } else {
                    fallback = null;
                }
                if (!arrayList.contains(str4)) {
                    arrayList.add(str4);
                }
                Iterator it = arrayList.iterator();
                String str5 = null;
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    String str6 = (String) it.next();
                    List arrayList2 = list2 != null ? new ArrayList(list2) : null;
                    long currentTimeMillis = System.currentTimeMillis();
                    try {
                        if (!httpProcessor2.prepare(context2, str6, arrayList2)) {
                            break;
                        }
                        str2 = httpProcessor2.visit(context2, str6, arrayList2);
                        try {
                            if (!TextUtils.isEmpty(str2)) {
                                if (fallback == null) {
                                    break;
                                }
                                try {
                                    fallback.succeedUrl(str6, System.currentTimeMillis() - currentTimeMillis, (long) getTraffic(httpProcessor2, str6, arrayList2, str2));
                                    break;
                                } catch (IOException e) {
                                    e = e;
                                }
                            } else {
                                if (fallback != null) {
                                    str3 = str2;
                                    try {
                                        fallback.failedUrl(str6, System.currentTimeMillis() - currentTimeMillis, (long) getTraffic(httpProcessor2, str6, arrayList2, str2), null);
                                    } catch (IOException e2) {
                                        e = e2;
                                        str2 = str3;
                                    }
                                } else {
                                    str3 = str2;
                                }
                                str5 = str3;
                            }
                        } catch (IOException e3) {
                            e = e3;
                            String str7 = str2;
                            if (fallback == null) {
                            }
                            e.printStackTrace();
                            str5 = str3;
                        }
                    } catch (IOException e4) {
                        e = e4;
                        str2 = str5;
                        if (fallback == null) {
                            str3 = str2;
                            fallback.failedUrl(str6, System.currentTimeMillis() - currentTimeMillis, (long) getTraffic(httpProcessor2, str6, arrayList2, str2), e);
                        } else {
                            str3 = str2;
                        }
                        e.printStackTrace();
                        str5 = str3;
                    }
                }
                str2 = str5;
                return str2;
            } catch (MalformedURLException e5) {
                e5.printStackTrace();
            }
        }
        return null;
    }
}
