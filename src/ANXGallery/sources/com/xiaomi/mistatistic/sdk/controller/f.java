package com.xiaomi.mistatistic.sdk.controller;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.text.TextUtils;
import android.text.format.DateUtils;
import com.xiaomi.mistatistic.sdk.MiStatInterface;
import com.xiaomi.mistatistic.sdk.controller.e.a;
import com.xiaomi.mistatistic.sdk.controller.l.b;
import java.util.Random;
import java.util.TreeMap;
import org.json.JSONObject;

/* compiled from: ConfigProvider */
public class f {
    private static volatile f a = null;
    private static int d = 1;
    /* access modifiers changed from: private */
    public int b = 0;
    private Context c;
    /* access modifiers changed from: private */
    public BroadcastReceiver e = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            try {
                if (f.this.b != 1) {
                    context.unregisterReceiver(f.this.e);
                    return;
                }
                if (l.a(context)) {
                    f.this.a(false);
                }
            } catch (Exception e) {
                j.a("CP", "mNetReceiver exception", (Throwable) e);
            }
        }
    };

    private f(Context context) {
        this.c = context;
        d = m.a(this.c, "sessionMgr", 1);
    }

    public static f a(Context context) {
        if (a == null) {
            synchronized (f.class) {
                if (a == null) {
                    a = new f(context);
                }
            }
        }
        return a;
    }

    /* access modifiers changed from: private */
    public void a(b bVar) {
        try {
            if (!l.a(this.c)) {
                j.d("CP", "no internet connection");
                this.b = 1;
                d();
                return;
            }
            TreeMap treeMap = new TreeMap();
            treeMap.put("channel", d.d());
            treeMap.put("app_id", d.b());
            treeMap.put("sdk_version", "2.1.0");
            treeMap.put("device_id", g.a(this.c));
            treeMap.put("config_version", e());
            treeMap.put("package_name", this.c.getPackageName());
            treeMap.put("app_version", d.e());
            l.a(this.c, "http://data.mistat.xiaomi.com/getconfig", treeMap, bVar);
        } catch (Exception e2) {
            j.a("CP", "requestConfig exception ", (Throwable) e2);
        }
    }

    /* access modifiers changed from: private */
    public void a(String str) {
        try {
            g();
            if (!TextUtils.isEmpty(str)) {
                j.b("CP", String.format("config result:%s", new Object[]{str}));
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.getInt("errorCode") == 0) {
                    JSONObject jSONObject2 = jSONObject.getJSONObject("result");
                    if (jSONObject2 != null) {
                        if (!jSONObject2.optString("configVersion", "0.0").equals(m.a(this.c, "configVersion", "0.0"))) {
                            m.b(this.c, "configVersion", jSONObject2.optString("configVersion", "0.0"));
                            m.b(this.c, "configDelay", jSONObject2.optString("configDelay", "0-0"));
                            n.a(jSONObject2.optDouble("monitor", -1.0d));
                            int optInt = jSONObject2.optInt("uploadPolicy", -1);
                            if (optInt == 0) {
                                MiStatInterface.setUploadPolicy(optInt, jSONObject2.optLong("uploadInterval", -1));
                            } else if (optInt == 1) {
                                MiStatInterface.setUploadPolicy(optInt, jSONObject2.optLong("uploadSize", -1));
                            }
                            MiStatInterface.setUploadNetwork(jSONObject2.optInt("configNetwork", -1));
                            s.a().a(jSONObject2.optLong("uploadIntervalBasic", -1), jSONObject2.optLong("uploadIntervalMin", -1));
                            int optInt2 = jSONObject2.optInt("sessionMgr", -1);
                            if (optInt2 == 1 || optInt2 == 2 || optInt2 == 3) {
                                m.b(this.c, "sessionMgr", optInt2);
                                d = optInt2;
                            }
                        }
                        if (this.b == 1) {
                            this.c.unregisterReceiver(this.e);
                        }
                        this.b = 2;
                    }
                }
            }
        } catch (Exception e2) {
            j.a("CP", "processResult exception", (Throwable) e2);
        }
    }

    /* access modifiers changed from: private */
    public void c() {
        r.b.execute(new Runnable() {
            public void run() {
                f.this.a((b) new b() {
                    public void a(String str) {
                        f.this.a(str);
                    }
                });
            }
        });
    }

    private void d() {
        try {
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
            this.c.registerReceiver(this.e, intentFilter);
        } catch (Exception e2) {
            j.a("CP", "registerNetReceiver exception", (Throwable) e2);
        }
    }

    private String e() {
        return m.a(this.c, "configVersion", "0.0");
    }

    private boolean f() {
        long currentTimeMillis = System.currentTimeMillis();
        try {
            if (!m.b(this.c, "config_request_time")) {
                m.b(this.c, "config_request_time", currentTimeMillis);
                m.b(this.c, "config_request_count", 1);
                return false;
            } else if (DateUtils.isToday(m.a(this.c, "config_request_time", 0))) {
                return m.a(this.c, "config_request_count", 0) >= 12;
            } else {
                m.b(this.c, "config_request_time", currentTimeMillis);
                m.b(this.c, "config_request_count", 0);
                return false;
            }
        } catch (Exception e2) {
            j.a("CP", "reachConfigRequestMaxCount exception", (Throwable) e2);
            return false;
        }
    }

    private void g() {
        try {
            m.b(this.c, "config_request_count", m.a(this.c, "config_request_count", 0) + 1);
        } catch (Exception e2) {
            j.a("CP", "accumulateConfigRequestCount exception", (Throwable) e2);
        }
    }

    public void a(boolean z) {
        if (!l.b()) {
            j.d("CP", "Network connection is disabled.");
        } else if (f()) {
            j.d("CP", "config request to max count skip..");
        } else {
            if (!z) {
                try {
                    c();
                } catch (Exception e2) {
                    j.a("CP", "updateConfig exception", (Throwable) e2);
                }
            } else {
                String[] split = m.a(this.c, "configDelay", "0-0").split("-");
                int i = 0;
                if (split.length > 1) {
                    int parseInt = Integer.parseInt(split[0]);
                    int parseInt2 = Integer.parseInt(split[1]);
                    if (parseInt2 > parseInt) {
                        i = new Random().nextInt(parseInt2 - parseInt) + parseInt;
                    }
                }
                e.b().a((a) new a() {
                    public void execute() {
                        f.this.c();
                    }
                }, (long) (i * 1000));
            }
        }
    }

    public boolean a() {
        return d == 1 || d == 3;
    }

    public boolean b() {
        return d == 2 || d == 3;
    }
}
