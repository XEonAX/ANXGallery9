package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Log;
import com.nexstreaming.kminternal.kinemaster.utils.facedetect.a;
import com.nexstreaming.nexeditorsdk.nexCollageManager.CollageType;
import com.nexstreaming.nexeditorsdk.nexSaveDataFormat.nexCollageOf;
import com.nexstreaming.nexeditorsdk.nexSaveDataFormat.nexCollageTitleInfoOf;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class nexCollage {
    private static String a = "nexCollage";
    private String b;
    private String c;
    private String d;
    private String e;
    private float f = 1.0f;
    private CollageType g;
    private int h;
    private float i;
    private String j;
    private int k;
    private String l;
    private float m;
    private String n;
    private boolean o;
    /* access modifiers changed from: private */
    public List<a> p = new ArrayList();
    private List<nexCollageTitleInfo> q = new ArrayList();
    private float r;
    private float s;
    private int t = 200;
    private int u = 1000;
    /* access modifiers changed from: private */
    public nexProject v;
    /* access modifiers changed from: private */
    public nexEngine w;
    private Context x;
    /* access modifiers changed from: private */
    public Date y;
    private boolean z = false;

    protected interface CollageInfoChangedListener {
        String CollageTime(String str);

        void DrawInfoChanged(nexDrawInfo nexdrawinfo);

        RectF FaceRect(String str);

        void SourceChanged(nexClip nexclip, nexClip nexclip2);

        void TitleInfoChanged();

        String TitleInfoContentTime(String str, String str2);
    }

    nexCollage() {
    }

    /* access modifiers changed from: private */
    public String a(int i2) {
        StringBuilder sb = new StringBuilder();
        sb.append(0);
        sb.append(',');
        sb.append(i2);
        sb.append('?');
        sb.append('?');
        Iterator it = this.q.iterator();
        while (it.hasNext()) {
            sb.append(((nexCollageTitleInfo) it.next()).b());
            if (it.hasNext()) {
                sb.append('&');
            }
        }
        return sb.toString();
    }

    public static void a(Rect rect, float f2) {
        float width = ((float) rect.width()) / ((float) rect.height());
        Log.d(a, String.format("shrinkToAspect(%f %f)", new Object[]{Float.valueOf(width), Float.valueOf(f2)}));
        if (width < f2) {
            int width2 = (int) (((float) rect.width()) / f2);
            rect.top = rect.centerY() - (width2 / 2);
            rect.bottom = rect.top + width2;
        } else {
            int height = (int) (((float) rect.height()) * f2);
            rect.left = rect.centerX() - (height / 2);
            rect.right = rect.left + height;
        }
        String str = a;
        StringBuilder sb = new StringBuilder();
        sb.append(String.format("shrinkToAspect: ", new Object[0]));
        sb.append(rect.toString());
        Log.d(str, sb.toString());
    }

    public static void a(Rect rect, int i2, int i3) {
        rect.left = (rect.left * i2) / nexCrop.ABSTRACT_DIMENSION;
        rect.top = (rect.top * i3) / nexCrop.ABSTRACT_DIMENSION;
        rect.right = (rect.right * i2) / nexCrop.ABSTRACT_DIMENSION;
        rect.bottom = (rect.bottom * i3) / nexCrop.ABSTRACT_DIMENSION;
    }

    /* access modifiers changed from: private */
    public RectF b(String str) {
        RectF rectF = new RectF();
        a a2 = a.a(str);
        if (a2 == null) {
            a2 = new a(new File(str), true, this.x);
            a.a(str, a2);
        }
        a2.a(rectF);
        return rectF;
    }

    public static void b(Rect rect, int i2, int i3) {
        rect.left = (rect.left * nexCrop.ABSTRACT_DIMENSION) / i2;
        rect.top = (rect.top * nexCrop.ABSTRACT_DIMENSION) / i3;
        rect.right = (rect.right * nexCrop.ABSTRACT_DIMENSION) / i2;
        rect.bottom = (rect.bottom * nexCrop.ABSTRACT_DIMENSION) / i3;
    }

    public float a() {
        return this.i;
    }

    /* access modifiers changed from: protected */
    public String a(nexProject nexproject, nexEngine nexengine, int i2, Context context, boolean z2) {
        nexDrawInfo nexdrawinfo;
        nexDrawInfo nexdrawinfo2;
        int i3;
        boolean z3;
        nexProject nexproject2 = nexproject;
        nexEngine nexengine2 = nexengine;
        Context context2 = context;
        int i4 = 3;
        int i5 = 0;
        boolean z4 = true;
        Log.d(a, String.format("apply2Project sources(%d %d %d)", new Object[]{Integer.valueOf(this.k), Integer.valueOf(nexproject2.getTotalClipCount(true)), Integer.valueOf(i2)}));
        this.x = context2;
        int i6 = i2 == 0 ? this.h : i2;
        for (int i7 = 0; i7 < nexproject2.getTotalClipCount(true); i7++) {
            nexClip clip = nexproject2.getClip(i7, true);
            if (clip.isMotionTrackedVideo() || clip.isAssetResource()) {
                nexproject2.remove(clip);
            }
        }
        for (int i8 = 0; i8 < nexproject2.getTotalClipCount(false); i8++) {
            nexClip clip2 = nexproject2.getClip(i8, false);
            if (clip2.isAssetResource()) {
                nexproject2.remove(clip2);
            }
        }
        ArrayList arrayList = new ArrayList();
        int i9 = 0;
        while (nexproject2.getTotalClipCount(true) > 0) {
            nexClip clip3 = nexproject2.getClip(0, true);
            if (clip3.getClipType() == 4) {
                clip3.setAudioOnOff(false);
            }
            arrayList.add(clip3);
            if (i9 <= clip3.getProjectDuration()) {
                i9 = clip3.getProjectDuration();
            }
            nexproject2.remove(clip3);
        }
        if (i6 == 0) {
            i6 = i9;
        }
        nexproject.getTopDrawInfo().clear();
        nexproject2.setTemplateApplyMode(3);
        nexDrawInfo nexdrawinfo3 = new nexDrawInfo();
        nexdrawinfo3.setID(1);
        nexdrawinfo3.setSubEffectID(65537);
        nexdrawinfo3.setEffectID(this.n);
        nexdrawinfo3.setStartTime(0);
        nexdrawinfo3.setEndTime(i6);
        nexproject.getTopDrawInfo().add(nexdrawinfo3);
        this.y = new Date();
        Iterator it = this.p.iterator();
        nexClip nexclip = null;
        int i10 = 1;
        while (it.hasNext()) {
            a aVar = (a) it.next();
            if (aVar.a()) {
                nexclip = nexClip.getSupportedClip(aVar.a(context2));
                nexclip.setAssetResource(z4);
                if (aVar.b()) {
                    nexclip.setMotionTrackedVideo(z4);
                }
            } else if (nexclip == null && arrayList.size() > 0) {
                nexclip = (nexClip) arrayList.get(i5);
                arrayList.remove(nexclip);
            }
            if (nexclip != null) {
                nexproject2.add(nexclip);
                nexDrawInfo nexdrawinfo4 = nexclip.getDrawInfos().size() > 0 ? (nexDrawInfo) nexclip.getDrawInfos().get(i5) : null;
                nexclip.clearDrawInfos();
                if (nexclip.getClipType() == z4) {
                    nexclip.setImageClipDuration(i6);
                } else {
                    nexclip.getVideoClipEdit().clearTrim();
                    if (nexclip.getTotalTime() > i6) {
                        nexclip.getVideoClipEdit().setTrim(i5, i6);
                    }
                }
                nexclip.mStartTime = i5;
                nexclip.mEndTime = i6;
                nexDrawInfo nexdrawinfo5 = new nexDrawInfo();
                nexdrawinfo5.setTopEffectID(nexdrawinfo3.getID());
                int i11 = 65536 | i10;
                nexdrawinfo5.setID(i11);
                nexdrawinfo5.setSubEffectID(i11);
                int i12 = i10 + 1;
                float f2 = (float) i6;
                int c2 = (int) (f2 * aVar.c());
                int d2 = (int) (f2 * aVar.d());
                String str = a;
                ArrayList arrayList2 = arrayList;
                Iterator it2 = it;
                Object[] objArr = new Object[i4];
                objArr[0] = Integer.valueOf(i6);
                objArr[1] = Integer.valueOf(c2);
                objArr[2] = Integer.valueOf(d2);
                Log.d(str, String.format("Collage setDrawInfo2Clip(dur:%d %d %d)", objArr));
                if (nexclip.getClipType() == 1) {
                    nexclip.mStartTime = c2 < nexclip.mStartTime ? c2 : nexclip.mStartTime;
                    nexclip.mEndTime = d2 > nexclip.mEndTime ? d2 : nexclip.mEndTime;
                    nexclip.setImageClipDuration(nexclip.mEndTime - nexclip.mStartTime);
                } else {
                    if (c2 < nexclip.getProjectStartTime()) {
                        c2 = nexclip.getProjectStartTime();
                    }
                    if (d2 > nexclip.getProjectEndTime()) {
                        d2 = nexclip.getProjectEndTime();
                    }
                }
                nexdrawinfo5.setStartTime(c2);
                nexdrawinfo5.setEndTime(d2);
                if (!(aVar.e() == null || aVar.e().compareTo("none") == 0)) {
                    nexColorEffect lutColorEffect = nexColorEffect.getLutColorEffect(aVar.e());
                    if (lutColorEffect != null) {
                        nexdrawinfo5.setLUT(lutColorEffect.getLUTId());
                    }
                }
                int width = nexclip.getWidth();
                int height = nexclip.getHeight();
                if (nexclip.getRotateInMeta() == 90 || nexclip.getRotateInMeta() == 270) {
                    width = nexclip.getHeight();
                    height = nexclip.getWidth();
                    if (nexclip.getClipType() == 4) {
                        nexdrawinfo5.setRotateState(nexclip.getRotateInMeta());
                    }
                }
                Rect rect = new Rect(0, 0, width, height);
                Rect rect2 = new Rect(0, 0, 1, 1);
                if (nexclip.getClipType() == 1) {
                    RectF b2 = b(nexclip.getPath());
                    i3 = i12;
                    float f3 = (float) width;
                    nexdrawinfo2 = nexdrawinfo3;
                    float f4 = (float) height;
                    nexdrawinfo = nexdrawinfo4;
                    rect.set((int) (b2.left * f3), (int) (b2.top * f4), (int) (b2.right * f3), (int) (b2.bottom * f4));
                    if (rect.isEmpty()) {
                        rect = new Rect(0, 0, width, height);
                    } else {
                        rect2.set((int) (b2.left * f3), (int) (b2.top * f4), (int) (b2.right * f3), (int) (b2.bottom * f4));
                        int i13 = (rect.right - rect.left) / 2;
                        rect.left -= i13;
                        rect.right += i13;
                        if (rect.left < 0) {
                            rect.left = 0;
                        }
                        if (rect.right > width) {
                            rect.right = width;
                        }
                        int i14 = (rect.bottom - rect.top) / 2;
                        rect.top -= i14;
                        rect.bottom += i14;
                        if (rect.top < 0) {
                            rect.top = 0;
                        }
                        if (rect.bottom > height) {
                            rect.bottom = height;
                        }
                    }
                } else {
                    nexdrawinfo2 = nexdrawinfo3;
                    nexdrawinfo = nexdrawinfo4;
                    i3 = i12;
                }
                String str2 = a;
                StringBuilder sb = new StringBuilder();
                sb.append(String.format("Collage setDrawInfo2Clip", new Object[0]));
                sb.append(aVar.getRectangle().toString());
                Log.d(str2, sb.toString());
                float width2 = (aVar.getRectangle().width() * this.r) / (aVar.getRectangle().height() * this.s);
                float f5 = (float) aVar.f();
                float g2 = (float) aVar.g();
                if (!(f5 == 0.0f || g2 == 0.0f)) {
                    width2 = f5 / g2;
                }
                a(rect, width2);
                String str3 = a;
                StringBuilder sb2 = new StringBuilder();
                sb2.append(String.format("Collage setDrawInfo2Clip sr : ", new Object[0]));
                sb2.append(rect.toString());
                Log.d(str3, sb2.toString());
                b(rect, width, height);
                b(rect2, width, height);
                String str4 = a;
                StringBuilder sb3 = new StringBuilder();
                sb3.append(String.format("Collage setDrawInfo2Clip1 sr : ", new Object[0]));
                sb3.append(rect.toString());
                Log.d(str4, sb3.toString());
                Log.d(a, String.format("Collage setDrawInfo2Clip clip size(%d %d)", new Object[]{Integer.valueOf(width), Integer.valueOf(height)}));
                nexdrawinfo5.setStartRect(rect);
                nexdrawinfo5.setEndRect(rect);
                nexdrawinfo5.setFaceRect(rect2);
                nexclip.addDrawInfo(nexdrawinfo5);
                aVar.a(nexclip);
                aVar.b(width2);
                nexproject2 = nexproject;
                aVar.a(nexproject2, i6);
                if (nexdrawinfo != null) {
                    nexdrawinfo5.setRotateState(nexdrawinfo.getRotateState());
                    nexdrawinfo5.setUserTranslate(nexdrawinfo.getUserTranslateX(), nexdrawinfo.getUserTranslateY());
                    nexdrawinfo5.setUserRotateState(nexdrawinfo.getUserRotateState());
                    nexdrawinfo5.setRealScale(nexdrawinfo.getRealScale());
                    nexdrawinfo5.setBrightness(nexdrawinfo.getBrightness());
                    nexdrawinfo5.setUserLUT(nexdrawinfo.getUserLUT());
                    if (z2) {
                        String userLUT = nexdrawinfo.getUserLUT();
                        if (!(userLUT == null || userLUT.compareTo("none") == 0 || userLUT.compareTo("null") == 0)) {
                            nexColorEffect lutColorEffect2 = nexColorEffect.getLutColorEffect(userLUT);
                            if (lutColorEffect2 != null && lutColorEffect2.getLUTId() == nexdrawinfo.getLUT()) {
                                nexdrawinfo5.setLUT(nexdrawinfo.getLUT());
                            }
                        }
                        nexdrawinfo5.setStartRect(nexdrawinfo.getStartRect());
                        nexdrawinfo5.setEndRect(nexdrawinfo.getEndRect());
                        nexdrawinfo5.setFaceRect(nexdrawinfo.getFaceRect());
                    }
                    z3 = false;
                } else {
                    z3 = true;
                }
                aVar.a((RectF) null);
                aVar.a(z3);
                i5 = 0;
                Log.d(a, String.format("Collage apply rect(%s) %f", new Object[]{nexdrawinfo5.getStartRect().toString(), Float.valueOf(nexdrawinfo5.getRealScale())}));
                arrayList = arrayList2;
                it = it2;
                i10 = i3;
                nexdrawinfo3 = nexdrawinfo2;
                nexEngine nexengine3 = nexengine;
                context2 = context;
                i4 = 3;
                z4 = true;
                nexclip = null;
            }
        }
        nexdrawinfo3.setTitle(a(i6));
        if (this.e == null || this.e.length() <= 0 || this.e.compareTo("none") == 0) {
            nexproject2.setBackgroundMusicPath(null);
            nexproject2.setBGMMasterVolumeScale(0.0f);
        } else {
            nexproject2.setBackgroundMusicPath(this.e);
            nexproject2.setBGMMasterVolumeScale(this.f);
        }
        nexproject2.setProjectAudioFadeInTime(this.t);
        nexproject2.setProjectAudioFadeOutTime(this.u);
        nexEngine nexengine4 = nexengine;
        nexengine4.setProperty("PreviewFPS", "30");
        nexengine4.setProject(nexproject2);
        nexengine.updateProject();
        this.v = nexproject2;
        this.w = nexengine4;
        return null;
    }

    public String a(JSONObject jSONObject) {
        if (jSONObject == null) {
            return "Collage parsing error with invalid handle";
        }
        try {
            this.b = jSONObject.getString("collage_name");
            this.c = jSONObject.getString("collage_version");
            this.d = jSONObject.getString("collage_desc");
            this.e = jSONObject.getString("collage_bgm");
            this.f = Float.parseFloat(jSONObject.getString("collage_bgm_volume"));
            if (jSONObject.getString("collage_type").compareTo("static") == 0) {
                this.g = CollageType.StaticCollage;
            } else if (jSONObject.getString("collage_type").compareTo("dynamic") == 0) {
                this.g = CollageType.DynamicCollage;
            }
            this.h = Integer.parseInt(jSONObject.getString("collage_duration"));
            this.i = Float.parseFloat(jSONObject.getString("collage_edit_time"));
            this.j = jSONObject.getString("collage_ratio");
            String[] split = this.j.toLowerCase().split("v");
            if (split == null) {
                return "Wrong ratio info was included";
            }
            this.r = Float.parseFloat(split[0]);
            this.s = Float.parseFloat(split[1]);
            this.k = Integer.parseInt(jSONObject.getString("collage_source_count"));
            this.l = jSONObject.getString("audio_res");
            this.m = Float.parseFloat(jSONObject.getString("audio_res_pos"));
            if (jSONObject.has("collage_project_vol_fade_in_time")) {
                this.t = Integer.parseInt(jSONObject.getString("collage_project_vol_fade_in_time"));
            }
            if (jSONObject.has("collage_project_vol_fade_out_time")) {
                this.u = Integer.parseInt(jSONObject.getString("collage_project_vol_fade_out_time"));
            }
            this.o = false;
            if (jSONObject.has("frame_collage")) {
                this.o = jSONObject.getString("frame_collage").compareTo("1") == 0;
            }
            this.n = jSONObject.getString("effect");
            if (jSONObject.has("draw_infos")) {
                JSONArray jSONArray = jSONObject.getJSONArray("draw_infos");
                for (int i2 = 0; i2 < jSONArray.length(); i2++) {
                    a aVar = new a();
                    if (aVar.a(jSONArray.getJSONObject(i2)) != null) {
                        this.p.clear();
                        this.q.clear();
                        return "Collage drawinfo parse error";
                    }
                    aVar.a((CollageInfoChangedListener) new CollageInfoChangedListener() {
                        public String CollageTime(String str) {
                            return "";
                        }

                        public void DrawInfoChanged(nexDrawInfo nexdrawinfo) {
                            if (nexCollage.this.w != null) {
                                nexCollage.this.w.updateDrawInfo(nexdrawinfo);
                            }
                        }

                        public RectF FaceRect(String str) {
                            return nexCollage.this.b(str);
                        }

                        public void SourceChanged(nexClip nexclip, nexClip nexclip2) {
                            if (nexCollage.this.w != null) {
                                int i = 0;
                                int i2 = 1;
                                while (i < nexCollage.this.v.getTotalClipCount(true) && !nexCollage.this.v.getClip(i, true).equals(nexclip)) {
                                    i2++;
                                    i++;
                                }
                                nexCollage.this.v.add(i2 - 1, true, nexclip2);
                                nexCollage.this.v.remove(nexclip);
                                nexCollage.this.w.removeClip(i2);
                                nexCollage.this.w.updateProject();
                            }
                        }

                        public void TitleInfoChanged() {
                        }

                        public String TitleInfoContentTime(String str, String str2) {
                            return "";
                        }
                    });
                    this.p.add(aVar);
                }
            }
            if (jSONObject.has("title_infos")) {
                JSONArray jSONArray2 = jSONObject.getJSONArray("title_infos");
                for (int i3 = 0; i3 < jSONArray2.length(); i3++) {
                    nexCollageTitleInfo nexcollagetitleinfo = new nexCollageTitleInfo();
                    if (nexcollagetitleinfo.a(jSONArray2.getJSONObject(i3)) != null) {
                        this.p.clear();
                        this.q.clear();
                        return "Collage title info parse error";
                    }
                    nexcollagetitleinfo.a((CollageInfoChangedListener) new CollageInfoChangedListener() {
                        public String CollageTime(String str) {
                            if (nexCollage.this.y == null) {
                                nexCollage.this.y = new Date();
                            }
                            return new SimpleDateFormat(str).format(nexCollage.this.y);
                        }

                        public void DrawInfoChanged(nexDrawInfo nexdrawinfo) {
                        }

                        public RectF FaceRect(String str) {
                            return nexCollage.this.b(str);
                        }

                        public void SourceChanged(nexClip nexclip, nexClip nexclip2) {
                        }

                        public void TitleInfoChanged() {
                            if (nexCollage.this.v != null) {
                                ((nexDrawInfo) nexCollage.this.v.getTopDrawInfo().get(0)).setTitle(nexCollage.this.a(nexCollage.this.v.getTotalTime()));
                                if (nexCollage.this.w != null) {
                                    nexCollage.this.w.updateDrawInfo((nexDrawInfo) nexCollage.this.v.getTopDrawInfo().get(0));
                                }
                            }
                        }

                        public String TitleInfoContentTime(String str, String str2) {
                            for (a aVar : nexCollage.this.p) {
                                if (aVar.getId().compareTo(str) == 0) {
                                    return aVar.a(str2);
                                }
                            }
                            return "";
                        }
                    });
                    nexcollagetitleinfo.c();
                    this.q.add(nexcollagetitleinfo);
                }
            }
            this.z = true;
            return null;
        } catch (JSONException e2) {
            e2.printStackTrace();
            String str = a;
            StringBuilder sb = new StringBuilder();
            sb.append("parse Collage header failed : ");
            sb.append(e2.getMessage());
            Log.d(str, sb.toString());
            return e2.getMessage();
        }
    }

    /* access modifiers changed from: 0000 */
    public void a(nexCollageOf nexcollageof) {
        if (nexcollageof.titleInfos != null) {
            int i2 = 0;
            for (nexCollageTitleInfo nexcollagetitleinfo : this.q) {
                if (i2 < nexcollageof.titleInfos.size()) {
                    nexcollagetitleinfo.a((nexCollageTitleInfoOf) nexcollageof.titleInfos.get(i2));
                    i2++;
                } else {
                    return;
                }
            }
        }
    }

    public boolean a(a aVar, a aVar2) {
        a aVar3 = aVar;
        a aVar4 = aVar2;
        if (aVar3 == null || aVar4 == null) {
            return false;
        }
        nexClip bindSource = aVar.getBindSource();
        nexClip bindSource2 = aVar2.getBindSource();
        if (bindSource == null || bindSource2 == null) {
            return false;
        }
        nexClip dup = nexClip.dup(bindSource);
        nexClip dup2 = nexClip.dup(bindSource2);
        if (dup.getClipType() == 4) {
            dup.setAudioOnOff(false);
        }
        if (dup2.getClipType() == 4) {
            dup2.setAudioOnOff(false);
        }
        nexDrawInfo nexdrawinfo = (nexDrawInfo) bindSource.getDrawInfos().get(0);
        nexDrawInfo nexdrawinfo2 = (nexDrawInfo) bindSource2.getDrawInfos().get(0);
        int rotateState = nexdrawinfo.getRotateState();
        int userTranslateX = nexdrawinfo.getUserTranslateX();
        int userTranslateY = nexdrawinfo.getUserTranslateY();
        int userRotateState = nexdrawinfo.getUserRotateState();
        float realScale = nexdrawinfo.getRealScale();
        int lut = nexdrawinfo.getLUT();
        int customLUTA = nexdrawinfo.getCustomLUTA();
        nexClip nexclip = bindSource2;
        int customLUTB = nexdrawinfo.getCustomLUTB();
        nexClip nexclip2 = bindSource;
        int customLUTPower = nexdrawinfo.getCustomLUTPower();
        String userLUT = nexdrawinfo.getUserLUT();
        int brightness = nexdrawinfo.getBrightness();
        nexClip nexclip3 = dup;
        nexdrawinfo.setRotateState(nexdrawinfo2.getRotateState());
        int i2 = brightness;
        nexdrawinfo.setUserTranslate(nexdrawinfo2.getUserTranslateX(), nexdrawinfo2.getUserTranslateY());
        nexdrawinfo.setUserRotateState(nexdrawinfo2.getUserRotateState());
        nexdrawinfo.setRealScale(nexdrawinfo2.getRealScale());
        nexdrawinfo.setLUT(0);
        String userLUT2 = nexdrawinfo2.getUserLUT();
        if (userLUT2 != null && userLUT2.compareTo("none") != 0 && userLUT2.compareTo("null") != 0) {
            nexdrawinfo.setLUT(nexdrawinfo2.getLUT());
        } else if (!(aVar.e() == null || aVar.e().compareTo("none") == 0 || aVar.e().compareTo("null") == 0)) {
            nexColorEffect lutColorEffect = nexColorEffect.getLutColorEffect(aVar.e());
            if (lutColorEffect != null) {
                nexdrawinfo.setLUT(lutColorEffect.getLUTId());
            }
        }
        nexdrawinfo.setCustomLUTA(nexdrawinfo2.getCustomLUTA());
        nexdrawinfo.setCustomLUTB(nexdrawinfo2.getCustomLUTB());
        nexdrawinfo.setCustomLUTPower(nexdrawinfo2.getCustomLUTPower());
        nexdrawinfo.setUserLUT(nexdrawinfo2.getUserLUT());
        nexdrawinfo.setBrightness(nexdrawinfo2.getBrightness());
        aVar3.a(dup2, nexdrawinfo);
        nexdrawinfo2.setRotateState(rotateState);
        nexdrawinfo2.setUserTranslate(userTranslateX, userTranslateY);
        nexdrawinfo2.setUserRotateState(userRotateState);
        nexdrawinfo2.setRealScale(realScale);
        nexdrawinfo2.setLUT(0);
        if (userLUT != null && userLUT.compareTo("none") != 0 && userLUT.compareTo("null") != 0) {
            nexdrawinfo2.setLUT(lut);
        } else if (!(aVar2.e() == null || aVar2.e().compareTo("none") == 0 || aVar2.e().compareTo("null") == 0)) {
            nexColorEffect lutColorEffect2 = nexColorEffect.getLutColorEffect(aVar2.e());
            if (lutColorEffect2 != null) {
                nexdrawinfo2.setLUT(lutColorEffect2.getLUTId());
            }
        }
        nexdrawinfo2.setCustomLUTA(customLUTA);
        nexdrawinfo2.setCustomLUTB(customLUTB);
        nexdrawinfo2.setCustomLUTPower(customLUTPower);
        nexdrawinfo2.setUserLUT(userLUT);
        nexdrawinfo2.setBrightness(i2);
        nexClip nexclip4 = nexclip3;
        aVar2.a(nexclip4, nexdrawinfo2);
        int i3 = 0;
        int i4 = 1;
        while (i3 < this.v.getTotalClipCount(true)) {
            nexClip nexclip5 = nexclip2;
            if (this.v.getClip(i3, true).equals(nexclip5)) {
                this.v.add(i4 - 1, true, dup2);
                this.v.remove(nexclip5);
                this.w.removeClip(i4);
            }
            nexClip nexclip6 = nexclip;
            if (this.v.getClip(i3, true).equals(nexclip6)) {
                this.v.add(i4 - 1, true, nexclip4);
                this.v.remove(nexclip6);
                this.w.removeClip(i4);
            }
            i4++;
            i3++;
            nexclip2 = nexclip5;
            nexclip = nexclip6;
        }
        this.w.updateProject();
        this.w.setThumbnailRoutine(2);
        this.w.seek((int) (((float) this.h) * this.i));
        return true;
    }

    /* access modifiers changed from: protected */
    public boolean a(String str) {
        if (this.v == null || this.w == null) {
            return false;
        }
        if (str != null) {
            this.v.setBackgroundMusicPath(str);
        } else if (this.e != null) {
            this.v.setBackgroundMusicPath(this.e);
            this.v.setBGMMasterVolumeScale(this.f);
            return true;
        } else {
            this.v.setBackgroundMusicPath(null);
        }
        this.w.updateProject();
        return true;
    }

    public int b() {
        return this.k;
    }

    public int c() {
        return this.h;
    }

    public CollageType d() {
        return this.g;
    }

    public float e() {
        return this.r / this.s;
    }

    public List<a> f() {
        return this.p;
    }

    public List<nexCollageTitleInfo> g() {
        return this.q;
    }

    /* access modifiers changed from: protected */
    public boolean h() {
        return this.o;
    }

    /* access modifiers changed from: protected */
    public boolean i() {
        return this.z;
    }

    /* access modifiers changed from: 0000 */
    public nexSaveDataFormat j() {
        if (this.v == null) {
            return null;
        }
        nexSaveDataFormat nexsavedataformat = new nexSaveDataFormat();
        nexsavedataformat.project = this.v.getSaveData();
        nexsavedataformat.collage = new nexCollageOf();
        if (this.q.size() == 0) {
            nexsavedataformat.collage.titleInfos = null;
        } else {
            nexsavedataformat.collage.titleInfos = new ArrayList();
            for (nexCollageTitleInfo d2 : this.q) {
                nexsavedataformat.collage.titleInfos.add(d2.d());
            }
        }
        return nexsavedataformat;
    }
}
