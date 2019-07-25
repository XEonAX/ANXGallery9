package com.xiaomi.metoknlp;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.xiaomi.metoknlp.a.e;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.json.JSONObject;

/* compiled from: Config */
public class a {
    private static boolean f;
    private static int g;
    private static a h;
    private SharedPreferences i = this.mContext.getSharedPreferences("config", 0);
    private List j = new ArrayList();
    private Context mContext;

    private a(Context context) {
        this.mContext = context;
    }

    public static a g() {
        return h;
    }

    public static boolean h() {
        return false;
    }

    public static synchronized void init(Context context) {
        synchronized (a.class) {
            if (h == null) {
                h = new a(context);
            }
        }
    }

    public void a(f fVar) {
        if (fVar != null) {
            synchronized (this.j) {
                this.j.add(fVar);
            }
        }
    }

    public void c(String str) {
        Editor edit = this.i.edit();
        edit.putString("config_update_time", str);
        edit.commit();
    }

    public void i() {
        synchronized (this.j) {
            for (f onConfigurationChanged : this.j) {
                onConfigurationChanged.onConfigurationChanged();
            }
        }
    }

    public String j() {
        return this.i.getString("m_s_u", "https://metok.sys.miui.com");
    }

    public boolean k() {
        return this.i.getBoolean("f_d_d", true);
    }

    public long l() {
        return this.i.getLong("d_m_i", Long.MAX_VALUE);
    }

    public boolean m() {
        return this.i.getBoolean("d_n_s", f);
    }

    public long n() {
        return this.i.getLong("d_s_t", Long.MAX_VALUE);
    }

    public long o() {
        return this.i.getLong("d_s_c_t", Long.MAX_VALUE);
    }

    public String p() {
        return this.i.getString("config_update_time", MovieStatUtils.DOWNLOAD_SUCCESS);
    }

    public void update() {
        String a;
        String p = p();
        String Y = e.Y();
        if (!p.equals(Y)) {
            String W = e.W();
            StringBuilder sb = new StringBuilder();
            sb.append("t_");
            sb.append(W);
            String a2 = b.a("collect", sb.toString());
            int i2 = 0;
            if (a2 == null || a2.isEmpty()) {
                int i3 = 0;
                do {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("t_");
                    sb2.append(W);
                    a = b.a("collect", sb2.toString());
                    if (a != null && !a.isEmpty()) {
                        break;
                    }
                    i3++;
                } while (i3 != 5);
                if (i3 != 5) {
                    a2 = a;
                } else {
                    return;
                }
            }
            try {
                JSONObject jSONObject = new JSONObject(new JSONObject(a2).getString("data"));
                String string = this.i.getString("s_f", "");
                String optString = jSONObject.optString("s_f", "");
                boolean a3 = e.a(jSONObject.optInt("f_d_d", 0));
                Editor edit = this.i.edit();
                edit.putString("s_f", optString);
                edit.putBoolean("f_d_d", a3);
                edit.putString("m_s_u", jSONObject.optString("m_s_u", "https://metok.sys.miui.com"));
                edit.commit();
                new Date();
                new Date();
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmm");
                if (string != null && !string.isEmpty() && optString != null && !optString.isEmpty()) {
                    Date parse = simpleDateFormat.parse(string);
                    Date parse2 = simpleDateFormat.parse(optString);
                    if (parse2.before(parse) || parse2.equals(parse)) {
                        c(Y);
                        i();
                        return;
                    }
                }
                StringBuilder sb3 = new StringBuilder();
                sb3.append("f_");
                sb3.append(W);
                String a4 = b.a("collect", sb3.toString());
                if (a4 == null || a4.isEmpty()) {
                    do {
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("f_");
                        sb4.append(W);
                        a4 = b.a("collect", sb4.toString());
                        if (a4 != null && !a4.isEmpty()) {
                            break;
                        }
                        i2++;
                    } while (i2 != 5);
                    if (i2 == 5) {
                        return;
                    }
                }
                try {
                    JSONObject jSONObject2 = new JSONObject(new JSONObject(a4).getString("data"));
                    Editor edit2 = this.i.edit();
                    edit2.putLong("d_m_i", jSONObject2.optLong("d_m_i", Long.MAX_VALUE));
                    edit2.putBoolean("d_n_s", e.a(jSONObject2.optInt("d_n_s", g)));
                    edit2.putLong("d_s_t", jSONObject2.optLong("d_s_t", Long.MAX_VALUE));
                    edit2.putLong("d_s_c_t", jSONObject2.optLong("d_s_c_t", Long.MAX_VALUE));
                    edit2.commit();
                    c(Y);
                    i();
                } catch (Exception unused) {
                }
            } catch (Exception unused2) {
            }
        }
    }
}
