package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Log;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* compiled from: nexCollageDrawInfo */
class a implements nexCollageInfo, nexCollageInfoDraw {
    private static String d = "nexCollageDrawInfo";
    protected nexClip a;
    protected RectF b;
    protected CollageInfoChangedListener c;
    private float e;
    private float f;
    private RectF g;
    private List<PointF> h = new ArrayList();
    private String i;
    private String j;
    private String k;
    private String l;
    private String m;
    private String n;
    private int o = 0;
    private int p = 0;
    private float q;
    private Rect r;
    private RectF s;
    private RectF t;

    a() {
    }

    private Rect a(nexDrawInfo nexdrawinfo, Rect rect, int i2, int i3) {
        int userTranslateX = (nexdrawinfo.getUserTranslateX() * i2) / nexCrop.ABSTRACT_DIMENSION;
        int userTranslateY = (nexdrawinfo.getUserTranslateY() * i3) / nexCrop.ABSTRACT_DIMENSION;
        float width = ((float) rect.width()) * 0.5f;
        float height = ((float) rect.height()) * 0.5f;
        float f2 = -width;
        float f3 = -height;
        double d2 = (double) (-((float) Math.toRadians((double) nexdrawinfo.getUserRotateState())));
        float cos = (float) Math.cos(d2);
        float sin = (float) Math.sin(d2);
        float f4 = cos * f2;
        float f5 = sin * f3;
        float f6 = f4 - f5;
        float f7 = f2 * sin;
        float f8 = f3 * cos;
        float f9 = f7 + f8;
        float f10 = cos * width;
        float f11 = f10 - f5;
        float f12 = sin * width;
        float f13 = f8 + f12;
        float f14 = sin * height;
        float f15 = f4 - f14;
        float f16 = cos * height;
        float f17 = f7 + f16;
        float f18 = f10 - f14;
        float f19 = f12 + f16;
        float min = Math.min(Math.min(Math.min(f6, f11), f15), f18);
        float min2 = Math.min(Math.min(Math.min(f9, f13), f17), f19);
        float max = Math.max(Math.max(Math.max(f6, f11), f15), f18);
        float max2 = Math.max(Math.max(Math.max(f9, f13), f17), f19);
        Rect rect2 = new Rect();
        rect2.left = ((int) (min + width)) + userTranslateX + rect.left;
        rect2.top = ((int) (min2 + height)) + userTranslateY + rect.top;
        rect2.right = ((int) (max + width)) + userTranslateX + rect.left;
        rect2.bottom = ((int) (max2 + height)) + userTranslateY + rect.top;
        return rect2;
    }

    private void a(Rect rect) {
        if (this.a != null && this.a.getDrawInfos() != null && this.a.getDrawInfos().size() > 0) {
            if (this.t == null) {
                this.t = new RectF(this.s);
            }
            double width = (double) (this.t.width() * this.t.height());
            double width2 = (double) (rect.width() * rect.height());
            Double.isNaN(width);
            Double.isNaN(width2);
            ((nexDrawInfo) this.a.getDrawInfos().get(0)).setRealScale((float) Math.sqrt(width / width2));
        }
    }

    private void h() {
        if (this.a != null && this.a.getDrawInfos() != null && this.a.getDrawInfos().size() > 0) {
            nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
            int width = this.a.getWidth();
            int height = this.a.getHeight();
            if (this.a.getRotateInMeta() == 90 || this.a.getRotateInMeta() == 270) {
                width = this.a.getHeight();
                height = this.a.getWidth();
            }
            if (this.r == null) {
                this.r = new Rect(nexdrawinfo.getStartRect());
                nexCollage.a(this.r, width, height);
            }
            Rect rect = new Rect(this.r);
            Rect a2 = a(nexdrawinfo, rect, width, height);
            float exactCenterX = a2.exactCenterX();
            float exactCenterY = a2.exactCenterY();
            float f2 = 1.0f;
            float width2 = ((float) a2.width()) * 0.5f;
            float height2 = ((float) a2.height()) * 0.5f;
            if (a2.left < 0) {
                f2 = Math.min(exactCenterX / width2, 1.0f);
            }
            if (a2.right > width) {
                f2 = Math.min((((float) width) - exactCenterX) / width2, f2);
            }
            if (a2.top < 0) {
                f2 = Math.min(exactCenterY / height2, f2);
            }
            if (a2.bottom > height) {
                f2 = Math.min((((float) height) - exactCenterY) / height2, f2);
            }
            float height3 = ((float) rect.height()) * 0.5f * f2;
            float f3 = this.q * height3;
            float exactCenterX2 = rect.exactCenterX();
            float exactCenterY2 = rect.exactCenterY();
            this.s.left = exactCenterX2 - f3;
            this.s.right = exactCenterX2 + f3;
            this.s.top = exactCenterY2 - height3;
            this.s.bottom = exactCenterY2 + height3;
            this.s.round(rect);
            nexCollage.b(rect, width, height);
            nexdrawinfo.setStartRect(rect);
            nexdrawinfo.setEndRect(rect);
        }
    }

    private void i() {
        if (this.a != null && this.a.getDrawInfos() != null && this.a.getDrawInfos().size() > 0) {
            int i2 = 0;
            nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
            int width = this.a.getWidth();
            int height = this.a.getHeight();
            if (this.a.getRotateInMeta() == 90 || this.a.getRotateInMeta() == 270) {
                width = this.a.getHeight();
                height = this.a.getWidth();
            }
            Rect rect = new Rect();
            rect.set((int) this.s.left, (int) this.s.top, (int) this.s.right, (int) this.s.bottom);
            Rect a2 = a(nexdrawinfo, rect, width, height);
            int i3 = a2.left < 0 ? 0 - a2.left : 0;
            if (a2.right > width) {
                i3 -= a2.right - width;
            }
            if (a2.top < 0) {
                i2 = 0 - a2.top;
            }
            if (a2.bottom > height) {
                i2 -= a2.bottom - height;
            }
            if (i3 != 0 || i2 != 0) {
                RectF rectF = this.s;
                float f2 = (float) i3;
                rectF.left += f2;
                this.s.right += f2;
                RectF rectF2 = this.s;
                float f3 = (float) i2;
                rectF2.top += f3;
                this.s.bottom += f3;
                this.s.round(rect);
                nexCollage.b(rect, width, height);
                nexdrawinfo.setStartRect(rect);
                nexdrawinfo.setEndRect(rect);
            }
        }
    }

    private boolean j() {
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return false;
        }
        nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
        int width = this.a.getWidth();
        int height = this.a.getHeight();
        if (this.a.getRotateInMeta() == 90 || this.a.getRotateInMeta() == 270) {
            width = this.a.getHeight();
            height = this.a.getWidth();
        }
        Rect rect = new Rect(nexdrawinfo.getStartRect());
        nexCollage.a(rect, width, height);
        Rect a2 = a(nexdrawinfo, rect, width, height);
        String str = d;
        StringBuilder sb = new StringBuilder();
        sb.append("aabb:");
        sb.append(a2.toString());
        sb.append(" width:");
        sb.append(width);
        sb.append(" height:");
        sb.append(height);
        sb.append(" r:");
        sb.append(rect.toString());
        Log.d(str, sb.toString());
        if (a2.width() > width || a2.height() > height) {
            return false;
        }
        Log.d(d, "aabb checkTranformOk");
        return true;
    }

    private void k() {
        if (this.a != null && this.a.getDrawInfos() != null && this.a.getDrawInfos().size() > 0) {
            int i2 = 0;
            nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
            int width = this.a.getWidth();
            int height = this.a.getHeight();
            if (this.a.getRotateInMeta() == 90 || this.a.getRotateInMeta() == 270) {
                width = this.a.getHeight();
                height = this.a.getWidth();
            }
            Rect rect = new Rect(nexdrawinfo.getStartRect());
            nexCollage.a(rect, width, height);
            Rect a2 = a(nexdrawinfo, rect, width, height);
            int i3 = a2.left < 0 ? 0 - a2.left : 0;
            if (a2.right > width) {
                i3 -= a2.right - width;
            }
            if (a2.top < 0) {
                i2 = 0 - a2.top;
            }
            if (a2.bottom > height) {
                i2 -= a2.bottom - height;
            }
            if (i3 != 0 || i2 != 0) {
                nexdrawinfo.setUserTranslate(((((nexdrawinfo.getUserTranslateX() * width) / nexCrop.ABSTRACT_DIMENSION) + i3) * nexCrop.ABSTRACT_DIMENSION) / width, ((((nexdrawinfo.getUserTranslateY() * height) / nexCrop.ABSTRACT_DIMENSION) + i2) * nexCrop.ABSTRACT_DIMENSION) / height);
            }
        }
    }

    private void l() {
        if (this.a != null && this.a.getDrawInfos() != null && this.a.getDrawInfos().size() > 0) {
            if (this.t == null) {
                this.t = new RectF(this.s);
            }
            double width = (double) (this.t.width() * this.t.height());
            double width2 = (double) (this.s.width() * this.s.height());
            Double.isNaN(width);
            Double.isNaN(width2);
            ((nexDrawInfo) this.a.getDrawInfos().get(0)).setRealScale((float) Math.sqrt(width / width2));
        }
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

    public String a(Context context) {
        return nexAssetPackageManager.getAssetPackageMediaPath(context, this.k);
    }

    /* access modifiers changed from: protected */
    public String a(nexProject nexproject, int i2) {
        float f2 = (float) i2;
        int i3 = (int) (this.e * f2);
        float f3 = this.f;
        if (this.m != null && this.m.length() > 0 && !this.m.equals("none")) {
            nexproject.updateProject();
            nexClip supportedClip = nexClip.getSupportedClip(nexAssetPackageManager.getAssetPackageMediaPath(com.nexstreaming.kminternal.kinemaster.config.a.a().b(), this.m));
            if (supportedClip != null) {
                int totalTime = supportedClip.getTotalTime();
                int parseFloat = (int) (f2 * Float.parseFloat(this.n));
                supportedClip.setCollageDrawInfoID(this.i);
                supportedClip.setAssetResource(true);
                int i4 = i3 + parseFloat;
                nexproject.addAudio(supportedClip, i4, totalTime + i4);
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public String a(String str) {
        if (this.a == null) {
            return "";
        }
        return new SimpleDateFormat(str).format(new Date(new File(this.a.getPath()).lastModified()));
    }

    /* access modifiers changed from: 0000 */
    public String a(JSONObject jSONObject) {
        try {
            this.e = Float.parseFloat(jSONObject.getString("start"));
            this.f = Float.parseFloat(jSONObject.getString("end"));
            if (jSONObject.has("position")) {
                String[] split = jSONObject.getString("position").replace(" ", "").split(",");
                if (split == null) {
                    return "Wrong position data of drawinfo";
                }
                this.h.clear();
                if (split.length == 4) {
                    float parseFloat = Float.parseFloat(split[0]);
                    float parseFloat2 = Float.parseFloat(split[1]);
                    float parseFloat3 = Float.parseFloat(split[2]);
                    float parseFloat4 = Float.parseFloat(split[3]);
                    PointF pointF = new PointF(parseFloat, parseFloat2);
                    PointF pointF2 = new PointF(parseFloat3, parseFloat2);
                    PointF pointF3 = new PointF(parseFloat3, parseFloat4);
                    PointF pointF4 = new PointF(parseFloat, parseFloat4);
                    this.h.add(pointF);
                    this.h.add(pointF2);
                    this.h.add(pointF3);
                    this.h.add(pointF4);
                    this.h.add(pointF);
                    this.g = new RectF(parseFloat, parseFloat2, parseFloat3, parseFloat4);
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
                        this.h.add(new PointF(parseFloat5, parseFloat6));
                    }
                    this.g = new RectF(f2, f3, f4, f5);
                }
            }
            this.i = jSONObject.getString("draw_id");
            this.j = jSONObject.getString("source_type");
            this.k = jSONObject.getString("source_default");
            this.l = jSONObject.getString("lut");
            this.m = jSONObject.getString("audio_res");
            this.n = jSONObject.getString("audio_res_pos");
            if (jSONObject.has("draw_width")) {
                this.o = Integer.parseInt(jSONObject.getString("draw_width"));
            }
            if (jSONObject.has("draw_height")) {
                this.p = Integer.parseInt(jSONObject.getString("draw_height"));
            }
            return null;
        } catch (JSONException e2) {
            e2.printStackTrace();
            String str = d;
            StringBuilder sb = new StringBuilder();
            sb.append("parse Collage failed : ");
            sb.append(e2.getMessage());
            Log.d(str, sb.toString());
            return e2.getMessage();
        }
    }

    public void a(float f2) {
        float f3;
        float f4;
        if (this.a != null && this.a.getDrawInfos() != null && this.a.getDrawInfos().size() > 0) {
            nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
            int width = this.a.getWidth();
            int height = this.a.getHeight();
            if (this.a.getRotateInMeta() == 90 || this.a.getRotateInMeta() == 270) {
                width = this.a.getHeight();
                height = this.a.getWidth();
            }
            if (this.t == null) {
                this.t = new RectF(this.s);
            }
            double width2 = (double) (this.t.width() * this.t.height());
            double width3 = (double) (this.s.width() * this.s.height());
            Double.isNaN(width2);
            Double.isNaN(width3);
            float sqrt = (float) Math.sqrt(width2 / width3);
            String str = d;
            StringBuilder sb = new StringBuilder();
            sb.append("scale_chk:");
            sb.append(sqrt);
            sb.append(" display_rect:");
            sb.append(this.s.toString());
            Log.d(str, sb.toString());
            float centerX = this.s.centerX();
            float centerY = this.s.centerY();
            this.s.width();
            float height2 = this.s.height() * 0.5f;
            if (f2 > 0.0f) {
                if (sqrt <= 2.0f) {
                    f4 = height2 * 0.97f;
                    f3 = this.q * f4;
                } else {
                    return;
                }
            } else if (sqrt >= 0.2f) {
                f4 = height2 * 1.03f;
                f3 = this.q * f4;
            } else {
                return;
            }
            this.s.left = centerX - f3;
            this.s.right = centerX + f3;
            this.s.top = centerY - f4;
            this.s.bottom = centerY + f4;
            Rect rect = new Rect();
            this.s.round(rect);
            nexCollage.b(rect, width, height);
            nexdrawinfo.setStartRect(rect);
            nexdrawinfo.setEndRect(rect);
            this.r = null;
        }
    }

    public void a(RectF rectF) {
        this.t = null;
        if (rectF != null) {
            this.t = new RectF(rectF);
        }
    }

    /* access modifiers changed from: protected */
    public void a(nexClip nexclip) {
        this.a = nexclip;
        if (this.a != null) {
            int width = nexclip.getWidth();
            int height = nexclip.getHeight();
            if (nexclip.getRotateInMeta() == 90 || nexclip.getRotateInMeta() == 270) {
                width = nexclip.getHeight();
                height = nexclip.getWidth();
            }
            this.b = new RectF(0.0f, 0.0f, (float) width, (float) height);
        }
    }

    /* access modifiers changed from: protected */
    public void a(CollageInfoChangedListener collageInfoChangedListener) {
        this.c = collageInfoChangedListener;
    }

    public void a(boolean z) {
        if (this.a != null && this.a.getDrawInfos() != null && this.a.getDrawInfos().size() > 0) {
            int width = this.a.getWidth();
            int height = this.a.getHeight();
            if (this.a.getRotateInMeta() == 90 || this.a.getRotateInMeta() == 270) {
                width = this.a.getHeight();
                height = this.a.getWidth();
            }
            nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
            if (this.t == null) {
                Rect rect = new Rect(0, 0, width, height);
                nexCollage.a(rect, this.q);
                a(new RectF(rect));
            }
            float centerX = this.t.centerX();
            float centerY = this.t.centerY();
            Rect rect2 = new Rect(nexdrawinfo.getStartRect());
            nexCollage.a(rect2, width, height);
            if (z) {
                a(rect2);
            }
            float realScale = nexdrawinfo.getRealScale();
            float width2 = this.t.width() / realScale;
            float height2 = this.t.height() / realScale;
            float exactCenterX = rect2.exactCenterX();
            float exactCenterY = rect2.exactCenterY();
            double d2 = (double) centerX;
            double d3 = (double) width2;
            Double.isNaN(d3);
            double d4 = d3 / 2.0d;
            Double.isNaN(d2);
            nexDrawInfo nexdrawinfo2 = nexdrawinfo;
            rect2.left = (int) (d2 - d4);
            double d5 = (double) centerY;
            double d6 = (double) height2;
            Double.isNaN(d6);
            double d7 = d6 / 2.0d;
            Double.isNaN(d5);
            int i2 = width;
            rect2.top = (int) (d5 - d7);
            Double.isNaN(d2);
            rect2.right = (int) (d2 + d4);
            Double.isNaN(d5);
            rect2.bottom = (int) (d5 + d7);
            nexCollage.a(rect2, this.q);
            int exactCenterX2 = (int) (exactCenterX - rect2.exactCenterX());
            int exactCenterY2 = (int) (exactCenterY - rect2.exactCenterY());
            rect2.left += exactCenterX2;
            rect2.right += exactCenterX2;
            rect2.top += exactCenterY2;
            rect2.bottom += exactCenterY2;
            this.s = new RectF(rect2);
            nexCollage.b(rect2, i2, height);
            nexDrawInfo nexdrawinfo3 = nexdrawinfo2;
            nexdrawinfo3.setStartRect(rect2);
            nexdrawinfo3.setEndRect(rect2);
            this.r = null;
            i();
            h();
            if (z) {
                l();
                this.r = null;
            }
        }
    }

    public boolean a() {
        return this.j.compareTo("system") == 0 || this.j.compareTo("system_mt") == 0;
    }

    public boolean a(float f2, float f3) {
        if (this.h != null && this.h.size() > 0) {
            return a(new PointF(f2, f3), this.h) > 0;
        }
        if (this.g != null) {
            return this.g.contains(f2, f3);
        }
        return false;
    }

    public boolean a(nexClip nexclip, nexDrawInfo nexdrawinfo) {
        if (nexclip == null || nexdrawinfo == null || this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return false;
        }
        nexclip.clearDrawInfos();
        nexclip.addDrawInfo(nexdrawinfo);
        nexclip.mStartTime = this.a.mStartTime;
        nexclip.mEndTime = this.a.mEndTime;
        if (nexclip.getClipType() == 1) {
            nexclip.setImageClipDuration(this.a.getProjectDuration());
        }
        int width = nexclip.getWidth();
        int height = nexclip.getHeight();
        if (nexclip.getRotateInMeta() == 90 || nexclip.getRotateInMeta() == 270) {
            width = nexclip.getHeight();
            height = nexclip.getWidth();
        }
        float f2 = (float) width;
        float f3 = (float) height;
        this.b = new RectF(0.0f, 0.0f, f2, f3);
        this.a = nexclip;
        Rect rect = new Rect(0, 0, width, height);
        Rect rect2 = new Rect(0, 0, 1, 1);
        if (nexclip.getClipType() == 1) {
            RectF rectF = new RectF();
            if (this.c != null) {
                rectF = this.c.FaceRect(nexclip.getPath());
            }
            rect.set((int) (rectF.left * f2), (int) (rectF.top * f3), (int) (rectF.right * f2), (int) (rectF.bottom * f3));
            if (rect.isEmpty()) {
                rect = new Rect(0, 0, width, height);
            } else {
                rect2.set((int) (rectF.left * f2), (int) (rectF.top * f3), (int) (rectF.right * f2), (int) (rectF.bottom * f3));
                int i2 = (rect.right - rect.left) / 2;
                rect.left -= i2;
                rect.right += i2;
                if (rect.left < 0) {
                    rect.left = 0;
                }
                if (rect.right > width) {
                    rect.right = width;
                }
                int i3 = (rect.bottom - rect.top) / 2;
                rect.top -= i3;
                rect.bottom += i3;
                if (rect.top < 0) {
                    rect.top = 0;
                }
                if (rect.bottom > height) {
                    rect.bottom = height;
                }
            }
        }
        nexCollage.a(rect, this.q);
        nexCollage.b(rect, width, height);
        nexCollage.b(rect2, width, height);
        nexdrawinfo.setStartRect(rect);
        nexdrawinfo.setEndRect(rect);
        nexdrawinfo.setFaceRect(rect2);
        this.r = null;
        this.s = null;
        this.b = new RectF(0.0f, 0.0f, f2, f3);
        this.t = null;
        a(false);
        return true;
    }

    /* access modifiers changed from: protected */
    public void b(float f2) {
        this.q = f2;
    }

    public boolean b() {
        return this.j.compareTo("system_mt") == 0;
    }

    public float c() {
        return this.e;
    }

    public boolean changeSource(nexClip nexclip) {
        nexClip nexclip2 = nexclip;
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return false;
        }
        nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
        if (nexdrawinfo == null) {
            return false;
        }
        nexclip.clearDrawInfos();
        nexclip2.addDrawInfo(nexdrawinfo);
        nexclip2.mStartTime = this.a.mStartTime;
        nexclip2.mEndTime = this.a.mEndTime;
        if (nexclip.getClipType() == 4) {
            nexclip2.setAudioOnOff(false);
        } else if (nexclip.getClipType() != 1) {
            return false;
        } else {
            nexclip2.setImageClipDuration(this.a.getProjectDuration());
        }
        int width = nexclip.getWidth();
        int height = nexclip.getHeight();
        if (nexclip.getRotateInMeta() == 90 || nexclip.getRotateInMeta() == 270) {
            width = nexclip.getHeight();
            height = nexclip.getWidth();
        }
        Rect rect = new Rect(0, 0, width, height);
        Rect rect2 = new Rect(0, 0, 1, 1);
        if (nexclip.getClipType() == 1) {
            RectF rectF = new RectF();
            if (this.c != null) {
                rectF = this.c.FaceRect(nexclip.getPath());
            }
            float f2 = (float) width;
            float f3 = (float) height;
            rect.set((int) (rectF.left * f2), (int) (rectF.top * f3), (int) (rectF.right * f2), (int) (rectF.bottom * f3));
            if (rect.isEmpty()) {
                rect = new Rect(0, 0, width, height);
            } else {
                rect2.set((int) (rectF.left * f2), (int) (rectF.top * f3), (int) (rectF.right * f2), (int) (rectF.bottom * f3));
                int i2 = (rect.right - rect.left) / 2;
                rect.left -= i2;
                rect.right += i2;
                if (rect.left < 0) {
                    rect.left = 0;
                }
                if (rect.right > width) {
                    rect.right = width;
                }
                int i3 = (rect.bottom - rect.top) / 2;
                rect.top -= i3;
                rect.bottom += i3;
                if (rect.top < 0) {
                    rect.top = 0;
                }
                if (rect.bottom > height) {
                    rect.bottom = height;
                }
            }
        }
        nexCollage.a(rect, this.q);
        nexCollage.b(rect, width, height);
        nexCollage.b(rect2, width, height);
        nexdrawinfo.setStartRect(rect);
        nexdrawinfo.setEndRect(rect);
        nexdrawinfo.setFaceRect(rect2);
        if (nexclip.getClipType() == 4) {
            nexdrawinfo.setRotateState(nexclip.getRotateInMeta());
        } else {
            nexdrawinfo.setRotateState(0);
        }
        nexdrawinfo.setUserRotateState(0);
        nexdrawinfo.setUserTranslate(0, 0);
        nexdrawinfo.setRealScale(1.0f);
        nexdrawinfo.setBrightness(0);
        this.r = null;
        this.s = null;
        this.b = new RectF(0.0f, 0.0f, (float) width, (float) height);
        nexClip nexclip3 = this.a;
        this.a = nexclip2;
        this.t = null;
        a(true);
        if (this.c == null) {
            return false;
        }
        this.c.SourceChanged(nexclip3, this.a);
        return true;
    }

    public float d() {
        return this.f;
    }

    public String e() {
        return this.l;
    }

    /* access modifiers changed from: 0000 */
    public int f() {
        return this.o;
    }

    /* access modifiers changed from: 0000 */
    public int g() {
        return this.p;
    }

    public nexClip getBindSource() {
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return null;
        }
        return this.a;
    }

    public String getId() {
        return this.i;
    }

    public String getLut() {
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return null;
        }
        nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
        if (nexdrawinfo != null) {
            return nexdrawinfo.getUserLUT();
        }
        return null;
    }

    public List<PointF> getPositions() {
        return this.h;
    }

    public RectF getRectangle() {
        return this.g;
    }

    public int getRotate() {
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return 0;
        }
        return ((nexDrawInfo) this.a.getDrawInfos().get(0)).getUserRotateState();
    }

    public int getTagID() {
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return 0;
        }
        return ((nexDrawInfo) this.a.getDrawInfos().get(0)).getID();
    }

    public boolean getVisible() {
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return false;
        }
        nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
        return (nexdrawinfo == null || nexdrawinfo.getBrightness() == -255) ? false : true;
    }

    public boolean setAudioVolume(int i2) {
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0 || this.a.getClipType() == 1) {
            return false;
        }
        if (i2 == 0) {
            this.a.setAudioOnOff(false);
            return true;
        }
        this.a.setAudioOnOff(true);
        this.a.setClipVolume(i2);
        return true;
    }

    public boolean setFlip(int i2) {
        int i3;
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return false;
        }
        nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
        int rotateState = nexdrawinfo.getRotateState();
        if (i2 == 0) {
            i3 = -196609 & rotateState;
        } else {
            if ((i2 & 1) == 1) {
                rotateState = (rotateState & 65536) == 65536 ? rotateState & -65537 : rotateState | 65536;
            }
            i3 = (i2 & 2) == 2 ? (rotateState & nexEngine.ExportHEVCHighTierLevel51) == 131072 ? -131073 & rotateState : 131072 | rotateState : rotateState;
        }
        nexdrawinfo.setRotateState(i3);
        if (this.c != null) {
            this.c.DrawInfoChanged(nexdrawinfo);
        }
        return true;
    }

    public boolean setLut(String str) {
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return false;
        }
        nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
        if (str == null || str.compareTo("none") == 0) {
            nexdrawinfo.setUserLUT(null);
            nexdrawinfo.setLUT(0);
            if (this.c != null) {
                this.c.DrawInfoChanged(nexdrawinfo);
            }
            return true;
        } else if (str.compareTo("default") == 0) {
            nexdrawinfo.setUserLUT(null);
            if (e() == null || e().compareTo("none") == 0) {
                nexdrawinfo.setLUT(0);
            } else {
                nexColorEffect lutColorEffect = nexColorEffect.getLutColorEffect(e());
                if (lutColorEffect != null) {
                    nexdrawinfo.setLUT(lutColorEffect.getLUTId());
                }
            }
            if (this.c != null) {
                this.c.DrawInfoChanged(nexdrawinfo);
            }
            return true;
        } else {
            if (!(str.compareTo("none") == 0 && str.compareTo("null") == 0)) {
                nexColorEffect lutColorEffect2 = nexColorEffect.getLutColorEffect(str);
                if (lutColorEffect2 != null) {
                    nexdrawinfo.setLUT(lutColorEffect2.getLUTId());
                    nexdrawinfo.setUserLUT(str);
                    if (this.c != null) {
                        this.c.DrawInfoChanged(nexdrawinfo);
                    }
                    return true;
                }
            }
            return false;
        }
    }

    public boolean setRotate(int i2, int i3) {
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return false;
        }
        nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
        Log.d(d, String.format("setRotate: %d %d", new Object[]{Integer.valueOf(i2), Integer.valueOf(i3)}));
        if (i2 == 1 || i2 == 2) {
            return true;
        }
        if (this.s == null) {
            int width = this.a.getWidth();
            int height = this.a.getHeight();
            if (this.a.getRotateInMeta() == 90 || this.a.getRotateInMeta() == 270) {
                width = this.a.getHeight();
                height = this.a.getWidth();
            }
            Rect rect = new Rect(nexdrawinfo.getStartRect());
            nexCollage.a(rect, width, height);
            this.s = new RectF(rect);
        }
        nexdrawinfo.setUserRotateState(i3);
        h();
        l();
        if (this.c != null) {
            this.c.DrawInfoChanged(nexdrawinfo);
        }
        return true;
    }

    public boolean setScale(float f2) {
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return false;
        }
        if (f2 == 0.0f) {
            return true;
        }
        Log.d(d, String.format("setScale %f", new Object[]{Float.valueOf(f2)}));
        nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
        if (this.s == null) {
            int width = this.a.getWidth();
            int height = this.a.getHeight();
            if (this.a.getRotateInMeta() == 90 || this.a.getRotateInMeta() == 270) {
                width = this.a.getHeight();
                height = this.a.getWidth();
            }
            Rect rect = new Rect(nexdrawinfo.getStartRect());
            nexCollage.a(rect, width, height);
            this.s = new RectF(rect);
            this.t = new RectF(this.s);
        }
        RectF rectF = new RectF(this.s);
        Rect rect2 = new Rect(nexdrawinfo.getStartRect());
        int userTranslateX = nexdrawinfo.getUserTranslateX();
        int userTranslateY = nexdrawinfo.getUserTranslateY();
        a(f2);
        k();
        if (!j()) {
            this.s = rectF;
            nexdrawinfo.setStartRect(rect2);
            nexdrawinfo.setEndRect(rect2);
            nexdrawinfo.setUserTranslate(userTranslateX, userTranslateY);
        }
        l();
        if (this.c != null) {
            this.c.DrawInfoChanged(nexdrawinfo);
        }
        return true;
    }

    public boolean setTranslate(int i2, int i3, int i4, int i5) {
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return false;
        }
        nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
        double d2 = (double) (-((float) Math.toRadians((double) nexdrawinfo.getUserRotateState())));
        float cos = (float) Math.cos(d2);
        float sin = (float) Math.sin(d2);
        float f2 = (float) i2;
        float f3 = (float) i3;
        float f4 = (f2 * cos) - (f3 * sin);
        float f5 = (f2 * sin) + (f3 * cos);
        int width = this.a.getWidth();
        int height = this.a.getHeight();
        if (this.a.getRotateInMeta() == 90 || this.a.getRotateInMeta() == 270) {
            width = this.a.getHeight();
            height = this.a.getWidth();
        }
        if (this.s == null) {
            Rect rect = new Rect(nexdrawinfo.getStartRect());
            nexCollage.a(rect, width, height);
            this.s = new RectF(rect);
        }
        double width2 = (double) (this.s.width() * this.s.height());
        double d3 = (double) (this.o * this.p);
        Double.isNaN(width2);
        Double.isNaN(d3);
        float sqrt = (float) Math.sqrt(width2 / d3);
        nexdrawinfo.setUserTranslate(((((int) (f4 * sqrt)) * nexCrop.ABSTRACT_DIMENSION) / width) + nexdrawinfo.getUserTranslateX(), ((((int) (f5 * sqrt)) * nexCrop.ABSTRACT_DIMENSION) / height) + nexdrawinfo.getUserTranslateY());
        k();
        if (this.c != null) {
            this.c.DrawInfoChanged(nexdrawinfo);
        }
        return true;
    }

    public boolean setVisible(boolean z) {
        if (this.a == null || this.a.getDrawInfos() == null || this.a.getDrawInfos().size() <= 0) {
            return false;
        }
        nexDrawInfo nexdrawinfo = (nexDrawInfo) this.a.getDrawInfos().get(0);
        if (nexdrawinfo == null) {
            return false;
        }
        if (z) {
            nexdrawinfo.setBrightness(0);
        } else {
            nexdrawinfo.setBrightness(-255);
        }
        if (this.c != null) {
            this.c.DrawInfoChanged(nexdrawinfo);
        }
        return true;
    }
}
