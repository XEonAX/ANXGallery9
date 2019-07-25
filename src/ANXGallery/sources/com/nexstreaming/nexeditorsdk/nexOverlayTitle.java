package com.nexstreaming.nexeditorsdk;

import android.animation.TimeInterpolator;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Paint.Align;
import android.util.Log;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AnticipateInterpolator;
import android.view.animation.AnticipateOvershootInterpolator;
import android.view.animation.BounceInterpolator;
import android.view.animation.CycleInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import android.view.animation.OvershootInterpolator;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemCategory;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemType;
import com.nexstreaming.app.common.nexasset.assetpackage.c;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.util.q;
import com.nexstreaming.nexeditorsdk.nexOverlayImage.runTimeMakeBitMap;
import com.nexstreaming.nexeditorsdk.nexOverlayManager.nexTitleInfo;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class nexOverlayTitle {
    private static String a = "nexOverlayTitle";
    private String b;
    private String c;
    private String d;
    private String e;
    private Priority f = Priority.NONE;
    private ArrayList<HashMap<String, String>> g = new ArrayList<>();
    private int h = 0;

    private enum Priority {
        NONE,
        START,
        END,
        START_END
    }

    public interface TitleInfoListener {
        void OnTitleInfoListener(int i, String str, int i2, String str2, int i3, String str3, String str4, int i4, int i5);
    }

    private boolean a(JSONObject jSONObject) {
        new HashMap();
        try {
            this.b = jSONObject.getString("overlay_name");
            this.c = jSONObject.getString("overlay_version");
            this.d = jSONObject.getString("overlay_desc");
            this.e = jSONObject.getString("overlay_priority");
            return true;
        } catch (JSONException e2) {
            e2.printStackTrace();
            String str = a;
            StringBuilder sb = new StringBuilder();
            sb.append("pasrse Overlay info failed : ");
            sb.append(e2.getMessage());
            Log.d(str, sb.toString());
            return false;
        }
    }

    private nexOverlayImage b(String str) {
        f c2 = c.a().c(str);
        if (c2 != null && c2.getCategory() == ItemCategory.overlay && c2.getType() == ItemType.overlay) {
            return new nexOverlayImage(str, true);
        }
        return null;
    }

    private String b(JSONObject jSONObject, TitleInfoListener titleInfoListener) {
        int i;
        int i2;
        try {
            HashMap hashMap = new HashMap();
            String str = a;
            StringBuilder sb = new StringBuilder();
            sb.append("pasrse Overlay : ");
            sb.append(jSONObject.toString());
            Log.d(str, sb.toString());
            StringBuilder sb2 = new StringBuilder();
            sb2.append("");
            sb2.append(this.h);
            hashMap.put("id", sb2.toString());
            hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, jSONObject.getString(nexExportFormat.TAG_FORMAT_TYPE));
            if (jSONObject.has("text")) {
                hashMap.put("text", jSONObject.getString("text"));
            }
            if (jSONObject.has("text_desc")) {
                hashMap.put("text_desc", jSONObject.getString("text_desc"));
            }
            if (jSONObject.has("text_max_len")) {
                hashMap.put("text_max_len", jSONObject.getString("text_max_len"));
            }
            if (jSONObject.has("position")) {
                hashMap.put("position", jSONObject.getString("position"));
            }
            if (jSONObject.has("start_time")) {
                hashMap.put("start_time", jSONObject.getString("start_time"));
            }
            if (jSONObject.has("duration")) {
                hashMap.put("duration", jSONObject.getString("duration"));
            }
            if (jSONObject.has("font")) {
                hashMap.put("font", jSONObject.getString("font"));
            }
            if (jSONObject.has("font_size")) {
                hashMap.put("font_size", jSONObject.getString("font_size"));
            }
            if (jSONObject.has("text_color")) {
                hashMap.put("text_color", jSONObject.getString("text_color"));
            }
            if (jSONObject.has("shadow_color")) {
                hashMap.put("shadow_color", jSONObject.getString("shadow_color"));
            }
            if (jSONObject.has("shadow_visible")) {
                hashMap.put("shadow_visible", jSONObject.getString("shadow_visible"));
            }
            if (jSONObject.has("glow_color")) {
                hashMap.put("glow_color", jSONObject.getString("glow_color"));
            }
            if (jSONObject.has("glow_visible")) {
                hashMap.put("glow_visible", jSONObject.getString("glow_visible"));
            }
            if (jSONObject.has("outline_color")) {
                hashMap.put("outline_color", jSONObject.getString("outline_color"));
            }
            if (jSONObject.has("outline_visible")) {
                hashMap.put("outline_visible", jSONObject.getString("outline_visible"));
            }
            if (jSONObject.has("align")) {
                hashMap.put("align", jSONObject.getString("align"));
            }
            if (jSONObject.has("animation")) {
                hashMap.put("animation", jSONObject.getString("animation"));
            }
            if (jSONObject.has("adjust_animation_non_sub")) {
                hashMap.put("adjust_animation_non_sub", jSONObject.getString("adjust_animation_non_sub"));
            }
            if (jSONObject.has("rotate")) {
                hashMap.put("rotate", jSONObject.getString("rotate"));
            }
            if (jSONObject.has("scale")) {
                hashMap.put("scale", jSONObject.getString("scale"));
            }
            if (jSONObject.has("group")) {
                hashMap.put("group", jSONObject.getString("group"));
            }
            if (jSONObject.has("adjust_pos_non_sub")) {
                hashMap.put("adjust_pos_non_sub", jSONObject.getString("adjust_pos_non_sub"));
            }
            if (jSONObject.has("adjust_align_non_sub")) {
                hashMap.put("adjust_align_non_sub", jSONObject.getString("adjust_align_non_sub"));
            }
            if (jSONObject.has("image_res")) {
                hashMap.put("image_res", jSONObject.getString("image_res"));
            }
            if (jSONObject.getString("start_time").equals(MovieStatUtils.DOWNLOAD_SUCCESS)) {
                if (this.f != Priority.START_END) {
                    if (this.f == Priority.END) {
                        this.f = Priority.START_END;
                    } else {
                        this.f = Priority.START;
                    }
                }
            } else if (jSONObject.getString("start_time").equals(MovieStatUtils.DOWNLOAD_FAILED)) {
                if (this.f != Priority.START_END) {
                    if (this.f == Priority.START) {
                        this.f = Priority.START_END;
                    } else {
                        this.f = Priority.END;
                    }
                }
            }
            if (titleInfoListener != null && hashMap.containsKey("text")) {
                String string = jSONObject.getString("font");
                String string2 = jSONObject.getString("text");
                String string3 = jSONObject.getString("text_desc");
                String string4 = jSONObject.has("group") ? jSONObject.getString("group") : "";
                int parseInt = Integer.parseInt(jSONObject.getString("text_max_len"));
                int parseInt2 = Integer.parseInt(jSONObject.getString("font_size"));
                if (jSONObject.has("position")) {
                    String[] split = ((String) hashMap.get("position")).replace(" ", "").split(",");
                    if (split != null) {
                        int parseInt3 = Integer.parseInt(split[0]);
                        i = Integer.parseInt(split[3]) - Integer.parseInt(split[1]);
                        i2 = Integer.parseInt(split[2]) - parseInt3;
                        titleInfoListener.OnTitleInfoListener(this.h, string, parseInt2, string2, parseInt, string3, string4, i2, i);
                    }
                }
                i = parseInt2;
                i2 = 0;
                titleInfoListener.OnTitleInfoListener(this.h, string, parseInt2, string2, parseInt, string3, string4, i2, i);
            }
            this.h++;
            this.g.add(hashMap);
            return null;
        } catch (JSONException e2) {
            e2.printStackTrace();
            return e2.getMessage();
        }
    }

    /* access modifiers changed from: 0000 */
    public int a(int i, List<nexTitleInfo> list, int i2) {
        for (nexTitleInfo nextitleinfo : list) {
            if (nextitleinfo.getId() == i) {
                int fontSize = nextitleinfo.getFontSize();
                String str = a;
                StringBuilder sb = new StringBuilder();
                sb.append("getFontSize() id=");
                sb.append(i);
                sb.append(", FontSize=");
                sb.append(fontSize);
                Log.d(str, sb.toString());
                return fontSize <= 0 ? i2 : fontSize;
            }
        }
        String str2 = a;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("getFontSize() id=");
        sb2.append(i);
        sb2.append(", defaultFontSize=");
        sb2.append(i2);
        Log.d(str2, sb2.toString());
        return i2;
    }

    /* access modifiers changed from: 0000 */
    public int a(String str, List<nexTitleInfo> list, int i) {
        for (nexTitleInfo nextitleinfo : list) {
            if (nextitleinfo.getGroup().startsWith(str.substring(0, 1)) && nextitleinfo.getText() != null && nextitleinfo.getText().length() > 0) {
                return nextitleinfo.getFontSize();
            }
        }
        return i;
    }

    /* access modifiers changed from: 0000 */
    public int a(boolean z) {
        Iterator it = this.g.iterator();
        int i = 0;
        while (it.hasNext()) {
            HashMap hashMap = (HashMap) it.next();
            int parseInt = Integer.parseInt((String) hashMap.get("start_time"));
            int parseInt2 = Integer.parseInt((String) hashMap.get("duration"));
            if (!z ? parseInt < 0 && i < parseInt2 : parseInt >= 0 && i < parseInt2) {
                i = parseInt2;
            }
        }
        return i;
    }

    /* access modifiers changed from: 0000 */
    public TimeInterpolator a(String str) {
        char c2;
        switch (str.hashCode()) {
            case -1539081405:
                if (str.equals("DecelerateInterpolator")) {
                    c2 = 5;
                    break;
                }
            case -1327597199:
                if (str.equals("AnticipateInterpolator")) {
                    c2 = 1;
                    break;
                }
            case -1275674606:
                if (str.equals("OvershootInterpolator")) {
                    c2 = 7;
                    break;
                }
            case -1163632952:
                if (str.equals("AnticipateOvershootInterpolator")) {
                    c2 = 2;
                    break;
                }
            case -142581660:
                if (str.equals("AccelerateInterpolator")) {
                    c2 = 0;
                    break;
                }
            case 593057964:
                if (str.equals("LinearInterpolator")) {
                    c2 = 6;
                    break;
                }
            case 1416217487:
                if (str.equals("BounceInterpolator")) {
                    c2 = 3;
                    break;
                }
            case 1682001069:
                if (str.equals("CycleInterpolator")) {
                    c2 = 4;
                    break;
                }
            default:
                c2 = 65535;
                break;
        }
        switch (c2) {
            case 0:
                return new AccelerateInterpolator();
            case 1:
                return new AnticipateInterpolator();
            case 2:
                return new AnticipateOvershootInterpolator();
            case 3:
                return new BounceInterpolator();
            case 4:
                return new CycleInterpolator(1.0f);
            case 5:
                return new DecelerateInterpolator();
            case 6:
                return new LinearInterpolator();
            case 7:
                return new OvershootInterpolator();
            default:
                return new AccelerateDecelerateInterpolator();
        }
    }

    /* access modifiers changed from: 0000 */
    public String a(int i, List<nexTitleInfo> list, String str) {
        for (nexTitleInfo nextitleinfo : list) {
            if (nextitleinfo.getId() == i) {
                return nextitleinfo.getFontID();
            }
        }
        return str;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:133:0x040a, code lost:
        if (r0 != null) goto L_0x0410;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:134:0x040c, code lost:
        r1 = r54;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:135:0x0410, code lost:
        r5 = r49;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:136:0x0418, code lost:
        if (r5.containsKey("rotate") == false) goto L_0x0429;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:137:0x041a, code lost:
        r0.setRotate(java.lang.Float.parseFloat((java.lang.String) r5.get("rotate")));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:139:0x042f, code lost:
        if (r5.containsKey("scale") == false) goto L_0x0463;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:140:0x0431, code lost:
        r1 = ((java.lang.String) r5.get("scale")).replace(" ", "").split(",");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:141:0x0447, code lost:
        if (r1 == null) goto L_0x0463;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:142:0x0449, code lost:
        r0.setScale(java.lang.Float.parseFloat(r1[0]), java.lang.Float.parseFloat(r1[1]), java.lang.Float.parseFloat(r1[2]));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:144:0x0466, code lost:
        r0.clearAnimate();
        r1 = (java.lang.String) r5.get("animation");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:145:0x0471, code lost:
        if (r13 == false) goto L_0x0483;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:147:0x0479, code lost:
        if (r5.containsKey("adjust_animation_non_sub") == false) goto L_0x0483;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:148:0x047b, code lost:
        r1 = (java.lang.String) r5.get("adjust_animation_non_sub");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:150:?, code lost:
        r9 = new org.json.JSONArray(r1);
        r10 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:152:0x048d, code lost:
        if (r10 >= r9.length()) goto L_0x066e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:153:0x048f, code lost:
        r1 = r9.getJSONObject(r10);
        r2 = r1.getString(com.nexstreaming.nexeditorsdk.nexExportFormat.TAG_FORMAT_TYPE);
        r11 = r1.getJSONArray("values");
        r1 = r2.hashCode();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:154:0x04a6, code lost:
        if (r1 == -925180581) goto L_0x04d6;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:156:0x04ab, code lost:
        if (r1 == 3357649) goto L_0x04cc;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:158:0x04b0, code lost:
        if (r1 == 92909918) goto L_0x04c2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:160:0x04b5, code lost:
        if (r1 == 109250890) goto L_0x04b8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:163:0x04be, code lost:
        if (r2.equals("scale") == false) goto L_0x04e0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:164:0x04c0, code lost:
        r1 = 2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:166:0x04c8, code lost:
        if (r2.equals("alpha") == false) goto L_0x04e0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:167:0x04ca, code lost:
        r1 = 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:169:0x04d2, code lost:
        if (r2.equals("move") == false) goto L_0x04e0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:170:0x04d4, code lost:
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:172:0x04dc, code lost:
        if (r2.equals("rotate") == false) goto L_0x04e0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:173:0x04de, code lost:
        r1 = 3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:174:0x04e0, code lost:
        r1 = 65535;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:175:0x04e1, code lost:
        switch(r1) {
            case 0: goto L_0x05e8;
            case 1: goto L_0x059c;
            case 2: goto L_0x053b;
            case 3: goto L_0x04e8;
            default: goto L_0x04e4;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:177:0x04e8, code lost:
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:179:0x04ed, code lost:
        if (r1 >= r11.length()) goto L_0x04e4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:180:0x04ef, code lost:
        r2 = r11.getJSONObject(r1);
        r3 = r7.a(r2.getString("motion_type"));
        r4 = java.lang.Integer.parseInt(r2.getString("start_time"));
        r5 = java.lang.Integer.parseInt(r2.getString("end_time"));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:181:0x051c, code lost:
        if (java.lang.Integer.parseInt(r2.getString("clockwise")) != 1) goto L_0x0520;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:182:0x051e, code lost:
        r6 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:183:0x0520, code lost:
        r6 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:184:0x0521, code lost:
        r0.addAnimate(com.nexstreaming.nexeditorsdk.nexAnimate.getRotate(r4, r5 - r4, r6, java.lang.Float.parseFloat(r2.getString("rotatedegree")), null).setInterpolator(r3));
        r1 = r1 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:185:0x053b, code lost:
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:187:0x0540, code lost:
        if (r1 >= r11.length()) goto L_0x04e4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:188:0x0542, code lost:
        r2 = r11.getJSONObject(r1);
        r3 = r7.a(r2.getString("motion_type"));
        r20 = java.lang.Integer.parseInt(r2.getString("start_time"));
        r0.addAnimate(com.nexstreaming.nexeditorsdk.nexAnimate.getScale(r20, java.lang.Integer.parseInt(r2.getString("end_time")) - r20, java.lang.Float.parseFloat(r2.getString("start_x")), java.lang.Float.parseFloat(r2.getString("start_y")), java.lang.Float.parseFloat(r2.getString("end_x")), java.lang.Float.parseFloat(r2.getString("end_y"))).setInterpolator(r3));
        r1 = r1 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:189:0x059c, code lost:
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:191:0x05a1, code lost:
        if (r1 >= r11.length()) goto L_0x04e4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:192:0x05a3, code lost:
        r2 = r11.getJSONObject(r1);
        r3 = r7.a(r2.getString("motion_type"));
        r4 = java.lang.Integer.parseInt(r2.getString("start_time"));
        r0.addAnimate(com.nexstreaming.nexeditorsdk.nexAnimate.getAlpha(r4, java.lang.Integer.parseInt(r2.getString("end_time")) - r4, java.lang.Float.parseFloat(r2.getString("start")), java.lang.Float.parseFloat(r2.getString("end"))).setInterpolator(r3));
        r1 = r1 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:193:0x05e8, code lost:
        r14 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:195:0x05ed, code lost:
        if (r14 >= r11.length()) goto L_0x04e4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:196:0x05ef, code lost:
        r1 = r11.getJSONObject(r14);
        r6 = r7.a(r1.getString("motion_type"));
        r5 = java.lang.Integer.parseInt(r1.getString("start_time"));
        r2 = java.lang.Integer.parseInt(r1.getString("end_time"));
        r3 = java.lang.Float.parseFloat(r1.getString("start_x"));
        r4 = java.lang.Float.parseFloat(r1.getString("end_x"));
        r12 = java.lang.Float.parseFloat(r1.getString("start_y"));
        r50 = r6;
        r6 = java.lang.Float.parseFloat(r1.getString("end_y"));
        r7 = r2 - r5;
        r8 = r5;
        r5 = r12;
        r12 = r50;
        r1 = new com.nexstreaming.nexeditorsdk.nexOverlayTitle.AnonymousClass1(r52);
        r0.addAnimate(com.nexstreaming.nexeditorsdk.nexAnimate.getMove(r8, r7, r1).setInterpolator(r12));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:197:0x0659, code lost:
        r14 = r14 + 1;
        r7 = r52;
        r8 = r55;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:198:0x0663, code lost:
        r10 = r10 + 1;
        r7 = r52;
        r8 = r55;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:199:0x066e, code lost:
        r0.setOverlayTitle(true);
        r1 = r54;
        r1.addOverlay(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:201:0x0689, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:202:0x068a, code lost:
        r0.printStackTrace();
        r1 = a;
        r2 = new java.lang.StringBuilder();
        r2.append("applyOverlayAsset failed");
        r2.append(r0.getMessage());
        android.util.Log.d(r1, r2.toString());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:203:0x06ab, code lost:
        return r0.getMessage();
     */
    /* JADX WARNING: Removed duplicated region for block: B:100:0x0348  */
    /* JADX WARNING: Removed duplicated region for block: B:106:0x035d  */
    /* JADX WARNING: Removed duplicated region for block: B:107:0x0360  */
    /* JADX WARNING: Removed duplicated region for block: B:112:0x036f  */
    /* JADX WARNING: Removed duplicated region for block: B:114:0x0382  */
    /* JADX WARNING: Removed duplicated region for block: B:119:0x0393  */
    /* JADX WARNING: Removed duplicated region for block: B:123:0x03a8  */
    /* JADX WARNING: Removed duplicated region for block: B:126:0x03e2  */
    /* JADX WARNING: Removed duplicated region for block: B:128:0x03f1  */
    /* JADX WARNING: Removed duplicated region for block: B:129:0x03f8  */
    /* JADX WARNING: Removed duplicated region for block: B:131:0x03fb  */
    /* JADX WARNING: Removed duplicated region for block: B:33:0x010c  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x011c  */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x012d  */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x0136  */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x01ed  */
    /* JADX WARNING: Removed duplicated region for block: B:98:0x0343  */
    public String a(Context context, nexProject nexproject, List<nexTitleInfo> list) {
        int i;
        int i2;
        String str;
        boolean z;
        Iterator it;
        Priority priority;
        int hashCode;
        char c2;
        HashMap hashMap;
        nexOverlayItem nexoverlayitem;
        String str2;
        Align align;
        int i3;
        String b2;
        String str3;
        int i4;
        boolean z2;
        Align align2;
        String str4;
        int i5;
        int parseInt;
        int parseInt2;
        nexOverlayTitle nexoverlaytitle = this;
        nexProject nexproject2 = nexproject;
        List<nexTitleInfo> list2 = list;
        nexoverlaytitle.a(nexproject2);
        Priority b3 = nexoverlaytitle.b(nexproject2);
        Iterator it2 = nexoverlaytitle.g.iterator();
        char c3 = 0;
        String str5 = null;
        boolean z3 = false;
        int i6 = 0;
        int i7 = 0;
        while (it2.hasNext()) {
            HashMap hashMap2 = (HashMap) it2.next();
            String str6 = (String) hashMap2.get(nexExportFormat.TAG_FORMAT_TYPE);
            if (str6.equals("title") && hashMap2.containsKey("group") && ((String) hashMap2.get("group")).endsWith("_1")) {
                if (str5 == null) {
                    str5 = (String) hashMap2.get("group");
                    z3 = nexoverlaytitle.a(list2, str5);
                    if (z3 && hashMap2.containsKey("adjust_pos_non_sub")) {
                        String[] split = ((String) hashMap2.get("adjust_pos_non_sub")).replace(" ", "").split(",");
                        parseInt = Integer.parseInt(split[c3]);
                        parseInt2 = Integer.parseInt(split[1]);
                    }
                } else if (!str5.equals(hashMap2.get("group"))) {
                    str5 = (String) hashMap2.get("group");
                    z3 = nexoverlaytitle.a(list2, str5);
                    if (!z3 || !hashMap2.containsKey("adjust_pos_non_sub")) {
                        str = str5;
                        z = z3;
                        i2 = 0;
                        i = 0;
                        if (!z || !hashMap2.containsKey("group") || !((String) hashMap2.get("group")).endsWith("_2")) {
                            hashCode = str6.hashCode();
                            if (hashCode == 100313435) {
                                if (str6.equals("image")) {
                                    c2 = 1;
                                    switch (c2) {
                                        case 0:
                                            break;
                                        case 1:
                                            break;
                                    }
                                }
                            } else if (hashCode == 110371416 && str6.equals("title")) {
                                c2 = 0;
                                switch (c2) {
                                    case 0:
                                        int parseInt3 = Integer.parseInt((String) hashMap2.get("id"));
                                        String str7 = (String) hashMap2.get("text");
                                        Integer.parseInt((String) hashMap2.get("text_max_len"));
                                        String[] split2 = ((String) hashMap2.get("position")).replace(" ", "").split(",");
                                        if (split2 != null) {
                                            int parseInt4 = Integer.parseInt(split2[c3]);
                                            int parseInt5 = Integer.parseInt(split2[1]);
                                            int parseInt6 = Integer.parseInt(split2[2]);
                                            int parseInt7 = Integer.parseInt(split2[3]);
                                            int i8 = (parseInt4 + parseInt6) / 2;
                                            int i9 = (parseInt5 + parseInt7) / 2;
                                            int i10 = parseInt6 - parseInt4;
                                            int i11 = parseInt7 - parseInt5;
                                            int parseInt8 = Integer.parseInt((String) hashMap2.get("start_time"));
                                            int parseInt9 = Integer.parseInt((String) hashMap2.get("duration"));
                                            if ((b3 == Priority.START && parseInt8 < 0) || (b3 == Priority.END && parseInt8 >= 0)) {
                                                String str8 = a;
                                                Object[] objArr = new Object[2];
                                                objArr[c3] = b3.name();
                                                objArr[1] = Integer.valueOf(parseInt8);
                                                Log.d(str8, String.format("Apply title skip(%s %d)", objArr));
                                                break;
                                            } else {
                                                String a2 = nexoverlaytitle.a(parseInt3, list2, (String) hashMap2.get("font"));
                                                int a3 = nexoverlaytitle.a(parseInt3, list2, Integer.parseInt((String) hashMap2.get("font_size")));
                                                int parseColor = Color.parseColor((String) hashMap2.get("text_color"));
                                                if (a3 > i11) {
                                                    a3 = i11 - 4;
                                                }
                                                boolean z4 = Integer.parseInt((String) hashMap2.get("shadow_visible")) == 1;
                                                int parseColor2 = Color.parseColor((String) hashMap2.get("shadow_color"));
                                                priority = b3;
                                                boolean z5 = Integer.parseInt((String) hashMap2.get("glow_visible")) == 1;
                                                int parseColor3 = Color.parseColor((String) hashMap2.get("glow_color"));
                                                it = it2;
                                                boolean z6 = Integer.parseInt((String) hashMap2.get("outline_visible")) == 1;
                                                int parseColor4 = Color.parseColor((String) hashMap2.get("outline_color"));
                                                String str9 = (String) hashMap2.get("align");
                                                if (z) {
                                                    str4 = str9;
                                                    if (hashMap2.containsKey("adjust_align_non_sub")) {
                                                        str2 = (String) hashMap2.get("adjust_align_non_sub");
                                                        Align align3 = Align.CENTER;
                                                        hashMap = hashMap2;
                                                        if (str2.contains("LEFT")) {
                                                            if (!str2.contains("RIGHT")) {
                                                                align = align3;
                                                                i3 = str2.contains("MIDDLE") ? 2 : str2.contains("BOTTOM") ? 3 : 1;
                                                                if (z) {
                                                                    b2 = nexoverlaytitle.a(str, list2);
                                                                    a3 = nexoverlaytitle.a(str, list2, a3);
                                                                    i8 += i2;
                                                                    i9 += i;
                                                                } else {
                                                                    b2 = nexoverlaytitle.b(parseInt3, list2, str7);
                                                                }
                                                                str3 = b2;
                                                                int i12 = i9;
                                                                int i13 = i8;
                                                                if (str3 != null && str3.length() > 0) {
                                                                    if (parseInt8 >= 0) {
                                                                        i4 = parseInt8;
                                                                    } else if (nexproject.getTotalTime() < parseInt9) {
                                                                        parseInt9 = nexproject.getTotalTime();
                                                                        i4 = 0;
                                                                    } else {
                                                                        i4 = nexproject.getTotalTime() - parseInt9;
                                                                    }
                                                                    q qVar = new q(context, str3, i10, i11, 1.0f);
                                                                    StringBuilder sb = new StringBuilder();
                                                                    sb.append("");
                                                                    sb.append(parseInt3);
                                                                    nexOverlayItem nexoverlayitem2 = new nexOverlayItem(new nexOverlayImage(sb.toString(), (runTimeMakeBitMap) qVar), i13, i12, i4, i4 + parseInt9);
                                                                    qVar.a((float) a3, parseColor, align, a2, i3);
                                                                    if (z4) {
                                                                        qVar.a(true, parseColor2, 5.0f, 3.0f, 3.0f);
                                                                    }
                                                                    if (z5) {
                                                                        z2 = true;
                                                                        qVar.b(true, parseColor3, 8.0f);
                                                                    } else {
                                                                        z2 = true;
                                                                    }
                                                                    if (z6) {
                                                                        qVar.a(z2, parseColor4, 1.0f);
                                                                    }
                                                                    qVar.a(nexoverlayitem2.getId());
                                                                    nexoverlayitem = nexoverlayitem2;
                                                                    break;
                                                                }
                                                            } else {
                                                                align2 = Align.RIGHT;
                                                            }
                                                        } else {
                                                            align2 = Align.LEFT;
                                                        }
                                                        align = align2;
                                                        if (str2.contains("MIDDLE")) {
                                                        }
                                                        if (z) {
                                                        }
                                                        str3 = b2;
                                                        int i122 = i9;
                                                        int i132 = i8;
                                                        if (parseInt8 >= 0) {
                                                        }
                                                        q qVar2 = new q(context, str3, i10, i11, 1.0f);
                                                        StringBuilder sb2 = new StringBuilder();
                                                        sb2.append("");
                                                        sb2.append(parseInt3);
                                                        nexOverlayItem nexoverlayitem22 = new nexOverlayItem(new nexOverlayImage(sb2.toString(), (runTimeMakeBitMap) qVar2), i132, i122, i4, i4 + parseInt9);
                                                        qVar2.a((float) a3, parseColor, align, a2, i3);
                                                        if (z4) {
                                                        }
                                                        if (z5) {
                                                        }
                                                        if (z6) {
                                                        }
                                                        qVar2.a(nexoverlayitem22.getId());
                                                        nexoverlayitem = nexoverlayitem22;
                                                    }
                                                } else {
                                                    str4 = str9;
                                                }
                                                str2 = str4;
                                                Align align32 = Align.CENTER;
                                                hashMap = hashMap2;
                                                if (str2.contains("LEFT")) {
                                                }
                                                align = align2;
                                                if (str2.contains("MIDDLE")) {
                                                }
                                                if (z) {
                                                }
                                                str3 = b2;
                                                int i1222 = i9;
                                                int i1322 = i8;
                                                if (parseInt8 >= 0) {
                                                }
                                                q qVar22 = new q(context, str3, i10, i11, 1.0f);
                                                StringBuilder sb22 = new StringBuilder();
                                                sb22.append("");
                                                sb22.append(parseInt3);
                                                nexOverlayItem nexoverlayitem222 = new nexOverlayItem(new nexOverlayImage(sb22.toString(), (runTimeMakeBitMap) qVar22), i1322, i1222, i4, i4 + parseInt9);
                                                qVar22.a((float) a3, parseColor, align, a2, i3);
                                                if (z4) {
                                                }
                                                if (z5) {
                                                }
                                                if (z6) {
                                                }
                                                qVar22.a(nexoverlayitem222.getId());
                                                nexoverlayitem = nexoverlayitem222;
                                            }
                                        } else {
                                            return "Wrong position data of title";
                                        }
                                        break;
                                    case 1:
                                        Integer.parseInt((String) hashMap2.get("id"));
                                        String[] split3 = ((String) hashMap2.get("position")).replace(" ", "").split(",");
                                        if (split3 != null) {
                                            int parseInt10 = (Integer.parseInt(split3[c3]) + Integer.parseInt(split3[2])) / 2;
                                            int parseInt11 = (Integer.parseInt(split3[1]) + Integer.parseInt(split3[3])) / 2;
                                            int parseInt12 = Integer.parseInt((String) hashMap2.get("start_time"));
                                            int parseInt13 = Integer.parseInt((String) hashMap2.get("duration"));
                                            if ((b3 == Priority.START && parseInt12 < 0) || (b3 == Priority.END && parseInt12 >= 0)) {
                                                String str10 = a;
                                                Object[] objArr2 = new Object[2];
                                                objArr2[c3] = b3.name();
                                                objArr2[1] = Integer.valueOf(parseInt12);
                                                Log.d(str10, String.format("Apply image res skip(%s %d)", objArr2));
                                                break;
                                            } else {
                                                if (parseInt12 < 0) {
                                                    if (nexproject.getTotalTime() < parseInt13) {
                                                        parseInt13 = nexproject.getTotalTime();
                                                        i5 = 0;
                                                        nexOverlayItem nexoverlayitem3 = new nexOverlayItem(nexoverlaytitle.b((String) hashMap2.get("image_res")), parseInt10, parseInt11, i5, i5 + parseInt13);
                                                        nexoverlayitem = nexoverlayitem3;
                                                        hashMap = hashMap2;
                                                        priority = b3;
                                                        it = it2;
                                                        break;
                                                    } else {
                                                        parseInt12 = nexproject.getTotalTime() - parseInt13;
                                                    }
                                                }
                                                i5 = parseInt12;
                                                nexOverlayItem nexoverlayitem32 = new nexOverlayItem(nexoverlaytitle.b((String) hashMap2.get("image_res")), parseInt10, parseInt11, i5, i5 + parseInt13);
                                                nexoverlayitem = nexoverlayitem32;
                                                hashMap = hashMap2;
                                                priority = b3;
                                                it = it2;
                                            }
                                        } else {
                                            return "Wrong position data of title";
                                        }
                                        break;
                                    default:
                                        hashMap = hashMap2;
                                        priority = b3;
                                        it = it2;
                                        nexoverlayitem = null;
                                        break;
                                }
                            }
                            c2 = 65535;
                            switch (c2) {
                                case 0:
                                    break;
                                case 1:
                                    break;
                            }
                        }
                        nexProject nexproject3 = nexproject2;
                        priority = b3;
                        it = it2;
                        nexproject2 = nexproject3;
                        z3 = z;
                        str5 = str;
                        i6 = i2;
                        i7 = i;
                        b3 = priority;
                        it2 = it;
                        nexoverlaytitle = this;
                        list2 = list;
                        c3 = 0;
                    } else {
                        String[] split4 = ((String) hashMap2.get("adjust_pos_non_sub")).replace(" ", "").split(",");
                        parseInt = Integer.parseInt(split4[c3]);
                        parseInt2 = Integer.parseInt(split4[1]);
                    }
                }
                str = str5;
                z = z3;
                i = parseInt2;
                i2 = parseInt;
                hashCode = str6.hashCode();
                if (hashCode == 100313435) {
                }
                c2 = 65535;
                switch (c2) {
                    case 0:
                        break;
                    case 1:
                        break;
                }
            }
            str = str5;
            z = z3;
            i2 = i6;
            i = i7;
            hashCode = str6.hashCode();
            if (hashCode == 100313435) {
            }
            c2 = 65535;
            switch (c2) {
                case 0:
                    break;
                case 1:
                    break;
            }
        }
        return null;
    }

    public String a(nexProject nexproject) {
        if (nexproject == null) {
            return "Null project";
        }
        ArrayList<Integer> arrayList = new ArrayList<>();
        for (nexOverlayItem nexoverlayitem : nexproject.getOverlayItems()) {
            if (nexoverlayitem.getOverlayTitle()) {
                arrayList.add(Integer.valueOf(nexoverlayitem.getId()));
            }
        }
        for (Integer intValue : arrayList) {
            nexproject.removeOverlay(intValue.intValue());
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public String a(String str, List<nexTitleInfo> list) {
        for (nexTitleInfo nextitleinfo : list) {
            if (nextitleinfo.getGroup().startsWith(str.substring(0, 1)) && nextitleinfo.getText() != null && nextitleinfo.getText().length() > 0) {
                return nextitleinfo.getText();
            }
        }
        return null;
    }

    public String a(JSONObject jSONObject, TitleInfoListener titleInfoListener) {
        if (!a(jSONObject)) {
            return "parseOverlayAssetInfo parse error";
        }
        try {
            JSONArray jSONArray = jSONObject.getJSONArray("overlay");
            for (int i = 0; i < jSONArray.length(); i++) {
                String b2 = b(jSONArray.getJSONObject(i), titleInfoListener);
                if (b2 != null) {
                    this.g.clear();
                    String str = a;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Overlay parse error : ");
                    sb.append(b2);
                    Log.d(str, sb.toString());
                    return b2;
                }
            }
            Log.d(a, "parseOverlayAsset end");
            return null;
        } catch (JSONException e2) {
            e2.printStackTrace();
            this.g.clear();
            String str2 = a;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("parseOverlayAsset failed");
            sb2.append(e2.getMessage());
            Log.d(str2, sb2.toString());
            return e2.getMessage();
        }
    }

    /* access modifiers changed from: 0000 */
    public boolean a(List<nexTitleInfo> list, String str) {
        boolean z = false;
        for (nexTitleInfo nextitleinfo : list) {
            if (nextitleinfo.getGroup().startsWith(str.substring(0, 1)) && (nextitleinfo.getText() == null || nextitleinfo.getText().length() <= 0)) {
                z = true;
            }
        }
        return z;
    }

    /* access modifiers changed from: 0000 */
    public Priority b(nexProject nexproject) {
        return nexproject.getTotalTime() >= a(true) + a(false) ? Priority.START_END : this.e.equals("start") ? Priority.START : Priority.END;
    }

    /* access modifiers changed from: 0000 */
    public String b(int i, List<nexTitleInfo> list, String str) {
        for (nexTitleInfo nextitleinfo : list) {
            if (nextitleinfo.getId() == i) {
                return nextitleinfo.getText();
            }
        }
        return str;
    }
}
