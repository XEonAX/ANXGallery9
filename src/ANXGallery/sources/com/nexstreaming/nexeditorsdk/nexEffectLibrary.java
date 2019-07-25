package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemCategory;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemParameterType;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemType;
import com.nexstreaming.app.common.nexasset.assetpackage.c;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.nexasset.assetpackage.g;
import com.nexstreaming.app.common.nexasset.assetpackage.h;
import com.nexstreaming.app.common.nexasset.assetpackage.i;
import com.nexstreaming.kminternal.kinemaster.config.EditorGlobal;
import com.nexstreaming.kminternal.kinemaster.config.a;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.xmlpull.v1.XmlPullParserException;

public final class nexEffectLibrary {
    private static nexEffectLibrary sSingleton;
    private final Context mAppContext;

    @Deprecated
    public static abstract class OnInstallPluginEffectPackageAsyncListener {
        public abstract void onComplete(int i, String[] strArr);

        public abstract void onPackageLoaded(int i);
    }

    private nexEffectLibrary(Context context) {
        this.mAppContext = context;
    }

    public static nexEffectLibrary getEffectLibrary(Context context) {
        Context applicationContext = context.getApplicationContext();
        if (sSingleton != null && !sSingleton.mAppContext.getPackageName().equals(applicationContext.getPackageName())) {
            sSingleton = null;
        }
        if (sSingleton == null) {
            sSingleton = new nexEffectLibrary(applicationContext);
        }
        return sSingleton;
    }

    @Deprecated
    public static String getPluginDirPath() {
        return EditorGlobal.g().getAbsolutePath();
    }

    /* access modifiers changed from: 0000 */
    public boolean checkEffectID(String str) {
        boolean a = c.a(this.mAppContext).a(str, ItemCategory.transition);
        return !a ? c.a(this.mAppContext).a(str, ItemCategory.effect) : a;
    }

    public nexClipEffect findClipEffectById(String str) {
        f c = c.a(this.mAppContext).c(str);
        if (c == null || c.getCategory() != ItemCategory.effect) {
            return null;
        }
        nexClipEffect nexclipeffect = new nexClipEffect(str);
        nexclipeffect.itemMethodType = nexAssetPackageManager.getMethodType(c.getType());
        return nexclipeffect;
    }

    public nexOverlayFilter findOverlayFilterById(String str) {
        f c = c.a(this.mAppContext).c(str);
        if (c != null && c.getType() == ItemType.renderitem) {
            return new nexOverlayFilter(str);
        }
        return null;
    }

    @Deprecated
    public nexTheme findThemeById(String str) {
        return null;
    }

    public nexTransitionEffect findTransitionEffectById(String str) {
        f c = c.a(this.mAppContext).c(str);
        if (c == null || c.getCategory() != ItemCategory.transition) {
            return null;
        }
        nexTransitionEffect nextransitioneffect = new nexTransitionEffect(str);
        nextransitioneffect.itemMethodType = nexAssetPackageManager.getMethodType(c.getType());
        return nextransitioneffect;
    }

    public nexClipEffect[] getClipEffects() {
        List<f> a = c.a(this.mAppContext).a(ItemCategory.effect);
        int i = 0;
        int i2 = 0;
        for (f isHidden : a) {
            if (!isHidden.isHidden()) {
                i2++;
            }
        }
        nexClipEffect[] nexclipeffectArr = new nexClipEffect[i2];
        for (f fVar : a) {
            if (!fVar.isHidden()) {
                nexclipeffectArr[i] = new nexClipEffect(fVar.getId());
                nexclipeffectArr[i].itemMethodType = nexAssetPackageManager.getMethodType(fVar.getType());
                i++;
            }
        }
        return nexclipeffectArr;
    }

    /* JADX WARNING: type inference failed for: r7v0 */
    /* JADX WARNING: type inference failed for: r7v1, types: [boolean] */
    /* JADX WARNING: type inference failed for: r7v2 */
    /* JADX WARNING: type inference failed for: r7v5, types: [int] */
    /* JADX WARNING: type inference failed for: r7v6 */
    /* JADX WARNING: type inference failed for: r7v7 */
    /* JADX WARNING: type inference failed for: r7v8 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r7v0
  assigns: [?[boolean, int, float, short, byte, char], ?[int, float, short, byte, char], ?[int, float, boolean, short, byte, char, OBJECT, ARRAY]]
  uses: [boolean, int]
  mth insns count: 149
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x005c  */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x0111  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x0114  */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x0193  */
    /* JADX WARNING: Removed duplicated region for block: B:92:0x012a A[SYNTHETIC] */
    /* JADX WARNING: Unknown variable types count: 3 */
    public nexEffectOptions getEffectOptions(Context context, String str) {
        h hVar;
        String str2;
        String str3;
        f c = c.a(a.a().b()).c(str);
        if (c == null) {
            return null;
        }
        int i = c.getCategory() == ItemCategory.transition ? 4 : c.getCategory() == ItemCategory.effect ? 2 : (c.getCategory() == ItemCategory.filter && c.getType() == ItemType.renderitem) ? 5 : 0;
        nexEffectOptions nexeffectoptions = new nexEffectOptions(str, i);
        try {
            hVar = i.a(a.a().b(), str);
        } catch (XmlPullParserException e) {
            e.printStackTrace();
            hVar = null;
            if (hVar != null) {
            }
            return nexeffectoptions;
        } catch (IOException e2) {
            e2.printStackTrace();
            hVar = null;
            if (hVar != null) {
            }
            return nexeffectoptions;
        }
        if (hVar != null) {
            for (g gVar : hVar.a()) {
                Map i2 = gVar.i();
                if (i2 != null) {
                    Map map = (Map) i2.get("label");
                    if (map != null) {
                        str2 = (String) map.get("en");
                        if (gVar.a() != ItemParameterType.RGBA || gVar.a() == ItemParameterType.RGB) {
                            if (str2 == null) {
                                str2 = "Color";
                            }
                            nexeffectoptions.addColorOpt(gVar.e(), str2, gVar.b());
                        } else {
                            ? r7 = 1;
                            if (gVar.a() == ItemParameterType.TEXT) {
                                if (str2 == null) {
                                    str2 = "Text";
                                }
                                String e3 = gVar.e();
                                if (gVar.f()) {
                                    r7 = 2;
                                }
                                nexeffectoptions.addTextOpt(e3, str2, r7);
                            } else if (gVar.a() == ItemParameterType.CHOICE) {
                                if (str2 == null) {
                                    str2 = "Choice";
                                }
                                String str4 = str2;
                                List j = gVar.j();
                                String[] strArr = new String[j.size()];
                                String[] strArr2 = new String[j.size()];
                                int i3 = 0;
                                for (int i4 = 0; i4 < j.size(); i4++) {
                                    Map a = ((g.a) j.get(i4)).a();
                                    if (a != null) {
                                        Map map2 = (Map) a.get("label");
                                        if (map2 != null) {
                                            str3 = (String) map2.get("en");
                                            if (((g.a) j.get(i4)).b().compareTo(gVar.b()) == 0) {
                                                i3 = i4;
                                            }
                                            if (str3 != null) {
                                                StringBuilder sb = new StringBuilder();
                                                sb.append("item");
                                                sb.append(i4);
                                                str3 = new String(sb.toString());
                                            }
                                            strArr[i4] = str3;
                                            strArr2[i4] = ((g.a) j.get(i4)).b();
                                        }
                                    }
                                    str3 = null;
                                    if (((g.a) j.get(i4)).b().compareTo(gVar.b()) == 0) {
                                    }
                                    if (str3 != null) {
                                    }
                                    strArr[i4] = str3;
                                    strArr2[i4] = ((g.a) j.get(i4)).b();
                                }
                                nexeffectoptions.addSelectOpt(gVar.e(), str4, strArr, strArr2, i3);
                            } else if (gVar.a() == ItemParameterType.RANGE) {
                                if (str2 == null) {
                                    str2 = "Range";
                                }
                                nexeffectoptions.addRangeOpt(gVar.e(), str2, Integer.parseInt(gVar.b()), gVar.g(), gVar.h());
                            } else if (gVar.a() == ItemParameterType.SWITCH) {
                                if (str2 == null) {
                                    str2 = "Switch";
                                }
                                if (gVar.d().compareTo(gVar.b()) != 0) {
                                    r7 = 0;
                                }
                                nexeffectoptions.addSwitchOpt(gVar.e(), str2, r7);
                            }
                        }
                    }
                }
                str2 = null;
                if (gVar.a() != ItemParameterType.RGBA) {
                }
                if (str2 == null) {
                }
                nexeffectoptions.addColorOpt(gVar.e(), str2, gVar.b());
            }
        }
        return nexeffectoptions;
    }

    public nexOverlayFilter[] getOverlayFilters() {
        ArrayList arrayList = new ArrayList();
        for (f fVar : c.a(this.mAppContext).a(ItemCategory.effect)) {
            if (!fVar.isHidden() && fVar.getType() == ItemType.renderitem) {
                arrayList.add(fVar.getId());
            }
        }
        nexOverlayFilter[] nexoverlayfilterArr = new nexOverlayFilter[arrayList.size()];
        for (int i = 0; i < nexoverlayfilterArr.length; i++) {
            nexoverlayfilterArr[i] = new nexOverlayFilter((String) arrayList.get(i));
        }
        return nexoverlayfilterArr;
    }

    @Deprecated
    public nexTheme[] getThemes() {
        return new nexTheme[0];
    }

    @Deprecated
    public ArrayList<nexTheme> getThemesEx() {
        return new ArrayList<>();
    }

    public nexTransitionEffect[] getTransitionEffects() {
        List<f> a = c.a(this.mAppContext).a(ItemCategory.transition);
        int i = 0;
        int i2 = 0;
        for (f isHidden : a) {
            if (!isHidden.isHidden()) {
                i2++;
            }
        }
        nexTransitionEffect[] nextransitioneffectArr = new nexTransitionEffect[i2];
        for (f fVar : a) {
            if (!fVar.isHidden()) {
                nextransitioneffectArr[i] = new nexTransitionEffect(fVar.getId());
                nextransitioneffectArr[i].itemMethodType = nexAssetPackageManager.getMethodType(fVar.getType());
                i++;
            }
        }
        return nextransitioneffectArr;
    }

    public ArrayList<nexTransitionEffect> getTransitionEffectsEx() {
        ArrayList<nexTransitionEffect> arrayList = new ArrayList<>();
        for (f fVar : c.a(this.mAppContext).a(ItemCategory.transition)) {
            if (!fVar.isHidden()) {
                arrayList.add(new nexTransitionEffect(fVar.getId()));
            }
        }
        return arrayList;
    }

    @Deprecated
    public boolean installPluginEffectPackageAsync(String[] strArr, OnInstallPluginEffectPackageAsyncListener onInstallPluginEffectPackageAsyncListener) {
        return true;
    }
}
