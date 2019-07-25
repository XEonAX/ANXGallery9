package com.nexstreaming.nexeditorsdk;

import android.graphics.Bitmap;
import android.graphics.ColorMatrix;
import com.nexstreaming.kminternal.kinemaster.config.a;
import com.nexstreaming.kminternal.kinemaster.editorwrapper.b;
import com.nexstreaming.kminternal.kinemaster.editorwrapper.b.C0005b;
import com.nexstreaming.kminternal.kinemaster.editorwrapper.b.c;
import com.nexstreaming.nexeditorsdk.nexSaveDataFormat.nexColorEffectOf;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class nexColorEffect implements Cloneable {
    public static final nexColorEffect ALIEN_INVASION;
    public static final nexColorEffect BLACK_AND_WHITE;
    public static final nexColorEffect COOL;
    public static final nexColorEffect DEEP_BLUE;
    public static final nexColorEffect FALL;
    public static final nexColorEffect NOIR;
    public static final nexColorEffect NONE;
    public static final nexColorEffect ORANGE;
    public static final nexColorEffect PASTEL;
    public static final nexColorEffect PINK;
    public static final nexColorEffect PURPLE;
    public static final nexColorEffect RED_ALERT;
    public static final nexColorEffect ROUGE;
    public static final nexColorEffect SEPIA;
    public static final nexColorEffect SPRING;
    public static final nexColorEffect STRONG_ORANGE;
    public static final nexColorEffect SUMMER;
    public static final nexColorEffect SUNNY;
    private static List<nexColorEffect> list = new ArrayList();
    private static List<nexColorEffect> listCollect = null;
    private static boolean needUpdate = true;
    private final String assetItemID;
    private final float brightness;
    private ColorMatrix colorMatrix;
    private final float contrast;
    private final String kineMasterID;
    private boolean lut_enabled_ = false;
    private int lut_resource_id_ = 0;
    private final String presetName;
    private final float saturation;
    private final int tintColor;

    static {
        nexColorEffect nexcoloreffect = new nexColorEffect("NONE", 0.0f, 0.0f, 0.0f, 0);
        NONE = nexcoloreffect;
        nexColorEffect nexcoloreffect2 = new nexColorEffect("ALIEN_INVASION", 0.12f, -0.06f, -0.3f, -15437804);
        ALIEN_INVASION = nexcoloreffect2;
        nexColorEffect nexcoloreffect3 = new nexColorEffect("BLACK_AND_WHITE", 0.0f, 0.0f, -1.0f, -1);
        BLACK_AND_WHITE = nexcoloreffect3;
        nexColorEffect nexcoloreffect4 = new nexColorEffect("COOL", 0.12f, -0.12f, -0.3f, -15449488);
        COOL = nexcoloreffect4;
        nexColorEffect nexcoloreffect5 = new nexColorEffect("DEEP_BLUE", -0.2f, -0.3f, -0.6f, -16763905);
        DEEP_BLUE = nexcoloreffect5;
        nexColorEffect nexcoloreffect6 = new nexColorEffect("PINK", 0.1f, -0.3f, -0.6f, -6533297);
        PINK = nexcoloreffect6;
        nexColorEffect nexcoloreffect7 = new nexColorEffect("RED_ALERT", -0.3f, -0.19f, -1.0f, -65536);
        RED_ALERT = nexcoloreffect7;
        nexColorEffect nexcoloreffect8 = new nexColorEffect("SEPIA", 0.12f, -0.12f, -0.3f, -9420268);
        SEPIA = nexcoloreffect8;
        nexColorEffect nexcoloreffect9 = new nexColorEffect("SUNNY", 0.08f, -0.06f, -0.3f, -3364267);
        SUNNY = nexcoloreffect9;
        nexColorEffect nexcoloreffect10 = new nexColorEffect("PURPLE", 0.08f, -0.06f, -0.3f, -5614132);
        PURPLE = nexcoloreffect10;
        nexColorEffect nexcoloreffect11 = new nexColorEffect("ORANGE", 0.08f, -0.06f, -0.35f, -17664);
        ORANGE = nexcoloreffect11;
        nexColorEffect nexcoloreffect12 = new nexColorEffect("STRONG_ORANGE", 0.08f, -0.06f, -0.5f, -17664);
        STRONG_ORANGE = nexcoloreffect12;
        nexColorEffect nexcoloreffect13 = new nexColorEffect("SPRING", 0.08f, -0.06f, -0.3f, -5583787);
        SPRING = nexcoloreffect13;
        nexColorEffect nexcoloreffect14 = new nexColorEffect("SUMMER", 0.08f, -0.06f, -0.5f, -5570816);
        SUMMER = nexcoloreffect14;
        nexColorEffect nexcoloreffect15 = new nexColorEffect("FALL", 0.08f, -0.06f, -0.5f, -16711766);
        FALL = nexcoloreffect15;
        nexColorEffect nexcoloreffect16 = new nexColorEffect("ROUGE", 0.08f, -0.06f, -0.6f, -43691);
        ROUGE = nexcoloreffect16;
        nexColorEffect nexcoloreffect17 = new nexColorEffect("PASTEL", 0.08f, -0.06f, -0.5f, -11184811);
        PASTEL = nexcoloreffect17;
        nexColorEffect nexcoloreffect18 = new nexColorEffect("NOIR", -0.25f, 0.6f, -1.0f, -8952235);
        NOIR = nexcoloreffect18;
    }

    public nexColorEffect(float f, float f2, float f3, int i) {
        this.brightness = f;
        this.contrast = f2;
        this.saturation = f3;
        this.tintColor = i;
        this.presetName = null;
        this.lut_enabled_ = false;
        this.kineMasterID = null;
        this.assetItemID = null;
    }

    nexColorEffect(nexColorEffectOf nexcoloreffectof) {
        this.brightness = nexcoloreffectof.brightness;
        this.contrast = nexcoloreffectof.contrast;
        this.saturation = nexcoloreffectof.saturation;
        this.tintColor = nexcoloreffectof.tintColor;
        this.presetName = nexcoloreffectof.presetName;
        this.lut_enabled_ = nexcoloreffectof.lut_enabled_;
        this.lut_resource_id_ = nexcoloreffectof.lut_resource_id_;
        this.kineMasterID = nexcoloreffectof.kineMasterID;
        this.assetItemID = nexcoloreffectof.assetItemID;
    }

    private nexColorEffect(String str, float f, float f2, float f3, int i) {
        this.brightness = f;
        this.contrast = f2;
        this.saturation = f3;
        this.tintColor = i;
        this.presetName = str;
        this.lut_enabled_ = false;
        this.kineMasterID = null;
        this.assetItemID = null;
    }

    private nexColorEffect(String str, float f, float f2, float f3, int i, int i2, String str2, String str3) {
        this.brightness = f;
        this.contrast = f2;
        this.saturation = f3;
        this.tintColor = i;
        this.presetName = str;
        this.lut_enabled_ = true;
        this.lut_resource_id_ = i2;
        this.kineMasterID = str2;
        this.assetItemID = str3;
    }

    public static int addCustomLUT(String str, byte[] bArr, int i, int i2, int i3) {
        b a = b.a(a.a().b());
        if (a == null) {
            return 0;
        }
        a.getClass();
        C0005b bVar = new C0005b(bArr, i, i2, i3);
        try {
            return a.a(str, bVar);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static Bitmap applyColorEffectOnBitmap(Bitmap bitmap, nexColorEffect nexcoloreffect) {
        int lUTId = nexcoloreffect.getLUTId();
        return lUTId == 0 ? bitmap : b.a(a.a().b()).a(bitmap, lUTId);
    }

    private static void checkUpdate() {
        if (needUpdate) {
            needUpdate = false;
            resolveList(true);
            return;
        }
        resolveList(false);
    }

    public static void cleanLutCache() {
        b a = b.a(a.a().b());
        if (a != null) {
            a.b();
        }
    }

    protected static nexColorEffect clone(nexColorEffect nexcoloreffect) {
        nexColorEffect nexcoloreffect2;
        CloneNotSupportedException e;
        try {
            nexcoloreffect2 = (nexColorEffect) nexcoloreffect.clone();
            try {
                list = list;
                listCollect = listCollect;
            } catch (CloneNotSupportedException e2) {
                e = e2;
            }
        } catch (CloneNotSupportedException e3) {
            e = e3;
            nexcoloreffect2 = null;
            e.printStackTrace();
            return nexcoloreffect2;
        }
        return nexcoloreffect2;
    }

    public static boolean existCustomLUT(String str) {
        b a = b.a(a.a().b());
        if (a == null) {
            return false;
        }
        return a.b(str);
    }

    static nexColorEffect[] getInternalPresetList() {
        return new nexColorEffect[]{ALIEN_INVASION, BLACK_AND_WHITE, COOL, PINK, SEPIA, SUNNY, PURPLE, ORANGE, STRONG_ORANGE, SPRING, SUMMER, FALL, ROUGE, PASTEL, NOIR};
    }

    public static int getLUTUID(String str) {
        b a = b.a(a.a().b());
        if (a == null) {
            return 0;
        }
        return a.c(str);
    }

    public static nexColorEffect getLutColorEffect(String str) {
        b a = b.a(a.a().b());
        if (a == null) {
            return null;
        }
        c d = a.d(str);
        if (d == null) {
            return null;
        }
        if (d.c()) {
            nexColorEffect nexcoloreffect = new nexColorEffect(d.a(), 0.0f, 0.0f, 0.0f, 0, d.b(), d.d(), d.e());
            return nexcoloreffect;
        }
        checkUpdate();
        for (nexColorEffect nexcoloreffect2 : list) {
            if (nexcoloreffect2.getLUTId() == d.b()) {
                return nexcoloreffect2;
            }
        }
        return null;
    }

    public static String[] getLutIds() {
        b a = b.a(a.a().b());
        return a == null ? new String[0] : a.a(false);
    }

    public static List<nexColorEffect> getPresetList() {
        checkUpdate();
        if (listCollect == null) {
            listCollect = Collections.unmodifiableList(list);
        }
        return listCollect;
    }

    public static int removeAllCustomLUT() {
        b a = b.a(a.a().b());
        if (a == null) {
            return 0;
        }
        a.e();
        return 1;
    }

    public static int removeCustomLUT(String str) {
        b a = b.a(a.a().b());
        if (a == null) {
            return 0;
        }
        return a.a(str);
    }

    private static void resolveList(boolean z) {
        if (list.size() == 0) {
            z = true;
        }
        if (z) {
            list.clear();
            list.addAll(Arrays.asList(new nexColorEffect[]{NONE, ALIEN_INVASION, BLACK_AND_WHITE, COOL, DEEP_BLUE, PINK, RED_ALERT, SEPIA, SUNNY, PURPLE, ORANGE, STRONG_ORANGE, SPRING, SUMMER, FALL, ROUGE, PASTEL, NOIR}));
            b a = b.a(a.a().b());
            if (a != null) {
                for (c cVar : a.f()) {
                    if (!cVar.c()) {
                        List<nexColorEffect> list2 = list;
                        nexColorEffect nexcoloreffect = new nexColorEffect(cVar.a(), 0.0f, 0.0f, 0.0f, 0, cVar.b(), cVar.d(), cVar.e());
                        list2.add(nexcoloreffect);
                    }
                }
            }
        }
    }

    static void setNeedUpdate() {
        needUpdate = true;
        b a = b.a(a.a().b());
        if (a != null) {
            a.h();
        }
    }

    public static void updatePluginLut() {
        setNeedUpdate();
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof nexColorEffect)) {
            return false;
        }
        nexColorEffect nexcoloreffect = (nexColorEffect) obj;
        if (nexcoloreffect.brightness == this.brightness && nexcoloreffect.contrast == this.contrast && nexcoloreffect.saturation == this.saturation && nexcoloreffect.tintColor == this.tintColor) {
            z = true;
        }
        return z;
    }

    public String getAssetItemID() {
        return this.assetItemID;
    }

    public float getBrightness() {
        return this.brightness;
    }

    public ColorMatrix getColorMatrix() {
        if (this.colorMatrix == null) {
            this.colorMatrix = com.nexstreaming.app.common.thememath.a.a(this.brightness, this.contrast, this.saturation, this.tintColor);
        }
        return this.colorMatrix;
    }

    public float getContrast() {
        return this.contrast;
    }

    /* access modifiers changed from: 0000 */
    public String getKineMasterID() {
        return this.lut_enabled_ ? this.kineMasterID : this.presetName;
    }

    public int getLUTId() {
        if (!this.lut_enabled_) {
            return 0;
        }
        return this.lut_resource_id_;
    }

    public String getPresetName() {
        return this.presetName;
    }

    public float getSaturation() {
        return this.saturation;
    }

    /* access modifiers changed from: 0000 */
    public nexColorEffectOf getSaveData() {
        nexColorEffectOf nexcoloreffectof = new nexColorEffectOf();
        nexcoloreffectof.brightness = this.brightness;
        nexcoloreffectof.contrast = this.contrast;
        nexcoloreffectof.saturation = this.saturation;
        nexcoloreffectof.tintColor = this.tintColor;
        nexcoloreffectof.presetName = this.presetName;
        nexcoloreffectof.lut_enabled_ = this.lut_enabled_;
        nexcoloreffectof.lut_resource_id_ = this.lut_resource_id_;
        nexcoloreffectof.kineMasterID = this.kineMasterID;
        nexcoloreffectof.assetItemID = this.assetItemID;
        return nexcoloreffectof;
    }

    public int getTintColor() {
        return this.tintColor;
    }

    public int hashCode() {
        return (((((((int) (this.brightness * 255.0f)) * 71) + ((int) (this.contrast * 255.0f))) * 479) + ((int) (this.saturation * 255.0f))) * 977) + this.tintColor;
    }
}
