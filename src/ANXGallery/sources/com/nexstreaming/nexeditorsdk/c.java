package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.Rect;
import android.util.Log;
import com.miui.gallery.movie.utils.MovieStatUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* compiled from: nexTemplate */
final class c {
    private static String w = "nexTemplate";
    private ArrayList<e> A = new ArrayList<>();
    private ArrayList<e> B = new ArrayList<>();
    private Map<String, ArrayList<e>> C = new HashMap();
    private boolean D = true;
    private int E = 10368000;
    private boolean F = false;
    String a;
    String b;
    String c;
    String d;
    String e;
    String f;
    float g = 1.0f;
    int h = 2500;
    int i = -1;
    int j = -1;
    int k = -1;
    int l = -1;
    int m = 0;
    int n;
    String o;
    boolean p = true;
    float q;
    boolean r = false;
    String s = "";
    boolean t = true;
    g u = null;
    boolean v = false;
    private int x = 1;
    private ArrayList<e> y = new ArrayList<>();
    private ArrayList<e> z = new ArrayList<>();

    /* access modifiers changed from: 0000 */
    public int a(nexProject nexproject, List<nexDrawInfo> list) {
        int i2 = 0;
        for (nexDrawInfo nexdrawinfo : list) {
            nexproject.getTopDrawInfo().add(nexdrawinfo);
            i2 = nexdrawinfo.getIsTransition() == 1 ? nexdrawinfo.getStartTime() : nexdrawinfo.getEndTime();
        }
        return i2;
    }

    /* access modifiers changed from: 0000 */
    public String a(nexProject nexproject, Context context, Context context2) {
        nexproject.setBackgroundMusicPath(this.e);
        nexproject.setBGMMasterVolumeScale(this.g);
        return null;
    }

    /* access modifiers changed from: 0000 */
    public String a(nexProject nexproject, Context context, Context context2, boolean z2, boolean z3) {
        this.r = z2;
        this.t = z3;
        Log.d(w, String.format("updateProjectWithTemplate(%b %b)", new Object[]{Boolean.valueOf(z2), Boolean.valueOf(z3)}));
        if (this.b.startsWith("2.0")) {
            nexproject.setTemplateApplyMode(2);
            nexproject.clearDrawInfo();
            return c(nexproject, context, context2);
        } else if (this.b.startsWith("3.0")) {
            nexproject.setTemplateApplyMode(3);
            String d2 = d(nexproject, context, context2);
            if (this.i >= 0) {
                nexproject.setProjectAudioFadeInTime(this.i);
            }
            if (this.j >= 0) {
                nexproject.setProjectAudioFadeOutTime(this.j);
            }
            nexproject.updateProject();
            a(nexproject, context, context2);
            return d2;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Unsupported Template version : ");
            sb.append(this.b);
            return sb.toString();
        }
    }

    /* access modifiers changed from: 0000 */
    public String a(nexProject nexproject, nexProject nexproject2, Context context, Context context2) {
        int i2;
        int i3;
        int i4;
        nexClip nexclip;
        int i5;
        nexClip nexclip2;
        int i6;
        int i7;
        nexClip nexclip3;
        nexProject nexproject3 = nexproject;
        nexProject nexproject4 = nexproject2;
        Context context3 = context;
        Context context4 = context2;
        Log.d(w, String.format("Template imageProject Apply Start(%d %d)", new Object[]{Integer.valueOf(nexproject4.getTotalClipCount(true)), Integer.valueOf(nexproject3.getTotalClipCount(true))}));
        if (!this.B.isEmpty()) {
            int totalClipCount = nexproject3.getTotalClipCount(true);
            Iterator it = this.B.iterator();
            while (it.hasNext()) {
                e eVar = (e) it.next();
                if (eVar.a(true) >= totalClipCount) {
                    List a2 = eVar.a(0, 0, (String) null);
                    nexClip nexclip4 = null;
                    for (d dVar : eVar.j()) {
                        d dVar2 = dVar;
                        List list = a2;
                        e eVar2 = eVar;
                        if (dVar.a(nexproject2, context, eVar, 0, this.q)) {
                            a2 = list;
                            eVar = eVar2;
                        } else {
                            if (nexproject3.getTotalClipCount(true) > 0) {
                                nexClip clip = nexproject3.getClip(0, true);
                                nexproject3.remove(clip);
                                nexproject4.add(clip);
                                clip.clearDrawInfos();
                                clip.mStartTime = Integer.MAX_VALUE;
                                clip.mEndTime = Integer.MIN_VALUE;
                                nexclip4 = clip;
                            }
                            e eVar3 = eVar2;
                            dVar2.a(nexclip4, eVar3.a, eVar3.i(), 0, this.q, null, false);
                            dVar2.a(nexproject4, 0, eVar3.i());
                            eVar = eVar3;
                            a2 = list;
                        }
                    }
                    a(nexproject4, a2);
                    nexproject2.updateProject();
                    b(nexproject4, context3, context4);
                    Log.d(w, String.format("Template imageProject Apply single effect(%d %d)", new Object[]{Integer.valueOf(nexproject4.getTotalClipCount(true)), Integer.valueOf(nexproject3.getTotalClipCount(true))}));
                    return null;
                }
            }
        }
        String str = null;
        int f2 = f();
        this.s = "";
        nexClip nexclip5 = null;
        int i8 = 0;
        boolean z2 = true;
        boolean z3 = true;
        while (true) {
            if (nexproject3.getTotalClipCount(true) <= 0 || this.F) {
                break;
            } else if (z2) {
                int i9 = i8;
                int i10 = 0;
                while (i6 < this.y.size()) {
                    e eVar4 = (e) this.y.get(i6);
                    List a3 = eVar4.a(i7, 0, str);
                    List<d> j2 = eVar4.j();
                    this.s = eVar4.c;
                    nexClip nexclip6 = nexclip5;
                    for (d dVar3 : j2) {
                        e eVar5 = eVar4;
                        int i11 = i7;
                        int i12 = i6;
                        d dVar4 = dVar3;
                        int i13 = i2;
                        if (dVar3.a(nexproject2, context, eVar5, i11, this.q)) {
                            i2 = i13;
                            i6 = i12;
                            eVar4 = eVar5;
                            i7 = i11;
                        } else {
                            if (nexproject3.getTotalClipCount(true) > i13) {
                                nexClip clip2 = nexproject3.getClip(0, true);
                                nexproject3.remove(clip2);
                                nexproject4.add(clip2);
                                clip2.clearDrawInfos();
                                clip2.mStartTime = Integer.MAX_VALUE;
                                clip2.mEndTime = Integer.MIN_VALUE;
                                nexclip3 = clip2;
                            } else {
                                nexclip3 = nexclip6;
                            }
                            eVar4 = eVar5;
                            dVar4.a(nexclip3, eVar4.a, eVar4.i(), i11, this.q, null, false);
                            int i14 = i11;
                            dVar4.a(nexproject4, i14, eVar4.i());
                            nexclip6 = nexclip3;
                            i7 = i14;
                            i2 = i13;
                            i6 = i12;
                        }
                    }
                    int i15 = i6;
                    int i16 = i2;
                    i9 = a(nexproject4, a3);
                    i10 = i15 + 1;
                    nexclip5 = nexclip6;
                    str = null;
                }
                int i17 = i7;
                int i18 = i2;
                if (nexproject3.getTotalClipCount(true) <= i18) {
                    z3 = false;
                }
                Log.d(w, String.format("Template imageProject Apply Intro End(%d %d) (%d)", new Object[]{Integer.valueOf(nexproject4.getTotalClipCount(true)), Integer.valueOf(nexproject3.getTotalClipCount(true)), Integer.valueOf(i18)}));
                i8 = i17;
                f2 = i18;
                str = null;
                z2 = false;
            } else {
                int i19 = i2;
                if (z3) {
                    int i20 = i8;
                    int i21 = 0;
                    while (true) {
                        if (i21 >= this.z.size()) {
                            i8 = i5;
                            break;
                        }
                        e eVar6 = (e) this.z.get(i21);
                        List a4 = eVar6.a(i5, 0, (String) null);
                        List<d> j3 = eVar6.j();
                        this.s = eVar6.c;
                        nexClip nexclip7 = nexclip5;
                        for (d dVar5 : j3) {
                            d dVar6 = dVar5;
                            List list2 = a4;
                            e eVar7 = eVar6;
                            int i22 = i5;
                            if (dVar5.a(nexproject2, context, eVar6, i5, this.q)) {
                                a4 = list2;
                                eVar6 = eVar7;
                                i5 = i22;
                            } else {
                                if (nexproject3.getTotalClipCount(true) > i19) {
                                    nexClip clip3 = nexproject3.getClip(0, true);
                                    nexproject3.remove(clip3);
                                    nexproject4.add(clip3);
                                    clip3.clearDrawInfos();
                                    clip3.mStartTime = Integer.MAX_VALUE;
                                    clip3.mEndTime = Integer.MIN_VALUE;
                                    nexclip2 = clip3;
                                } else {
                                    nexclip2 = nexclip7;
                                }
                                e eVar8 = eVar7;
                                dVar6.a(nexclip2, eVar8.a, eVar8.i(), i22, this.q, null, false);
                                int i23 = i22;
                                dVar6.a(nexproject4, i23, eVar8.i());
                                eVar6 = eVar8;
                                nexclip7 = nexclip2;
                                i5 = i23;
                                a4 = list2;
                            }
                        }
                        i20 = a(nexproject4, a4);
                        if (nexproject3.getTotalClipCount(true) <= i19) {
                            Log.d(w, String.format("Template imageProject Apply Loop End(%d %d) (%d)", new Object[]{Integer.valueOf(nexproject4.getTotalClipCount(true)), Integer.valueOf(nexproject3.getTotalClipCount(true)), Integer.valueOf(i19)}));
                            i8 = i20;
                            nexclip5 = nexclip7;
                            z3 = false;
                            break;
                        }
                        i21++;
                        nexclip5 = nexclip7;
                    }
                    f2 = i19;
                    str = null;
                } else {
                    ArrayList<e> arrayList = this.A;
                    if (this.C != null && this.C.size() > 0) {
                        if (this.C.containsKey(this.s)) {
                            arrayList = (ArrayList) this.C.get(this.s);
                            Log.d(w, String.format("Template imageProject select Outro(%s)", new Object[]{this.s}));
                        } else {
                            arrayList = (ArrayList) this.C.values().iterator().next();
                        }
                    }
                    ArrayList<e> arrayList2 = arrayList;
                    int i24 = i8;
                    int i25 = 0;
                    while (i3 < arrayList2.size()) {
                        e eVar9 = (e) arrayList2.get(i3);
                        List a5 = eVar9.a(i4, 0, this.s);
                        nexClip nexclip8 = null;
                        for (d dVar7 : eVar9.j()) {
                            d dVar8 = dVar7;
                            List list3 = a5;
                            e eVar10 = eVar9;
                            int i26 = i4;
                            int i27 = i3;
                            if (dVar7.a(nexproject2, context, eVar9, i4, this.q)) {
                                i3 = i27;
                                a5 = list3;
                                eVar9 = eVar10;
                                i4 = i26;
                            } else {
                                if (nexproject3.getTotalClipCount(true) > 0) {
                                    nexClip clip4 = nexproject3.getClip(0, true);
                                    nexproject3.remove(clip4);
                                    nexproject4.add(clip4);
                                    clip4.clearDrawInfos();
                                    clip4.mStartTime = Integer.MAX_VALUE;
                                    clip4.mEndTime = Integer.MIN_VALUE;
                                    nexclip = clip4;
                                } else {
                                    nexclip = nexclip8;
                                }
                                e eVar11 = eVar10;
                                dVar8.a(nexclip, eVar11.a, eVar11.i(), i26, this.q, this.s, false);
                                i4 = i26;
                                dVar8.a(nexproject4, i4, eVar11.i());
                                eVar9 = eVar11;
                                nexclip8 = nexclip;
                                i3 = i27;
                                a5 = list3;
                            }
                        }
                        int i28 = i3;
                        i24 = a(nexproject4, a5);
                        i25 = i28 + 1;
                    }
                    Log.d(w, String.format("Template imageProject Apply Outro End(%d %d) (%d)", new Object[]{Integer.valueOf(nexproject4.getTotalClipCount(true)), Integer.valueOf(nexproject3.getTotalClipCount(true)), Integer.valueOf(i19)}));
                }
            }
        }
        if (this.F) {
            return "apply Template user canceled";
        }
        nexproject2.updateProject();
        a(nexproject4, context3, context4);
        return null;
    }

    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x015f, code lost:
        r5 = r6;
        r28 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x01d4, code lost:
        if (r3.getCrop().getEndPosionLock() == false) goto L_0x0229;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x01d6, code lost:
        r5 = new android.graphics.Rect();
        r6 = new android.graphics.Rect();
        r3.getCrop().getStartPosition(r5);
        r3.getCrop().getEndPosition(r6);
        r3.getCrop().applyCropSpeed(r5, r6, r3.getWidth(), r3.getHeight(), r22, r3.getImageClipDuration());
        r3.getCrop().shrinkToAspect(r5, com.nexstreaming.nexeditorsdk.nexApplicationConfig.getAspectRatio());
        r3.getCrop().shrinkToAspect(r6, com.nexstreaming.nexeditorsdk.nexApplicationConfig.getAspectRatio());
        r3.getCrop().setStartPosition(r5);
        r3.getCrop().setEndPosition(r6);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x0229, code lost:
        r1.remove(r3);
        r2.add(r3);
        r9.a(com.miui.gallery.movie.utils.MovieStatUtils.DOWNLOAD_SUCCESS, r3, true, r0.q, r0.r);
        r9.a(r2, r3);
        r9.a(r2, r3, r0.s, r4);
        b(r2);
     */
    public String a(nexProject nexproject, nexProject nexproject2, Context context, ArrayList<e> arrayList, boolean z2) {
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        nexClip nexclip;
        nexProject nexproject3 = nexproject;
        nexProject nexproject4 = nexproject2;
        ArrayList<e> arrayList2 = arrayList;
        boolean z3 = z2;
        int c2 = c();
        int size = arrayList.size();
        int i10 = 0;
        int i11 = 0;
        while (true) {
            if (i11 >= size) {
                break;
            }
            e eVar = (e) arrayList2.get(i11);
            int h2 = eVar.h();
            int c3 = eVar.c();
            int i12 = c3 + h2;
            int d2 = eVar.d() + h2;
            int e2 = h2 + eVar.e();
            if (e2 <= i12) {
                e2 = i12;
            }
            boolean f2 = eVar.f();
            int i13 = eVar.r;
            int totalClipCount = nexproject3.getTotalClipCount(true);
            if (totalClipCount <= 0 && !z3) {
                Log.d(w, String.format("setProjectWithEffects clip apply end", new Object[i10]));
                break;
            }
            if (!eVar.a(nexproject4, context, this.q)) {
                if (totalClipCount > 0) {
                    if (this.m == 1 && !z3 && nexproject3.getClip(0, true).getProjectDuration() - i12 < c2) {
                        this.v = true;
                        Log.d(w, String.format("setProjectWithEffects clip apply end for outro on single video", new Object[0]));
                        break;
                    }
                    if (!z3) {
                        this.s = eVar.c;
                    }
                    int i14 = i12;
                    int i15 = d2;
                    int i16 = e2;
                    while (true) {
                        boolean z4 = true;
                        while (true) {
                            if (nexproject3.getTotalClipCount(z4) <= 0) {
                                break;
                            }
                            i3 = c2;
                            nexClip clip = nexproject3.getClip(0, z4);
                            int projectDuration = clip.getProjectDuration();
                            int i17 = i16;
                            if (clip.getClipType() == z4) {
                                clip.getCrop().setFaceDetectSpeed(i13);
                                if (clip.getCrop().getEndPosionLock()) {
                                    Rect rect = new Rect();
                                    Rect rect2 = new Rect();
                                    clip.getCrop().getStartPosition(rect);
                                    clip.getCrop().getEndPosition(rect2);
                                    clip.getCrop().applyCropSpeed(rect, rect2, clip.getWidth(), clip.getHeight(), i13, projectDuration);
                                    i5 = i13;
                                    clip.getCrop().shrinkToAspect(rect, nexApplicationConfig.getAspectRatio());
                                    clip.getCrop().shrinkToAspect(rect2, nexApplicationConfig.getAspectRatio());
                                    clip.getCrop().setStartPosition(rect);
                                    clip.getCrop().setEndPosition(rect2);
                                } else {
                                    i5 = i13;
                                }
                                if (projectDuration > i14) {
                                    i6 = size;
                                    i2 = i11;
                                    int i18 = i5;
                                    clip.setImageClipDuration(i14);
                                    if (clip.getCrop().getEndPosionLock()) {
                                        Rect rect3 = new Rect();
                                        Rect rect4 = new Rect();
                                        clip.getCrop().getStartPosition(rect3);
                                        clip.getCrop().getEndPosition(rect4);
                                        clip.getCrop().applyCropSpeed(rect3, rect4, clip.getWidth(), clip.getHeight(), i18, clip.getImageClipDuration());
                                        clip.getCrop().shrinkToAspect(rect3, nexApplicationConfig.getAspectRatio());
                                        clip.getCrop().shrinkToAspect(rect4, nexApplicationConfig.getAspectRatio());
                                        clip.getCrop().setStartPosition(rect3);
                                        clip.getCrop().setEndPosition(rect4);
                                    }
                                    nexproject3.remove(clip);
                                    nexproject4.add(clip);
                                    eVar.a(MovieStatUtils.DOWNLOAD_SUCCESS, clip, true, this.q, this.r);
                                    eVar.a(nexproject4, clip);
                                    eVar.a(nexproject4, clip, this.s, z3);
                                    b(nexproject4);
                                } else if (projectDuration >= i15) {
                                    nexproject3.remove(clip);
                                    nexproject4.add(clip);
                                    eVar.a(MovieStatUtils.DOWNLOAD_SUCCESS, clip, true, this.q, this.r);
                                    eVar.a(nexproject4, clip);
                                    eVar.a(nexproject4, clip, this.s, z3);
                                    b(nexproject4);
                                    break;
                                } else if (i14 <= 5000 || nexproject3.getTotalClipCount(true) == 1 || !f2) {
                                    i6 = size;
                                    i2 = i11;
                                    int i19 = i5;
                                    clip.setImageClipDuration(i12);
                                } else {
                                    int i20 = i12 - projectDuration;
                                    nexproject3.remove(clip);
                                    nexproject4.add(clip);
                                    if (i20 <= 0) {
                                        eVar.a("1", clip, true, this.q, this.r);
                                        eVar.a(nexproject4, clip);
                                        eVar.a(nexproject4, clip, this.s, z3);
                                        b(nexproject4);
                                        break;
                                    }
                                    float f3 = this.q;
                                    e eVar2 = eVar;
                                    i6 = size;
                                    float f4 = f3;
                                    i2 = i11;
                                    i7 = i14;
                                    i8 = i17;
                                    i9 = i5;
                                    eVar2.a("1", clip, false, f4, this.r);
                                    eVar.a(nexproject4, clip);
                                    eVar.a(nexproject4, clip, this.s, z3);
                                    Context context2 = context;
                                    i12 = i20;
                                }
                            } else {
                                i6 = size;
                                i2 = i11;
                                i7 = i14;
                                i9 = i13;
                                i8 = i17;
                                if (projectDuration < i15) {
                                    if (!eVar.g()) {
                                        nexproject3.remove(clip);
                                        Context context3 = context;
                                        break;
                                    }
                                    nexproject3.remove(clip);
                                    nexproject4.add(clip);
                                    int i21 = i12;
                                    eVar.a("2", clip, false, this.q, this.r);
                                    eVar.a(nexproject4, clip);
                                    eVar.a(nexproject4, clip, this.s, z3);
                                    if (!this.t) {
                                        clip.getVideoClipEdit().setSpeedControl(100);
                                        z4 = true;
                                        if (nexproject3.getTotalClipCount(true) <= 0) {
                                            clip.setTemplateEffectID(clip.getTemplateEffectID() & nexEngine.ExportHEVCMainTierLevel62);
                                        }
                                    } else {
                                        z4 = true;
                                    }
                                    i15 -= projectDuration;
                                    i16 = i8 - projectDuration;
                                    i14 = i7 - projectDuration;
                                    Context context4 = context;
                                    i12 = i21;
                                    i13 = i9;
                                    c2 = i3;
                                    size = i6;
                                    i11 = i2;
                                    arrayList2 = arrayList;
                                } else if (projectDuration <= i8) {
                                    nexproject3.remove(clip);
                                    nexproject4.add(clip);
                                    eVar.a("3", clip, true, this.q, this.r);
                                    eVar.a(nexproject4, clip);
                                    eVar.a(nexproject4, clip, this.s, z3);
                                    b(nexproject4);
                                    if (!this.t) {
                                        clip.getVideoClipEdit().setSpeedControl(100);
                                        c(nexproject4);
                                    }
                                } else {
                                    int i22 = i2 + 1;
                                    int i23 = i6;
                                    if (i22 >= i23) {
                                        nexclip = clip;
                                        arrayList2 = arrayList;
                                        i22 = 0;
                                    } else {
                                        nexclip = clip;
                                        arrayList2 = arrayList;
                                    }
                                    e eVar3 = (e) arrayList2.get(i22);
                                    int i24 = projectDuration - i7;
                                    int i25 = projectDuration - i15;
                                    int d3 = eVar3.d() + eVar3.h();
                                    if (i24 <= d3 && !eVar3.a() && eVar.g()) {
                                        if (i25 >= d3) {
                                            i7 = i15;
                                        } else {
                                            nexproject3.remove(nexclip);
                                            nexproject4.add(nexclip);
                                            nexClip nexclip2 = nexclip;
                                            nexClip nexclip3 = nexclip;
                                            float f5 = this.q;
                                            i4 = i23;
                                            eVar.a("3", nexclip2, true, f5, this.r);
                                            eVar.a(nexproject4, nexclip3);
                                            eVar.a(nexproject4, nexclip3, this.s, z3);
                                            b(nexproject4);
                                            if (!this.t) {
                                                nexclip3.getVideoClipEdit().setSpeedControl(100);
                                                c(nexproject4);
                                            }
                                        }
                                    }
                                    nexClip nexclip4 = nexclip;
                                    i4 = i23;
                                    int speedControl = nexclip4.getVideoClipEdit().getSpeedControl();
                                    nexClip dup = nexClip.dup(nexclip4);
                                    nexproject4.add(dup);
                                    dup.setRotateDegree(nexclip4.getRotateDegree());
                                    dup.getVideoClipEdit().setSpeedControl(speedControl);
                                    if (speedControl != 100) {
                                        i7 = (i7 * speedControl) / 100;
                                    }
                                    dup.getVideoClipEdit().setTrim(nexclip4.getVideoClipEdit().getStartTrimTime(), nexclip4.getVideoClipEdit().getStartTrimTime() + i7);
                                    nexclip4.getVideoClipEdit().setTrim(nexclip4.getVideoClipEdit().getStartTrimTime() + i7, nexclip4.getVideoClipEdit().getEndTrimTime());
                                    nexClip nexclip5 = dup;
                                    eVar.a("4", dup, true, this.q, this.r);
                                    eVar.a(nexproject4, nexclip5);
                                    eVar.a(nexproject4, nexclip5, this.s, z3);
                                    if (!this.t) {
                                        nexclip4.getVideoClipEdit().setSpeedControl(100);
                                        nexclip5.getVideoClipEdit().setSpeedControl(100);
                                        c(nexproject4);
                                    } else {
                                        b(nexproject4);
                                    }
                                }
                            }
                        }
                        i14 = i7;
                        i13 = i9;
                        c2 = i3;
                        size = i6;
                        i11 = i2;
                        i16 = i8;
                        arrayList2 = arrayList;
                    }
                    i4 = i6;
                    arrayList2 = arrayList;
                    i11 = i2 + 1;
                    size = i4;
                    c2 = i3;
                    i10 = 0;
                } else {
                    Log.d(w, String.format("setProjectWithEffects clip apply end", new Object[0]));
                    break;
                }
            } else if (!z3) {
                this.s = eVar.c;
            } else {
                nexClip clip2 = nexproject4.getClip(nexproject4.getTotalClipCount(true) - 1, true);
                if (clip2 != null) {
                    eVar.a(nexproject4, clip2, this.s, z3);
                }
            }
            i3 = c2;
            i4 = size;
            i2 = i11;
            i11 = i2 + 1;
            size = i4;
            c2 = i3;
            i10 = 0;
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public String a(String str, JSONObject jSONObject) {
        this.F = false;
        if (str != null) {
            File file = new File(str);
            Log.d(w, String.format("Template templateFile path(%s)", new Object[]{file.getAbsolutePath()}));
            file.getAbsolutePath().endsWith("txt");
        }
        this.x = 1;
        String a2 = a(jSONObject);
        if (a2 != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Template header parse error : ");
            sb.append(a2);
            return sb.toString();
        }
        try {
            JSONArray jSONArray = jSONObject.getJSONArray("template_intro");
            for (int i2 = 0; i2 < jSONArray.length(); i2++) {
                JSONObject jSONObject2 = jSONArray.getJSONObject(i2);
                int i3 = this.x;
                this.x = i3 + 1;
                e a3 = e.a(jSONObject2, i3);
                if (a3 == null) {
                    return "Template intro parse error";
                }
                this.y.add(a3);
            }
            JSONArray jSONArray2 = jSONObject.getJSONArray("template_loop");
            for (int i4 = 0; i4 < jSONArray2.length(); i4++) {
                JSONObject jSONObject3 = jSONArray2.getJSONObject(i4);
                int i5 = this.x;
                this.x = i5 + 1;
                e a4 = e.a(jSONObject3, i5);
                if (a4 == null) {
                    return "Template Loop parse error";
                }
                this.z.add(a4);
            }
            JSONArray jSONArray3 = jSONObject.getJSONArray("template_outro");
            for (int i6 = 0; i6 < jSONArray3.length(); i6++) {
                JSONObject jSONObject4 = jSONArray3.getJSONObject(i6);
                if (jSONObject4 != null) {
                    if (!jSONObject4.has("alternative_id") || !jSONObject4.has("alternative_outro")) {
                        JSONObject jSONObject5 = jSONArray3.getJSONObject(i6);
                        int i7 = this.x;
                        this.x = i7 + 1;
                        e a5 = e.a(jSONObject5, i7);
                        if (a5 == null) {
                            return "Template Outro parse error";
                        }
                        this.A.add(a5);
                    } else {
                        String string = jSONObject4.getString("alternative_id");
                        JSONArray jSONArray4 = jSONObject4.getJSONArray("alternative_outro");
                        ArrayList arrayList = new ArrayList();
                        for (int i8 = 0; i8 < jSONArray4.length(); i8++) {
                            JSONObject jSONObject6 = jSONArray4.getJSONObject(i8);
                            int i9 = this.x;
                            this.x = i9 + 1;
                            e a6 = e.a(jSONObject6, i9);
                            if (a6 == null) {
                                return "Template Outro parse error(alternative outro)";
                            }
                            arrayList.add(a6);
                        }
                        this.C.put(string, arrayList);
                    }
                }
            }
            if (jSONObject.has("template_single")) {
                JSONArray jSONArray5 = jSONObject.getJSONArray("template_single");
                for (int i10 = 0; i10 < jSONArray5.length(); i10++) {
                    JSONObject jSONObject7 = jSONArray5.getJSONObject(i10);
                    int i11 = this.x;
                    this.x = i11 + 1;
                    e a7 = e.a(jSONObject7, i11);
                    if (a7 == null) {
                        return "Template Single parse error";
                    }
                    this.B.add(a7);
                }
            }
            Log.d(w, "parseTemplate end");
            return null;
        } catch (JSONException e2) {
            e2.printStackTrace();
            this.y.clear();
            this.z.clear();
            this.A.clear();
            this.B.clear();
            String str2 = w;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("parseTemplate failed : ");
            sb2.append(e2.getMessage());
            Log.d(str2, sb2.toString());
            StringBuilder sb3 = new StringBuilder();
            sb3.append("parseTemplate failed : ");
            sb3.append(e2.getMessage());
            return sb3.toString();
        }
    }

    /* access modifiers changed from: 0000 */
    public String a(JSONObject jSONObject) {
        try {
            this.a = jSONObject.getString("template_name");
            this.b = jSONObject.getString("template_version");
            this.c = jSONObject.getString("template_desc");
            this.d = jSONObject.getString("template_mode");
            this.q = 1.7777778f;
            if (this.d.equals("16v9")) {
                this.q = 1.7777778f;
            } else if (this.d.equals("9v16")) {
                this.q = 0.5625f;
            } else if (this.d.equals("1v1")) {
                this.q = 1.0f;
            } else if (this.d.equals("2v1")) {
                this.q = 2.0f;
            } else if (this.d.equals("1v2")) {
                this.q = 0.5f;
            }
            this.e = jSONObject.getString("template_bgm");
            if (jSONObject.has("template_single_bgm")) {
                this.f = jSONObject.getString("template_single_bgm");
            }
            if (jSONObject.has("template_bgm_volume")) {
                this.g = Float.parseFloat(jSONObject.getString("template_bgm_volume"));
            }
            if (jSONObject.has("template_min_duration")) {
                this.n = Integer.parseInt(jSONObject.getString("template_min_duration"));
            }
            if (jSONObject.has("template_default_effect")) {
                this.o = jSONObject.getString("template_default_effect");
            }
            if (jSONObject.has("template_default_effect_scale")) {
                this.p = !jSONObject.getString("template_default_effect_scale").equals(MovieStatUtils.DOWNLOAD_SUCCESS);
            }
            if (jSONObject.has("template_default_image_duration") && !jSONObject.getString("template_default_image_duration").equals("default")) {
                this.h = Integer.parseInt(jSONObject.getString("template_default_image_duration"));
            }
            if (jSONObject.has("template_project_vol_fade_in_time") && !jSONObject.getString("template_project_vol_fade_in_time").equals("default")) {
                this.i = Integer.parseInt(jSONObject.getString("template_project_vol_fade_in_time"));
            }
            if (jSONObject.has("template_project_vol_fade_out_time") && !jSONObject.getString("template_project_vol_fade_out_time").equals("default")) {
                this.j = Integer.parseInt(jSONObject.getString("template_project_vol_fade_out_time"));
            }
            if (jSONObject.has("template_single_project_vol_fade_in_time") && !jSONObject.getString("template_single_project_vol_fade_in_time").equals("default")) {
                this.k = Integer.parseInt(jSONObject.getString("template_single_project_vol_fade_in_time"));
            }
            if (jSONObject.has("template_single_project_vol_fade_out_time") && !jSONObject.getString("template_single_project_vol_fade_out_time").equals("default")) {
                this.l = Integer.parseInt(jSONObject.getString("template_single_project_vol_fade_out_time"));
            }
            if (jSONObject.has("template_single_video")) {
                this.m = Integer.parseInt(jSONObject.getString("template_single_video"));
            }
            return null;
        } catch (JSONException e2) {
            e2.printStackTrace();
            String str = w;
            StringBuilder sb = new StringBuilder();
            sb.append("parse Template failed : ");
            sb.append(e2.getMessage());
            Log.d(str, sb.toString());
            Log.d(w, "case1 1");
            return e2.getMessage();
        }
    }

    public void a() {
        this.F = false;
        if (this.y != null) {
            this.y.clear();
        }
        if (this.z != null) {
            this.z.clear();
        }
        if (this.A != null) {
            this.A.clear();
        }
        if (this.B != null) {
            this.B.clear();
        }
    }

    /* access modifiers changed from: 0000 */
    public boolean a(nexProject nexproject) {
        for (int i2 = 0; i2 < nexproject.getTotalClipCount(true); i2++) {
            if (nexproject.getClip(i2, true).getClipType() == 1) {
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: 0000 */
    public int b() {
        return this.n;
    }

    /* access modifiers changed from: 0000 */
    public String b(nexProject nexproject, Context context, Context context2) {
        nexproject.setBackgroundMusicPath(this.f);
        nexproject.setBGMMasterVolumeScale(this.g);
        return null;
    }

    /* access modifiers changed from: 0000 */
    public void b(nexProject nexproject) {
        int totalClipCount = nexproject.getTotalClipCount(true);
        if (totalClipCount > 1) {
            nexClip clip = nexproject.getClip(totalClipCount - 2, true);
            int templateEffectID = clip.getTemplateEffectID() & -251658241;
            nexClip clip2 = nexproject.getClip(totalClipCount - 1, true);
            int templateEffectID2 = clip2.getTemplateEffectID() & -251658241;
            if (templateEffectID != templateEffectID2 && clip.getTransitionEffect().getDuration() >= clip2.getProjectDuration() - clip2.getTransitionEffect().getDuration()) {
                clip.getTransitionEffect(true).setEffectNone();
                clip.getTransitionEffect(true).setDuration(0);
            }
            if (templateEffectID != templateEffectID2 && clip2.getProjectDuration() <= clip2.getTransitionEffect().getDuration()) {
                clip2.getTransitionEffect(true).setEffectNone();
                clip2.getTransitionEffect(true).setDuration(0);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public int c() {
        int i2 = 0;
        if (this.C != null && this.C.size() > 0) {
            Iterator it = this.C.values().iterator();
            if (it.hasNext()) {
                Iterator it2 = ((ArrayList) it.next()).iterator();
                while (it2.hasNext()) {
                    e eVar = (e) it2.next();
                    if (!eVar.b().equals("res_video") && !eVar.b().equals("res_image") && !eVar.b().equals("res_solid")) {
                        i2 += eVar.c();
                    }
                }
                return i2;
            }
        }
        if (this.A == null || this.A.isEmpty()) {
            return 0;
        }
        Iterator it3 = this.A.iterator();
        while (it3.hasNext()) {
            e eVar2 = (e) it3.next();
            if (!eVar2.b().equals("res_video") && !eVar2.b().equals("res_image") && !eVar2.b().equals("res_solid")) {
                i2 += eVar2.c() + eVar2.h();
            }
        }
        return i2;
    }

    /* access modifiers changed from: 0000 */
    public String c(nexProject nexproject, Context context, Context context2) {
        nexProject nexproject2 = nexproject;
        int totalTime = nexproject.getTotalTime();
        Log.d(w, String.format("applyTemplate20_Project ( ProjectTime:%d TemplateMinDur:%d)", new Object[]{Integer.valueOf(totalTime), Integer.valueOf(b())}));
        nexProject clone = nexProject.clone(nexproject);
        nexproject.allClear(true);
        int e2 = e();
        int c2 = c();
        ArrayList arrayList = new ArrayList();
        if (this.B.isEmpty() || (!(clone.getTotalClipCount(true) == 1 && clone.getClip(0, true).getClipType() == 1) && (clone.getTotalTime() >= d() || a(clone)))) {
            if (this.m != 1) {
                int totalClipCount = clone.getTotalClipCount(true) - 1;
                while (true) {
                    if (totalClipCount < 0 || c2 < 800 || e2 <= 0) {
                        break;
                    }
                    nexClip clip = clone.getClip(totalClipCount, true);
                    if (clip.getClipType() == 1) {
                        arrayList.add(0, clip);
                        clone.remove(clip);
                        c2 -= clip.getProjectDuration();
                        e2--;
                    } else if (clip.getProjectDuration() <= c2) {
                        arrayList.add(0, clip);
                        clone.remove(clip);
                        c2 -= clip.getProjectDuration();
                    } else {
                        if (((e) this.y.get(0)).d() > totalTime - c2) {
                            arrayList.add(0, clip);
                            clone.remove(clip);
                        } else {
                            int speedControl = clip.getVideoClipEdit().getSpeedControl();
                            nexClip dup = nexClip.dup(clip);
                            clone.add(totalClipCount, true, dup);
                            dup.getVideoClipEdit().setSpeedControl(speedControl);
                            dup.setRotateDegree(clip.getRotateDegree());
                            if (speedControl != 100) {
                                c2 = (c2 * speedControl) / 100;
                            }
                            int startTrimTime = clip.getVideoClipEdit().getStartTrimTime();
                            int endTrimTime = clip.getVideoClipEdit().getEndTrimTime();
                            int i2 = endTrimTime - c2;
                            dup.getVideoClipEdit().setTrim(startTrimTime, i2);
                            clip.getVideoClipEdit().setTrim(i2, endTrimTime);
                            Log.d(w, String.format("Template Apply 1(%d %d %d) 2(%d %d %d)", new Object[]{Integer.valueOf(dup.getProjectDuration()), Integer.valueOf(dup.getVideoClipEdit().getStartTrimTime()), Integer.valueOf(dup.getVideoClipEdit().getEndTrimTime()), Integer.valueOf(clip.getProjectDuration()), Integer.valueOf(clip.getVideoClipEdit().getStartTrimTime()), Integer.valueOf(clip.getVideoClipEdit().getEndTrimTime())}));
                            arrayList.add(0, clip);
                            clone.remove(clip);
                        }
                    }
                    totalClipCount--;
                }
            }
            Log.d(w, String.format("Template Apply Intro Start(%d %d)", new Object[]{Integer.valueOf(nexproject.getTotalClipCount(true)), Integer.valueOf(clone.getTotalClipCount(true))}));
            String a2 = a(clone, nexproject, context, this.y, false);
            if (a2 != null) {
                return a2;
            }
            Log.d(w, String.format("Template Apply Intro End(%d %d)", new Object[]{Integer.valueOf(nexproject.getTotalClipCount(true)), Integer.valueOf(clone.getTotalClipCount(true))}));
            while (clone.getTotalClipCount(true) > 0 && !this.v) {
                String a3 = a(clone, nexproject, context, this.z, false);
                if (a3 != null) {
                    return a3;
                }
                if (this.F) {
                    Log.d(w, "cancel template");
                    return "cancel template";
                }
            }
            Log.d(w, String.format("Template Apply Loop End(%d %d)", new Object[]{Integer.valueOf(nexproject.getTotalClipCount(true)), Integer.valueOf(clone.getTotalClipCount(true))}));
            while (arrayList.size() > 0) {
                clone.add((nexClip) arrayList.get(0));
                arrayList.remove(0);
            }
            Log.d(w, String.format("Template Apply Outpro Start(%d %d)", new Object[]{Integer.valueOf(nexproject.getTotalClipCount(true)), Integer.valueOf(clone.getTotalClipCount(true))}));
            String a4 = a(clone, nexproject, context, this.A, true);
            if (a4 != null) {
                return a4;
            }
            Log.d(w, String.format("Template Apply Outro End(%d %d)", new Object[]{Integer.valueOf(nexproject.getTotalClipCount(true)), Integer.valueOf(clone.getTotalClipCount(true))}));
            nexproject.updateTimeLine(false);
            if (this.i >= 0) {
                nexproject.setProjectAudioFadeInTime(this.i);
            }
            if (this.j >= 0) {
                nexproject.setProjectAudioFadeOutTime(this.j);
            }
            nexproject.updateProject();
            if (!this.t) {
                int totalClipCount2 = nexproject.getTotalClipCount(true);
                for (int i3 = 0; i3 < totalClipCount2; i3++) {
                    if (nexproject.getClip(i3, true).getClipEffect().getId().endsWith(".force_effect")) {
                        Rect rect = new Rect();
                        nexproject.getClip(i3 - 1, true).getCrop().getEndPositionRaw(rect);
                        nexproject.getClip(i3, true).getCrop().setStartPositionRaw(rect);
                        int i4 = i3 + 1;
                        if (i4 < totalClipCount2) {
                            nexproject.getClip(i4, true).getCrop().getStartPositionRaw(rect);
                            nexproject.getClip(i3, true).getCrop().setEndPositionRaw(rect);
                        }
                    }
                }
            }
            a(nexproject, context, context2);
            return a4;
        }
        Log.d(w, String.format("Template Apply Single Start(%d %d)", new Object[]{Integer.valueOf(nexproject.getTotalClipCount(true)), Integer.valueOf(clone.getTotalClipCount(true))}));
        String a5 = a(clone, nexproject, context, this.B, true);
        if (a5 != null) {
            return a5;
        }
        nexproject.updateTimeLine(false);
        if (this.k >= 0) {
            nexproject.setProjectAudioFadeInTime(this.k);
        }
        if (this.l >= 0) {
            nexproject.setProjectAudioFadeOutTime(this.l);
        }
        nexproject.updateProject();
        if (this.f != null) {
            b(nexproject, context, context2);
        } else {
            a(nexproject, context, context2);
        }
        return a5;
    }

    /* access modifiers changed from: 0000 */
    public void c(nexProject nexproject) {
        int totalClipCount = nexproject.getTotalClipCount(true);
        if (totalClipCount > 0) {
            nexClip clip = nexproject.getClip(totalClipCount - 1, true);
            if (clip != null && !clip.getTransitionEffect().getId().equals("none") && clip.getTransitionEffect().getDuration() > 0) {
                int duration = clip.getTransitionEffect().getDuration();
                if (clip.getVideoClipEdit().getSpeedControl() != 100) {
                    duration = (duration * clip.getVideoClipEdit().getSpeedControl()) / 100;
                }
                nexClip dup = nexClip.dup(clip);
                nexproject.add(dup);
                dup.setRotateDegree(clip.getRotateDegree());
                dup.getVideoClipEdit().setSpeedControl(clip.getVideoClipEdit().getSpeedControl());
                dup.setColorEffect(clip.getColorEffect());
                dup.setBrightness(clip.getBrightness());
                dup.setContrast(clip.getContrast());
                dup.setSaturation(clip.getSaturation());
                dup.setTemplateEffectID(clip.getTemplateEffectID());
                dup.setClipVolume(clip.getClipVolume());
                dup.setAudioOnOff(clip.getAudioOnOff());
                nexClipEffect clipEffect = dup.getClipEffect();
                StringBuilder sb = new StringBuilder();
                sb.append(clip.getTransitionEffect().getId());
                sb.append(".force_effect");
                clipEffect.setEffect(sb.toString());
                dup.getTransitionEffect().setTransitionEffect("none");
                dup.getTransitionEffect().setDuration(0);
                clip.getTransitionEffect().setTransitionEffect("none");
                clip.getTransitionEffect().setDuration(0);
                dup.getVideoClipEdit().setTrim(clip.getVideoClipEdit().getEndTrimTime() - duration, clip.getVideoClipEdit().getEndTrimTime());
                clip.getVideoClipEdit().setTrim(clip.getVideoClipEdit().getStartTrimTime(), clip.getVideoClipEdit().getEndTrimTime() - duration);
                Log.d(w, String.format("Template split clip(%d %d) next(%d %d %s)", new Object[]{Integer.valueOf(clip.getProjectStartTime()), Integer.valueOf(clip.getVideoClipEdit().getStartTrimTime() + duration), Integer.valueOf(clip.getVideoClipEdit().getStartTrimTime() + duration), Integer.valueOf(dup.getProjectEndTime()), dup.getTransitionEffect().getId()}));
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public int d() {
        int i2 = 0;
        if (this.B == null || this.B.isEmpty()) {
            return 0;
        }
        Iterator it = this.B.iterator();
        while (it.hasNext()) {
            e eVar = (e) it.next();
            if (!eVar.b().equals("res_video") && !eVar.b().equals("res_image") && !eVar.b().equals("res_solid")) {
                i2 += eVar.c() + eVar.h();
            }
        }
        return i2;
    }

    /* access modifiers changed from: 0000 */
    public String d(nexProject nexproject, Context context, Context context2) {
        int totalTime = nexproject.getTotalTime();
        Log.d(w, String.format("applyTemplate30_Project ( ProjectTime:%d TemplateMinDur:%d)", new Object[]{Integer.valueOf(totalTime), Integer.valueOf(b())}));
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        for (int i5 = 0; i5 < nexproject.getTotalClipCount(true); i5++) {
            nexClip clip = nexproject.getClip(i5, true);
            if (clip.getClipType() == 1) {
                i2++;
            } else {
                if (i4 < clip.getProjectDuration()) {
                    i4 = clip.getProjectDuration();
                }
                clip.getWidth();
                clip.getHeight();
                i3++;
            }
        }
        Log.d(w, String.format("applyTemplate30_Project(I:%d V:%d)", new Object[]{Integer.valueOf(i2), Integer.valueOf(i3)}));
        if (i2 <= 0 && i3 <= 0) {
            return "Not support project on 3.0 template";
        }
        if (i3 > 0) {
            return "Template applying failed(variable content) with preprocessing fail";
        }
        nexProject clone = nexProject.clone(nexproject);
        nexproject.allClear(true);
        nexproject.getTopDrawInfo().clear();
        String a2 = a(clone, nexproject, context, context2);
        nexproject.updateTimeLine(false);
        String str = w;
        StringBuilder sb = new StringBuilder();
        sb.append("Template3.0 make Project end with only images: ");
        sb.append(a2);
        Log.d(str, sb.toString());
        return a2;
    }

    /* access modifiers changed from: 0000 */
    public int e() {
        Iterator it = this.A.iterator();
        int i2 = 0;
        while (it.hasNext()) {
            e eVar = (e) it.next();
            if (!eVar.b().equals("res_video") && !eVar.b().equals("res_image") && !eVar.b().equals("res_solid")) {
                i2++;
            }
        }
        return i2;
    }

    /* access modifiers changed from: 0000 */
    public int f() {
        int i2 = 0;
        if (this.C == null || this.C.size() <= 0) {
            Iterator it = this.A.iterator();
            while (it.hasNext()) {
                e eVar = (e) it.next();
                if (!eVar.b().equals("res_video") && !eVar.b().equals("res_image") && !eVar.b().equals("res_solid")) {
                    i2 += eVar.a(true);
                }
            }
            return i2;
        }
        Iterator it2 = ((ArrayList) this.C.values().iterator().next()).iterator();
        while (it2.hasNext()) {
            i2 += ((e) it2.next()).a(true);
        }
        return i2;
    }

    /* access modifiers changed from: 0000 */
    public int g() {
        return this.h;
    }

    /* access modifiers changed from: 0000 */
    public void h() {
        Log.d(w, "setCancel");
        this.F = true;
    }
}
