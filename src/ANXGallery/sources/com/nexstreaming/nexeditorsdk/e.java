package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.Color;
import android.media.ExifInterface;
import android.util.Log;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.nexstreaming.kminternal.kinemaster.config.a;
import com.nexstreaming.nexeditorsdk.exception.nexSDKException;
import com.nexstreaming.nexeditorsdk.nexCrop.CropMode;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* compiled from: nexTemplateEffect */
final class e {
    private static String L = "nexTemplateEffect";
    Map<String, String> A = new HashMap();
    Map<String, String> B = new HashMap();
    Map<String, String> C = new HashMap();
    Map<String, String> D = new HashMap();
    boolean E = true;
    String F = "none";
    int G;
    String H = "none";
    int I;
    int J = 1;
    List<d> K = new ArrayList();
    int a;
    String b;
    String c;
    String d;
    String e;
    int f;
    int g;
    int h;
    int i;
    String j;
    int k = -1;
    int l = -1;
    int m = -1;
    int n = -1;
    int o = 100;
    int p = 0;
    String q = "default";
    int r = BaiduSceneResult.SHOOTING;
    String s = "";
    String t = "";
    String u;
    String v;
    String w;
    String x;
    String y;
    Map<String, String> z = new HashMap();

    e() {
    }

    public static e a(JSONObject jSONObject, int i2) {
        String a2 = a(jSONObject, nexExportFormat.TAG_FORMAT_TYPE);
        if (!a2.equals("scene")) {
            return null;
        }
        e eVar = new e();
        eVar.a = i2;
        eVar.b = a2;
        eVar.c = a(jSONObject, "identifier");
        if (jSONObject.has("alternative_id")) {
            eVar.c = a(jSONObject, "alternative_id");
        }
        eVar.d = a(jSONObject, "source_type");
        if (!eVar.d.equals("res_default")) {
            eVar.e = a(jSONObject, "res_path");
        }
        eVar.f = Integer.parseInt(a(jSONObject, "duration"));
        eVar.h = Integer.parseInt(a(jSONObject, "duration_max"));
        eVar.g = Integer.parseInt(a(jSONObject, "duration_min"));
        eVar.i = Integer.parseInt(a(jSONObject, "volume"));
        if (jSONObject.has("effect")) {
            eVar.j = a(jSONObject, "effect");
        } else {
            eVar.j = a(jSONObject, "effects");
        }
        if (jSONObject.has("draw_infos")) {
            try {
                int i3 = 1;
                Log.d(L, String.format("Effect : %s", new Object[]{eVar.j}));
                JSONArray jSONArray = jSONObject.getJSONArray("draw_infos");
                for (int i4 = 0; i4 < jSONArray.length(); i4++) {
                    d a3 = d.a(jSONArray.getJSONObject(i4), (i2 << 16) | i3);
                    if (a3 != null) {
                        eVar.K.add(a3);
                        a3.a();
                    }
                    i3++;
                }
            } catch (JSONException e2) {
                e2.printStackTrace();
                eVar.K.clear();
            }
            if (a(jSONObject, "apply_effect_on_res").equals(MovieStatUtils.DOWNLOAD_SUCCESS)) {
                eVar.E = false;
            }
        }
        String a4 = a(jSONObject, "speed_control");
        if (!a4.equals("default")) {
            eVar.o = Integer.parseInt(a4);
        }
        String a5 = a(jSONObject, "brightness");
        if (!a5.equals("default")) {
            eVar.k = Integer.parseInt(a5);
        }
        String a6 = a(jSONObject, "contrast");
        if (!a6.equals("default")) {
            eVar.l = Integer.parseInt(a6);
        }
        String a7 = a(jSONObject, "saturation");
        if (!a7.equals("default")) {
            eVar.m = Integer.parseInt(a7);
        }
        String a8 = a(jSONObject, "color_filter");
        if (!a8.equals("default")) {
            eVar.n = Integer.parseInt(a8);
        }
        eVar.y = a(jSONObject, "vignette");
        eVar.u = a(jSONObject, "lut");
        eVar.v = a(jSONObject, "external_video_path");
        eVar.w = a(jSONObject, "external_image_path");
        eVar.x = a(jSONObject, "solid_color");
        if (jSONObject.has("apply_effect_on_res") && a(jSONObject, "apply_effect_on_res").equals(MovieStatUtils.DOWNLOAD_SUCCESS)) {
            eVar.E = false;
        }
        if (jSONObject.has("audio_res")) {
            String a9 = a(jSONObject, "audio_res");
            if (!a9.equals("none")) {
                String a10 = a(jSONObject, "audio_res_pos");
                eVar.F = a9;
                eVar.G = Integer.parseInt(a10);
            }
        }
        eVar.q = a(jSONObject, "crop_mode");
        if (jSONObject.has("video_crop_mode")) {
            eVar.s = a(jSONObject, "video_crop_mode");
        }
        if (jSONObject.has("image_crop_mode")) {
            eVar.t = a(jSONObject, "image_crop_mode");
        }
        if (jSONObject.has("image_crop_speed")) {
            eVar.r = Integer.parseInt(a(jSONObject, "image_crop_speed"));
        }
        if (jSONObject.has("freeze_duration")) {
            eVar.p = Integer.parseInt(a(jSONObject, "freeze_duration"));
        }
        eVar.H = a(jSONObject, "transition_name");
        if (eVar.H == null || eVar.H.compareTo("none") == 0) {
            eVar.I = 0;
        } else {
            eVar.I = Integer.parseInt(a(jSONObject, "transition_duration"));
        }
        if (jSONObject.has("use_particle_video")) {
            eVar.J = Integer.parseInt(a(jSONObject, "use_particle_video"));
        }
        if (jSONObject.has("alternative_effect")) {
            try {
                eVar.z.clear();
                JSONObject jSONObject2 = jSONObject.getJSONObject("alternative_effect");
                Iterator keys = jSONObject2.keys();
                while (keys.hasNext()) {
                    String str = (String) keys.next();
                    eVar.z.put(str, jSONObject2.getString(str));
                }
            } catch (JSONException e3) {
                e3.printStackTrace();
                eVar.z.clear();
            }
        }
        if (jSONObject.has("alternative_transition")) {
            try {
                eVar.A.clear();
                JSONObject jSONObject3 = jSONObject.getJSONObject("alternative_transition");
                Iterator keys2 = jSONObject3.keys();
                while (keys2.hasNext()) {
                    String str2 = (String) keys2.next();
                    eVar.A.put(str2, jSONObject3.getString(str2));
                }
            } catch (JSONException e4) {
                e4.printStackTrace();
                eVar.A.clear();
            }
        }
        if (jSONObject.has("alternative_lut")) {
            try {
                eVar.B.clear();
                JSONObject jSONObject4 = jSONObject.getJSONObject("alternative_lut");
                Iterator keys3 = jSONObject4.keys();
                while (keys3.hasNext()) {
                    String str3 = (String) keys3.next();
                    eVar.B.put(str3, jSONObject4.getString(str3));
                }
            } catch (JSONException e5) {
                e5.printStackTrace();
                eVar.B.clear();
            }
        }
        if (jSONObject.has("alternative_audio")) {
            try {
                eVar.C.clear();
                JSONObject jSONObject5 = jSONObject.getJSONObject("alternative_audio");
                Iterator keys4 = jSONObject5.keys();
                while (keys4.hasNext()) {
                    String str4 = (String) keys4.next();
                    eVar.C.put(str4, jSONObject5.getString(str4));
                }
            } catch (JSONException e6) {
                e6.printStackTrace();
                eVar.C.clear();
            }
        }
        if (jSONObject.has("alternative_audio_pos")) {
            try {
                eVar.D.clear();
                JSONObject jSONObject6 = jSONObject.getJSONObject("alternative_audio_pos");
                Iterator keys5 = jSONObject6.keys();
                while (keys5.hasNext()) {
                    String str5 = (String) keys5.next();
                    eVar.D.put(str5, jSONObject6.getString(str5));
                }
            } catch (JSONException e7) {
                e7.printStackTrace();
                eVar.D.clear();
            }
        }
        return eVar;
    }

    static String a(JSONObject jSONObject, String str) {
        try {
            return jSONObject.getString(str);
        } catch (JSONException unused) {
            if (str.equals("effects")) {
                return "none";
            }
            if (str.equals("id") || str.equals("transition_duration") || str.equals("audio_res_pos")) {
                return MovieStatUtils.DOWNLOAD_SUCCESS;
            }
            if (str.equals("volume") || str.equals("speed_control")) {
                return "100";
            }
            if (str.equals("duration")) {
                return "3000";
            }
            if (str.equals("duration_max")) {
                return "5000";
            }
            if (str.equals("duration_min")) {
                return "2000";
            }
            if (str.equals("brightness") || str.equals("contrast") || str.equals("saturation") || str.equals("color_filter")) {
                return MovieStatUtils.DOWNLOAD_FAILED;
            }
            if (str.equals("source_type")) {
                return "ALL";
            }
            if (str.equals("external_video_path") || str.equals("external_image_path") || str.equals("solid_color") || str.equals("lut")) {
                return null;
            }
            return str.equals("vignette") ? "clip,no" : str.equals("crop_mode") ? "default" : str.equals("transition_name") ? "none" : str.equals("identifier") ? "" : str.equals("freeze_duration") ? MovieStatUtils.DOWNLOAD_SUCCESS : str.equals("use_particle_video") ? "1" : "default";
        }
    }

    public int a(boolean z2) {
        int i2 = 0;
        if (this.K == null) {
            return 0;
        }
        for (d dVar : this.K) {
            if (!z2) {
                i2++;
            } else if (dVar.b.compareTo("res_default") == 0 || dVar.b.compareTo("user") == 0) {
                i2++;
            }
        }
        return i2;
    }

    /* access modifiers changed from: 0000 */
    public nexColorEffect a(int i2) {
        return (nexColorEffect) nexColorEffect.getPresetList().get(i2);
    }

    /* access modifiers changed from: 0000 */
    public String a(nexClip nexclip) {
        if (this.k != -1) {
            nexclip.setBrightness(this.k);
        }
        if (this.l != -1) {
            nexclip.setContrast(this.l);
        }
        if (this.m != -1) {
            nexclip.setSaturation(this.m);
        }
        if (this.n != -1) {
            nexclip.setColorEffect(a(this.n - 1));
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public String a(nexClip nexclip, float f2) {
        ExifInterface exifInterface;
        String str = this.q;
        if (nexclip.getCrop().getEndPosionLock()) {
            return null;
        }
        if (nexclip.getClipType() == 1 && this.t.length() > 0) {
            str = this.t;
        }
        if (nexclip.getClipType() == 4 && this.s.length() > 0) {
            str = this.s;
        }
        char c2 = 65535;
        int hashCode = str.hashCode();
        if (hashCode != 101393) {
            if (hashCode != 3143043) {
                if (hashCode != 1054849215) {
                    if (hashCode == 1055207047 && str.equals("pan_rand")) {
                        c2 = 1;
                    }
                } else if (str.equals("pan_face")) {
                    c2 = 2;
                }
            } else if (str.equals("fill")) {
                c2 = 0;
            }
        } else if (str.equals("fit")) {
            c2 = 3;
        }
        switch (c2) {
            case 0:
                nexclip.getCrop().randomizeStartEndPosition(false, CropMode.FILL);
                break;
            case 1:
                nexclip.getCrop().randomizeStartEndPosition(false, CropMode.PAN_RAND);
                break;
            case 2:
                nexclip.getCrop().randomizeStartEndPosition(false, CropMode.PAN_FACE);
                break;
            case 3:
                nexclip.getCrop().randomizeStartEndPosition(false, CropMode.FIT);
                break;
            default:
                if (f2 == 0.0f) {
                    nexclip.getCrop().randomizeStartEndPosition(false, CropMode.FIT);
                    break;
                } else {
                    float width = ((float) nexclip.getWidth()) / (((float) nexclip.getHeight()) * 1.0f);
                    int rotateDegree = nexclip.getRotateDegree();
                    if (nexclip.getClipType() == 4) {
                        if (rotateDegree == 90 || rotateDegree == 270) {
                            width = ((float) nexclip.getHeight()) / (((float) nexclip.getWidth()) * 1.0f);
                        }
                    } else if (nexclip.getClipType() == 1) {
                        try {
                            exifInterface = new ExifInterface(nexclip.getRealPath());
                        } catch (IOException e2) {
                            e2.printStackTrace();
                            exifInterface = null;
                        }
                        if (exifInterface != null) {
                            String attribute = exifInterface.getAttribute("Orientation");
                            int parseInt = attribute != null ? Integer.parseInt(attribute) : 1;
                            if (parseInt == 6 || parseInt == 8) {
                                if (parseInt == 6) {
                                    rotateDegree = 90;
                                }
                                if (parseInt == 8) {
                                    rotateDegree = nexClip.kClip_Rotate_270;
                                }
                                width = ((float) nexclip.getHeight()) / (((float) nexclip.getWidth()) * 1.0f);
                            }
                        }
                    }
                    if (((double) Math.abs(f2 - width)) > 0.05d) {
                        nexclip.getCrop().randomizeStartEndPosition(false, CropMode.PAN_RAND);
                    } else {
                        nexclip.getCrop().randomizeStartEndPosition(false, CropMode.FIT);
                    }
                    Log.d(L, String.format("Apply default crop mode(%f %f) (%d)", new Object[]{Float.valueOf(f2), Float.valueOf(width), Integer.valueOf(rotateDegree)}));
                    break;
                }
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public String a(nexProject nexproject, nexClip nexclip) {
        if (this.F != null && this.F.length() > 0 && !this.F.equals("none")) {
            nexproject.updateProject();
            nexClip supportedClip = nexClip.getSupportedClip(nexAssetPackageManager.getAssetPackageMediaPath(a.a().b(), this.F));
            if (supportedClip != null) {
                int totalTime = supportedClip.getTotalTime();
                supportedClip.setTemplateEffectID(this.a);
                supportedClip.setTemplateAudioPos(this.G);
                nexproject.addAudio(supportedClip, nexclip.getProjectStartTime(), nexclip.getProjectStartTime() + totalTime);
            }
        }
        return null;
    }

    public String a(String str, nexClip nexclip, boolean z2, float f2, boolean z3) {
        Log.d(L, String.format("Template applyEffect %s  clip(%d %d) effect(%s) apply_transition(%b) transition(%s, %d)", new Object[]{str, Integer.valueOf(nexclip.getProjectStartTime()), Integer.valueOf(nexclip.getProjectDuration()), this.j, Boolean.valueOf(z2), this.H, Integer.valueOf(this.I)}));
        int i2 = this.a;
        if (z2) {
            i2 |= nexEngine.ExportHEVCMainTierLevel62;
        }
        nexclip.setTemplateEffectID(i2);
        try {
            if (nexclip.getClipType() == 4) {
                if (this.i != -1) {
                    if (this.i == 0) {
                        nexclip.setAudioOnOff(false);
                    } else {
                        nexclip.setAudioOnOff(true);
                        nexclip.setClipVolume(this.i);
                    }
                }
                if (!z3 && this.o != -1) {
                    nexclip.getVideoClipEdit().setSpeedControl(this.o);
                }
                Log.d(L, String.format("freeze_duration(%d)", new Object[]{Integer.valueOf(this.p)}));
                if (this.p != 0) {
                    nexclip.getVideoClipEdit().setFreezeDuration(this.p);
                }
            }
            if (this.j.equals("none")) {
                nexclip.getClipEffect(true).setEffectNone();
            } else {
                nexclip.getClipEffect(true).setEffect(this.j);
            }
            nexclip.getClipEffect(true).setEffectShowTime(0, 0);
            a(nexclip);
            a(nexclip, f2);
            b(nexclip);
            if (z2 && !this.H.equals("none")) {
                if (this.I > 0) {
                    if (nexclip.getProjectDuration() <= this.I) {
                        Log.d(L, String.format("Template Apply transition was ignored on short clip", new Object[0]));
                        nexclip.getTransitionEffect(true).setEffectNone();
                        nexclip.getTransitionEffect(true).setDuration(0);
                        return null;
                    }
                    nexclip.getTransitionEffect(true).setTransitionEffect(this.H);
                    nexclip.getTransitionEffect(true).setDuration(this.I);
                    return null;
                }
            }
            nexclip.getTransitionEffect(true).setEffectNone();
            nexclip.getTransitionEffect(true).setDuration(0);
            return null;
        } catch (nexSDKException e2) {
            return e2.getMessage();
        }
    }

    public List<nexDrawInfo> a(int i2, int i3, String str) {
        ArrayList arrayList = new ArrayList();
        if (i3 == 0) {
            i3 = this.f;
        }
        nexDrawInfo nexdrawinfo = new nexDrawInfo();
        nexdrawinfo.setID(this.a);
        nexdrawinfo.setSubEffectID((this.a << 16) | 1);
        if (str == null || !this.z.containsKey(str)) {
            nexdrawinfo.setEffectID(this.j);
        } else {
            nexdrawinfo.setEffectID((String) this.z.get(str));
        }
        nexdrawinfo.setStartTime(i2);
        nexdrawinfo.setEndTime(i2 + i3);
        nexdrawinfo.setSubTemplateDrawInfos(this.K);
        arrayList.add(nexdrawinfo);
        if (this.H.compareTo("none") == 0 || this.I <= 0) {
            return arrayList;
        }
        nexDrawInfo nexdrawinfo2 = new nexDrawInfo();
        if (str == null || !this.A.containsKey(str)) {
            nexdrawinfo2.setEffectID(this.H);
        } else {
            nexdrawinfo2.setEffectID((String) this.A.get(str));
        }
        nexdrawinfo2.setIsTransition(1);
        nexdrawinfo2.setStartTime(nexdrawinfo.getEndTime() - this.I);
        nexdrawinfo2.setEndTime(nexdrawinfo.getEndTime());
        arrayList.add(nexdrawinfo2);
        return arrayList;
    }

    public void a(nexProject nexproject, nexClip nexclip, String str, boolean z2) {
        if (z2 && str != null && str.length() > 0) {
            if (this.z.containsKey(str)) {
                nexclip.getClipEffect(true).setEffect((String) this.z.get(str));
            }
            if (this.A.containsKey(str)) {
                nexclip.getTransitionEffect(true).setTransitionEffect((String) this.A.get(str));
            }
            if (this.B.containsKey(str) && !((String) this.B.get(str)).equals("null")) {
                nexColorEffect lutColorEffect = nexColorEffect.getLutColorEffect((String) this.B.get(str));
                if (lutColorEffect != null) {
                    nexclip.setColorEffect(lutColorEffect);
                }
            }
            if (this.C.containsKey(str)) {
                String str2 = (String) this.C.get(str);
                if (str2 != null && str2.length() > 0 && !str2.equals("none")) {
                    nexClip supportedClip = nexClip.getSupportedClip(nexAssetPackageManager.getAssetPackageMediaPath(a.a().b(), str2));
                    if (supportedClip != null) {
                        int totalTime = supportedClip.getTotalTime();
                        int parseInt = Integer.parseInt((String) this.D.get(str));
                        supportedClip.setTemplateEffectID(this.a);
                        supportedClip.setTemplateAudioPos(parseInt);
                        for (int i2 = 0; i2 < nexproject.getTotalClipCount(false); i2++) {
                            nexClip clip = nexproject.getClip(0, false);
                            if (clip != null && clip.getTemplateEffectID() == this.a) {
                                nexproject.remove(clip);
                            }
                        }
                        nexproject.addAudio(supportedClip, nexclip.getProjectStartTime(), nexclip.getProjectStartTime() + totalTime);
                    }
                }
            }
        }
    }

    public boolean a() {
        return this.d.equals("res_video") || this.d.equals("res_image") || this.d.equals("res_solid");
    }

    public boolean a(nexProject nexproject, Context context, float f2) {
        nexClip nexclip = null;
        if (this.d.equals("res_video")) {
            String assetPackageMediaPath = nexAssetPackageManager.getAssetPackageMediaPath(context, this.e);
            if (assetPackageMediaPath != null) {
                nexclip = nexClip.getSupportedClip(assetPackageMediaPath);
            }
            String str = L;
            StringBuilder sb = new StringBuilder();
            sb.append(String.format("Template applyResource2Project file : ", new Object[0]));
            sb.append(assetPackageMediaPath);
            Log.d(str, sb.toString());
            if (nexclip != null) {
                nexproject.add(nexclip);
                nexproject.updateProject();
                nexclip.setAssetResource(true);
                a("res : ", nexclip, true, f2, false);
                a(nexproject, nexclip);
            }
            return true;
        } else if (this.d.equals("res_image")) {
            String assetPackageMediaPath2 = nexAssetPackageManager.getAssetPackageMediaPath(context, this.e);
            if (assetPackageMediaPath2 != null) {
                nexclip = nexClip.getSupportedClip(assetPackageMediaPath2);
            }
            if (nexclip != null) {
                nexclip.setImageClipDuration(this.f + this.I);
                nexproject.add(nexclip);
                nexproject.updateProject();
                nexclip.setAssetResource(true);
                a("res : ", nexclip, true, f2, false);
                a(nexproject, nexclip);
            }
            return true;
        } else if (!this.d.equals("res_solid")) {
            return false;
        } else {
            nexClip solidClip = nexClip.getSolidClip(Color.parseColor(this.e));
            if (solidClip != null) {
                solidClip.setImageClipDuration(this.f + this.I);
                nexproject.add(solidClip);
                nexproject.updateProject();
                solidClip.setAssetResource(true);
                a("res : ", solidClip, true, f2, false);
                a(nexproject, solidClip);
            }
            return true;
        }
    }

    public String b() {
        return this.d;
    }

    /* access modifiers changed from: 0000 */
    public String b(nexClip nexclip) {
        if (this.u != null && !this.u.equals("null")) {
            nexColorEffect lutColorEffect = nexColorEffect.getLutColorEffect(this.u);
            if (lutColorEffect != null) {
                String str = L;
                StringBuilder sb = new StringBuilder();
                sb.append("Template applyLUT2Clip effect set =xte");
                sb.append(lutColorEffect.getPresetName());
                Log.d(str, sb.toString());
                nexclip.setColorEffect(lutColorEffect);
            }
        }
        return null;
    }

    public int c() {
        return this.f;
    }

    public int d() {
        return this.g;
    }

    public int e() {
        return this.h;
    }

    public boolean f() {
        return this.E;
    }

    public boolean g() {
        return this.J == 1;
    }

    public int h() {
        return this.I;
    }

    public int i() {
        return this.f;
    }

    public List<d> j() {
        return this.K;
    }
}
