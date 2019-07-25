package com.xiaomi.mistatistic.sdk.controller.asyncjobs;

import android.text.TextUtils;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import com.xiaomi.mistatistic.sdk.controller.h;
import com.xiaomi.mistatistic.sdk.controller.j;
import com.xiaomi.mistatistic.sdk.controller.o;
import com.xiaomi.mistatistic.sdk.data.StatEventPojo;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* compiled from: RemoteDataPackingJob */
public class b implements com.xiaomi.mistatistic.sdk.controller.e.a {
    private static int a;
    private long b;
    private a c;
    private HashMap<String, JSONObject> d = new HashMap<>();
    private HashMap<String, JSONObject> e = new HashMap<>();
    private ArrayList<String> f = new ArrayList<>();
    private JSONObject g = null;
    private long h = 0;
    private int i = 0;
    private boolean j = false;

    /* compiled from: RemoteDataPackingJob */
    public interface a {
        void a(String str, long j, long j2, int i, boolean z);
    }

    /* renamed from: com.xiaomi.mistatistic.sdk.controller.asyncjobs.b$b reason: collision with other inner class name */
    /* compiled from: RemoteDataPackingJob */
    public class C0008b {
        int a;
        /* access modifiers changed from: private */
        public JSONArray c;
        /* access modifiers changed from: private */
        public long d;
        /* access modifiers changed from: private */
        public long e;

        public C0008b(JSONArray jSONArray, long j, long j2, int i) {
            this.c = jSONArray;
            this.d = j;
            this.e = j2;
            this.a = i;
        }
    }

    public b(int i2, long j2, boolean z, a aVar) {
        this.i = i2;
        this.b = j2;
        this.c = aVar;
        this.j = z;
    }

    private void a() {
        this.g = null;
        this.d.clear();
        this.f.clear();
        this.e.clear();
    }

    private void a(StatEventPojo statEventPojo) {
        long j2 = statEventPojo.mTimeStamp;
        if (b(j2) && this.g != null) {
            a();
            this.h = j2;
        }
    }

    private void b(StatEventPojo statEventPojo) throws JSONException {
        JSONObject jSONObject = (JSONObject) this.d.get("mistat_pa");
        if (jSONObject == null) {
            JSONArray jSONArray = new JSONArray();
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("category", "mistat_pa");
            jSONObject2.put("values", jSONArray);
            this.d.put("mistat_pa", jSONObject2);
            this.g.getJSONArray("content").put(jSONObject2);
            jSONObject = jSONObject2;
        }
        JSONObject jSONObject3 = new JSONObject();
        String[] split = statEventPojo.mValue.split(",");
        String str = split[0];
        long parseLong = Long.parseLong(split[1]);
        long parseLong2 = Long.parseLong(split[2]);
        boolean parseBoolean = Boolean.parseBoolean(split[3]);
        jSONObject3.put("name", str);
        jSONObject3.put("start", parseLong);
        jSONObject3.put("end", parseLong2);
        jSONObject3.put("auto_end", parseBoolean);
        jSONObject3.put("env", statEventPojo.mExtra);
        jSONObject.getJSONArray("values").put(jSONObject3);
    }

    private boolean b(long j2) {
        return (this.b > 0 && this.h - j2 > this.b) || !a(j2);
    }

    private C0008b c(long j2) throws JSONException {
        int i2;
        long j3;
        long j4;
        JSONArray jSONArray;
        long j5;
        int i3;
        long j6;
        long j7;
        long j8 = j2;
        JSONArray jSONArray2 = new JSONArray();
        h hVar = new h();
        a();
        hVar.a(Boolean.valueOf(this.j));
        List list = this.i == 2 ? hVar.c(j8) : this.i == 1 ? hVar.a(j8) : null;
        int i4 = 0;
        long j9 = 0;
        if (list != null) {
            try {
                if (list.size() > 0) {
                    j.a(String.format("Packing, get %d events from local DB", new Object[]{Integer.valueOf(list.size())}));
                    j6 = 0;
                    j7 = 0;
                    i3 = 0;
                    while (i4 < list.size()) {
                        try {
                            StatEventPojo statEventPojo = (StatEventPojo) list.get(i4);
                            if (j6 == 0) {
                                long j10 = statEventPojo.mTimeStamp;
                                try {
                                    this.h = j10;
                                    j6 = j10;
                                } catch (Exception e2) {
                                    e = e2;
                                    j6 = j10;
                                    j5 = j7;
                                    j.a("doPacking exception", (Throwable) e);
                                    jSONArray = jSONArray2;
                                    i2 = i3;
                                    j3 = j6;
                                    j4 = j5;
                                    C0008b bVar = new C0008b(jSONArray, j4, j3, i2);
                                    return bVar;
                                }
                            }
                            j5 = statEventPojo.mTimeStamp;
                            try {
                                a(statEventPojo);
                                if (this.g == null) {
                                    this.g = new JSONObject();
                                    this.g.put("endTS", statEventPojo.mTimeStamp);
                                    this.g.put("content", new JSONArray());
                                    jSONArray2.put(this.g);
                                }
                                if ("mistat_session".equals(statEventPojo.mCategory)) {
                                    d(statEventPojo);
                                } else if ("mistat_pv".equals(statEventPojo.mCategory)) {
                                    f(statEventPojo);
                                } else if ("mistat_pt".equals(statEventPojo.mCategory)) {
                                    g(statEventPojo);
                                } else if ("mistat_session_extra".equals(statEventPojo.mCategory)) {
                                    e(statEventPojo);
                                } else if ("mistat_pa".equals(statEventPojo.mCategory)) {
                                    b(statEventPojo);
                                } else if ("mistat_monitor".equals(statEventPojo.mCategory)) {
                                    c(statEventPojo);
                                } else {
                                    h(statEventPojo);
                                }
                                this.g.put("startTS", statEventPojo.mTimeStamp);
                                i3++;
                                i4++;
                                j7 = j5;
                            } catch (Exception e3) {
                                e = e3;
                                j.a("doPacking exception", (Throwable) e);
                                jSONArray = jSONArray2;
                                i2 = i3;
                                j3 = j6;
                                j4 = j5;
                                C0008b bVar2 = new C0008b(jSONArray, j4, j3, i2);
                                return bVar2;
                            }
                        } catch (Exception e4) {
                            e = e4;
                            j5 = j7;
                            j.a("doPacking exception", (Throwable) e);
                            jSONArray = jSONArray2;
                            i2 = i3;
                            j3 = j6;
                            j4 = j5;
                            C0008b bVar22 = new C0008b(jSONArray, j4, j3, i2);
                            return bVar22;
                        }
                    }
                    StringBuilder sb = new StringBuilder();
                    sb.append("Packing complete, total ");
                    sb.append(i3);
                    sb.append(" records were packed and to be uploaded");
                    j.a(sb.toString());
                    j9 = j6;
                    i4 = i3;
                    i2 = i4;
                    j3 = j9;
                    j4 = j7;
                    jSONArray = jSONArray2;
                    C0008b bVar222 = new C0008b(jSONArray, j4, j3, i2);
                    return bVar222;
                }
            } catch (Exception e5) {
                e = e5;
                j6 = 0;
                j5 = 0;
                i3 = 0;
                j.a("doPacking exception", (Throwable) e);
                jSONArray = jSONArray2;
                i2 = i3;
                j3 = j6;
                j4 = j5;
                C0008b bVar2222 = new C0008b(jSONArray, j4, j3, i2);
                return bVar2222;
            }
        }
        j.a("No data available to be packed");
        j7 = 0;
        jSONArray2 = null;
        i2 = i4;
        j3 = j9;
        j4 = j7;
        jSONArray = jSONArray2;
        C0008b bVar22222 = new C0008b(jSONArray, j4, j3, i2);
        return bVar22222;
    }

    private void c(StatEventPojo statEventPojo) throws JSONException {
        JSONObject jSONObject = (JSONObject) this.d.get("mistat_monitor");
        if (jSONObject == null) {
            JSONArray jSONArray = new JSONArray();
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("category", "mistat_monitor");
            jSONObject2.put("values", jSONArray);
            this.d.put("mistat_monitor", jSONObject2);
            this.g.getJSONArray("content").put(jSONObject2);
            jSONObject = jSONObject2;
        }
        JSONObject jSONObject3 = new JSONObject();
        jSONObject3.put("start", Long.parseLong(statEventPojo.mValue));
        jSONObject3.put("end", statEventPojo.mTimeStamp);
        jSONObject3.put("value", new JSONObject(statEventPojo.mExtra));
        jSONObject.getJSONArray("values").put(jSONObject3);
    }

    private void d(StatEventPojo statEventPojo) throws JSONException {
        JSONObject jSONObject = (JSONObject) this.d.get("mistat_session");
        if (jSONObject == null) {
            JSONArray jSONArray = new JSONArray();
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("category", "mistat_session");
            jSONObject2.put("values", jSONArray);
            this.d.put("mistat_session", jSONObject2);
            this.g.getJSONArray("content").put(jSONObject2);
            jSONObject = jSONObject2;
        }
        JSONObject jSONObject3 = new JSONObject();
        String[] split = statEventPojo.mValue.split(",");
        long parseLong = Long.parseLong(split[0]);
        long parseLong2 = Long.parseLong(split[1]);
        jSONObject3.put("start", parseLong);
        jSONObject3.put("end", parseLong2);
        jSONObject3.put("env", statEventPojo.mExtra);
        jSONObject.getJSONArray("values").put(jSONObject3);
    }

    private void e(StatEventPojo statEventPojo) throws JSONException {
        JSONObject jSONObject = (JSONObject) this.d.get("mistat_session_extra");
        if (jSONObject == null) {
            JSONArray jSONArray = new JSONArray();
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("category", "mistat_session_extra");
            jSONObject2.put("values", jSONArray);
            this.d.put("mistat_session_extra", jSONObject2);
            this.g.getJSONArray("content").put(jSONObject2);
            jSONObject = jSONObject2;
        }
        JSONObject jSONObject3 = new JSONObject();
        long parseLong = Long.parseLong(statEventPojo.mValue);
        long parseLong2 = Long.parseLong(statEventPojo.mExtra);
        jSONObject3.put("start", parseLong);
        jSONObject3.put("auto_end", parseLong2);
        jSONObject.getJSONArray("values").put(jSONObject3);
    }

    private void f(StatEventPojo statEventPojo) throws JSONException {
        JSONObject jSONObject = (JSONObject) this.d.get("mistat_pv");
        if (jSONObject == null) {
            jSONObject = new JSONObject();
            JSONArray jSONArray = new JSONArray();
            JSONArray jSONArray2 = new JSONArray();
            jSONObject.put("category", "mistat_pv");
            jSONObject.put("values", jSONArray);
            jSONObject.put("source", jSONArray2);
            this.d.put("mistat_pv", jSONObject);
            this.g.getJSONArray("content").put(jSONObject);
        }
        String[] split = statEventPojo.mValue.trim().split(",");
        String[] strArr = new String[split.length];
        if (split != null && split.length > 0) {
            for (int i2 = 0; i2 < split.length; i2++) {
                int indexOf = this.f.indexOf(split[i2]);
                if (indexOf >= 0) {
                    strArr[i2] = String.valueOf(indexOf + 1);
                } else {
                    strArr[i2] = String.valueOf(this.f.size() + 1);
                    this.f.add(split[i2]);
                }
            }
        }
        jSONObject.getJSONArray("values").put(TextUtils.join(",", strArr));
        jSONObject.put("index", TextUtils.join(",", this.f));
        if (TextUtils.isEmpty(statEventPojo.mExtra)) {
            jSONObject.getJSONArray("source").put("");
        } else {
            jSONObject.getJSONArray("source").put(statEventPojo.mExtra);
        }
    }

    private void g(StatEventPojo statEventPojo) throws JSONException {
        JSONObject jSONObject = (JSONObject) this.d.get("mistat_pt");
        if (jSONObject == null) {
            jSONObject = new JSONObject();
            JSONArray jSONArray = new JSONArray();
            jSONObject.put("category", "mistat_pt");
            jSONObject.put("values", jSONArray);
            this.d.put("mistat_pt", jSONObject);
            this.g.getJSONArray("content").put(jSONObject);
        }
        JSONArray jSONArray2 = jSONObject.getJSONArray("values");
        for (int i2 = 0; i2 < jSONArray2.length(); i2++) {
            JSONObject jSONObject2 = jSONArray2.getJSONObject(i2);
            if (TextUtils.equals(jSONObject2.getString("key"), statEventPojo.mKey)) {
                StringBuilder sb = new StringBuilder();
                sb.append(jSONObject2.getString("value"));
                sb.append(",");
                sb.append(statEventPojo.mValue);
                jSONObject2.put("value", sb.toString());
                return;
            }
        }
        JSONObject jSONObject3 = new JSONObject();
        jSONObject3.put("key", statEventPojo.mKey);
        jSONObject3.put("value", statEventPojo.mValue);
        jSONObject.getJSONArray("values").put(jSONObject3);
    }

    private void h(StatEventPojo statEventPojo) throws JSONException {
        boolean z;
        JSONObject jSONObject = (JSONObject) this.d.get(statEventPojo.mCategory);
        if (jSONObject == null) {
            jSONObject = new JSONObject();
            JSONArray jSONArray = new JSONArray();
            jSONObject.put("category", statEventPojo.mCategory);
            jSONObject.put("values", jSONArray);
            this.d.put(statEventPojo.mCategory, jSONObject);
            this.g.getJSONArray("content").put(jSONObject);
            z = true;
        } else {
            z = false;
        }
        if ("event".equals(statEventPojo.mType) && TextUtils.isEmpty(statEventPojo.mExtra)) {
            JSONObject jSONObject2 = (JSONObject) this.e.get(statEventPojo.mKey);
            if (jSONObject2 == null || z) {
                JSONObject jSONObject3 = new JSONObject();
                jSONObject3.put("key", statEventPojo.mKey);
                jSONObject3.put(nexExportFormat.TAG_FORMAT_TYPE, statEventPojo.mType);
                jSONObject3.put("value", Long.parseLong(statEventPojo.mValue));
                jSONObject.getJSONArray("values").put(jSONObject3);
                this.e.put(statEventPojo.mKey, jSONObject3);
                return;
            }
            jSONObject2.put("value", jSONObject2.getLong("value") + Long.parseLong(statEventPojo.mValue));
        } else if ("mistat_extra".equals(statEventPojo.mCategory)) {
            jSONObject.getJSONArray("values").put(statEventPojo.mValue);
        } else {
            JSONObject jSONObject4 = new JSONObject();
            jSONObject4.put("key", statEventPojo.mKey);
            jSONObject4.put(nexExportFormat.TAG_FORMAT_TYPE, statEventPojo.mType);
            if ("count".equals(statEventPojo.mType) || "numeric".equals(statEventPojo.mType)) {
                jSONObject4.put("value", Long.parseLong(statEventPojo.mValue));
            } else {
                jSONObject4.put("value", statEventPojo.mValue);
            }
            if (!TextUtils.isEmpty(statEventPojo.mExtra)) {
                jSONObject4.put("params", new JSONObject(statEventPojo.mExtra));
            }
            jSONObject.getJSONArray("values").put(jSONObject4);
        }
    }

    /* access modifiers changed from: 0000 */
    public boolean a(long j2) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(this.h);
        instance.setTimeZone(TimeZone.getTimeZone("GMT + 8"));
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        long timeInMillis = instance.getTimeInMillis();
        return j2 >= timeInMillis && j2 < 86400000 + timeInMillis;
    }

    public void execute() {
        try {
            C0008b c2 = c(Long.MAX_VALUE);
            if (c2.c != null) {
                this.c.a(c2.c.toString(), c2.d, c2.e, c2.a, this.j);
            } else {
                this.c.a("", c2.d, c2.e, c2.a, this.j);
            }
            if (c2.a >= 500) {
                j.a(String.format("Packing %d events >= MAX_PACKING_EVENT %d", new Object[]{Integer.valueOf(c2.a), Integer.valueOf(500)}));
                if (a < 10) {
                    new o(this.i).a();
                    a++;
                    return;
                }
                j.c("Packing, exceeded MAX_UPLOAD_TIMES 10");
                return;
            }
            a = 0;
        } catch (Exception e2) {
            j.a("remote data packing job execute exception:", (Throwable) e2);
            this.c.a("", 0, 0, 0, this.j);
        }
    }
}
