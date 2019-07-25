package com.nexstreaming.nexeditorsdk;

import android.graphics.Color;
import android.graphics.PointF;
import android.graphics.RectF;
import android.util.Log;
import com.nexstreaming.nexeditorsdk.nexSaveDataFormat.nexCollageTitleInfoOf;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
import org.keyczar.Keyczar;

class nexCollageTitleInfo implements nexCollageInfo, nexCollageInfoTitle {
    private static String b = "nexCollageTitleInfo";
    protected CollageInfoChangedListener a;
    private float c;
    private float d;
    private RectF e;
    private List<PointF> f = new ArrayList();
    private String g;
    private Type h;
    private String i;
    private int j = 20;
    private int k = 20;
    private int l = 1;
    private Map<String, String> m = new HashMap();
    private String n = null;
    private String o = "";
    private String p = "";
    private String q = "";
    private String r = "";

    enum Type {
        User,
        System
    }

    nexCollageTitleInfo() {
    }

    /* access modifiers changed from: 0000 */
    public float a(PointF pointF, PointF pointF2, PointF pointF3) {
        return ((pointF2.x - pointF.x) * (pointF3.y - pointF.y)) - ((pointF3.x - pointF.x) * (pointF2.y - pointF.y));
    }

    /* access modifiers changed from: 0000 */
    public int a(PointF pointF, List<PointF> list) {
        int i2 = 0;
        for (int i3 = 0; i3 < list.size() - 1; i3++) {
            if (((PointF) list.get(i3)).y <= pointF.y) {
                int i4 = i3 + 1;
                if (((PointF) list.get(i4)).y > pointF.y && a((PointF) list.get(i3), (PointF) list.get(i4), pointF) > 0.0f) {
                    i2++;
                }
            } else {
                int i5 = i3 + 1;
                if (((PointF) list.get(i5)).y <= pointF.y && a((PointF) list.get(i3), (PointF) list.get(i5), pointF) < 0.0f) {
                    i2--;
                }
            }
        }
        return i2;
    }

    /* access modifiers changed from: 0000 */
    public String a(JSONObject jSONObject) {
        try {
            this.c = Float.parseFloat(jSONObject.getString("start"));
            this.d = Float.parseFloat(jSONObject.getString("end"));
            if (jSONObject.has("position")) {
                String[] split = jSONObject.getString("position").replace(" ", "").split(",");
                if (split == null) {
                    return "Wrong position data of titleinfo";
                }
                this.f.clear();
                if (split.length == 4) {
                    float parseFloat = Float.parseFloat(split[0]);
                    float parseFloat2 = Float.parseFloat(split[1]);
                    float parseFloat3 = Float.parseFloat(split[2]);
                    float parseFloat4 = Float.parseFloat(split[3]);
                    PointF pointF = new PointF(parseFloat, parseFloat2);
                    PointF pointF2 = new PointF(parseFloat3, parseFloat2);
                    PointF pointF3 = new PointF(parseFloat3, parseFloat4);
                    PointF pointF4 = new PointF(parseFloat, parseFloat4);
                    this.f.add(pointF);
                    this.f.add(pointF2);
                    this.f.add(pointF3);
                    this.f.add(pointF4);
                    this.f.add(pointF);
                    this.e = new RectF(parseFloat, parseFloat2, parseFloat3, parseFloat4);
                } else {
                    float f2 = Float.MAX_VALUE;
                    float f3 = Float.MAX_VALUE;
                    float f4 = Float.MIN_VALUE;
                    float f5 = Float.MIN_VALUE;
                    for (int i2 = 0; i2 < split.length; i2 += 2) {
                        float parseFloat5 = Float.parseFloat(split[i2]);
                        float parseFloat6 = Float.parseFloat(split[i2 + 1]);
                        if (f2 > parseFloat5) {
                            f2 = parseFloat5;
                        }
                        if (f4 < parseFloat5) {
                            f4 = parseFloat5;
                        }
                        if (f3 > parseFloat6) {
                            f3 = parseFloat6;
                        }
                        if (f5 < parseFloat6) {
                            f5 = parseFloat6;
                        }
                        this.f.add(new PointF(parseFloat5, parseFloat6));
                    }
                    this.e = new RectF(f2, f3, f4, f5);
                }
            }
            this.g = jSONObject.getString("title_id");
            this.h = jSONObject.getString("title_type").compareTo("user") == 0 ? Type.User : Type.System;
            if (jSONObject.has("draw_id")) {
                this.i = jSONObject.getString("draw_id");
            }
            JSONObject jSONObject2 = jSONObject.getJSONObject("title_default");
            Iterator keys = jSONObject2.keys();
            while (keys.hasNext()) {
                String str = (String) keys.next();
                this.m.put(str, jSONObject2.getString(str));
            }
            if (jSONObject.has("max_length")) {
                this.j = Integer.parseInt(jSONObject.getString("max_length"));
            }
            if (jSONObject.has("recommend_length")) {
                this.k = Integer.parseInt(jSONObject.getString("recommend_length"));
            }
            if (jSONObject.has("title_max_lines")) {
                this.l = Integer.parseInt(jSONObject.getString("title_max_lines"));
            }
            return null;
        } catch (JSONException e2) {
            e2.printStackTrace();
            String str2 = b;
            StringBuilder sb = new StringBuilder();
            sb.append("parse Collage failed : ");
            sb.append(e2.getMessage());
            Log.d(str2, sb.toString());
            return e2.getMessage();
        }
    }

    /* access modifiers changed from: protected */
    public void a(CollageInfoChangedListener collageInfoChangedListener) {
        this.a = collageInfoChangedListener;
    }

    /* access modifiers changed from: 0000 */
    public void a(nexCollageTitleInfoOf nexcollagetitleinfoof) {
        this.r = nexcollagetitleinfoof.userDropShadowColor;
        this.p = nexcollagetitleinfoof.userFillColor;
        this.o = nexcollagetitleinfoof.userFont;
        this.q = nexcollagetitleinfoof.userStrokeColor;
        this.n = nexcollagetitleinfoof.userText;
    }

    public boolean a() {
        return this.h == Type.User;
    }

    public boolean a(float f2, float f3) {
        if (this.f != null && this.f.size() > 0 && a(new PointF(f2, f3), this.f) > 0) {
            return true;
        }
        if (this.e != null) {
            return this.e.contains(f2, f3);
        }
        return false;
    }

    public String b() {
        StringBuilder sb = new StringBuilder();
        try {
            if (this.o.length() > 0) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(getId());
                sb2.append("_font");
                sb.append(URLEncoder.encode(sb2.toString(), Keyczar.DEFAULT_ENCODING));
                sb.append("=");
                StringBuilder sb3 = new StringBuilder();
                sb3.append("fontid:");
                sb3.append(this.o);
                sb.append(URLEncoder.encode(sb3.toString(), Keyczar.DEFAULT_ENCODING));
                sb.append("&");
            }
            if (this.p.length() > 0) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append(getId());
                sb4.append("_fill_color");
                sb.append(URLEncoder.encode(sb4.toString(), Keyczar.DEFAULT_ENCODING));
                sb.append("=");
                sb.append(URLEncoder.encode(this.p, Keyczar.DEFAULT_ENCODING));
                sb.append("&");
            }
            if (this.q.length() > 0) {
                StringBuilder sb5 = new StringBuilder();
                sb5.append(getId());
                sb5.append("_stroke_color");
                sb.append(URLEncoder.encode(sb5.toString(), Keyczar.DEFAULT_ENCODING));
                sb.append("=");
                sb.append(URLEncoder.encode(this.q, Keyczar.DEFAULT_ENCODING));
                sb.append("&");
            }
            if (this.r.length() > 0) {
                StringBuilder sb6 = new StringBuilder();
                sb6.append(getId());
                sb6.append("_dropshadow_color");
                sb.append(URLEncoder.encode(sb6.toString(), Keyczar.DEFAULT_ENCODING));
                sb.append("=");
                sb.append(URLEncoder.encode(this.r, Keyczar.DEFAULT_ENCODING));
                sb.append("&");
            }
            sb.append(URLEncoder.encode(getId(), Keyczar.DEFAULT_ENCODING));
            sb.append("=");
            if (this.n == null) {
                String language = Locale.getDefault().getLanguage();
                String str = this.m.containsKey(language) ? (String) this.m.get(language) : (String) this.m.get("en");
                if (str.startsWith("@content=")) {
                    str = this.a != null ? this.a.TitleInfoContentTime(this.i, str.substring("@content=".length())) : "";
                } else if (str.startsWith("@collage=")) {
                    str = this.a != null ? this.a.CollageTime(str.substring("@collage=".length())) : "";
                }
                sb.append(URLEncoder.encode(str, Keyczar.DEFAULT_ENCODING));
            } else if (this.n.length() <= 0) {
                sb.append(URLEncoder.encode(" ", Keyczar.DEFAULT_ENCODING));
            } else {
                sb.append(URLEncoder.encode(this.n, Keyczar.DEFAULT_ENCODING));
            }
        } catch (UnsupportedEncodingException e2) {
            e2.printStackTrace();
        }
        return sb.toString();
    }

    public String c() {
        return this.i;
    }

    /* access modifiers changed from: 0000 */
    public nexCollageTitleInfoOf d() {
        nexCollageTitleInfoOf nexcollagetitleinfoof = new nexCollageTitleInfoOf();
        nexcollagetitleinfoof.userDropShadowColor = this.r;
        nexcollagetitleinfoof.userFillColor = this.p;
        nexcollagetitleinfoof.userFont = this.o;
        nexcollagetitleinfoof.userStrokeColor = this.q;
        nexcollagetitleinfoof.userText = this.n;
        return nexcollagetitleinfoof;
    }

    public String getId() {
        return this.g;
    }

    public List<PointF> getPositions() {
        return this.f;
    }

    public RectF getRectangle() {
        return this.e;
    }

    public String getTitle(String str) {
        if (this.n != null) {
            return this.n;
        }
        String str2 = "";
        if (str == null || !this.m.containsKey(str)) {
            String language = Locale.getDefault().getLanguage();
            if (this.m.containsKey(language)) {
                str2 = (String) this.m.get(language);
            } else if (this.m.containsKey("en")) {
                str2 = (String) this.m.get("en");
            }
        } else {
            str2 = (String) this.m.get(str);
        }
        if (str2.startsWith("@content=")) {
            if (this.a != null) {
                str2 = this.a.TitleInfoContentTime(this.i, str2.substring("@content=".length()));
            }
        } else if (str2.startsWith("@collage=") && this.a != null) {
            str2 = this.a.CollageTime(str2.substring("@collage=".length()));
        }
        return str2;
    }

    public int getTitleDropShadowColor() {
        if (this.p == null || this.p.length() <= 0) {
            return 0;
        }
        int parseInt = Integer.parseInt(this.p.substring(1, this.p.length()));
        return Color.argb(Color.blue(parseInt), Color.alpha(parseInt), Color.red(parseInt), Color.green(parseInt));
    }

    public int getTitleFillColor() {
        if (this.p == null || this.p.length() <= 0) {
            return 0;
        }
        int parseInt = Integer.parseInt(this.p.substring(1, this.p.length()));
        return Color.argb(Color.blue(parseInt), Color.alpha(parseInt), Color.red(parseInt), Color.green(parseInt));
    }

    public String getTitleFont() {
        return this.o;
    }

    public int getTitleMaxLength() {
        return this.j;
    }

    public int getTitleMaxLines() {
        return this.l;
    }

    public int getTitleRecommendLength() {
        return this.k;
    }

    public int getTitleStrokeColor() {
        if (this.p == null || this.p.length() <= 0) {
            return 0;
        }
        int parseInt = Integer.parseInt(this.p.substring(1, this.p.length()));
        return Color.argb(Color.blue(parseInt), Color.alpha(parseInt), Color.red(parseInt), Color.green(parseInt));
    }

    public boolean setTitle(String str) {
        this.n = str;
        if (this.a != null) {
            this.a.TitleInfoChanged();
        }
        return true;
    }

    public boolean setTitleDropShadowColor(int i2) {
        int alpha = Color.alpha(i2);
        int red = Color.red(i2);
        int green = Color.green(i2);
        int blue = Color.blue(i2);
        if (Color.alpha(i2) == 0) {
            this.r = "";
        } else {
            this.r = String.format("#%8X", new Object[]{Integer.valueOf(Color.argb(red, green, blue, alpha))});
        }
        return true;
    }

    public boolean setTitleFillColor(int i2) {
        int alpha = Color.alpha(i2);
        int red = Color.red(i2);
        int green = Color.green(i2);
        int blue = Color.blue(i2);
        if (Color.alpha(i2) == 0) {
            this.p = "";
        } else {
            this.p = String.format("#%8X", new Object[]{Integer.valueOf(Color.argb(red, green, blue, alpha))});
        }
        return true;
    }

    public boolean setTitleFont(String str) {
        this.o = str;
        return true;
    }

    public boolean setTitleStrokeColor(int i2) {
        int alpha = Color.alpha(i2);
        int red = Color.red(i2);
        int green = Color.green(i2);
        int blue = Color.blue(i2);
        if (Color.alpha(i2) == 0) {
            this.q = "";
        } else {
            this.q = String.format("#%8X", new Object[]{Integer.valueOf(Color.argb(red, green, blue, alpha))});
        }
        return true;
    }
}
