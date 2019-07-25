package com.nexstreaming.kminternal.kinemaster.fonts;

import android.graphics.Typeface;
import android.util.Log;
import com.nexstreaming.app.common.nexasset.assetpackage.AssetPackageReader;
import com.nexstreaming.app.common.nexasset.assetpackage.AssetPackageReader.LocalPathNotAvailableException;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemType;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.util.b;
import com.nexstreaming.kminternal.kinemaster.fonts.Font.TypefaceLoadException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* compiled from: FontManager */
public class c {
    private static c a;
    private List<b> b = null;
    private Map<String, Font> c;

    /* compiled from: FontManager */
    private static class a implements b {
        private final String a;
        private final int b;
        private final List<Font> c = new ArrayList();

        a(String str, int i) {
            this.a = str;
            this.b = i;
        }

        public List<Font> a() {
            return Collections.unmodifiableList(this.c);
        }

        /* access modifiers changed from: 0000 */
        public List<Font> b() {
            return this.c;
        }
    }

    public static c a() {
        if (a == null) {
            a = new c();
        }
        return a;
    }

    private static Map<String, Integer> d() {
        HashMap hashMap = new HashMap();
        hashMap.put("latin", Integer.valueOf(0));
        hashMap.put("hangul", Integer.valueOf(0));
        hashMap.put("chs", Integer.valueOf(0));
        hashMap.put("cht", Integer.valueOf(0));
        hashMap.put("japanese", Integer.valueOf(0));
        hashMap.put("android", Integer.valueOf(0));
        return hashMap;
    }

    private void e() {
        Map d = d();
        HashMap hashMap = new HashMap();
        for (Font font : f().values()) {
            String b2 = font.b();
            a aVar = (a) hashMap.get(b2);
            if (aVar == null) {
                Integer num = (Integer) d.get(b2);
                if (num == null) {
                    num = Integer.valueOf(0);
                }
                a aVar2 = new a(b2, num.intValue());
                hashMap.put(b2, aVar2);
                aVar = aVar2;
            }
            aVar.b().add(font);
        }
        this.b = Collections.unmodifiableList(new ArrayList(hashMap.values()));
    }

    private Map<String, Font> f() {
        if (this.c == null) {
            List<Font> a2 = a.a();
            this.c = new HashMap();
            for (Font font : a2) {
                this.c.put(font.a(), font);
            }
        }
        return this.c;
    }

    public boolean a(String str) {
        boolean z = true;
        if (((Font) f().get(str)) != null) {
            return true;
        }
        f c2 = com.nexstreaming.app.common.nexasset.assetpackage.c.a().c(str);
        if (c2 == null || c2.getType() != ItemType.font) {
            z = false;
        }
        return z;
    }

    public Typeface b(String str) {
        if (str == null || str.trim().length() < 1) {
            return null;
        }
        String substring = str.substring(str.indexOf(47) + 1);
        Font font = (Font) f().get(substring);
        if (font != null) {
            try {
                return font.b(com.nexstreaming.kminternal.kinemaster.config.a.a().b());
            } catch (TypefaceLoadException unused) {
                return null;
            }
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Get typeface: ");
            sb.append(substring);
            Log.d("FontManager", sb.toString());
            f c2 = com.nexstreaming.app.common.nexasset.assetpackage.c.a().c(substring);
            if (c2 == null || c2.getType() != ItemType.font) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Typeface not found: ");
                sb2.append(substring);
                Log.w("FontManager", sb2.toString());
                return null;
            } else if (com.nexstreaming.app.common.nexasset.assetpackage.c.a().a(c2.getAssetPackage())) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Typeface expire: ");
                sb3.append(substring);
                Log.w("FontManager", sb3.toString());
                return null;
            } else {
                try {
                    AssetPackageReader a2 = AssetPackageReader.a(com.nexstreaming.kminternal.kinemaster.config.a.a().b(), c2.getPackageURI(), c2.getAssetPackage().getAssetId());
                    try {
                        return a2.d(c2.getFilePath());
                    } catch (LocalPathNotAvailableException e) {
                        String str2 = "FontManager";
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("Error loading typeface: ");
                        sb4.append(substring);
                        Log.e(str2, sb4.toString(), e);
                        return null;
                    } finally {
                        b.a(a2);
                    }
                } catch (IOException e2) {
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("Error loading typeface: ");
                    sb5.append(substring);
                    Log.e("FontManager", sb5.toString(), e2);
                    return null;
                }
            }
        }
    }

    public List<b> b() {
        if (this.b == null) {
            e();
        }
        return this.b;
    }

    public void c() {
        this.c = null;
    }
}
