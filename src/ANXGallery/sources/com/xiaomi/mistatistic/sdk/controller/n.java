package com.xiaomi.mistatistic.sdk.controller;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.mistatistic.sdk.BuildSetting;
import com.xiaomi.mistatistic.sdk.CustomSettings;
import com.xiaomi.mistatistic.sdk.MiStatInterface;
import com.xiaomi.mistatistic.sdk.URLStatsRecorder;
import com.xiaomi.mistatistic.sdk.b;
import com.xiaomi.mistatistic.sdk.data.AbstractEvent;
import com.xiaomi.mistatistic.sdk.data.StatEventPojo;
import com.xiaomi.mistatistic.sdk.data.h;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import org.json.JSONArray;
import org.json.JSONObject;

/* compiled from: ProcessMonitorManager */
public class n {
    private static final String[] a = {"mistat_dau", "pv", "pt", "session", "new", "pa"};
    /* access modifiers changed from: private */
    public static Context b = d.a();
    private static HashMap<Integer, Integer> c = new HashMap<>();
    /* access modifiers changed from: private */
    public static boolean d = m.a(b, "config_monitor_enable");

    static {
        c.put(Integer.valueOf(1), Integer.valueOf(1));
        c.put(Integer.valueOf(2), Integer.valueOf(2));
        c.put(Integer.valueOf(3), Integer.valueOf(4));
        c.put(Integer.valueOf(4), Integer.valueOf(8));
        c.put(Integer.valueOf(5), Integer.valueOf(16));
        c.put(Integer.valueOf(6), Integer.valueOf(32));
        c.put(Integer.valueOf(7), Integer.valueOf(64));
        c.put(Integer.valueOf(8), Integer.valueOf(128));
        c.put(Integer.valueOf(9), Integer.valueOf(256));
        c.put(Integer.valueOf(10), Integer.valueOf(512));
        c.put(Integer.valueOf(11), Integer.valueOf(1024));
    }

    public static int a(String str) {
        int i = 0;
        try {
            for (Entry entry : c.entrySet()) {
                int intValue = ((Integer) entry.getKey()).intValue();
                int intValue2 = ((Integer) entry.getValue()).intValue();
                if (a(intValue, str)) {
                    i |= intValue2;
                }
            }
        } catch (Exception e) {
            j.a("PMM", "getClientConfiguration exception", (Throwable) e);
        }
        return i;
    }

    private static JSONObject a(StatEventPojo statEventPojo) {
        JSONObject jSONObject = new JSONObject();
        if (statEventPojo != null) {
            try {
                jSONObject.put("category", statEventPojo.mCategory);
                jSONObject.put("key", statEventPojo.mKey);
            } catch (Exception e) {
                j.a("PMM", "pojoToJson exception", (Throwable) e);
            }
        }
        return jSONObject;
    }

    public static void a() {
        try {
            if (d && b != null) {
                HashMap hashMap = new HashMap();
                for (String a2 : a) {
                    a(a2, (Map<String, Long>) hashMap);
                }
                if (!hashMap.isEmpty()) {
                    LocalEventRecorder.insertEvent(new h(m.d(b, "monitor_start", 0), hashMap));
                    c();
                }
            }
        } catch (Exception e) {
            j.a("PMM", "createMonitorEvent exception:", (Throwable) e);
        }
    }

    public static void a(final double d2) {
        r.b.execute(new Runnable() {
            public void run() {
                try {
                    if (t.a(g.a(n.b), d2)) {
                        n.d = true;
                        m.b(n.b, "config_monitor_enable", true);
                        return;
                    }
                    n.d = false;
                    m.b(n.b, "config_monitor_enable", false);
                } catch (Exception e) {
                    j.a("PMM", "setMonitorEnable exception", (Throwable) e);
                }
            }
        });
    }

    public static void a(String str, AbstractEvent abstractEvent) {
        try {
            if (b != null) {
                a(str, abstractEvent.valueToJSon());
            }
        } catch (Exception e) {
            j.a("PMM", "monitor AbstractEvent exception", (Throwable) e);
        }
    }

    public static void a(String str, StatEventPojo statEventPojo) {
        try {
            if (b != null) {
                a(str, a(statEventPojo));
            }
        } catch (Exception e) {
            j.a("PMM", "monitor StatEventPojo exception", (Throwable) e);
        }
    }

    public static void a(String str, String str2) {
        try {
            if (b != null) {
                JSONArray jSONArray = new JSONArray(str2);
                if (jSONArray.length() > 0) {
                    for (int i = 0; i < jSONArray.length(); i++) {
                        JSONObject jSONObject = jSONArray.getJSONObject(i);
                        if (jSONObject != null) {
                            JSONArray jSONArray2 = jSONObject.getJSONArray("content");
                            if (jSONArray2 != null && jSONArray2.length() > 0) {
                                for (int i2 = 0; i2 < jSONArray2.length(); i2++) {
                                    a(str, jSONArray2.getJSONObject(i2));
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            j.a("PMM", "monitor data exception", (Throwable) e);
        }
    }

    public static void a(String str, List<StatEventPojo> list) {
        try {
            if (b != null) {
                for (StatEventPojo a2 : list) {
                    a(str, a(a2));
                }
            }
        } catch (Exception e) {
            j.a("PMM", "monitor List<StatEventPojo> exception", (Throwable) e);
        }
    }

    private static void a(String str, Map<String, Long> map) {
        String str2 = str;
        Map<String, Long> map2 = map;
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("c-");
            sb.append(str2);
            long b2 = b(sb.toString());
            StringBuilder sb2 = new StringBuilder();
            sb2.append("w-");
            sb2.append(str2);
            long b3 = b(sb2.toString());
            StringBuilder sb3 = new StringBuilder();
            sb3.append("p-");
            sb3.append(str2);
            long b4 = b(sb3.toString());
            StringBuilder sb4 = new StringBuilder();
            sb4.append("u-");
            sb4.append(str2);
            long b5 = b(sb4.toString());
            StringBuilder sb5 = new StringBuilder();
            sb5.append("d-");
            sb5.append(str2);
            long b6 = b(sb5.toString());
            StringBuilder sb6 = new StringBuilder();
            sb6.append("ed-");
            sb6.append(str2);
            long b7 = b(sb6.toString());
            if (b2 != 0 || b3 != 0 || b4 != 0 || b5 != 0 || b6 != 0) {
                StringBuilder sb7 = new StringBuilder();
                sb7.append("c-");
                sb7.append(str2);
                map2.put(sb7.toString(), Long.valueOf(b2));
                StringBuilder sb8 = new StringBuilder();
                sb8.append("w-");
                sb8.append(str2);
                map2.put(sb8.toString(), Long.valueOf(b3));
                StringBuilder sb9 = new StringBuilder();
                sb9.append("p-");
                sb9.append(str2);
                map2.put(sb9.toString(), Long.valueOf(b4));
                StringBuilder sb10 = new StringBuilder();
                sb10.append("u-");
                sb10.append(str2);
                map2.put(sb10.toString(), Long.valueOf(b5));
                StringBuilder sb11 = new StringBuilder();
                sb11.append("d-");
                sb11.append(str2);
                map2.put(sb11.toString(), Long.valueOf(b6));
                if (b7 != 0) {
                    StringBuilder sb12 = new StringBuilder();
                    sb12.append("ed-");
                    sb12.append(str2);
                    map2.put(sb12.toString(), Long.valueOf(b7));
                }
            } else if (b7 != 0) {
                StringBuilder sb13 = new StringBuilder();
                sb13.append("ed-");
                sb13.append(str2);
                map2.put(sb13.toString(), Long.valueOf(b7));
            }
        } catch (Exception e) {
            j.a("PMM", "fillMonitorCounterMap exception", (Throwable) e);
        }
    }

    private static void a(String str, JSONObject jSONObject) {
        try {
            if (d && b != null) {
                long currentTimeMillis = System.currentTimeMillis();
                if (b("monitor_start") == 0) {
                    m.c(b, "monitor_start", currentTimeMillis);
                }
                String string = jSONObject.getString("category");
                if (!TextUtils.isEmpty(string)) {
                    if (string.equals("mistat_basic")) {
                        b(str, jSONObject);
                    } else if (string.equals("mistat_pt")) {
                        c(str, jSONObject);
                    } else if (string.equals("mistat_pv")) {
                        d(str, jSONObject);
                    } else if (string.equals("mistat_pa")) {
                        f(str, jSONObject);
                    } else if (string.equals("mistat_session")) {
                        e(str, jSONObject);
                    }
                }
            }
        } catch (Exception e) {
            j.a("PMM", "monitor JSONObject exception", (Throwable) e);
        }
    }

    private static boolean a(int i, String str) {
        boolean z;
        switch (i) {
            case 1:
                z = URLStatsRecorder.isRecordEnabled();
                break;
            case 2:
                z = CustomSettings.isUseSystemUploadingService();
                break;
            case 3:
                z = CustomSettings.isUseSystemStatService();
                break;
            case 4:
                z = j.a();
                break;
            case 5:
                z = MiStatInterface.isABTestInitialized();
                break;
            case 6:
                z = b.a();
                break;
            case 7:
                z = BuildSetting.isTestNetworkEnabled();
                break;
            case 8:
                z = BuildSetting.isSelfStats();
                break;
            case 9:
                z = h.b();
                break;
            case 10:
                if (!TextUtils.isEmpty(str)) {
                    z = str.toLowerCase().startsWith("https");
                    break;
                } else {
                    return false;
                }
            case 11:
                try {
                    z = BuildSetting.isRespectUEP();
                    break;
                } catch (Exception e) {
                    j.a("PMM", "checkSetting exception", (Throwable) e);
                    return false;
                }
            default:
                return false;
        }
        return z;
    }

    private static long b(String str) {
        try {
            if (b != null) {
                return m.d(b, str, 0);
            }
            return 0;
        } catch (Exception e) {
            j.a("PMM", "getMonitor exception", (Throwable) e);
            return 0;
        }
    }

    private static void b(String str, String str2) {
        if (TextUtils.isEmpty(str2)) {
            return;
        }
        if (str2.equals("mistat_dau")) {
            m.c(b, c(str, "mistat_dau"), m.d(b, c(str, "mistat_dau"), 0) + 1);
        } else if (str2.equals("new")) {
            m.c(b, c(str, "new"), m.d(b, c(str, "new"), 0) + 1);
        }
    }

    private static void b(String str, JSONObject jSONObject) {
        try {
            JSONArray optJSONArray = jSONObject.optJSONArray("values");
            if (optJSONArray != null) {
                for (int i = 0; i < optJSONArray.length(); i++) {
                    b(str, optJSONArray.getJSONObject(i).optString("key", ""));
                }
                return;
            }
            b(str, jSONObject.optString("key", ""));
        } catch (Exception e) {
            j.a("PMM", "basicMonitor exception", (Throwable) e);
        }
    }

    private static String c(String str, String str2) {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("-");
        sb.append(str2);
        return sb.toString();
    }

    private static void c() {
        try {
            if (b != null) {
                m.b(b);
                m.c(b, "monitor_start", System.currentTimeMillis());
            }
        } catch (Exception e) {
            j.a("PMM", "cleanMonitor exception", (Throwable) e);
        }
    }

    private static void c(String str, JSONObject jSONObject) {
        int i;
        try {
            JSONArray optJSONArray = jSONObject.optJSONArray("values");
            if (optJSONArray != null) {
                i = 0;
                for (int i2 = 0; i2 < optJSONArray.length(); i2++) {
                    i += optJSONArray.getJSONObject(i2).optString("value", "").split(",").length;
                }
            } else {
                i = 1;
            }
            m.c(b, c(str, "pt"), m.d(b, c(str, "pt"), 0) + ((long) i));
        } catch (Exception e) {
            j.a("PMM", "ptMonitor exception", (Throwable) e);
        }
    }

    private static void d(String str, JSONObject jSONObject) {
        try {
            JSONArray optJSONArray = jSONObject.optJSONArray("values");
            m.c(b, c(str, "pv"), m.d(b, c(str, "pv"), 0) + ((long) (optJSONArray != null ? optJSONArray.length() : 1)));
        } catch (Exception e) {
            j.a("PMM", "pvMonitor exception", (Throwable) e);
        }
    }

    private static void e(String str, JSONObject jSONObject) {
        try {
            JSONArray optJSONArray = jSONObject.optJSONArray("values");
            m.c(b, c(str, "session"), m.d(b, c(str, "session"), 0) + ((long) (optJSONArray != null ? optJSONArray.length() : 1)));
        } catch (Exception e) {
            j.a("PMM", "sessionMonitor exception", (Throwable) e);
        }
    }

    private static void f(String str, JSONObject jSONObject) {
        try {
            JSONArray optJSONArray = jSONObject.optJSONArray("values");
            int length = optJSONArray != null ? optJSONArray.length() : 1;
            long d2 = m.d(b, c(str, "pa"), 0);
            Context context = b;
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(c(str, "pa"));
            m.c(context, sb.toString(), d2 + ((long) length));
        } catch (Exception e) {
            j.a("PMM", "paMonitor exception", (Throwable) e);
        }
    }
}
