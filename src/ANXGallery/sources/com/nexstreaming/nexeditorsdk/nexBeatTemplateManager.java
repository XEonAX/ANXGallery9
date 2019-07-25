package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.Log;
import com.google.gson_nex.Gson;
import com.nexstreaming.kminternal.json.TemplateMetaData.EffectEntry;
import com.nexstreaming.kminternal.json.TemplateMetaData.Music;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.Asset;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.Category;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.Item;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.ItemMethodType;
import com.nexstreaming.nexeditorsdk.nexCrop.CropMode;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class nexBeatTemplateManager {
    private static final String TAG = "nexMusicTempMan";
    private static Context mAppContext;
    private static nexBeatTemplateManager sSingleton;
    private List<BeatTemplate> externalView_musicTemplates = null;
    private Object m_musicTemplateLock = new Object();
    private List<BeatTemplate> musicTemplates = new ArrayList();

    public static class BeatTemplate extends c {
        private String bgmId;
        private int internalSourceCount = -1;
        private int maxExtendCount = -1;
        private int maxRecommendCount;
        private int maxSourceCount;
        private boolean parsed = false;

        BeatTemplate(Item item) {
            super(item);
        }

        private void parseTemplate() {
            if (!this.parsed) {
                int i = 1;
                this.parsed = true;
                String AssetPackageTemplateJsonToString = nexTemplateComposer.AssetPackageTemplateJsonToString(id());
                if (AssetPackageTemplateJsonToString != null) {
                    Music music = (Music) new Gson().fromJson(AssetPackageTemplateJsonToString, Music.class);
                    if (music != null) {
                        this.bgmId = music.string_audio_id;
                        int i2 = -1;
                        Iterator it = music.list_effectEntries.iterator();
                        int i3 = 0;
                        int i4 = 0;
                        while (it.hasNext()) {
                            EffectEntry effectEntry = (EffectEntry) it.next();
                            i2++;
                            if (effectEntry.b_source_change || effectEntry.int_priority > 0) {
                                if (effectEntry.int_priority > 0) {
                                    i3++;
                                } else if (effectEntry.internal_clip_id != null) {
                                    i4++;
                                } else {
                                    i++;
                                }
                            }
                        }
                        this.maxSourceCount = i2;
                        this.maxRecommendCount = i;
                        this.maxExtendCount = i3;
                        this.internalSourceCount = i4;
                    }
                }
            }
        }

        public static BeatTemplate promote(c cVar) {
            if (cVar.category() != Category.beattemplate) {
                return null;
            }
            return new BeatTemplate(cVar);
        }

        public /* bridge */ /* synthetic */ Category category() {
            return super.category();
        }

        public String getBGMId() {
            parseTemplate();
            return this.bgmId;
        }

        public int getInternalSourceCount() {
            if (this.internalSourceCount == -1) {
                parseTemplate();
            }
            return this.internalSourceCount;
        }

        public int getMaxExtendCount() {
            if (this.maxExtendCount < 0) {
                parseTemplate();
            }
            return this.maxExtendCount;
        }

        public int getMaxRecommendCount() {
            if (this.maxRecommendCount == 0) {
                parseTemplate();
            }
            return this.maxRecommendCount;
        }

        public int getMaxSourceCount() {
            if (this.maxSourceCount == 0) {
                if (id().contains(".sc.")) {
                    String id = id();
                    String substring = id.substring(id.indexOf(".sc.") + 4, id.length());
                    if (substring != null && substring.length() > 0) {
                        this.maxSourceCount = Integer.parseInt(substring);
                        return this.maxSourceCount;
                    }
                } else {
                    parseTemplate();
                }
            }
            return this.maxSourceCount;
        }

        public /* bridge */ /* synthetic */ String[] getSupportedLocales() {
            return super.getSupportedLocales();
        }

        public /* bridge */ /* synthetic */ boolean hidden() {
            return super.hidden();
        }

        public /* bridge */ /* synthetic */ Bitmap icon() {
            return super.icon();
        }

        public /* bridge */ /* synthetic */ String id() {
            return super.id();
        }

        public /* bridge */ /* synthetic */ boolean isDelete() {
            return super.isDelete();
        }

        public /* bridge */ /* synthetic */ String name(String str) {
            return super.name(str);
        }

        public /* bridge */ /* synthetic */ Asset packageInfo() {
            return super.packageInfo();
        }

        public /* bridge */ /* synthetic */ Bitmap thumbnail() {
            return super.thumbnail();
        }

        public /* bridge */ /* synthetic */ ItemMethodType type() {
            return super.type();
        }

        public /* bridge */ /* synthetic */ boolean validate() {
            return super.validate();
        }
    }

    public enum Level {
        Recommend,
        Extends,
        Max
    }

    private static class a {
        public int a;
        public int b;
        public String c;
        public String d;
        public boolean e;
        public String f;
        public int g;
        public int h;

        private a() {
        }
    }

    private nexBeatTemplateManager(Context context) {
        mAppContext = context;
    }

    public static nexBeatTemplateManager getBeatTemplateManager(Context context) {
        if (sSingleton != null) {
            nexBeatTemplateManager nexbeattemplatemanager = sSingleton;
            if (!mAppContext.getPackageName().equals(context.getPackageName())) {
                sSingleton = null;
            }
        }
        if (sSingleton == null) {
            sSingleton = new nexBeatTemplateManager(context);
        }
        return sSingleton;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:145:0x04bc, code lost:
        if (r3 >= r6.length) goto L_0x04be;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:147:0x04c0, code lost:
        r11 = r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:153:0x04dc, code lost:
        if (r3 >= r6.length) goto L_0x04be;
     */
    /* JADX WARNING: Removed duplicated region for block: B:101:0x0300 A[LOOP:3: B:99:0x02fa->B:101:0x0300, LOOP_END] */
    /* JADX WARNING: Removed duplicated region for block: B:104:0x0373  */
    /* JADX WARNING: Removed duplicated region for block: B:167:0x0535  */
    /* JADX WARNING: Removed duplicated region for block: B:203:0x0547 A[EDGE_INSN: B:203:0x0547->B:169:0x0547 ?: BREAK  , SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:55:0x00f9  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x015b  */
    /* JADX WARNING: Removed duplicated region for block: B:77:0x01cc  */
    static boolean internalApplyTemplateToProjectById(nexProject nexproject, String str) {
        int i;
        int i2;
        Iterator it;
        int size;
        int i3;
        Iterator it2;
        int size2;
        int i4;
        Music music;
        int i5;
        int i6;
        int i7;
        nexProject nexproject2 = nexproject;
        String AssetPackageTemplateJsonToString = nexTemplateComposer.AssetPackageTemplateJsonToString(str);
        Level level = Level.Max;
        if (AssetPackageTemplateJsonToString == null) {
            return false;
        }
        Music music2 = (Music) new Gson().fromJson(AssetPackageTemplateJsonToString, Music.class);
        Iterator it3 = music2.list_effectEntries.iterator();
        boolean z = true;
        int i8 = 0;
        int i9 = 1;
        int i10 = 10800000;
        int i11 = 0;
        int i12 = -1;
        int i13 = 0;
        while (it3.hasNext()) {
            EffectEntry effectEntry = (EffectEntry) it3.next();
            if (i8 > 0 && i10 > effectEntry.int_time - i8) {
                i10 = effectEntry.int_time - i8;
            }
            i8 = effectEntry.int_time;
            i12++;
            if (effectEntry.b_source_change || effectEntry.int_priority > 0) {
                if (music2.default_effect != null) {
                    if (effectEntry.color_filter_id == null) {
                        effectEntry.color_filter_id = music2.default_effect.sc_color_effect_id;
                    }
                    if (effectEntry.clip_effect_id == null) {
                        effectEntry.clip_effect_id = music2.default_effect.sc_clip_effect_id;
                    }
                }
                if (effectEntry.int_priority > 0) {
                    i11++;
                } else if (effectEntry.internal_clip_id != null) {
                    i13++;
                } else {
                    i9++;
                }
            } else {
                if (music2.default_effect != null) {
                    if (effectEntry.color_filter_id == null) {
                        effectEntry.color_filter_id = music2.default_effect.color_filter_id;
                    }
                    if (effectEntry.clip_effect_id == null) {
                        effectEntry.clip_effect_id = music2.default_effect.clip_effect_id;
                    }
                }
                if (effectEntry.clip_effect_id != null) {
                    if (effectEntry.int_effect_in_duration == -1) {
                        effectEntry.int_effect_in_duration = 50;
                    }
                    if (effectEntry.int_effect_out_duration == -1) {
                        effectEntry.int_effect_out_duration = 50;
                    }
                }
            }
        }
        ((EffectEntry) music2.list_effectEntries.get(0)).int_effect_in_duration = 0;
        ((EffectEntry) music2.list_effectEntries.get(0)).int_effect_out_duration = 0;
        AnonymousClass1 r5 = null;
        ((EffectEntry) music2.list_effectEntries.get(0)).clip_effect_id = null;
        ((EffectEntry) music2.list_effectEntries.get(music2.list_effectEntries.size() - 1)).int_effect_in_duration = 0;
        ((EffectEntry) music2.list_effectEntries.get(music2.list_effectEntries.size() - 1)).int_effect_out_duration = 0;
        int totalClipCount = nexproject2.getTotalClipCount(true);
        if (totalClipCount > i9) {
            i2 = totalClipCount - i9;
            if (i2 > i11) {
                i = i2 - i11;
                i2 = i11;
                if (level != Level.Extends) {
                    if (level == Level.Recommend) {
                        i2 = 0;
                    }
                    String str2 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("sourceClipCount=");
                    sb.append(totalClipCount);
                    sb.append(", recommend=");
                    sb.append(i9);
                    sb.append(", extends=");
                    sb.append(i11);
                    sb.append(" ,max=");
                    sb.append(i12);
                    sb.append(", priorityLevel=");
                    sb.append(i2);
                    sb.append(", eventLevel=");
                    sb.append(i);
                    sb.append(", internal=");
                    sb.append(i13);
                    Log.d(str2, sb.toString());
                    ArrayList arrayList = new ArrayList();
                    ArrayList arrayList2 = new ArrayList();
                    it = music2.list_effectEntries.iterator();
                    while (it.hasNext()) {
                        EffectEntry effectEntry2 = (EffectEntry) it.next();
                        if (effectEntry2.int_priority > 0) {
                            if (effectEntry2.int_priority <= i2) {
                                effectEntry2.b_source_change = true;
                                String str3 = TAG;
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("t=");
                                sb2.append(effectEntry2.int_time);
                                sb2.append(", priority=");
                                sb2.append(effectEntry2.int_priority);
                                Log.d(str3, sb2.toString());
                            }
                        }
                        if (!effectEntry2.b_source_change && i > 0 && effectEntry2.internal_clip_id == null && effectEntry2.int_time > 0) {
                            effectEntry2.b_source_change = true;
                            i--;
                            String str4 = TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("t=");
                            sb3.append(effectEntry2.int_time);
                            sb3.append(", event=");
                            sb3.append(i);
                            Log.d(str4, sb3.toString());
                        }
                        arrayList2.add(effectEntry2);
                    }
                    size = arrayList2.size() - 1;
                    i3 = 0;
                    int i14 = 0;
                    while (i3 < size) {
                        a aVar = new a();
                        aVar.a = i14;
                        aVar.c = ((EffectEntry) arrayList2.get(i3)).color_filter_id;
                        aVar.f = ((EffectEntry) arrayList2.get(i3)).internal_clip_id;
                        int i15 = i3 + 1;
                        if (((EffectEntry) arrayList2.get(i15)).b_source_change) {
                            aVar.b = ((EffectEntry) arrayList2.get(i15)).int_time;
                        } else {
                            aVar.b = ((EffectEntry) arrayList2.get(i15)).int_time - ((EffectEntry) arrayList2.get(i15)).int_effect_in_duration;
                        }
                        int i16 = aVar.b;
                        int i17 = aVar.b - aVar.a;
                        if (i17 < 100) {
                            String str5 = TAG;
                            StringBuilder sb4 = new StringBuilder();
                            sb4.append("W[");
                            sb4.append(i3);
                            sb4.append("](");
                            sb4.append(aVar.a);
                            sb4.append(") lower duration (");
                            sb4.append(i17);
                            sb4.append(")");
                            Log.w(str5, sb4.toString());
                        }
                        if (((EffectEntry) arrayList2.get(i3)).b_source_change) {
                            aVar.e = true;
                        } else {
                            aVar.d = ((EffectEntry) arrayList2.get(i3)).clip_effect_id;
                            aVar.g = 0;
                            aVar.h = ((EffectEntry) arrayList2.get(i3)).int_effect_in_duration + ((EffectEntry) arrayList2.get(i3)).int_effect_out_duration;
                            if (aVar.h < 100 && i3 != 0) {
                                String str6 = TAG;
                                StringBuilder sb5 = new StringBuilder();
                                sb5.append("W[");
                                sb5.append(i3);
                                sb5.append("](");
                                sb5.append(aVar.a);
                                sb5.append(") lower effect duration (");
                                sb5.append(aVar.h);
                                sb5.append(")");
                                Log.w(str6, sb5.toString());
                            }
                            if (i17 < aVar.h) {
                                String str7 = TAG;
                                StringBuilder sb6 = new StringBuilder();
                                sb6.append("W[");
                                sb6.append(i3);
                                sb6.append("](");
                                sb6.append(aVar.a);
                                sb6.append(") higher effect duration (");
                                sb6.append(i17);
                                sb6.append(" < ");
                                sb6.append(aVar.h);
                                sb6.append(")");
                                Log.w(str7, sb6.toString());
                                aVar.h = i17;
                            }
                        }
                        if (aVar.a < aVar.b) {
                            arrayList.add(aVar);
                        }
                        i3 = i15;
                        i14 = i16;
                        r5 = null;
                    }
                    it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        a aVar2 = (a) it2.next();
                        String str8 = TAG;
                        StringBuilder sb7 = new StringBuilder();
                        sb7.append("st=");
                        sb7.append(aVar2.a);
                        sb7.append(",et=");
                        sb7.append(aVar2.b);
                        sb7.append(",sc=");
                        sb7.append(aVar2.e);
                        sb7.append(",ei=");
                        sb7.append(aVar2.d);
                        sb7.append(", cf=");
                        sb7.append(aVar2.c);
                        sb7.append(", et=");
                        sb7.append(aVar2.h);
                        sb7.append(", is=");
                        sb7.append(aVar2.f);
                        Log.d(str8, sb7.toString());
                    }
                    nexProject clone = nexProject.clone(nexproject);
                    nexproject2.allClear(true);
                    int totalClipCount2 = clone.getTotalClipCount(true);
                    nexColorEffect[] internalPresetList = nexColorEffect.getInternalPresetList();
                    size2 = arrayList.size();
                    i4 = 0;
                    int i18 = 0;
                    int i19 = 0;
                    while (i4 < size2) {
                        a aVar3 = (a) arrayList.get(i4);
                        if (aVar3.e && aVar3.f == null) {
                            i18++;
                            if (i18 >= totalClipCount2) {
                                i18 = 0;
                            }
                        }
                        if (aVar3.f != null) {
                            String str9 = aVar3.f;
                            StringBuilder sb8 = new StringBuilder();
                            sb8.append("@assetItem:");
                            sb8.append(aVar3.f);
                            nexproject2.add(new nexClip(str9, sb8.toString()));
                            nexproject.getLastPrimaryClip().setAssetResource(z);
                        } else {
                            nexproject2.add(nexClip.dup(clone.getClip(i18, z)));
                            nexproject.getLastPrimaryClip().setRotateDegree(clone.getClip(i18, z).getRotateDegree());
                        }
                        if (nexproject.getLastPrimaryClip().getClipType() == z) {
                            nexproject.getLastPrimaryClip().setImageClipDuration(aVar3.b - aVar3.a);
                            nexproject.getLastPrimaryClip().getCrop().randomizeStartEndPosition(false, CropMode.FILL);
                            if (aVar3.c != null) {
                                if (aVar3.c.compareToIgnoreCase("rand") != 0) {
                                    Iterator it4 = nexColorEffect.getPresetList().iterator();
                                    while (true) {
                                        if (!it4.hasNext()) {
                                            break;
                                        }
                                        nexColorEffect nexcoloreffect = (nexColorEffect) it4.next();
                                        if (nexcoloreffect.getPresetName().compareToIgnoreCase(aVar3.c) == 0) {
                                            nexproject.getLastPrimaryClip().setColorEffect(nexcoloreffect);
                                            break;
                                        }
                                    }
                                } else {
                                    nexproject.getLastPrimaryClip().setColorEffect(internalPresetList[i19]);
                                    i7 = i19 + 1;
                                    if (i7 >= internalPresetList.length) {
                                        i7 = 0;
                                    }
                                    if (!(aVar3.d == null || aVar3.d.compareToIgnoreCase("none") == 0)) {
                                        nexproject.getLastPrimaryClip().getClipEffect().setEffect(aVar3.d);
                                        nexproject.getLastPrimaryClip().getClipEffect().setEffectShowTime(aVar3.g, aVar3.h);
                                    }
                                    music = music2;
                                    i19 = i7;
                                }
                            }
                            i7 = i19;
                            nexproject.getLastPrimaryClip().getClipEffect().setEffect(aVar3.d);
                            nexproject.getLastPrimaryClip().getClipEffect().setEffectShowTime(aVar3.g, aVar3.h);
                            music = music2;
                            i19 = i7;
                        } else {
                            if (nexproject.getLastPrimaryClip().getClipType() == 4) {
                                int startTrimTime = clone.getClip(i18, z).getVideoClipEdit().getStartTrimTime();
                                int endTrimTime = clone.getClip(i18, z).getVideoClipEdit().getEndTrimTime();
                                int i20 = aVar3.b - aVar3.a;
                                if (startTrimTime + i20 <= endTrimTime) {
                                    i5 = i4;
                                    boolean z2 = false;
                                    while (true) {
                                        int i21 = i20 + startTrimTime;
                                        nexproject.getLastPrimaryClip().getVideoClipEdit().setTrim(startTrimTime, i21);
                                        music = music2;
                                        nexproject.getLastPrimaryClip().getCrop().randomizeStartEndPosition(false, CropMode.FILL);
                                        if (z2) {
                                            nexproject.getLastPrimaryClip().setColorEffect(internalPresetList[i19]);
                                            i6 = i19 + 1;
                                        } else {
                                            if (aVar3.c != null) {
                                                if (aVar3.c.compareToIgnoreCase("rand") != 0) {
                                                    Iterator it5 = nexColorEffect.getPresetList().iterator();
                                                    while (true) {
                                                        if (!it5.hasNext()) {
                                                            break;
                                                        }
                                                        nexColorEffect nexcoloreffect2 = (nexColorEffect) it5.next();
                                                        if (nexcoloreffect2.getPresetName().compareToIgnoreCase(aVar3.c) == 0) {
                                                            nexproject.getLastPrimaryClip().setColorEffect(nexcoloreffect2);
                                                            break;
                                                        }
                                                    }
                                                } else {
                                                    nexproject.getLastPrimaryClip().setColorEffect(internalPresetList[i19]);
                                                    i6 = i19 + 1;
                                                }
                                            }
                                            if (!(aVar3.d == null || aVar3.d.compareToIgnoreCase("none") == 0)) {
                                                nexproject.getLastPrimaryClip().getClipEffect().setEffect(aVar3.d);
                                                nexproject.getLastPrimaryClip().getClipEffect().setEffectShowTime(aVar3.g, aVar3.h);
                                            }
                                            i5++;
                                            if (i5 < size2) {
                                                break;
                                            }
                                            z2 = aVar3.e;
                                            aVar3 = (a) arrayList.get(i5);
                                            int i22 = aVar3.b - aVar3.a;
                                            if (i21 + i22 > endTrimTime) {
                                                break;
                                            }
                                            nexproject2.add(nexClip.dup(clone.getClip(i18, true)));
                                            nexproject.getLastPrimaryClip().setRotateDegree(clone.getClip(i18, true).getRotateDegree());
                                            startTrimTime = i21;
                                            i20 = i22;
                                            music2 = music;
                                        }
                                        i19 = 0;
                                        nexproject.getLastPrimaryClip().getClipEffect().setEffect(aVar3.d);
                                        nexproject.getLastPrimaryClip().getClipEffect().setEffectShowTime(aVar3.g, aVar3.h);
                                        i5++;
                                        if (i5 < size2) {
                                        }
                                    }
                                    i18++;
                                    if (i18 >= totalClipCount2) {
                                        i18 = 0;
                                        i4 = i5 + 1;
                                        music2 = music;
                                        z = true;
                                    }
                                    i4 = i5 + 1;
                                    music2 = music;
                                    z = true;
                                }
                            }
                            music = music2;
                        }
                        i5 = i4;
                        i4 = i5 + 1;
                        music2 = music;
                        z = true;
                    }
                    nexproject2.setBackgroundMusicPath(music2.string_audio_id);
                    nexproject2.setProjectAudioFadeInTime(0);
                    nexproject2.setProjectAudioFadeOutTime(0);
                    return true;
                }
                i = 0;
                String str22 = TAG;
                StringBuilder sb9 = new StringBuilder();
                sb9.append("sourceClipCount=");
                sb9.append(totalClipCount);
                sb9.append(", recommend=");
                sb9.append(i9);
                sb9.append(", extends=");
                sb9.append(i11);
                sb9.append(" ,max=");
                sb9.append(i12);
                sb9.append(", priorityLevel=");
                sb9.append(i2);
                sb9.append(", eventLevel=");
                sb9.append(i);
                sb9.append(", internal=");
                sb9.append(i13);
                Log.d(str22, sb9.toString());
                ArrayList arrayList3 = new ArrayList();
                ArrayList arrayList22 = new ArrayList();
                it = music2.list_effectEntries.iterator();
                while (it.hasNext()) {
                }
                size = arrayList22.size() - 1;
                i3 = 0;
                int i142 = 0;
                while (i3 < size) {
                }
                it2 = arrayList3.iterator();
                while (it2.hasNext()) {
                }
                nexProject clone2 = nexProject.clone(nexproject);
                nexproject2.allClear(true);
                int totalClipCount22 = clone2.getTotalClipCount(true);
                nexColorEffect[] internalPresetList2 = nexColorEffect.getInternalPresetList();
                size2 = arrayList3.size();
                i4 = 0;
                int i182 = 0;
                int i192 = 0;
                while (i4 < size2) {
                }
                nexproject2.setBackgroundMusicPath(music2.string_audio_id);
                nexproject2.setProjectAudioFadeInTime(0);
                nexproject2.setProjectAudioFadeOutTime(0);
                return true;
            }
        } else {
            i2 = 0;
        }
        i = 0;
        if (level != Level.Extends) {
        }
        i = 0;
        String str222 = TAG;
        StringBuilder sb92 = new StringBuilder();
        sb92.append("sourceClipCount=");
        sb92.append(totalClipCount);
        sb92.append(", recommend=");
        sb92.append(i9);
        sb92.append(", extends=");
        sb92.append(i11);
        sb92.append(" ,max=");
        sb92.append(i12);
        sb92.append(", priorityLevel=");
        sb92.append(i2);
        sb92.append(", eventLevel=");
        sb92.append(i);
        sb92.append(", internal=");
        sb92.append(i13);
        Log.d(str222, sb92.toString());
        ArrayList arrayList32 = new ArrayList();
        ArrayList arrayList222 = new ArrayList();
        it = music2.list_effectEntries.iterator();
        while (it.hasNext()) {
        }
        size = arrayList222.size() - 1;
        i3 = 0;
        int i1422 = 0;
        while (i3 < size) {
        }
        it2 = arrayList32.iterator();
        while (it2.hasNext()) {
        }
        nexProject clone22 = nexProject.clone(nexproject);
        nexproject2.allClear(true);
        int totalClipCount222 = clone22.getTotalClipCount(true);
        nexColorEffect[] internalPresetList22 = nexColorEffect.getInternalPresetList();
        size2 = arrayList32.size();
        i4 = 0;
        int i1822 = 0;
        int i1922 = 0;
        while (i4 < size2) {
        }
        nexproject2.setBackgroundMusicPath(music2.string_audio_id);
        nexproject2.setProjectAudioFadeInTime(0);
        nexproject2.setProjectAudioFadeOutTime(0);
        return true;
    }

    private void resolve(boolean z) {
        synchronized (this.m_musicTemplateLock) {
            this.musicTemplates.clear();
            for (Item item : nexAssetPackageManager.getAssetPackageManager(mAppContext).getInstalledAssetItems(Category.beattemplate)) {
                if (!item.hidden()) {
                    if (z) {
                        nexAssetPackageManager.getAssetPackageManager(mAppContext);
                        if (nexAssetPackageManager.checkExpireAsset(item.packageInfo())) {
                        }
                    }
                    this.musicTemplates.add(new BeatTemplate(item));
                }
            }
        }
    }

    public boolean applyTemplateToProjectById(nexProject nexproject, String str) {
        BeatTemplate beatTemplate = getBeatTemplate(str);
        if (beatTemplate != null && !nexAssetPackageManager.checkExpireAsset(beatTemplate.packageInfo())) {
            return internalApplyTemplateToProjectById(nexproject, str);
        }
        return false;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:125:0x03fd, code lost:
        if (r3 >= r6.length) goto L_0x03ff;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:127:0x0401, code lost:
        r11 = r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:133:0x041d, code lost:
        if (r3 >= r6.length) goto L_0x03ff;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:160:0x04a2, code lost:
        if (r10 < r5) goto L_0x04a5;
     */
    /* JADX WARNING: Removed duplicated region for block: B:147:0x0467  */
    /* JADX WARNING: Removed duplicated region for block: B:176:0x024a A[EDGE_INSN: B:176:0x024a->B:85:0x024a ?: BREAK  
EDGE_INSN: B:176:0x024a->B:85:0x024a ?: BREAK  
EDGE_INSN: B:176:0x024a->B:85:0x024a ?: BREAK  , SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:176:0x024a A[EDGE_INSN: B:176:0x024a->B:85:0x024a ?: BREAK  
EDGE_INSN: B:176:0x024a->B:85:0x024a ?: BREAK  , SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:186:0x0479 A[EDGE_INSN: B:186:0x0479->B:149:0x0479 ?: BREAK  , SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x00c3  */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x0121  */
    /* JADX WARNING: Removed duplicated region for block: B:88:0x029a A[LOOP:2: B:86:0x0294->B:88:0x029a, LOOP_END] */
    /* JADX WARNING: Removed duplicated region for block: B:91:0x02f9  */
    public boolean applyTemplateToProjectById2(nexProject nexproject, String str) {
        int i;
        int i2;
        int size;
        int i3;
        int i4;
        Iterator it;
        int size2;
        int i5;
        Music music;
        int i6;
        int i7;
        nexProject nexproject2 = nexproject;
        String AssetPackageTemplateJsonToString = nexTemplateComposer.AssetPackageTemplateJsonToString(str);
        Level level = Level.Max;
        boolean z = false;
        if (AssetPackageTemplateJsonToString == null) {
            return false;
        }
        Music music2 = (Music) new Gson().fromJson(AssetPackageTemplateJsonToString, Music.class);
        Iterator it2 = music2.list_effectEntries.iterator();
        boolean z2 = true;
        int i8 = 0;
        int i9 = 1;
        int i10 = 10800000;
        int i11 = 0;
        int i12 = -1;
        int i13 = 0;
        while (it2.hasNext()) {
            EffectEntry effectEntry = (EffectEntry) it2.next();
            if (i8 > 0 && i10 > effectEntry.int_time - i8) {
                i10 = effectEntry.int_time - i8;
            }
            i8 = effectEntry.int_time;
            i12++;
            if (effectEntry.b_source_change || effectEntry.int_priority > 0) {
                if (music2.default_effect != null) {
                    if (effectEntry.color_filter_id == null) {
                        effectEntry.color_filter_id = music2.default_effect.sc_color_effect_id;
                    }
                    if (effectEntry.clip_effect_id == null) {
                        effectEntry.clip_effect_id = music2.default_effect.sc_clip_effect_id;
                    }
                }
                if (effectEntry.int_priority > 0) {
                    i11++;
                } else if (effectEntry.internal_clip_id != null) {
                    i13++;
                } else {
                    i9++;
                }
            } else {
                if (music2.default_effect != null) {
                    if (effectEntry.color_filter_id == null) {
                        effectEntry.color_filter_id = music2.default_effect.color_filter_id;
                    }
                    if (effectEntry.clip_effect_id == null) {
                        effectEntry.clip_effect_id = music2.default_effect.clip_effect_id;
                    }
                }
                if (!(effectEntry.clip_effect_id == null || effectEntry.clip_effect_id.compareToIgnoreCase("none") == 0)) {
                    if (effectEntry.int_effect_in_duration == 0) {
                        effectEntry.int_effect_in_duration = 50;
                    }
                    if (effectEntry.int_effect_out_duration == 0) {
                        effectEntry.int_effect_out_duration = 50;
                    }
                }
            }
        }
        int totalClipCount = nexproject2.getTotalClipCount(true);
        if (totalClipCount > i9) {
            i2 = totalClipCount - i9;
            if (i2 > i11) {
                i = i2 - i11;
                i2 = i11;
                if (level != Level.Extends) {
                    if (level == Level.Recommend) {
                        i2 = 0;
                    }
                    String str2 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("sourceClipCount=");
                    sb.append(totalClipCount);
                    sb.append(", recommend=");
                    sb.append(i9);
                    sb.append(", extends=");
                    sb.append(i11);
                    sb.append(" ,max=");
                    sb.append(i12);
                    sb.append(", priorityLevel=");
                    sb.append(i2);
                    sb.append(", eventLevel=");
                    sb.append(i);
                    sb.append(", internal=");
                    sb.append(i13);
                    Log.d(str2, sb.toString());
                    size = music2.list_effectEntries.size();
                    ArrayList arrayList = new ArrayList();
                    i3 = 1;
                    int i14 = 0;
                    while (true) {
                        i4 = size - 1;
                        if (i3 >= i4) {
                            break;
                        }
                        a aVar = new a();
                        aVar.e = ((EffectEntry) music2.list_effectEntries.get(i3)).b_source_change;
                        if (((EffectEntry) music2.list_effectEntries.get(i3)).int_priority > 0) {
                            if (i2 == 0) {
                                i3++;
                            } else if (((EffectEntry) music2.list_effectEntries.get(i3)).int_priority <= i2) {
                                aVar.e = true;
                                String str3 = TAG;
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("num=");
                                sb2.append(i3);
                                sb2.append(", priority=");
                                sb2.append(((EffectEntry) music2.list_effectEntries.get(i3)).int_priority);
                                Log.d(str3, sb2.toString());
                            }
                        }
                        if (!aVar.e && i > 0 && aVar.f == null) {
                            aVar.e = true;
                            i--;
                            String str4 = TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("num=");
                            sb3.append(i3);
                            sb3.append(", event=");
                            sb3.append(i);
                            Log.d(str4, sb3.toString());
                        }
                        aVar.d = ((EffectEntry) music2.list_effectEntries.get(i3)).clip_effect_id;
                        aVar.c = ((EffectEntry) music2.list_effectEntries.get(i3)).color_filter_id;
                        aVar.f = ((EffectEntry) music2.list_effectEntries.get(i3)).internal_clip_id;
                        if (!aVar.e) {
                            a aVar2 = new a();
                            aVar2.a = i14;
                            aVar2.d = "none";
                            aVar2.c = "none";
                            aVar2.f = aVar.f;
                            aVar.a = ((EffectEntry) music2.list_effectEntries.get(i3)).int_time - ((EffectEntry) music2.list_effectEntries.get(i3)).int_effect_in_duration;
                            aVar.d = ((EffectEntry) music2.list_effectEntries.get(i3)).clip_effect_id;
                            aVar2.b = aVar.a;
                            aVar.b = aVar.a + ((EffectEntry) music2.list_effectEntries.get(i3)).int_effect_in_duration + ((EffectEntry) music2.list_effectEntries.get(i3)).int_effect_out_duration;
                            i14 = aVar.b;
                            if (aVar2.a < aVar2.b) {
                                arrayList.add(aVar2);
                            }
                        } else {
                            aVar.a = i14;
                            aVar.b = ((EffectEntry) music2.list_effectEntries.get(i3)).int_time;
                            if (aVar.a >= aVar.b) {
                                i3++;
                            } else {
                                i14 = aVar.b;
                            }
                        }
                        arrayList.add(aVar);
                        i3++;
                    }
                    a aVar3 = new a();
                    aVar3.e = false;
                    aVar3.a = i14;
                    aVar3.b = ((EffectEntry) music2.list_effectEntries.get(i4)).int_time;
                    aVar3.d = ((EffectEntry) music2.list_effectEntries.get(i4)).clip_effect_id;
                    aVar3.c = ((EffectEntry) music2.list_effectEntries.get(i4)).color_filter_id;
                    arrayList.add(aVar3);
                    String str5 = TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("s= ,gap duration=");
                    sb4.append(i10);
                    Log.d(str5, sb4.toString());
                    it = arrayList.iterator();
                    while (it.hasNext()) {
                        a aVar4 = (a) it.next();
                        String str6 = TAG;
                        StringBuilder sb5 = new StringBuilder();
                        sb5.append("s=");
                        sb5.append(aVar4.a);
                        sb5.append(",e=");
                        sb5.append(aVar4.b);
                        sb5.append(",c=");
                        sb5.append(aVar4.e);
                        sb5.append(",ee=");
                        sb5.append(aVar4.d);
                        sb5.append(", sc=");
                        sb5.append(aVar4.f);
                        Log.d(str6, sb5.toString());
                    }
                    nexProject clone = nexProject.clone(nexproject);
                    nexproject2.allClear(true);
                    int totalClipCount2 = clone.getTotalClipCount(true);
                    nexColorEffect[] internalPresetList = nexColorEffect.getInternalPresetList();
                    size2 = arrayList.size();
                    i5 = 0;
                    int i15 = 0;
                    int i16 = 0;
                    while (i5 < size2) {
                        a aVar5 = (a) arrayList.get(i5);
                        if (aVar5.f != null) {
                            nexproject2.add(new nexClip(aVar5.f));
                        } else {
                            nexproject2.add(nexClip.dup(clone.getClip(i15, z2)));
                        }
                        if (nexproject.getLastPrimaryClip().getClipType() == z2) {
                            nexproject.getLastPrimaryClip().setImageClipDuration(aVar5.b - aVar5.a);
                            nexproject.getLastPrimaryClip().getCrop().randomizeStartEndPosition(z, CropMode.FILL);
                            if (aVar5.c != null) {
                                if (aVar5.c.compareToIgnoreCase("rand") != 0) {
                                    Iterator it3 = nexColorEffect.getPresetList().iterator();
                                    while (true) {
                                        if (!it3.hasNext()) {
                                            break;
                                        }
                                        nexColorEffect nexcoloreffect = (nexColorEffect) it3.next();
                                        if (nexcoloreffect.getPresetName().compareToIgnoreCase(aVar5.c) == 0) {
                                            nexproject.getLastPrimaryClip().setColorEffect(nexcoloreffect);
                                            break;
                                        }
                                    }
                                } else {
                                    nexproject.getLastPrimaryClip().setColorEffect(internalPresetList[i16]);
                                    i16++;
                                    if (i16 >= internalPresetList.length) {
                                        i16 = 0;
                                    }
                                }
                            }
                            if (!(aVar5.d == null || aVar5.d.compareToIgnoreCase("none") == 0)) {
                                nexproject.getLastPrimaryClip().getClipEffect().setEffect(aVar5.d);
                            }
                            music = music2;
                            if (aVar5.e && aVar5.f == null) {
                                i15++;
                            }
                            i6 = 1;
                            i5 += i6;
                            music2 = music;
                            z = false;
                            z2 = true;
                        } else {
                            if (nexproject.getLastPrimaryClip().getClipType() == 4) {
                                int startTrimTime = clone.getClip(i15, z2).getVideoClipEdit().getStartTrimTime();
                                int endTrimTime = clone.getClip(i15, z2).getVideoClipEdit().getEndTrimTime();
                                int i17 = aVar5.b - aVar5.a;
                                if (startTrimTime + i17 > endTrimTime) {
                                    music = music2;
                                } else {
                                    int i18 = i5;
                                    boolean z3 = false;
                                    while (true) {
                                        int i19 = i17 + startTrimTime;
                                        nexproject.getLastPrimaryClip().getVideoClipEdit().setTrim(startTrimTime, i19);
                                        music = music2;
                                        nexproject.getLastPrimaryClip().getCrop().randomizeStartEndPosition(false, CropMode.FILL);
                                        if (z3) {
                                            nexproject.getLastPrimaryClip().setColorEffect(internalPresetList[i16]);
                                            i7 = i16 + 1;
                                        } else {
                                            if (aVar5.c != null) {
                                                if (aVar5.c.compareToIgnoreCase("rand") != 0) {
                                                    Iterator it4 = nexColorEffect.getPresetList().iterator();
                                                    while (true) {
                                                        if (!it4.hasNext()) {
                                                            break;
                                                        }
                                                        nexColorEffect nexcoloreffect2 = (nexColorEffect) it4.next();
                                                        if (nexcoloreffect2.getPresetName().compareToIgnoreCase(aVar5.c) == 0) {
                                                            nexproject.getLastPrimaryClip().setColorEffect(nexcoloreffect2);
                                                            break;
                                                        }
                                                    }
                                                } else {
                                                    nexproject.getLastPrimaryClip().setColorEffect(internalPresetList[i16]);
                                                    i7 = i16 + 1;
                                                }
                                            }
                                            if (!(aVar5.d == null || aVar5.d.compareToIgnoreCase("none") == 0)) {
                                                nexproject.getLastPrimaryClip().getClipEffect().setEffect(aVar5.d);
                                            }
                                            i18++;
                                            if (i18 < size2) {
                                                break;
                                            }
                                            z3 = aVar5.e;
                                            aVar5 = (a) arrayList.get(i18);
                                            int i20 = aVar5.b - aVar5.a;
                                            if (i19 + i20 > endTrimTime) {
                                                break;
                                            }
                                            nexproject2.add(nexClip.dup(clone.getClip(i15, true)));
                                            startTrimTime = i19;
                                            i17 = i20;
                                            music2 = music;
                                        }
                                        i16 = 0;
                                        nexproject.getLastPrimaryClip().getClipEffect().setEffect(aVar5.d);
                                        i18++;
                                        if (i18 < size2) {
                                        }
                                    }
                                    i15++;
                                    if (i15 >= totalClipCount2) {
                                        i5 = i18;
                                    } else {
                                        i5 = i18;
                                    }
                                }
                                i6 = 1;
                                i5 += i6;
                                music2 = music;
                                z = false;
                                z2 = true;
                            }
                            music = music2;
                            i15++;
                        }
                        i6 = 1;
                        i15 = 0;
                        i5 += i6;
                        music2 = music;
                        z = false;
                        z2 = true;
                    }
                    nexproject2.setBackgroundMusicPath(music2.string_audio_id);
                    nexproject2.setProjectAudioFadeInTime(0);
                    nexproject2.setProjectAudioFadeOutTime(0);
                    return true;
                }
                i = 0;
                String str22 = TAG;
                StringBuilder sb6 = new StringBuilder();
                sb6.append("sourceClipCount=");
                sb6.append(totalClipCount);
                sb6.append(", recommend=");
                sb6.append(i9);
                sb6.append(", extends=");
                sb6.append(i11);
                sb6.append(" ,max=");
                sb6.append(i12);
                sb6.append(", priorityLevel=");
                sb6.append(i2);
                sb6.append(", eventLevel=");
                sb6.append(i);
                sb6.append(", internal=");
                sb6.append(i13);
                Log.d(str22, sb6.toString());
                size = music2.list_effectEntries.size();
                ArrayList arrayList2 = new ArrayList();
                i3 = 1;
                int i142 = 0;
                while (true) {
                    i4 = size - 1;
                    if (i3 >= i4) {
                    }
                    i3++;
                }
                a aVar32 = new a();
                aVar32.e = false;
                aVar32.a = i142;
                aVar32.b = ((EffectEntry) music2.list_effectEntries.get(i4)).int_time;
                aVar32.d = ((EffectEntry) music2.list_effectEntries.get(i4)).clip_effect_id;
                aVar32.c = ((EffectEntry) music2.list_effectEntries.get(i4)).color_filter_id;
                arrayList2.add(aVar32);
                String str52 = TAG;
                StringBuilder sb42 = new StringBuilder();
                sb42.append("s= ,gap duration=");
                sb42.append(i10);
                Log.d(str52, sb42.toString());
                it = arrayList2.iterator();
                while (it.hasNext()) {
                }
                nexProject clone2 = nexProject.clone(nexproject);
                nexproject2.allClear(true);
                int totalClipCount22 = clone2.getTotalClipCount(true);
                nexColorEffect[] internalPresetList2 = nexColorEffect.getInternalPresetList();
                size2 = arrayList2.size();
                i5 = 0;
                int i152 = 0;
                int i162 = 0;
                while (i5 < size2) {
                }
                nexproject2.setBackgroundMusicPath(music2.string_audio_id);
                nexproject2.setProjectAudioFadeInTime(0);
                nexproject2.setProjectAudioFadeOutTime(0);
                return true;
            }
        } else {
            i2 = 0;
        }
        i = 0;
        if (level != Level.Extends) {
        }
        i = 0;
        String str222 = TAG;
        StringBuilder sb62 = new StringBuilder();
        sb62.append("sourceClipCount=");
        sb62.append(totalClipCount);
        sb62.append(", recommend=");
        sb62.append(i9);
        sb62.append(", extends=");
        sb62.append(i11);
        sb62.append(" ,max=");
        sb62.append(i12);
        sb62.append(", priorityLevel=");
        sb62.append(i2);
        sb62.append(", eventLevel=");
        sb62.append(i);
        sb62.append(", internal=");
        sb62.append(i13);
        Log.d(str222, sb62.toString());
        size = music2.list_effectEntries.size();
        ArrayList arrayList22 = new ArrayList();
        i3 = 1;
        int i1422 = 0;
        while (true) {
            i4 = size - 1;
            if (i3 >= i4) {
            }
            i3++;
        }
        a aVar322 = new a();
        aVar322.e = false;
        aVar322.a = i1422;
        aVar322.b = ((EffectEntry) music2.list_effectEntries.get(i4)).int_time;
        aVar322.d = ((EffectEntry) music2.list_effectEntries.get(i4)).clip_effect_id;
        aVar322.c = ((EffectEntry) music2.list_effectEntries.get(i4)).color_filter_id;
        arrayList22.add(aVar322);
        String str522 = TAG;
        StringBuilder sb422 = new StringBuilder();
        sb422.append("s= ,gap duration=");
        sb422.append(i10);
        Log.d(str522, sb422.toString());
        it = arrayList22.iterator();
        while (it.hasNext()) {
        }
        nexProject clone22 = nexProject.clone(nexproject);
        nexproject2.allClear(true);
        int totalClipCount222 = clone22.getTotalClipCount(true);
        nexColorEffect[] internalPresetList22 = nexColorEffect.getInternalPresetList();
        size2 = arrayList22.size();
        i5 = 0;
        int i1522 = 0;
        int i1622 = 0;
        while (i5 < size2) {
        }
        nexproject2.setBackgroundMusicPath(music2.string_audio_id);
        nexproject2.setProjectAudioFadeInTime(0);
        nexproject2.setProjectAudioFadeOutTime(0);
        return true;
    }

    public BeatTemplate getBeatTemplate(String str) {
        synchronized (this.m_musicTemplateLock) {
            for (BeatTemplate beatTemplate : this.musicTemplates) {
                if (beatTemplate.id().compareTo(str) == 0) {
                    return beatTemplate;
                }
            }
            return null;
        }
    }

    public List<BeatTemplate> getBeatTemplates() {
        List<BeatTemplate> list;
        synchronized (this.m_musicTemplateLock) {
            if (this.externalView_musicTemplates == null) {
                this.externalView_musicTemplates = Collections.unmodifiableList(this.musicTemplates);
            }
            list = this.externalView_musicTemplates;
        }
        return list;
    }

    public void loadTemplate() {
        resolve(false);
    }

    public void loadTemplate(boolean z) {
        resolve(z);
    }

    /* access modifiers changed from: 0000 */
    public boolean updateBeatTemplate(boolean z, Item item) {
        synchronized (this.m_musicTemplateLock) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("updateMusicTemplate(");
            sb.append(z);
            sb.append(",");
            sb.append(item.packageInfo().assetIdx());
            sb.append(")");
            Log.d(str, sb.toString());
            if (!z) {
                Iterator it = this.musicTemplates.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    BeatTemplate beatTemplate = (BeatTemplate) it.next();
                    if (beatTemplate.id().compareTo(item.id()) == 0) {
                        this.musicTemplates.remove(beatTemplate);
                        break;
                    }
                }
            } else if (!item.hidden()) {
                this.musicTemplates.add(new BeatTemplate(item));
            }
        }
        return false;
    }
}
