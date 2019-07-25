package com.xiaomi.metoknlp.devicediscover;

import android.content.Context;

/* compiled from: WifiCampStatistics */
public class b {
    private String b;
    private long c;
    private long d;
    private long e;
    private Context mContext;
    private long mDuration;

    public b(Context context) {
        this.mContext = context;
        reset();
    }

    public String a() {
        return this.b;
    }

    public void a(String str) {
        save();
        reset();
        b(str);
    }

    public long b() {
        return this.c;
    }

    public void b(String str) {
        String b2 = i.b(this.mContext, str, "none");
        if (b2 == null || "none".equals(b2)) {
            reset();
            this.b = str;
            long currentTimeMillis = System.currentTimeMillis();
            this.e = currentTimeMillis;
            this.d = currentTimeMillis;
            this.c = currentTimeMillis;
            return;
        }
        try {
            String[] split = b2.split("_");
            this.b = str;
            this.c = Long.valueOf(split[1]).longValue();
            this.mDuration = Long.valueOf(split[2]).longValue();
            this.d = Long.valueOf(split[3]).longValue();
            this.e = Long.valueOf(split[4]).longValue();
        } catch (Exception unused) {
        }
    }

    public long c() {
        return this.e;
    }

    public void d() {
        this.mDuration += System.currentTimeMillis() - this.c;
    }

    public void e() {
        this.e = System.currentTimeMillis();
    }

    public void f() {
        d();
        save();
        reset();
    }

    public long getDuration() {
        return this.mDuration;
    }

    public void reset() {
        this.b = null;
        this.c = 0;
        this.mDuration = 0;
        this.d = 0;
        this.e = 0;
    }

    public void save() {
        if (this.b != null) {
            i.a(this.mContext, this.b, toString());
        }
    }

    public String toString() {
        if (this.b == null) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        sb.append(this.b);
        sb.append("_");
        sb.append(this.c);
        sb.append("_");
        sb.append(this.mDuration);
        sb.append("_");
        sb.append(this.d);
        sb.append("_");
        sb.append(this.e);
        return sb.toString();
    }
}
