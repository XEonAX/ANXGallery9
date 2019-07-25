package com.xiaomi.mistatistic.sdk.controller;

import android.content.Context;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import com.xiaomi.mistatistic.sdk.BuildSetting;
import com.xiaomi.mistatistic.sdk.controller.asyncjobs.a;
import com.xiaomi.mistatistic.sdk.controller.l.b;
import com.xiaomi.mistatistic.sdk.data.HttpEvent;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.TreeMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* compiled from: HttpEventController */
public class i {
    private static volatile i a;
    private HttpEventFilter b = new HttpEventFilter() {
        public HttpEvent onEvent(HttpEvent httpEvent) {
            String url = httpEvent.getUrl();
            if (TextUtils.isEmpty(url)) {
                return null;
            }
            httpEvent.setUrl(url.split("\\?")[0]);
            return httpEvent;
        }
    };
    /* access modifiers changed from: private */
    public List<HttpEvent> c = new LinkedList();
    private Handler d = new Handler(e.d()) {
        public void handleMessage(Message message) {
            if (message.what == 1023) {
                if (i.this.c()) {
                    try {
                        List b = i.this.b();
                        int size = b.size();
                        if (size > 0) {
                            int i = 0;
                            while (i < size) {
                                int i2 = i + 30;
                                final List subList = i2 >= size ? b.subList(i, size) : b.subList(i, i2);
                                i.this.a(subList, (b) new b() {
                                    /* JADX WARNING: Removed duplicated region for block: B:22:? A[RETURN, SYNTHETIC] */
                                    /* JADX WARNING: Removed duplicated region for block: B:9:0x003b A[Catch:{ Exception -> 0x0056 }] */
                                    public void a(String str) {
                                        boolean z;
                                        StringBuilder sb = new StringBuilder();
                                        sb.append("http data complete, result=");
                                        sb.append(str);
                                        j.a("HEC", sb.toString());
                                        try {
                                            if (!TextUtils.isEmpty(str)) {
                                                JSONObject jSONObject = new JSONObject(str);
                                                if ("ok".equals(jSONObject.getString("status"))) {
                                                    i.this.a(jSONObject);
                                                    z = true;
                                                    if (!z) {
                                                        synchronized (i.this.c) {
                                                            i.this.c.removeAll(subList);
                                                        }
                                                        return;
                                                    }
                                                    return;
                                                }
                                            }
                                            z = false;
                                            if (!z) {
                                            }
                                        } catch (Exception e) {
                                            j.a("HEC", "upload events response exception:", (Throwable) e);
                                        }
                                    }
                                });
                                i = i2;
                            }
                        }
                    } catch (Exception e) {
                        j.a("HEC", "HttpEventController handleMessage exception", (Throwable) e);
                    }
                } else if (i.this.d()) {
                    try {
                        i.this.a(new JSONArray().toString(), (b) new b() {
                            public void a(String str) {
                                j.a("HEC", String.format("upload empty http events result: %s", new Object[]{str}));
                            }
                        });
                    } catch (Exception e2) {
                        j.a("HEC", "HttpEventController handleMessage exception", (Throwable) e2);
                    }
                }
            }
        }
    };

    private i() {
    }

    public static i a() {
        if (a == null) {
            synchronized (i.class) {
                if (a == null) {
                    a = new i();
                }
            }
        }
        return a;
    }

    /* access modifiers changed from: private */
    public void a(String str, b bVar) throws IOException {
        if (s.a().b(5)) {
            TreeMap treeMap = new TreeMap();
            String f = f();
            Context a2 = d.a();
            t.a(a2, f, treeMap);
            treeMap.put("app_package", d.g());
            treeMap.put("device_uuid", g.a(a2));
            StringBuilder sb = new StringBuilder();
            sb.append("android");
            sb.append(VERSION.SDK_INT);
            treeMap.put("device_os", sb.toString());
            treeMap.put("device_model", Build.MODEL);
            treeMap.put("app_version", d.e());
            treeMap.put("app_channel", d.d());
            treeMap.put("time", String.valueOf(System.currentTimeMillis()));
            treeMap.put("net_value", str);
            l.a(f, treeMap, bVar);
        }
    }

    /* access modifiers changed from: private */
    public void a(List<HttpEvent> list, b bVar) throws IOException, JSONException {
        HashMap hashMap = new HashMap();
        if (list != null && !list.isEmpty()) {
            for (HttpEvent httpEvent : list) {
                String url = httpEvent.getUrl();
                if (!TextUtils.isEmpty(url)) {
                    if (hashMap.containsKey(url)) {
                        ((List) hashMap.get(url)).add(httpEvent);
                    } else {
                        hashMap.put(url, new ArrayList());
                        ((List) hashMap.get(url)).add(httpEvent);
                    }
                }
            }
            if (!hashMap.isEmpty()) {
                JSONArray jSONArray = new JSONArray();
                for (String str : hashMap.keySet()) {
                    JSONArray jSONArray2 = new JSONArray();
                    for (HttpEvent json : (List) hashMap.get(str)) {
                        jSONArray2.put(json.toJSON());
                    }
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("url", str);
                    jSONObject.put("data", jSONArray2);
                    jSONArray.put(jSONObject);
                }
                a(jSONArray.toString(), bVar);
            }
        }
    }

    /* access modifiers changed from: private */
    public void a(JSONObject jSONObject) throws JSONException {
        if (jSONObject.has("data")) {
            JSONObject jSONObject2 = jSONObject.getJSONObject("data");
            int optInt = jSONObject2.optInt("sample_rate", 10000);
            int optInt2 = jSONObject2.optInt("delay", 300000);
            long optLong = jSONObject2.optLong("ban_time", 0);
            Context a2 = d.a();
            m.b(a2, "rt_upload_rate", optInt);
            m.b(a2, "rt_upload_delay", (long) optInt2);
            m.b(a2, "rt_ban_time", optLong);
            m.b(a2, "rt_update_time", System.currentTimeMillis());
        }
    }

    private boolean a(String str) {
        Context a2 = d.a();
        return str.equals(f()) || str.equals("https://data.mistat.xiaomi.com/micrash") || str.equals("https://data.mistat.xiaomi.com/mistats") || str.equals("http://data.mistat.xiaomi.com/mistats/v2") || str.equals("http://abtest.mistat.xiaomi.com/experiments") || str.equals("http://data.mistat.xiaomi.com/getconfig") || str.equals("https://dev.mi.com/mistats/xmstats/event/dynamic/upload") || str.equals("https://data.mistat.xiaomi.com/realtime_network") || str.equals(t.a(a2, "https://data.mistat.xiaomi.com/micrash")) || str.equals(t.a(a2, "https://data.mistat.xiaomi.com/mistats")) || str.equals(t.a(a2, "http://data.mistat.xiaomi.com/mistats/v2")) || str.equals(t.a(a2, "http://abtest.mistat.xiaomi.com/experiments")) || str.equals(t.a(a2, "http://data.mistat.xiaomi.com/getconfig")) || str.equals(t.a(a2, "https://dev.mi.com/mistats/xmstats/event/dynamic/upload")) || str.equals(t.a(a2, "https://data.mistat.xiaomi.com/realtime_network"));
    }

    private long e() {
        return m.a(d.a(), "rt_upload_delay", 300000);
    }

    private String f() {
        return BuildSetting.isTestNetworkEnabled() ? "http://test.data.mistat.xiaomi.srv/realtime_network" : "https://data.mistat.xiaomi.com/realtime_network";
    }

    public void a(HttpEvent httpEvent) {
        Context a2 = d.a();
        if (a2 == null) {
            j.a("HEC", "add http event without initialization.");
        } else if (BuildSetting.isDisabled(a2)) {
            j.a("HEC", "disabled the http event upload");
        } else if (!a(httpEvent.getUrl()) || BuildSetting.isSelfStats()) {
            if (this.b != null && !httpEvent.getUrl().equals(f())) {
                httpEvent = this.b.onEvent(httpEvent);
            }
            if (httpEvent != null && !TextUtils.isEmpty(httpEvent.getUrl())) {
                synchronized (this.c) {
                    this.c.add(httpEvent);
                    if (this.c.size() > 100) {
                        this.c.remove(0);
                    }
                }
                if (!this.d.hasMessages(1023) && !httpEvent.getUrl().equals(f())) {
                    a.a();
                    this.d.sendEmptyMessageDelayed(1023, e());
                }
            }
        }
    }

    public List<HttpEvent> b() {
        LinkedList linkedList;
        synchronized (this.c) {
            linkedList = new LinkedList(this.c);
        }
        return linkedList;
    }

    public boolean c() {
        Context a2 = d.a();
        return System.currentTimeMillis() > m.a(a2, "rt_ban_time", 0) && Math.random() * 10000.0d <= ((double) m.a(a2, "rt_upload_rate", 10000));
    }

    public boolean d() {
        return System.currentTimeMillis() - m.a(d.a(), "rt_update_time", 0) > 86400000;
    }
}
