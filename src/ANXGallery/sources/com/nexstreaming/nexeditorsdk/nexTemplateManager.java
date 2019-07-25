package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.AsyncTask;
import android.util.Log;
import com.google.gson_nex.Gson;
import com.nexstreaming.app.common.util.l;
import com.nexstreaming.kminternal.json.TemplateMetaData.EffectEntry;
import com.nexstreaming.kminternal.json.TemplateMetaData.Music;
import com.nexstreaming.kminternal.kinemaster.config.EditorGlobal;
import com.nexstreaming.nexeditorsdk.exception.ExpiredTimeException;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.Asset;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.Category;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.Item;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.ItemMethodType;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.OnInstallPackageListener;
import com.nexstreaming.nexeditorsdk.nexEngine.nexUndetectedFaceCrop;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONException;
import org.json.JSONObject;

public class nexTemplateManager {
    private static final String TAG = "nexTemplateManager";
    /* access modifiers changed from: private */
    public static boolean isApplyTemplate;
    /* access modifiers changed from: private */
    public static boolean sAutoAspectSelect = true;
    private static final ExecutorService sInstallThreadExcutor = Executors.newSingleThreadExecutor();
    private static nexTemplateManager sSingleton;
    /* access modifiers changed from: private */
    public static Category[] supportCategory = {Category.template, Category.beattemplate};
    private nexTemplateComposer composer;
    private String errorMsg = "";
    private List<Template> externalView_templateEntries = null;
    private int lastError = 0;
    private Context mAppContext;
    /* access modifiers changed from: private */
    public boolean mCancel;
    private Context mResContext;
    private boolean mUseClipSpeed = false;
    private boolean mUseVideoTrim = true;
    private int mVideoMemorySize = 0;
    private Object m_templateEntryLock = new Object();
    private List<Template> templateEntries = new ArrayList();

    public static class Template extends c {
        private float[] aspect;
        private String bgmId;
        private String[] ids;
        private int internalSourceCount = -1;
        private int maxAspect;
        private int maxExtendCount = -1;
        private int maxRecommendCount;
        private int maxSourceCount;
        private boolean parsed = false;
        private int selectAspect;

        Template() {
        }

        private Template(Item item) {
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

        public static Template promote(Item item) {
            for (Category category : nexTemplateManager.supportCategory) {
                if (item.category() == category) {
                    return new Template(item);
                }
            }
            return null;
        }

        private void selectAspect() {
            float aspectRatio = nexApplicationConfig.getAspectRatio();
            float f = 3.0f;
            for (int i = 0; i < this.maxAspect; i++) {
                float f2 = aspectRatio - this.aspect[i];
                if (f2 < 0.0f) {
                    f2 *= -1.0f;
                }
                if (f > f2) {
                    this.selectAspect = i;
                    f = f2;
                }
            }
        }

        public float aspect() {
            if (nexTemplateManager.sAutoAspectSelect) {
                selectAspect();
            }
            return this.aspect[this.selectAspect];
        }

        public /* bridge */ /* synthetic */ Category category() {
            return super.category();
        }

        public String defaultBGMId() {
            if (category() == Category.beattemplate) {
                parseTemplate();
                return this.bgmId;
            }
            if (this.bgmId == null) {
                String AssetPackageTemplateJsonToString = nexTemplateComposer.AssetPackageTemplateJsonToString(id());
                if (AssetPackageTemplateJsonToString != null) {
                    try {
                        this.bgmId = new JSONObject(AssetPackageTemplateJsonToString).getString("template_bgm");
                    } catch (JSONException unused) {
                    }
                }
            }
            return this.bgmId;
        }

        public float[] getSupportedAspects() {
            float[] fArr = new float[this.maxAspect];
            for (int i = 0; i < fArr.length; i++) {
                fArr[i] = this.aspect[i];
            }
            return fArr;
        }

        public String[] getSupportedLocales() {
            return packageInfo() == null ? new String[0] : packageInfo().getSupportedLocales();
        }

        public String getVersion() {
            return this.id.contains(".ver_") ? this.id.substring(this.id.indexOf(".ver_") + 5, this.id.indexOf(".ver_") + 8) : "200";
        }

        public /* bridge */ /* synthetic */ boolean hidden() {
            return super.hidden();
        }

        public /* bridge */ /* synthetic */ Bitmap icon() {
            return super.icon();
        }

        public String id() {
            if (nexTemplateManager.sAutoAspectSelect) {
                selectAspect();
            }
            return this.ids[this.selectAspect];
        }

        public /* bridge */ /* synthetic */ boolean isDelete() {
            return super.isDelete();
        }

        public String name(String str) {
            String assetName = packageInfo().assetName(str);
            return assetName != null ? assetName : super.name(str);
        }

        public /* bridge */ /* synthetic */ Asset packageInfo() {
            return super.packageInfo();
        }

        public void selectAspect(int i) {
            if (this.maxAspect > i) {
                this.selectAspect = i;
            }
        }

        /* access modifiers changed from: 0000 */
        public void setAspect(String str) {
            if (this.maxAspect < 5) {
                if (this.aspect == null) {
                    this.aspect = new float[5];
                    this.ids = new String[5];
                }
                if (str.contains("9v16")) {
                    this.aspect[this.maxAspect] = 0.5625f;
                } else if (str.contains("2v1")) {
                    this.aspect[this.maxAspect] = 2.0f;
                } else if (str.contains("1v2")) {
                    this.aspect[this.maxAspect] = 0.5f;
                } else if (str.contains("1v1")) {
                    this.aspect[this.maxAspect] = 1.0f;
                } else {
                    this.aspect[this.maxAspect] = 1.7777778f;
                }
                this.ids[this.maxAspect] = str;
                this.maxAspect++;
                selectAspect();
            }
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

    private final class a extends AsyncTask<Void, Integer, Void> {
        nexProject a;
        String b;
        Runnable c;
        boolean d;
        private boolean f;

        a(nexProject nexproject, String str, boolean z, Runnable runnable) {
            this.a = nexproject;
            this.b = str;
            this.c = runnable;
            this.d = z;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public Void doInBackground(Void... voidArr) {
            try {
                this.f = nexTemplateManager.this.internalApplyTemplateToProjectById(this.a, this.b, this.d, nexUndetectedFaceCrop.NONE.getValue());
            } catch (ExpiredTimeException e2) {
                e2.printStackTrace();
            }
            return null;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void onPostExecute(Void voidR) {
            if (!nexTemplateManager.this.mCancel && this.c != null) {
                this.c.run();
            }
            nexTemplateManager.isApplyTemplate = false;
        }
    }

    private nexTemplateManager(Context context, Context context2) {
        this.mAppContext = context;
        this.mResContext = context2;
    }

    private Template getAssetTemplate(String str) {
        for (Template template : this.templateEntries) {
            if (template.packageInfo().assetId().compareTo(str) == 0) {
                return template;
            }
        }
        return null;
    }

    private String getNameById(String str) {
        synchronized (this.m_templateEntryLock) {
            for (Template template : this.templateEntries) {
                if (template.id() != null && template.id().compareTo(str) == 0) {
                    String name = template.name(null);
                    return name;
                }
            }
            return null;
        }
    }

    public static nexTemplateManager getTemplateManager() {
        return sSingleton;
    }

    public static nexTemplateManager getTemplateManager(Context context, Context context2) {
        if (sSingleton != null && !sSingleton.mAppContext.getPackageName().equals(context.getPackageName())) {
            sSingleton = null;
        }
        if (sSingleton == null) {
            sSingleton = new nexTemplateManager(context, context2);
        }
        return sSingleton;
    }

    /* access modifiers changed from: private */
    public boolean internalApplyTemplateToProjectById(nexProject nexproject, String str, boolean z, final int i) throws ExpiredTimeException {
        l lVar = new l();
        lVar.a();
        this.lastError = 0;
        if (getNameById(str) == null) {
            this.lastError = -1;
            return false;
        }
        Template templateById = getTemplateById(str);
        if (templateById == null) {
            this.lastError = -1;
            return false;
        } else if (nexAssetPackageManager.checkExpireAsset(templateById.packageInfo())) {
            this.lastError = -2;
            throw new ExpiredTimeException(str);
        } else if (templateById.category() == Category.beattemplate) {
            return nexBeatTemplateManager.internalApplyTemplateToProjectById(nexproject, str);
        } else {
            if (this.composer == null) {
                this.composer = new nexTemplateComposer();
            }
            EditorGlobal.a().a((Thread) null);
            if (i != 0) {
                final nexClip clip = nexproject.getClip(0, true);
                if (clip.getClipType() == 1) {
                    EditorGlobal.a().e();
                    Thread thread = new Thread(new Runnable() {
                        public void run() {
                            nexTemplateManager.this.getFirstFace(clip, i);
                        }
                    });
                    thread.start();
                    EditorGlobal.a().a(thread);
                }
            }
            this.composer.setUseProjectSpeed(this.mUseClipSpeed);
            if (nexConfig.getProperty(2) == 1) {
                this.composer.setOverlappedTransitionFlag(false);
            } else {
                this.composer.setOverlappedTransitionFlag(z);
            }
            this.errorMsg = this.composer.setTemplateEffects2Project(nexproject, this.mAppContext, this.mResContext, str, false);
            if (this.errorMsg != null) {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("internalApplyTemplateToProjectById errorMsg=");
                sb.append(this.errorMsg);
                Log.d(str2, sb.toString());
                this.composer.release();
                lVar.b();
                String str3 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("internalApplyTemplateToProjectById error elapsed=");
                sb2.append(lVar.toString());
                Log.d(str3, sb2.toString());
                this.lastError = -2;
                return false;
            }
            this.composer.release();
            lVar.b();
            String str4 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("internalApplyTemplateToProjectById elapsed=");
            sb3.append(lVar.toString());
            Log.d(str4, sb3.toString());
            return true;
        }
    }

    /* access modifiers changed from: private */
    public void resolveTemplate(boolean z) {
        synchronized (this.m_templateEntryLock) {
            this.templateEntries.clear();
            for (Category installedAssetItems : supportCategory) {
                for (Item item : nexAssetPackageManager.getAssetPackageManager(this.mAppContext).getInstalledAssetItems(installedAssetItems)) {
                    if (!item.hidden()) {
                        if (z) {
                            nexAssetPackageManager.getAssetPackageManager(this.mAppContext);
                            if (nexAssetPackageManager.checkExpireAsset(item.packageInfo())) {
                            }
                        }
                        Template assetTemplate = getAssetTemplate(item.packageInfo().assetId());
                        if (assetTemplate == null) {
                            assetTemplate = Template.promote(item);
                            this.templateEntries.add(assetTemplate);
                        }
                        assetTemplate.setAspect(item.id());
                    }
                }
            }
        }
    }

    public static void setAutoSelectFromAspect(boolean z) {
        sAutoAspectSelect = z;
    }

    public boolean applyTemplateAsyncToProjectById(nexProject nexproject, String str, Runnable runnable) throws ExpiredTimeException {
        if (isApplyTemplate) {
            this.lastError = -3;
            return false;
        }
        Template templateById = getTemplateById(str);
        if (templateById == null) {
            this.lastError = -1;
            return false;
        } else if (!nexAssetPackageManager.checkExpireAsset(templateById.packageInfo())) {
            isApplyTemplate = true;
            this.mCancel = false;
            a aVar = new a(nexproject, str, true, runnable);
            aVar.executeOnExecutor(sInstallThreadExcutor, new Void[0]);
            return true;
        } else {
            this.lastError = -2;
            throw new ExpiredTimeException(str);
        }
    }

    public boolean applyTemplateAsyncToProjectById(nexProject nexproject, String str, boolean z, Runnable runnable) throws ExpiredTimeException {
        if (isApplyTemplate) {
            this.lastError = -3;
            return false;
        }
        Template templateById = getTemplateById(str);
        if (templateById == null) {
            this.lastError = -1;
            return false;
        } else if (!nexAssetPackageManager.checkExpireAsset(templateById.packageInfo())) {
            isApplyTemplate = true;
            this.mCancel = false;
            a aVar = new a(nexproject, str, z, runnable);
            aVar.executeOnExecutor(sInstallThreadExcutor, new Void[0]);
            return true;
        } else {
            this.lastError = -2;
            throw new ExpiredTimeException(str);
        }
    }

    public boolean applyTemplateToProjectById(nexProject nexproject, String str) throws ExpiredTimeException {
        if (isApplyTemplate) {
            Log.d(TAG, "applyTemplateToProjectById errorMsg= already run applyTemplate");
            this.lastError = -3;
            return false;
        }
        isApplyTemplate = true;
        try {
            boolean internalApplyTemplateToProjectById = internalApplyTemplateToProjectById(nexproject, str, true, nexUndetectedFaceCrop.NONE.getValue());
            isApplyTemplate = false;
            return internalApplyTemplateToProjectById;
        } catch (ExpiredTimeException e) {
            isApplyTemplate = false;
            throw e;
        }
    }

    public boolean applyTemplateToProjectById(nexProject nexproject, String str, boolean z) throws ExpiredTimeException {
        if (isApplyTemplate) {
            Log.d(TAG, "applyTemplateToProjectById errorMsg= already run applyTemplate");
            this.lastError = -3;
            return false;
        }
        isApplyTemplate = true;
        try {
            boolean internalApplyTemplateToProjectById = internalApplyTemplateToProjectById(nexproject, str, z, nexUndetectedFaceCrop.NONE.getValue());
            isApplyTemplate = false;
            return internalApplyTemplateToProjectById;
        } catch (ExpiredTimeException e) {
            isApplyTemplate = false;
            throw e;
        }
    }

    public boolean applyTemplateToProjectById(nexProject nexproject, String str, boolean z, int i) throws ExpiredTimeException {
        if (isApplyTemplate) {
            Log.d(TAG, "applyTemplateToProjectById errorMsg= already run applyTemplate");
            this.lastError = -3;
            return false;
        }
        isApplyTemplate = true;
        try {
            boolean internalApplyTemplateToProjectById = internalApplyTemplateToProjectById(nexproject, str, z, i);
            isApplyTemplate = false;
            return internalApplyTemplateToProjectById;
        } catch (ExpiredTimeException e) {
            isApplyTemplate = false;
            throw e;
        }
    }

    public void cancel() {
        this.mCancel = true;
        if (isApplyTemplate && this.composer != null) {
            this.composer.setCancel();
        }
    }

    public int findNewPackages() {
        return nexAssetPackageManager.getAssetPackageManager(com.nexstreaming.kminternal.kinemaster.config.a.a().b()).findNewPackages();
    }

    @Deprecated
    public void getFirstFace(nexClip nexclip, int i) {
        Log.d(TAG, "getFirstFace In");
        String path = nexclip.getPath();
        if (com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a(path) == null) {
            Log.d(TAG, "getFirstFace Proc");
            com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a(path, new com.nexstreaming.kminternal.kinemaster.utils.facedetect.a(new File(path), true, this.mAppContext));
        }
        Log.d(TAG, "getFirstFace Out");
    }

    public int getLastError() {
        return this.lastError;
    }

    public String getLastErrorMessage() {
        return this.errorMsg;
    }

    public String[] getTemplateAssetIds() {
        String[] strArr;
        synchronized (this.m_templateEntryLock) {
            ArrayList<String> arrayList = new ArrayList<>();
            for (Template template : this.templateEntries) {
                if (arrayList.size() == 0) {
                    arrayList.add(template.packageInfo().assetId());
                } else {
                    for (String compareTo : arrayList) {
                        int compareTo2 = compareTo.compareTo(template.packageInfo().assetId());
                    }
                    arrayList.add(template.packageInfo().assetId());
                }
            }
            strArr = new String[arrayList.size()];
            for (int i = 0; i < strArr.length; i++) {
                strArr[i] = (String) arrayList.get(i);
            }
        }
        return strArr;
    }

    public int[] getTemplateAssetIdxs() {
        int[] iArr;
        synchronized (this.m_templateEntryLock) {
            ArrayList<Integer> arrayList = new ArrayList<>();
            for (Template template : this.templateEntries) {
                if (arrayList.size() == 0) {
                    arrayList.add(Integer.valueOf(template.packageInfo().assetIdx()));
                } else {
                    for (Integer intValue : arrayList) {
                        int intValue2 = intValue.intValue();
                        int assetIdx = template.packageInfo().assetIdx();
                    }
                    arrayList.add(Integer.valueOf(template.packageInfo().assetIdx()));
                }
            }
            iArr = new int[arrayList.size()];
            for (int i = 0; i < iArr.length; i++) {
                iArr[i] = ((Integer) arrayList.get(i)).intValue();
            }
        }
        return iArr;
    }

    public Template getTemplateById(String str) {
        synchronized (this.m_templateEntryLock) {
            for (Template template : this.templateEntries) {
                if (template.id().compareTo(str) == 0) {
                    return template;
                }
            }
            return null;
        }
    }

    public String[] getTemplateIds() {
        String[] strArr = new String[this.templateEntries.size()];
        for (int i = 0; i < strArr.length; i++) {
            strArr[i] = ((Template) this.templateEntries.get(i)).id();
        }
        return strArr;
    }

    public String getTemplateItemId(boolean z, int i) {
        if (z) {
            loadTemplate();
        }
        String str = null;
        if (i < 2) {
            return null;
        }
        synchronized (this.m_templateEntryLock) {
            Iterator it = this.templateEntries.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Template template = (Template) it.next();
                if (template.packageInfo().assetIdx() == i) {
                    str = template.id();
                    break;
                }
            }
        }
        return str;
    }

    public List<Template> getTemplates() {
        if (this.externalView_templateEntries == null) {
            this.externalView_templateEntries = Collections.unmodifiableList(this.templateEntries);
        }
        return this.externalView_templateEntries;
    }

    public void installPackagesAsync(int i, OnInstallPackageListener onInstallPackageListener) {
        nexAssetPackageManager.getAssetPackageManager(com.nexstreaming.kminternal.kinemaster.config.a.a().b()).installPackagesAsync(i, onInstallPackageListener);
    }

    public void installPackagesAsync(OnInstallPackageListener onInstallPackageListener) {
        nexAssetPackageManager.getAssetPackageManager(com.nexstreaming.kminternal.kinemaster.config.a.a().b()).installPackagesAsync(onInstallPackageListener);
    }

    public boolean isInstallingPackages() {
        return nexAssetPackageManager.getAssetPackageManager(com.nexstreaming.kminternal.kinemaster.config.a.a().b()).isInstallingPackages();
    }

    public void loadTemplate() {
        resolveTemplate(false);
    }

    public void loadTemplate(final Runnable runnable) {
        new Thread(new Runnable() {
            public void run() {
                nexTemplateManager.this.resolveTemplate(false);
                runnable.run();
            }
        }).start();
    }

    public void loadTemplate(boolean z) {
        resolveTemplate(z);
    }

    /* access modifiers changed from: 0000 */
    public void onFirstFaceDone(nexClip nexclip, com.nexstreaming.kminternal.kinemaster.utils.facedetect.a aVar, int i) {
        boolean z;
        int width = nexclip.getCrop().getWidth();
        int height = nexclip.getCrop().getHeight();
        RectF rectF = new RectF();
        Rect rect = new Rect();
        Rect rect2 = new Rect();
        Rect rect3 = new Rect(0, 0, width, height);
        aVar.a(rectF);
        float f = (float) width;
        float f2 = (float) height;
        rect.set((int) (rectF.left * f), (int) (rectF.top * f2), (int) (rectF.right * f), (int) (rectF.bottom * f2));
        rect2.set((int) (rectF.left * f), (int) (rectF.top * f2), (int) (rectF.right * f), (int) (rectF.bottom * f2));
        if (rect.isEmpty()) {
            rect.set(0, 0, (width * 3) / 4, (height * 3) / 4);
            double d = (double) width;
            double random = Math.random();
            Double.isNaN(d);
            int i2 = (int) ((d * random) / 4.0d);
            double d2 = (double) height;
            double random2 = Math.random();
            Double.isNaN(d2);
            rect.offset(i2, (int) ((d2 * random2) / 4.0d));
            Log.d(TAG, "Face Detection Empty ");
            z = false;
        } else {
            int width2 = (width / 4) - rect.width();
            if (width2 >= 2) {
                int i3 = width2 / 2;
                rect.left -= i3;
                rect.right += i3;
                Log.d(TAG, "Face Detection width addSpace>0 ");
            }
            int height2 = (height / 4) - rect.height();
            if (height2 >= 2) {
                int i4 = height2 / 2;
                rect.top -= i4;
                rect.bottom += i4;
                Log.d(TAG, "Face Detection height addSpace>0 ");
            }
            nexclip.getCrop().growToAspect(rect, nexApplicationConfig.getAspectRatio());
            if (!rect.intersect(0, 0, width, height)) {
                rect.set(0, 0, (width * 2) / 3, (height * 2) / 3);
                Log.d(TAG, "Face Detection insect not ");
                double d3 = (double) width;
                double random3 = Math.random();
                Double.isNaN(d3);
                int i5 = (int) ((d3 * random3) / 3.0d);
                double d4 = (double) height;
                double random4 = Math.random();
                Double.isNaN(d4);
                rect.offset(i5, (int) ((d4 * random4) / 3.0d));
            }
            rect3.set(0, 0, (width * 3) / 4, (height * 3) / 4);
            double d5 = (double) width;
            double random5 = Math.random();
            Double.isNaN(d5);
            int i6 = (int) ((d5 * random5) / 4.0d);
            double d6 = (double) height;
            double random6 = Math.random();
            Double.isNaN(d6);
            rect3.offset(i6, (int) ((d6 * random6) / 4.0d));
            z = true;
        }
        if (z) {
            nexclip.getCrop().shrinkToAspect(rect, nexApplicationConfig.getAspectRatio());
            nexclip.getCrop().shrinkToAspect(rect3, nexApplicationConfig.getAspectRatio());
            Log.d(TAG, "Face Detection aync true  ");
            int i7 = (rect.right - rect.left) / 4;
            rect.left -= i7;
            rect.right += i7;
            int i8 = (rect.bottom - rect.top) / 4;
            rect.top -= i8;
            rect.bottom += i8;
            nexclip.getCrop().growToAspect(rect, nexApplicationConfig.getAspectRatio());
            nexclip.getCrop().setStartPosition(rect3);
            nexclip.getCrop().setEndPosition(rect);
            nexclip.getCrop().setFacePosition(rect2);
            nexclip.getCrop().getStartPositionRaw(rect3);
            nexclip.getCrop().getEndPositionRaw(rect);
            nexclip.getCrop().getFacePositionRaw(rect2);
            EditorGlobal.a().a(1, 1, rect3, rect, rect2);
        } else {
            nexclip.getCrop().shrinkToAspect(rect, nexApplicationConfig.getAspectRatio());
            if (i == 1) {
                nexclip.getCrop().shrinkToAspect(rect3, nexApplicationConfig.getAspectRatio());
            } else {
                nexclip.getCrop().growToAspect(rect3, nexApplicationConfig.getAspectRatio());
            }
            nexclip.getCrop().setStartPosition(rect);
            nexclip.getCrop().setEndPosition(rect3);
            nexclip.getCrop().setFacePosition(rect2);
            nexclip.getCrop().getStartPositionRaw(rect);
            nexclip.getCrop().getEndPositionRaw(rect3);
            nexclip.getCrop().getFacePositionRaw(rect2);
            Log.d(TAG, "Face Detection aync false  ");
            EditorGlobal.a().a(1, 0, rect3, rect, rect2);
        }
        nexclip.setFaceDetectProcessed(z, rect2);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Face Detection aync thread end =");
        sb.append(nexclip.getPath());
        Log.d(str, sb.toString());
    }

    public void setUseClipSpeed(boolean z) {
        this.mUseClipSpeed = z;
    }

    public void setVideoClipTrimMode(boolean z) {
        this.mUseVideoTrim = z;
    }

    public void setVideoMemorySize(int i) {
        this.mVideoMemorySize = i;
    }

    public void uninstallPackageById(String str) {
        nexAssetPackageManager.getAssetPackageManager(com.nexstreaming.kminternal.kinemaster.config.a.a().b()).uninstallPackageById(str);
    }

    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x005c, code lost:
        return r2;
     */
    public boolean updateTemplate(boolean z, Item item) {
        synchronized (this.m_templateEntryLock) {
            boolean z2 = true;
            if (!z) {
                Iterator it = this.templateEntries.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        z2 = false;
                        break;
                    }
                    Template template = (Template) it.next();
                    if (template.packageInfo().assetIdx() == item.packageInfo().assetIdx()) {
                        this.templateEntries.remove(template);
                        break;
                    }
                }
            } else {
                try {
                    if (item.hidden()) {
                        return false;
                    }
                    Template assetTemplate = getAssetTemplate(item.packageInfo().assetId());
                    if (assetTemplate == null) {
                        assetTemplate = Template.promote(item);
                        this.templateEntries.add(assetTemplate);
                    }
                    assetTemplate.setAspect(item.id());
                } finally {
                }
            }
        }
    }
}
