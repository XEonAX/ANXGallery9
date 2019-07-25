package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.util.Log;
import com.nexstreaming.app.common.nexasset.assetpackage.AssetPackageReader;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemCategory;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.nexasset.store.AssetLocalInstallDB;
import com.nexstreaming.app.common.util.n;
import com.nexstreaming.kminternal.kinemaster.config.a;
import com.nexstreaming.kminternal.kinemaster.fonts.Font;
import com.nexstreaming.kminternal.kinemaster.fonts.b;
import com.nexstreaming.kminternal.kinemaster.fonts.c;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public final class nexFont {
    private static final String LOG_TAG = "nexFont";
    private static List<nexFont> list = new ArrayList();
    private static boolean s_update;
    private boolean builtin;
    private Font font;
    private String sample;
    private boolean system;

    private nexFont(boolean z, Font font2, String str, boolean z2) {
        this.builtin = z;
        this.font = font2;
        this.sample = str;
        this.system = z2;
    }

    static void checkUpdate() {
        if (s_update) {
            s_update = false;
            reload();
        }
    }

    public static void clearBuiltinFontsCache() {
        c.a().c();
    }

    public static nexFont getFont(String str) {
        checkUpdate();
        for (nexFont nexfont : list) {
            if (nexfont.getId().compareTo(str) == 0) {
                return nexfont;
            }
        }
        return null;
    }

    public static String[] getFontIds() {
        checkUpdate();
        String[] strArr = new String[list.size()];
        for (int i = 0; i < strArr.length; i++) {
            strArr[i] = ((nexFont) list.get(i)).getId();
        }
        return strArr;
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0044 A[SYNTHETIC, Splitter:B:20:0x0044] */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0056 A[SYNTHETIC, Splitter:B:27:0x0056] */
    private static String getLocalPath(f fVar) {
        AssetPackageReader assetPackageReader;
        try {
            assetPackageReader = AssetPackageReader.a(a.a().b(), fVar.getPackageURI(), fVar.getId());
            try {
                String absolutePath = assetPackageReader.c(fVar.getFilePath()).getAbsolutePath();
                if (assetPackageReader != null) {
                    try {
                        assetPackageReader.close();
                    } catch (IOException e) {
                        Log.e(LOG_TAG, e.getMessage(), e);
                    }
                }
                return absolutePath;
            } catch (Exception e2) {
                e = e2;
                try {
                    Log.e(LOG_TAG, e.getMessage(), e);
                    if (assetPackageReader != null) {
                        try {
                            assetPackageReader.close();
                        } catch (IOException e3) {
                            Log.e(LOG_TAG, e3.getMessage(), e3);
                        }
                    }
                    return null;
                } catch (Throwable th) {
                    th = th;
                    if (assetPackageReader != null) {
                        try {
                            assetPackageReader.close();
                        } catch (IOException e4) {
                            Log.e(LOG_TAG, e4.getMessage(), e4);
                        }
                    }
                    throw th;
                }
            }
        } catch (Exception e5) {
            e = e5;
            assetPackageReader = null;
            Log.e(LOG_TAG, e.getMessage(), e);
            if (assetPackageReader != null) {
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            assetPackageReader = null;
            if (assetPackageReader != null) {
            }
            throw th;
        }
    }

    public static List<nexFont> getPresetList() {
        if (list.size() == 0) {
            for (b a : c.a().b()) {
                for (Font font2 : a.a()) {
                    list.add(new nexFont(true, font2, font2.a((Context) null), font2.a().startsWith("system")));
                }
            }
            for (f fVar : com.nexstreaming.app.common.nexasset.assetpackage.c.a().a(ItemCategory.font)) {
                if (!fVar.isHidden()) {
                    String valueOf = String.valueOf((int) fVar.getAssetPackage().getAssetSubCategory().getSubCategoryId());
                    if (valueOf == null) {
                        valueOf = "asset";
                    }
                    String sampleText = fVar.getSampleText();
                    if (sampleText == null || sampleText.trim().length() < 1) {
                        sampleText = n.a(a.a().b(), fVar.getLabel());
                    }
                    if (sampleText == null) {
                        sampleText = fVar.getId();
                    }
                    String str = LOG_TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("asset font id=");
                    sb.append(fVar.getId());
                    sb.append(", loacalPath=");
                    sb.append(getLocalPath(fVar));
                    Log.d(str, sb.toString());
                    Font font3 = new Font(fVar.getId(), valueOf, new File(getLocalPath(fVar)), sampleText);
                    list.add(new nexFont(!fVar.getPackageURI().contains(AssetLocalInstallDB.getInstalledAssetPath()), font3, sampleText, false));
                }
            }
        }
        return list;
    }

    public static Typeface getTypeface(Context context, String str) {
        return c.a().b(str);
    }

    static boolean isLoadedFont(String str) {
        if (c.a().a(str)) {
            return true;
        }
        f c = com.nexstreaming.app.common.nexasset.assetpackage.c.a().c(str);
        return c != null && c.getCategory() == ItemCategory.font;
    }

    static void needUpdate() {
        s_update = true;
    }

    public static void reload() {
        list.clear();
        getPresetList();
    }

    public String getId() {
        return this.font.a();
    }

    public Bitmap getSampleImage(Context context) {
        return this.font.c(context);
    }

    public String getSampleText() {
        return this.sample;
    }

    public Typeface getTypeFace() {
        return c.a().b(getId());
    }

    public boolean isBuiltinFont() {
        return this.builtin;
    }

    public boolean isSystemFont() {
        return this.system;
    }
}
