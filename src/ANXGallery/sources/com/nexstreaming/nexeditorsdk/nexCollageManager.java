package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.Log;
import com.google.gson_nex.Gson;
import com.nexstreaming.app.common.nexasset.assetpackage.AssetPackageReader;
import com.nexstreaming.app.common.nexasset.assetpackage.c;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.util.b;
import com.nexstreaming.kminternal.kinemaster.config.a;
import com.nexstreaming.nexeditorsdk.exception.ExpiredTimeException;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.Asset;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.Category;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.Item;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.ItemMethodType;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.OnInstallPackageListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

public class nexCollageManager {
    private static final String TAG = "nexCollageManager";
    private static nexCollageManager sSingleton;
    private List<Collage> collageEntries = new ArrayList();
    private Context mAppContext;
    private Context mResContext;
    private Object m_collageEntryLock = new Object();

    public static class Collage extends c {
        private nexCollage collage;

        Collage() {
        }

        private Collage(Item item) {
            super(item);
        }

        private boolean parsingCollage() {
            if (!this.collage.i()) {
                try {
                    if (nexCollageManager.AssetPackageJsonToString(id()) != null) {
                        String a = this.collage.a(new JSONObject(nexCollageManager.AssetPackageJsonToString(id())));
                        if (a != null) {
                            String str = nexCollageManager.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("collage parsing error");
                            sb.append(a);
                            Log.d(str, sb.toString());
                            return false;
                        }
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                    String str2 = nexCollageManager.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Collage parsing error");
                    sb2.append(e.getMessage());
                    Log.d(str2, sb2.toString());
                    return false;
                }
            }
            return true;
        }

        protected static Collage promote(Item item) {
            if (item.category() == Category.collage || item.category() == Category.staticcollage || item.category() == Category.dynamiccollage) {
                return new Collage(item);
            }
            return null;
        }

        public boolean applyCollage2Project(nexProject nexproject, nexEngine nexengine, int i, Context context) throws ExpiredTimeException {
            if (nexAssetPackageManager.checkExpireAsset(packageInfo())) {
                throw new ExpiredTimeException(id());
            } else if (this.collage == null || !parsingCollage()) {
                return false;
            } else {
                String a = this.collage.a(nexproject, nexengine, i, context, false);
                if (a == null) {
                    return true;
                }
                String str = nexCollageManager.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("applyCollage2Project failed with ");
                sb.append(a);
                Log.d(str, sb.toString());
                return false;
            }
        }

        public /* bridge */ /* synthetic */ Category category() {
            return super.category();
        }

        /* access modifiers changed from: protected */
        public nexCollage getCollage() {
            return this.collage;
        }

        public nexCollageInfo getCollageInfos(float f, float f2) {
            if (this.collage == null || !parsingCollage()) {
                return null;
            }
            for (nexCollageTitleInfo nexcollagetitleinfo : this.collage.g()) {
                if (nexcollagetitleinfo.a() && nexcollagetitleinfo.a(f, f2)) {
                    return nexcollagetitleinfo;
                }
            }
            for (a aVar : this.collage.f()) {
                if (!aVar.a() && aVar.a(f, f2)) {
                    return aVar;
                }
            }
            return null;
        }

        public List<nexCollageInfo> getCollageInfos() {
            if (this.collage == null || !parsingCollage()) {
                return null;
            }
            ArrayList arrayList = new ArrayList();
            for (a aVar : this.collage.f()) {
                if (!aVar.a()) {
                    arrayList.add(aVar);
                }
            }
            for (nexCollageTitleInfo nexcollagetitleinfo : this.collage.g()) {
                if (nexcollagetitleinfo.a()) {
                    arrayList.add(nexcollagetitleinfo);
                }
            }
            return arrayList;
        }

        public int getDuration() {
            if (this.collage == null || !parsingCollage()) {
                return 0;
            }
            return this.collage.c();
        }

        public int getEditTime() {
            if (this.collage == null || !parsingCollage()) {
                return 0;
            }
            return (int) (((float) this.collage.c()) * this.collage.a());
        }

        public float getRatio() {
            if (this.collage == null || !parsingCollage()) {
                return 0.0f;
            }
            return this.collage.e();
        }

        public int getRatioMode() {
            if (this.collage == null || !parsingCollage()) {
                return 1;
            }
            float e = this.collage.e();
            if (e == 1.0f) {
                return 2;
            }
            if (e == 1.7777778f) {
                return 1;
            }
            if (e == 0.5625f) {
                return 3;
            }
            if (e == 2.0f) {
                return 4;
            }
            if (e == 0.5f) {
                return 5;
            }
            if (e == 1.3333334f) {
                return 6;
            }
            return e == 0.75f ? 7 : 0;
        }

        public int getSourceCount() {
            if (id().contains(".sc.")) {
                String id = id();
                String substring = id.substring(id.indexOf(".sc.") + 4, id.length());
                if (substring != null && substring.length() > 0) {
                    return Integer.parseInt(substring);
                }
            }
            if (this.collage == null || !parsingCollage()) {
                return 0;
            }
            return this.collage.b();
        }

        public String[] getSupportedLocales() {
            return packageInfo() == null ? new String[0] : packageInfo().getSupportedLocales();
        }

        public CollageType getType() {
            ItemMethodType type = type();
            if (type == ItemMethodType.ItemDynamicCollage) {
                return CollageType.DynamicCollage;
            }
            if (type == ItemMethodType.ItemStaticCollage) {
                return CollageType.StaticCollage;
            }
            if (this.collage == null || !parsingCollage()) {
                return null;
            }
            return this.collage.d();
        }

        public /* bridge */ /* synthetic */ boolean hidden() {
            return super.hidden();
        }

        public /* bridge */ /* synthetic */ Bitmap icon() {
            return super.icon();
        }

        public String id() {
            return super.id();
        }

        public /* bridge */ /* synthetic */ boolean isDelete() {
            return super.isDelete();
        }

        public boolean isFrameCollage() {
            if (this.collage == null) {
                return false;
            }
            return this.collage.h();
        }

        /* access modifiers changed from: protected */
        public boolean loadCollage2Project(nexProject nexproject, nexEngine nexengine, int i, Context context) {
            if (this.collage == null || !parsingCollage()) {
                return false;
            }
            String a = this.collage.a(nexproject, nexengine, i, context, true);
            if (a == null) {
                return true;
            }
            String str = nexCollageManager.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("applyCollage2Project failed with ");
            sb.append(a);
            Log.d(str, sb.toString());
            return false;
        }

        public boolean loadFromSaveData(Context context, nexEngine nexengine, nexProject nexproject, String str) {
            if (this.collage == null) {
                return false;
            }
            nexSaveDataFormat nexsavedataformat = (nexSaveDataFormat) new Gson().fromJson(str, nexSaveDataFormat.class);
            if (nexsavedataformat.collage == null || nexsavedataformat.project == null) {
                return false;
            }
            this.collage.a(nexsavedataformat.collage);
            loadCollage2Project(nexproject, nexengine, getDuration(), context);
            nexengine.setProject(nexproject);
            return true;
        }

        public String name(String str) {
            String assetName = packageInfo().assetName(str);
            return assetName != null ? assetName : super.name(str);
        }

        public /* bridge */ /* synthetic */ Asset packageInfo() {
            return super.packageInfo();
        }

        public boolean restoreBGM() {
            if (this.collage == null) {
                return false;
            }
            return this.collage.a((String) null);
        }

        public String saveToString() {
            if (this.collage == null) {
                return null;
            }
            return new Gson().toJson((Object) this.collage.j());
        }

        /* access modifiers changed from: protected */
        public void setCollage(nexCollage nexcollage) {
            this.collage = nexcollage;
        }

        public boolean swapDrawInfoClip(nexCollageInfoDraw nexcollageinfodraw, nexCollageInfoDraw nexcollageinfodraw2) {
            if (this.collage == null) {
                return false;
            }
            return this.collage.a((a) nexcollageinfodraw, (a) nexcollageinfodraw2);
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

    public enum CollageType {
        StaticCollage,
        DynamicCollage,
        ALL
    }

    private nexCollageManager(Context context, Context context2) {
        this.mAppContext = context;
        this.mResContext = context2;
    }

    /* access modifiers changed from: private */
    public static String AssetPackageJsonToString(String str) {
        f c = c.a().c(str);
        if (c == null) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("AssetPackageJsonToString info fail=");
            sb.append(str);
            Log.e(str2, sb.toString());
            return null;
        } else if (c.a().a(c.getAssetPackage())) {
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("AssetPackageJsonToString expire id=");
            sb2.append(str);
            Log.e(str3, sb2.toString());
            return null;
        } else {
            try {
                AssetPackageReader a = AssetPackageReader.a(a.a().b(), c.getPackageURI(), c.getAssetPackage().getAssetId());
                try {
                    InputStream a2 = a.a(c.getFilePath());
                    if (a2 != null) {
                        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(a2));
                        StringBuilder sb3 = new StringBuilder();
                        while (true) {
                            String readLine = bufferedReader.readLine();
                            if (readLine != null) {
                                sb3.append(readLine);
                                sb3.append("\n");
                            } else {
                                a2.close();
                                String sb4 = sb3.toString();
                                b.a(a);
                                return sb4;
                            }
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (Throwable th) {
                    b.a(a);
                    throw th;
                }
                b.a(a);
                return null;
            } catch (IOException e2) {
                e2.printStackTrace();
                return null;
            }
        }
    }

    public static nexCollageManager getCollageManager() {
        return sSingleton;
    }

    public static nexCollageManager getCollageManager(Context context, Context context2) {
        if (sSingleton != null && !sSingleton.mAppContext.getPackageName().equals(context.getPackageName())) {
            sSingleton = null;
        }
        if (sSingleton == null) {
            sSingleton = new nexCollageManager(context, context2);
        }
        return sSingleton;
    }

    private boolean resolveCollage(boolean z) {
        synchronized (this.m_collageEntryLock) {
            this.collageEntries.clear();
            for (Item item : nexAssetPackageManager.getAssetPackageManager(this.mAppContext).getInstalledAssetItems(Category.collage)) {
                if (!item.hidden()) {
                    if (z) {
                        nexAssetPackageManager.getAssetPackageManager(this.mAppContext);
                        if (nexAssetPackageManager.checkExpireAsset(item.packageInfo())) {
                        }
                    }
                    Collage promote = Collage.promote(item);
                    if (promote != null) {
                        promote.setCollage(new nexCollage());
                        this.collageEntries.add(promote);
                    }
                }
            }
            for (Item item2 : nexAssetPackageManager.getAssetPackageManager(this.mAppContext).getInstalledAssetItems(Category.staticcollage)) {
                if (!item2.hidden()) {
                    if (z) {
                        nexAssetPackageManager.getAssetPackageManager(this.mAppContext);
                        if (nexAssetPackageManager.checkExpireAsset(item2.packageInfo())) {
                        }
                    }
                    Collage promote2 = Collage.promote(item2);
                    if (promote2 != null) {
                        promote2.setCollage(new nexCollage());
                        this.collageEntries.add(promote2);
                    }
                }
            }
            for (Item item3 : nexAssetPackageManager.getAssetPackageManager(this.mAppContext).getInstalledAssetItems(Category.dynamiccollage)) {
                if (!item3.hidden()) {
                    if (z) {
                        nexAssetPackageManager.getAssetPackageManager(this.mAppContext);
                        if (nexAssetPackageManager.checkExpireAsset(item3.packageInfo())) {
                        }
                    }
                    Collage promote3 = Collage.promote(item3);
                    if (promote3 != null) {
                        promote3.setCollage(new nexCollage());
                        this.collageEntries.add(promote3);
                    }
                }
            }
        }
        return true;
    }

    public int findNewPackages() {
        return nexAssetPackageManager.getAssetPackageManager(a.a().b()).findNewPackages();
    }

    public Collage getCollage(String str) {
        synchronized (this.m_collageEntryLock) {
            for (Collage collage : this.collageEntries) {
                if (collage.id() != null && collage.id().compareTo(str) == 0) {
                    return collage;
                }
            }
            return null;
        }
    }

    public String getCollageItemId(boolean z, int i, int i2) {
        if (z) {
            loadCollage();
        }
        String str = null;
        if (i < 2) {
            return null;
        }
        Iterator it = this.collageEntries.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Collage collage = (Collage) it.next();
            if (collage.packageInfo().assetIdx() == i && collage.getSourceCount() == i2) {
                str = collage.id();
                break;
            }
        }
        return str;
    }

    public List<Collage> getCollages() {
        ArrayList arrayList = new ArrayList();
        for (Collage add : this.collageEntries) {
            arrayList.add(add);
        }
        return arrayList;
    }

    public List<Collage> getCollages(int i, CollageType collageType) {
        ArrayList arrayList = new ArrayList();
        for (Collage collage : this.collageEntries) {
            if (collage.getSourceCount() == i) {
                if (collageType == CollageType.ALL) {
                    arrayList.add(collage);
                }
                if (collage.getType() == collageType) {
                    arrayList.add(collage);
                }
            }
        }
        return arrayList;
    }

    public List<Collage> getCollages(CollageType collageType) {
        ArrayList arrayList = new ArrayList();
        for (Collage collage : this.collageEntries) {
            if (collageType == CollageType.ALL) {
                arrayList.add(collage);
            }
            if (collage.getType() == collageType) {
                arrayList.add(collage);
            }
        }
        return arrayList;
    }

    public void installPackagesAsync(int i, OnInstallPackageListener onInstallPackageListener) {
        nexAssetPackageManager.getAssetPackageManager(a.a().b()).installPackagesAsync(i, onInstallPackageListener);
    }

    public void installPackagesAsync(OnInstallPackageListener onInstallPackageListener) {
        nexAssetPackageManager.getAssetPackageManager(a.a().b()).installPackagesAsync(onInstallPackageListener);
    }

    public boolean isInstallingPackages() {
        return nexAssetPackageManager.getAssetPackageManager(a.a().b()).isInstallingPackages();
    }

    public boolean loadCollage() {
        return resolveCollage(false);
    }

    public boolean loadCollage(boolean z) {
        return resolveCollage(z);
    }

    public void uninstallPackageById(String str) {
        nexAssetPackageManager.getAssetPackageManager(a.a().b()).uninstallPackageById(str);
    }

    /* access modifiers changed from: 0000 */
    public boolean updateCollage(boolean z, Item item) {
        boolean z2;
        synchronized (this.m_collageEntryLock) {
            z2 = false;
            if (z) {
                try {
                    if (item.hidden()) {
                        return false;
                    }
                    Collage promote = Collage.promote(item);
                    if (promote != null) {
                        if (AssetPackageJsonToString(promote.id()) != null) {
                            JSONObject jSONObject = new JSONObject(AssetPackageJsonToString(promote.id()));
                            nexCollage nexcollage = new nexCollage();
                            String a = nexcollage.a(jSONObject);
                            if (a != null) {
                                String str = TAG;
                                StringBuilder sb = new StringBuilder();
                                sb.append("collage parse error");
                                sb.append(a);
                                Log.d(str, sb.toString());
                            } else {
                                promote.setCollage(nexcollage);
                                this.collageEntries.add(promote);
                                z2 = true;
                            }
                        }
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("json create failed");
                    sb2.append(e.getMessage());
                    Log.d(str2, sb2.toString());
                } finally {
                }
            } else {
                ArrayList arrayList = new ArrayList();
                for (Collage collage : this.collageEntries) {
                    if (collage.packageInfo().assetIdx() == item.packageInfo().assetIdx()) {
                        arrayList.add(collage);
                        z2 = true;
                    }
                }
                this.collageEntries.removeAll(arrayList);
            }
        }
        return z2;
    }
}
