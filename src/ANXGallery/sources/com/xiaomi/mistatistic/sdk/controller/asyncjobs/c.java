package com.xiaomi.mistatistic.sdk.controller.asyncjobs;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.mistatistic.sdk.BuildSetting;
import com.xiaomi.mistatistic.sdk.controller.d;
import com.xiaomi.mistatistic.sdk.controller.f;
import com.xiaomi.mistatistic.sdk.controller.g;
import com.xiaomi.mistatistic.sdk.controller.j;
import com.xiaomi.mistatistic.sdk.controller.l;
import com.xiaomi.mistatistic.sdk.controller.l.b;
import com.xiaomi.mistatistic.sdk.controller.m;
import com.xiaomi.mistatistic.sdk.controller.o;
import com.xiaomi.mistatistic.sdk.controller.s;
import com.xiaomi.mistatistic.sdk.controller.t;
import java.util.TreeMap;
import org.json.JSONException;
import org.json.JSONObject;

/* compiled from: RemoteDataUploadJob */
public class c implements com.xiaomi.mistatistic.sdk.controller.e.a {
    /* access modifiers changed from: private */
    public a a;
    /* access modifiers changed from: private */
    public String b;
    private int c;
    private int d = 0;
    /* access modifiers changed from: private */
    public boolean e = false;

    /* compiled from: RemoteDataUploadJob */
    public interface a {
        void a(boolean z, String str, boolean z2);
    }

    public c(int i, String str, a aVar, int i2, boolean z) {
        this.d = i;
        this.a = aVar;
        this.b = str;
        this.c = i2;
        this.e = z;
    }

    private String a(String str, String str2, String str3) {
        return t.b(String.format("seed:%s-%s-%s", new Object[]{str, str2, str3})).substring(0, 16);
    }

    private void a(JSONObject jSONObject) throws JSONException {
        Context a2 = d.a();
        if (jSONObject.has("data")) {
            JSONObject jSONObject2 = jSONObject.getJSONObject("data");
            if (jSONObject2.has("configVersion") && !jSONObject2.getString("configVersion").equals(m.a(a2, "configVersion", "0.0"))) {
                f.a(a2).a(false);
            }
        }
    }

    /* access modifiers changed from: private */
    public boolean a(String str) throws JSONException {
        String str2 = "RDUJ";
        StringBuilder sb = new StringBuilder();
        sb.append("Upload complete, result: ");
        sb.append(str == null ? "" : str.trim());
        j.c(str2, sb.toString());
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                String string = jSONObject.getString("status");
                a(jSONObject);
                b(jSONObject);
                if ("ok".equals(string)) {
                    return true;
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append("result status isn't ok, ");
                sb2.append(string);
                j.c("RDUJ", sb2.toString());
            } catch (Exception e2) {
                j.a("RDUJ", "parseUploadingResult exception ", (Throwable) e2);
            }
        }
        return false;
    }

    private void b(JSONObject jSONObject) throws JSONException {
        if (jSONObject.has("data")) {
            JSONObject jSONObject2 = jSONObject.getJSONObject("data");
            if (jSONObject2.has("delay")) {
                long j = jSONObject2.getLong("delay");
                if (this.d == 1) {
                    o.a(j);
                }
            }
        }
    }

    public void execute() {
        int i;
        try {
            int f = s.a().f();
            long e2 = s.a().e();
            TreeMap treeMap = new TreeMap();
            Context a2 = d.a();
            String str = BuildSetting.isTestNetworkEnabled() ? "http://test.data.mistat.xiaomi.srv/mistats/v2" : "http://data.mistat.xiaomi.com/mistats/v2";
            t.a(a2, str, treeMap);
            String c2 = this.e ? g.c(a2) : g.a(a2);
            if (!this.e) {
                if (!BuildSetting.isInternationalBuild()) {
                    if (!t.c()) {
                        i = 1;
                    }
                }
                i = 2;
            } else {
                i = 0;
            }
            treeMap.put("channel", d.d());
            treeMap.put("device_id", c2);
            treeMap.put("id_type", String.valueOf(i));
            treeMap.put("policy", String.valueOf(f));
            treeMap.put("interval", String.valueOf(e2));
            j.a("RDUJ", String.format("upload policy:%d, upload interval:%d, mistat upload version:%d, upload %d events.", new Object[]{Integer.valueOf(f), Long.valueOf(e2), Integer.valueOf(5), Integer.valueOf(this.c)}));
            String e3 = d.e();
            if (!TextUtils.isEmpty(e3)) {
                treeMap.put("version", e3);
            }
            j.b("RDUJ", String.format("stat_value:%s", new Object[]{this.b}));
            treeMap.put("stat_value", com.xiaomi.mistatistic.sdk.controller.c.a(this.b, a(d.b(), d.c(), c2), a(c2, d.c(), d.b())));
            treeMap.put("mistatv", String.valueOf(5));
            treeMap.put("size", String.valueOf(this.c));
            l.a(str, treeMap, new b() {
                public void a(String str) {
                    boolean z;
                    try {
                        z = c.this.a(str);
                    } catch (Exception e) {
                        j.a("RDUJ", "Upload MiStat data failed: ", (Throwable) e);
                        z = false;
                    }
                    c.this.a.a(z, c.this.b, c.this.e);
                }
            });
        } catch (Exception e4) {
            StringBuilder sb = new StringBuilder();
            sb.append("RemoteDataUploadJob exception: ");
            sb.append(e4.getMessage());
            j.d("RDUJ", sb.toString());
            this.a.a(false, this.b, this.e);
        }
    }
}
