package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Rect;
import android.os.Environment;
import android.util.Log;
import android.util.SparseArray;
import android.view.animation.AccelerateDecelerateInterpolator;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.nexstreaming.app.common.nexasset.assetpackage.AssetPackageReader;
import com.nexstreaming.app.common.nexasset.assetpackage.c;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.util.b;
import com.nexstreaming.kminternal.kinemaster.config.EditorGlobal;
import com.nexstreaming.nexeditorsdk.exception.nexSDKException;
import com.nexstreaming.nexeditorsdk.nexCrop.CropMode;
import com.nexstreaming.nexeditorsdk.nexOverlayImage.runTimeMakeBitMap;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class nexTemplateComposer {
    private static final String TAG = "nexTemplateComposer";
    private static final String TAG_BRIGHTNESS = "brightness";
    private static final String TAG_COLOR_FILTER = "color_filter";
    private static final String TAG_CONTRAST = "contrast";
    private static final String TAG_CROP_MODE = "crop_mode";
    private static final String TAG_CROP_SPEED = "image_crop_speed";
    private static final String TAG_DURATION = "duration";
    private static final String TAG_EFFECTS = "effects";
    private static final String TAG_EXTERNAL_IMAGE_PATH = "external_image_path";
    private static final String TAG_EXTERNAL_VIDEO_PATH = "external_video_path";
    private static final String TAG_ID = "id";
    private static final String TAG_IMAGE_CROP_MODE = "image_crop_mode";
    private static final String TAG_LUT = "lut";
    private static final String TAG_SATURATION = "saturation";
    private static final String TAG_SOLID_COLOR = "solid_color";
    private static final String TAG_SOURCE_TYPE = "source_type";
    private static final String TAG_SPEED_CONTROL = "speed_control";
    private static final String TAG_TEMPLATE = "template";
    private static final String TAG_TEMPLATE_BGM = "template_bgm";
    private static final String TAG_TEMPLATE_BGM_VOLUME = "template_bgm_volume";
    private static final String TAG_TEMPLATE_DESCRIPTION = "template_desc";
    private static final String TAG_TEMPLATE_INTRO = "template_intro";
    private static final String TAG_TEMPLATE_LETTERBOX = "template_letterbox";
    private static final String TAG_TEMPLATE_LOOP = "template_loop";
    private static final String TAG_TEMPLATE_NAME = "template_name";
    private static final String TAG_TEMPLATE_OUTRO = "template_outro";
    private static final String TAG_TEMPLATE_VERSION = "template_version";
    private static final String TAG_TYPE = "type";
    private static final String TAG_VIDEO_CROP_MODE = "video_crop_mode";
    private static final String TAG_VIGNETTE = "vignette";
    private static final String TAG_VOLUME = "volume";
    private static final String cancelMassage = "cancel template";
    int introCount = 0;
    int loopCount = 0;
    private Context mAppContext;
    private String mBGMPath = null;
    private boolean mBGMTempFile = false;
    private boolean mCancel = false;
    private InputStream mInputStream;
    private JSONArray mIntroTemplateArray = null;
    private ArrayList<HashMap<String, String>> mIntroTemplateList = new ArrayList<>();
    private JSONArray mLoopTemplateArray = null;
    private ArrayList<HashMap<String, String>> mLoopTemplateList = new ArrayList<>();
    private JSONArray mOutroTemplateArray = null;
    private ArrayList<HashMap<String, String>> mOutroTemplateList = new ArrayList<>();
    private boolean mOverlappedTransition = true;
    private ArrayList<a> mOverlayList = new ArrayList<>();
    private nexProject mProject;
    /* access modifiers changed from: private */
    public Context mResContext;
    private c mTemplate = null;
    private JSONArray mTemplateArray = null;
    private String mTemplateFilePath;
    private String mTemplateID;
    private ArrayList<HashMap<String, String>> mTemplateList = new ArrayList<>();
    private SparseArray<Integer> mTemplateTypeCountList = new SparseArray<>();
    private String mTemplateVersion = null;
    private boolean mUseProjectSpeed;
    int tempClipID = 0;
    ArrayList<HashMap<String, String>> templateList;
    int templateListID = 0;

    private class a {
        private int b;
        private int c;
        private int d;
        private boolean e;
        private int f;
        private int g;
        private int h;
        private int i;

        public a(int i2, int i3, int i4, boolean z, int i5, int i6, int i7, int i8) {
            this.b = i2;
            this.c = i3;
            this.d = i4;
            this.e = z;
            this.f = i5;
            this.g = i6;
            this.h = i7;
            this.i = i8;
        }

        public int a() {
            return this.b;
        }

        public int b() {
            return this.c;
        }

        public int c() {
            return this.d;
        }

        public boolean d() {
            return this.e;
        }

        public int e() {
            return this.f;
        }

        public int f() {
            return this.g;
        }

        public int g() {
            return this.h;
        }

        public int h() {
            return this.i;
        }
    }

    static String AssetPackageTemplateJsonToString(String str) {
        f c = c.a().c(str);
        if (c == null) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("AssetPackageTemplateJsonToString info fail=");
            sb.append(str);
            Log.e(str2, sb.toString());
            return null;
        } else if (c.a().a(c.getAssetPackage())) {
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("AssetPackageTemplateJsonToString expire item id=");
            sb2.append(str);
            Log.e(str3, sb2.toString());
            return null;
        } else {
            try {
                AssetPackageReader a2 = AssetPackageReader.a(com.nexstreaming.kminternal.kinemaster.config.a.a().b(), c.getPackageURI(), c.getAssetPackage().getAssetId());
                String str4 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Template(");
                sb3.append(str);
                sb3.append(") Asset(");
                sb3.append(c.getAssetPackage().getAssetIdx());
                sb3.append(") version(In DB)=");
                sb3.append(c.getAssetPackage().getPackageVersion());
                sb3.append(", version(In reader)=");
                sb3.append(a2.b());
                Log.d(str4, sb3.toString());
                try {
                    InputStream a3 = a2.a(c.getFilePath());
                    if (a3 != null) {
                        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(a3));
                        StringBuilder sb4 = new StringBuilder();
                        while (true) {
                            String readLine = bufferedReader.readLine();
                            if (readLine != null) {
                                sb4.append(readLine);
                                sb4.append("\n");
                            } else {
                                a3.close();
                                String sb5 = sb4.toString();
                                b.a(a2);
                                return sb5;
                            }
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (Throwable th) {
                    b.a(a2);
                    throw th;
                }
                b.a(a2);
                return null;
            } catch (IOException e2) {
                e2.printStackTrace();
                return null;
            }
        }
    }

    static boolean checkEffectId(nexEffectLibrary nexeffectlibrary, String str) {
        if (str == null || str.compareToIgnoreCase("none") == 0 || str.compareToIgnoreCase("null") == 0 || nexeffectlibrary.checkEffectID(str)) {
            return true;
        }
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("missing effect: (");
        sb.append(str);
        sb.append("))");
        Log.d(str2, sb.toString());
        return false;
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x008c A[Catch:{ JSONException -> 0x00e8 }] */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x00af A[Catch:{ JSONException -> 0x00e8 }] */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x00d2 A[Catch:{ JSONException -> 0x00e8 }] */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x010d A[Catch:{ Exception | JSONException -> 0x0130 }] */
    static String[] checkMissEffects(nexEffectLibrary nexeffectlibrary, InputStream inputStream) {
        String str;
        JSONArray jSONArray;
        int i;
        JSONArray jSONArray2;
        int i2;
        JSONArray jSONArray3;
        int i3;
        String readFromFile = readFromFile(inputStream);
        ArrayList arrayList = new ArrayList();
        if (readFromFile != null) {
            try {
                JSONObject jSONObject = new JSONObject(readFromFile);
                String string = jSONObject.getString(TAG_TEMPLATE_NAME);
                try {
                    String string2 = jSONObject.getString(TAG_TEMPLATE_VERSION);
                    nexApplicationConfig.getDefaultLetterboxEffect();
                    if (jSONObject.has(TAG_TEMPLATE_LETTERBOX)) {
                        jSONObject.getString(TAG_TEMPLATE_LETTERBOX);
                    }
                    String string3 = jSONObject.getString(TAG_TEMPLATE_DESCRIPTION);
                    if (!string2.equals("v1.x")) {
                        if (!string2.equals("v2.0.0")) {
                            str = string2.equals("2.0.0") ? "template 2.0" : "template 1.0";
                            String str22 = TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Info(name, version, description): (");
                            sb2.append(string);
                            sb2.append(" ,");
                            sb2.append(str);
                            sb2.append(" ,");
                            sb2.append(string3);
                            sb2.append("))");
                            Log.d(str22, sb2.toString());
                            jSONArray = jSONObject.getJSONArray(TAG_TEMPLATE_INTRO);
                            for (i = 0; i < jSONArray.length(); i++) {
                                String string4 = jSONArray.getJSONObject(i).getString(TAG_EFFECTS);
                                if (!checkEffectId(nexeffectlibrary, string4)) {
                                    arrayList.add(string4);
                                }
                            }
                            jSONArray2 = jSONObject.getJSONArray(TAG_TEMPLATE_LOOP);
                            for (i2 = 0; i2 < jSONArray2.length(); i2++) {
                                String string5 = jSONArray2.getJSONObject(i2).getString(TAG_EFFECTS);
                                if (!checkEffectId(nexeffectlibrary, string5)) {
                                    arrayList.add(string5);
                                }
                            }
                            jSONArray3 = jSONObject.getJSONArray(TAG_TEMPLATE_OUTRO);
                            for (i3 = 0; i3 < jSONArray3.length(); i3++) {
                                String string6 = jSONArray3.getJSONObject(i3).getString(TAG_EFFECTS);
                                if (!checkEffectId(nexeffectlibrary, string6)) {
                                    arrayList.add(string6);
                                }
                            }
                            if (str.equals("template 1.0")) {
                                JSONArray jSONArray4 = jSONObject.getJSONArray(TAG_TEMPLATE);
                                for (int i4 = 0; i4 < jSONArray4.length(); i4++) {
                                    String string7 = jSONArray4.getJSONObject(i4).getString(TAG_EFFECTS);
                                    if (!checkEffectId(nexeffectlibrary, string7)) {
                                        arrayList.add(string7);
                                    }
                                }
                            }
                        }
                    }
                    str = "template 1.x";
                    String str222 = TAG;
                    StringBuilder sb22 = new StringBuilder();
                    sb22.append("Info(name, version, description): (");
                    sb22.append(string);
                    sb22.append(" ,");
                    sb22.append(str);
                    sb22.append(" ,");
                    sb22.append(string3);
                    sb22.append("))");
                    Log.d(str222, sb22.toString());
                    jSONArray = jSONObject.getJSONArray(TAG_TEMPLATE_INTRO);
                    while (i < jSONArray.length()) {
                    }
                    jSONArray2 = jSONObject.getJSONArray(TAG_TEMPLATE_LOOP);
                    while (i2 < jSONArray2.length()) {
                    }
                    jSONArray3 = jSONObject.getJSONArray(TAG_TEMPLATE_OUTRO);
                    while (i3 < jSONArray3.length()) {
                    }
                } catch (JSONException unused) {
                    String str3 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("Info(name: (");
                    sb3.append(string);
                    sb3.append("))");
                    Log.d(str3, sb3.toString());
                    str = "template 1.0";
                }
                if (str.equals("template 1.0")) {
                }
            } catch (Exception | JSONException unused2) {
            }
        }
        if (arrayList.size() <= 0) {
            return null;
        }
        String[] strArr = new String[arrayList.size()];
        for (int i5 = 0; i5 < arrayList.size(); i5++) {
            strArr[i5] = ((String) arrayList.get(i5)).toString();
        }
        return strArr;
    }

    static void in2sdcard(InputStream inputStream, File file) throws IOException {
        byte[] bArr = new byte[1024];
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream fileOutputStream2 = new FileOutputStream(file);
            while (true) {
                try {
                    int read = inputStream.read(bArr);
                    if (read <= 0) {
                        fileOutputStream2.close();
                        return;
                    }
                    fileOutputStream2.write(bArr, 0, read);
                } catch (IOException e) {
                    e = e;
                    fileOutputStream = fileOutputStream2;
                } catch (Throwable th) {
                    th = th;
                    fileOutputStream = fileOutputStream2;
                    if (fileOutputStream != null) {
                        fileOutputStream.close();
                    }
                    throw th;
                }
            }
        } catch (IOException e2) {
            e = e2;
            try {
                throw e;
            } catch (Throwable th2) {
                th = th2;
            }
        }
    }

    static String readFromFile(InputStream inputStream) {
        String str;
        if (inputStream != null) {
            try {
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
                StringBuilder sb = new StringBuilder();
                while (true) {
                    String readLine = bufferedReader.readLine();
                    if (readLine == null) {
                        break;
                    }
                    sb.append(readLine);
                    sb.append("\n");
                }
                inputStream.close();
                str = sb.toString();
            } catch (IOException e) {
                return e.getMessage();
            }
        } else {
            str = null;
        }
        return str;
    }

    static String readFromFile(String str) {
        BufferedInputStream bufferedInputStream;
        try {
            bufferedInputStream = new BufferedInputStream(new FileInputStream(new File(str)));
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(bufferedInputStream));
            StringBuilder sb = new StringBuilder();
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine != null) {
                    sb.append(readLine);
                    sb.append("\n");
                } else {
                    bufferedInputStream.close();
                    bufferedInputStream.close();
                    return sb.toString();
                }
            }
        } catch (FileNotFoundException e) {
            return e.getMessage();
        } catch (IOException e2) {
            return e2.getMessage();
        } catch (Throwable th) {
            r0.addSuppressed(th);
        }
        throw th;
    }

    /* access modifiers changed from: 0000 */
    public boolean addSpecialClip2Project(nexProject nexproject) {
        if (!((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("EXTERNAL_VIDEO") && !((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("EXTERNAL_IMAGE") && !((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("SOLID")) {
            return false;
        }
        if (((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("EXTERNAL_VIDEO")) {
            nexClip supportedClip = nexClip.getSupportedClip((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_EXTERNAL_VIDEO_PATH));
            if (supportedClip != null) {
                nexproject.add(supportedClip);
                if (this.templateList == this.mIntroTemplateList) {
                    this.introCount++;
                } else if (this.templateList == this.mLoopTemplateList) {
                    this.loopCount++;
                }
                this.tempClipID++;
            }
        } else {
            int parseInt = Integer.parseInt((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_DURATION));
            if (((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("EXTERNAL_IMAGE")) {
                nexClip supportedClip2 = nexClip.getSupportedClip((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_EXTERNAL_IMAGE_PATH));
                if (supportedClip2 != null) {
                    supportedClip2.setImageClipDuration(parseInt);
                    nexproject.add(supportedClip2);
                    if (this.templateList == this.mIntroTemplateList) {
                        this.introCount++;
                    } else if (this.templateList == this.mLoopTemplateList) {
                        this.loopCount++;
                    }
                    this.tempClipID++;
                }
            } else {
                nexClip solidClip = nexClip.getSolidClip(Color.parseColor((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOLID_COLOR)));
                if (solidClip != null) {
                    solidClip.setImageClipDuration(parseInt);
                    nexproject.add(solidClip);
                    if (this.templateList == this.mIntroTemplateList) {
                        this.introCount++;
                    } else if (this.templateList == this.mLoopTemplateList) {
                        this.loopCount++;
                    }
                    this.tempClipID++;
                }
            }
        }
        manageTemplateList(true);
        return true;
    }

    /* access modifiers changed from: 0000 */
    public void addTemplateOverlay(int i, String str) {
        String[] split = str.split(",");
        String str2 = split[0];
        String str3 = split[1];
        String str4 = split[2];
        String str5 = split[3];
        String str6 = split[4];
        String str7 = split[5];
        String str8 = split[6];
        String str9 = split[7];
        String str10 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("clipID=");
        sb.append(i);
        sb.append(" /type=");
        sb.append(str2);
        sb.append(" /duration=");
        sb.append(str3);
        sb.append(" /variation=");
        sb.append(str4);
        sb.append(" /activeAnimation=");
        sb.append(str5);
        sb.append(" /inAnimationStartTime=");
        sb.append(str6);
        sb.append(" /inAnimationTime=");
        sb.append(str7);
        sb.append(" /outAnimationStartTime=");
        sb.append(str8);
        sb.append(" /outAnimationTime=");
        sb.append(str9);
        Log.d(str10, sb.toString());
        if (str2.equals("overlay")) {
            a aVar = new a(i, Integer.parseInt(str3), Integer.parseInt(str4), Boolean.parseBoolean(str5), Integer.parseInt(str6), Integer.parseInt(str7), Integer.parseInt(str8), Integer.parseInt(str9));
            this.mOverlayList.add(aVar);
            return;
        }
    }

    /* access modifiers changed from: 0000 */
    public void applyBGM2Project(nexProject nexproject, String str) {
        if (str != null) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("bgm path1=");
            sb.append(str);
            Log.d(str2, sb.toString());
            if (this.mTemplateID != null) {
                if (str.equalsIgnoreCase("null")) {
                    nexproject.setBackgroundMusicPath(null);
                } else {
                    nexproject.setBackgroundMusicPath(nexAssetPackageManager.getAssetPackageMediaPath(this.mAppContext, str));
                }
            } else if (str.equalsIgnoreCase("null")) {
                nexproject.setBackgroundMusicPath(null);
            } else {
                if (str.regionMatches(true, 0, TAG_TEMPLATE, 0, 8)) {
                    try {
                        nexproject.setBackgroundMusicPath(raw2file(this.mAppContext, this.mResContext, str));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    if (str.contains("/storage/")) {
                        String absolutePath = Environment.getExternalStorageDirectory().getAbsolutePath();
                        str = str.contains("/storage/emulated/0") ? str.replace("/storage/emulated/0", absolutePath) : str.replace("/storage", absolutePath);
                    }
                    nexproject.setBackgroundMusicPath(str);
                }
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public String applyTemplateOnProject(nexProject nexproject) {
        if (this.mTemplate == null) {
            return "Template did not exist while apply template 2.0";
        }
        int g = this.mTemplate.g();
        for (int i = 0; i < nexproject.getTotalClipCount(true); i++) {
            nexClip clip = nexproject.getClip(i, true);
            if (clip.getClipType() == 1) {
                clip.setImageClipDuration(g);
            }
        }
        nexproject.updateProject();
        nexproject.setTemplageOverlappedTransitionMode(this.mOverlappedTransition);
        String a2 = this.mTemplate.a(nexproject, this.mAppContext, this.mResContext, this.mUseProjectSpeed, this.mOverlappedTransition);
        if (a2 != null) {
            return a2;
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public void consistProjectViaVer1(nexProject nexproject) {
        this.templateList = this.mTemplateList;
        nexProject clone = nexProject.clone(nexproject);
        nexproject.allClear(true);
        this.templateListID = 0;
        int i = 0;
        int i2 = 100;
        do {
            if (clone.getClip(i, true).getClipType() == 4) {
                int rotateDegree = clone.getClip(i, true).getRotateDegree();
                if (this.mUseProjectSpeed) {
                    i2 = clone.getClip(i, true).getVideoClipEdit().getSpeedControl();
                }
                int i3 = i2;
                int startTrimTime = clone.getClip(i, true).getVideoClipEdit().getStartTrimTime();
                int duration = this.mUseProjectSpeed ? clone.getClip(i, true).getVideoClipEdit().getDuration() : (clone.getClip(i, true).getVideoClipEdit().getEndTrimTime() == 0 ? clone.getClip(i, true).getTotalTime() : clone.getClip(i, true).getVideoClipEdit().getEndTrimTime()) - startTrimTime;
                nexClip dup = nexClip.dup(clone.getClip(i, true));
                int i4 = startTrimTime;
                boolean z = true;
                while (!this.mCancel) {
                    int parseInt = Integer.parseInt((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_DURATION));
                    if (parseInt < 0) {
                        parseInt = 0;
                    }
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("remainTime2Project=");
                    sb.append(duration);
                    sb.append(", defined_duration=");
                    sb.append(parseInt);
                    sb.append(", templateListID=");
                    sb.append(this.templateListID);
                    Log.d(str, sb.toString());
                    duration -= parseInt;
                    if (duration <= 500) {
                        parseInt += duration;
                        z = false;
                    }
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("index=");
                    sb2.append(0);
                    sb2.append(", defined_duration=");
                    sb2.append(parseInt);
                    sb2.append(", loop=");
                    sb2.append(z);
                    Log.d(str2, sb2.toString());
                    if (this.mUseProjectSpeed) {
                        parseInt = (int) (((float) parseInt) * (((float) i3) / 100.0f));
                    }
                    nexproject.add(nexClip.dup(dup));
                    if (((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("ALL") || ((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("VIDEO")) {
                        nexproject.getLastPrimaryClip().setRotateDegree(rotateDegree);
                        if (this.mUseProjectSpeed) {
                            nexproject.getLastPrimaryClip().getVideoClipEdit().setSpeedControl(i3);
                        }
                        nexproject.getLastPrimaryClip().getVideoClipEdit().setTrim(i4, i4 + parseInt);
                    }
                    Rect rect = new Rect();
                    clone.getClip(i, true).getCrop().getStartPositionRaw(rect);
                    nexproject.getLastPrimaryClip().getCrop().setStartPositionRaw(rect);
                    clone.getClip(i, true).getCrop().getEndPositionRaw(rect);
                    nexproject.getLastPrimaryClip().getCrop().setEndPositionRaw(rect);
                    i4 += parseInt;
                    this.templateListID += 2;
                    String str3 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("templateListID=");
                    sb3.append(this.templateListID);
                    sb3.append(", templateList.size()=");
                    sb3.append(this.templateList.size());
                    Log.d(str3, sb3.toString());
                    if (this.templateListID >= this.templateList.size()) {
                        this.templateListID = 0;
                        continue;
                    }
                    if (!z) {
                        i2 = i3;
                    }
                }
                return;
            } else if (clone.getClip(i, true).getClipType() == 1) {
                int parseInt2 = Integer.parseInt((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_DURATION));
                int rotateDegree2 = clone.getClip(i, true).getRotateDegree();
                nexClip dup2 = nexClip.dup(clone.getClip(i, true));
                nexproject.add(dup2);
                dup2.setRotateDegree(rotateDegree2);
                dup2.setImageClipDuration(parseInt2);
                Rect rect2 = new Rect();
                clone.getClip(i, true).getCrop().getStartPositionRaw(rect2);
                dup2.getCrop().setStartPositionRaw(rect2);
                clone.getClip(i, true).getCrop().getEndPositionRaw(rect2);
                dup2.getCrop().setEndPositionRaw(rect2);
                this.templateListID += 2;
                if (this.templateListID >= this.templateList.size()) {
                    this.templateListID = 0;
                }
            } else {
                String str4 = TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("not support_type in template:");
                sb4.append(clone.getClip(i, true).getClipType());
                Log.d(str4, sb4.toString());
            }
            i++;
        } while (i < clone.getTotalClipCount(true));
        nexproject.updateProject();
    }

    /* access modifiers changed from: 0000 */
    public void consistProjectViaVer2(nexProject nexproject) {
        int i;
        int i2;
        boolean z;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        boolean z2;
        int i9;
        boolean z3;
        boolean z4;
        boolean z5;
        nexProject nexproject2 = nexproject;
        int i10 = 0;
        int i11 = 0;
        for (int i12 = 0; i12 < this.mIntroTemplateList.size(); i12 += 2) {
            i11 += Integer.parseInt((String) ((HashMap) this.mIntroTemplateList.get(i12)).get(TAG_DURATION));
        }
        int i13 = 0;
        for (int i14 = 0; i14 < this.mOutroTemplateList.size(); i14 += 2) {
            i13 += Integer.parseInt((String) ((HashMap) this.mOutroTemplateList.get(i14)).get(TAG_DURATION));
        }
        this.templateList = this.mIntroTemplateList;
        nexProject clone = nexProject.clone(nexproject);
        boolean z6 = true;
        nexproject2.allClear(true);
        int i15 = 0;
        int i16 = 0;
        boolean z7 = false;
        while (true) {
            if (clone.getClip(i15, z6).getClipType() == 4) {
                int rotateDegree = clone.getClip(i15, z6).getRotateDegree();
                int speedControl = clone.getClip(i15, z6).getVideoClipEdit().getSpeedControl();
                int startTrimTime = clone.getClip(i15, z6).getVideoClipEdit().getStartTrimTime();
                int totalTime = clone.getClip(i15, z6).getVideoClipEdit().getEndTrimTime() == 0 ? clone.getClip(i15, z6).getTotalTime() : clone.getClip(i15, z6).getVideoClipEdit().getEndTrimTime();
                nexClip dup = nexClip.dup(clone.getClip(i15, z6));
                this.tempClipID = nexproject2.getTotalClipCount(z6);
                if (this.tempClipID < 0) {
                    this.tempClipID = i10;
                }
                int i17 = totalTime - startTrimTime;
                int i18 = i11 + i13;
                if (i18 >= i17) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    boolean z8 = z7;
                    sb.append("OVER durationOfSourceClip/ introDuration:");
                    sb.append(i11);
                    sb.append(" outroDuration:");
                    sb.append(i13);
                    sb.append(" sourceDuration:");
                    sb.append(i17);
                    Log.d(str, sb.toString());
                    i4 = i16;
                    i5 = i17;
                    z7 = z8;
                } else {
                    boolean z9 = z7;
                    i5 = i17 - i13;
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    int i19 = startTrimTime;
                    sb2.append("UNDER durationOfSourceClip/ introDuration:");
                    sb2.append(i11);
                    sb2.append(" outroDuration:");
                    sb2.append(i13);
                    sb2.append(" remainTime2Project:");
                    sb2.append(i5);
                    Log.d(str2, sb2.toString());
                    i4 = i16;
                    z7 = z9;
                    startTrimTime = i19;
                }
                while (!this.mCancel) {
                    addSpecialClip2Project(nexproject);
                    i2 = i11;
                    int parseInt = Integer.parseInt((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_DURATION)) < 0 ? 0 : Integer.parseInt((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_DURATION));
                    int i20 = i5 - parseInt;
                    i = i13;
                    int i21 = this.templateListID;
                    while (true) {
                        i21 += 2;
                        i6 = i15;
                        if (i21 >= this.templateList.size()) {
                            i21 = 0;
                        }
                        i7 = totalTime;
                        if (!((String) ((HashMap) this.templateList.get(i21)).get(TAG_SOURCE_TYPE)).equals("EXTERNAL_VIDEO") && !((String) ((HashMap) this.templateList.get(i21)).get(TAG_SOURCE_TYPE)).equals("EXTERNAL_IMAGE") && !((String) ((HashMap) this.templateList.get(i21)).get(TAG_SOURCE_TYPE)).equals("SOLID")) {
                            break;
                        }
                        totalTime = i7;
                        i15 = i6;
                        z7 = z7;
                    }
                    int parseInt2 = Integer.parseInt((String) ((HashMap) this.templateList.get(i21)).get(TAG_DURATION));
                    if (this.templateList == this.mOutroTemplateList || z7) {
                        boolean z10 = z7;
                        nexproject2.add(nexClip.dup(dup));
                        nexClip clip = nexproject2.getClip(this.tempClipID, true);
                        if ((((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("ALL") || ((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("VIDEO")) && clip.getClipType() == 4) {
                            clip.setRotateDegree(rotateDegree);
                            clip.getVideoClipEdit().setSpeedControl(speedControl);
                            i9 = i7;
                            clip.getVideoClipEdit().setTrim(startTrimTime, i9);
                        } else {
                            i9 = i7;
                        }
                        startTrimTime += i8;
                        if (z10) {
                            if (this.templateList == this.mIntroTemplateList) {
                                z = true;
                                this.introCount++;
                            } else {
                                z = true;
                                if (this.templateList == this.mLoopTemplateList) {
                                    this.loopCount++;
                                }
                            }
                            manageTemplateList(z);
                            z10 = false;
                        } else {
                            z = true;
                        }
                        z2 = z10;
                    } else {
                        String str3 = TAG;
                        StringBuilder sb3 = new StringBuilder();
                        boolean z11 = z7;
                        sb3.append("id:");
                        nexProject nexproject3 = clone;
                        sb3.append(Integer.parseInt((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_ID)));
                        sb3.append("/ current defined duration:");
                        sb3.append(parseInt);
                        sb3.append("/ next defined duration:");
                        sb3.append(parseInt2);
                        sb3.append("/ remain duration(based on source_duration - outro_duration)):");
                        sb3.append(i20);
                        Log.d(str3, sb3.toString());
                        if (i18 >= i17) {
                            nexproject2.add(nexClip.dup(dup));
                            int i22 = this.tempClipID;
                            this.tempClipID = i22 + 1;
                            nexClip clip2 = nexproject2.getClip(i22, true);
                            if ((((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("ALL") || ((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("VIDEO")) && clip2.getClipType() == 4) {
                                clip2.setRotateDegree(rotateDegree);
                                clip2.getVideoClipEdit().setSpeedControl(speedControl);
                                clip2.getVideoClipEdit().setTrim(startTrimTime, (i5 / 2) + startTrimTime);
                            }
                            startTrimTime += i5 / 2;
                            if (this.templateList == this.mIntroTemplateList) {
                                z5 = true;
                                this.introCount++;
                            } else {
                                z5 = true;
                                this.loopCount++;
                            }
                            i4++;
                            clone = nexproject3;
                            if (i4 < clone.getTotalClipCount(z5)) {
                                Log.d(TAG, "video,case 1] some clips exist in the source project.");
                                manageTemplateList(z5);
                            } else {
                                this.introCount += z5 ? 1 : 0;
                                manageTemplateList(false);
                                z5 = z11;
                            }
                            z2 = z5;
                            i8 = i7;
                        } else {
                            clone = nexproject3;
                            if (i20 <= parseInt2) {
                                nexproject2.add(nexClip.dup(dup));
                                int i23 = this.tempClipID;
                                this.tempClipID = i23 + 1;
                                nexClip clip3 = nexproject2.getClip(i23, true);
                                if ((((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("ALL") || ((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("VIDEO")) && clip3.getClipType() == 4) {
                                    clip3.setRotateDegree(rotateDegree);
                                    clip3.getVideoClipEdit().setSpeedControl(speedControl);
                                    clip3.getVideoClipEdit().setTrim(startTrimTime, (i20 / 2) + parseInt + startTrimTime);
                                }
                                startTrimTime += parseInt + (i20 / 2);
                                if (this.templateList == this.mIntroTemplateList) {
                                    z3 = true;
                                    this.introCount++;
                                } else {
                                    z3 = true;
                                    this.loopCount++;
                                }
                                i4++;
                                if (i4 < clone.getTotalClipCount(z3)) {
                                    Log.d(TAG, "video,case 3] the certain clip exist in the source project.");
                                    manageTemplateList(z3);
                                    i8 = i7;
                                    z = true;
                                    z2 = true;
                                } else {
                                    manageTemplateList(false);
                                }
                            } else if (i20 >= 0) {
                                nexproject2.add(nexClip.dup(dup));
                                int i24 = this.tempClipID;
                                this.tempClipID = i24 + 1;
                                nexClip clip4 = nexproject2.getClip(i24, true);
                                if ((((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("ALL") || ((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SOURCE_TYPE)).equals("VIDEO")) && clip4.getClipType() == 4) {
                                    clip4.setRotateDegree(rotateDegree);
                                    clip4.getVideoClipEdit().setSpeedControl(speedControl);
                                    clip4.getVideoClipEdit().setTrim(startTrimTime, startTrimTime + parseInt);
                                }
                                startTrimTime += parseInt;
                                if (this.templateList == this.mIntroTemplateList) {
                                    z4 = true;
                                    this.introCount++;
                                } else {
                                    z4 = true;
                                    this.loopCount++;
                                }
                                manageTemplateList(z4);
                                i5 = i20;
                            }
                            i8 = i7;
                            z2 = z11;
                        }
                        z = true;
                    }
                    if (startTrimTime >= totalTime) {
                        i16 = i4;
                        i3 = i6;
                    } else {
                        i11 = i2;
                        i13 = i;
                        i15 = i6;
                    }
                }
                return;
            }
            i2 = i11;
            i = i13;
            i3 = i15;
            boolean z12 = z7;
            z = true;
            if (clone.getClip(i3, true).getClipType() == 1) {
                addSpecialClip2Project(nexproject);
                int parseInt3 = Integer.parseInt((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_DURATION));
                int rotateDegree2 = clone.getClip(i3, true).getRotateDegree();
                nexClip dup2 = nexClip.dup(clone.getClip(i3, true));
                dup2.setRotateDegree(rotateDegree2);
                dup2.setImageClipDuration(parseInt3);
                nexproject2.add(dup2);
                i16++;
                if (i16 < clone.getTotalClipCount(true)) {
                    if (this.templateList == this.mIntroTemplateList) {
                        this.introCount++;
                    } else {
                        this.loopCount++;
                    }
                    if (i16 != clone.getTotalClipCount(true) - 1) {
                        Log.d(TAG, "image] some clips exist in the source project.");
                        manageTemplateList(true);
                    } else if (clone.getClip(i16, true).getClipType() == 4) {
                        Log.d(TAG, "image] the clipType of last clip is video, and go continually");
                        manageTemplateList(true);
                    } else {
                        Log.d(TAG, "image] the clipType of last clip is image, and goto OutTroTemplate");
                        manageTemplateList(false);
                    }
                } else {
                    Log.d(TAG, "image] No more any clip after this image clip.");
                    this.mTemplateTypeCountList.append(2, Integer.valueOf(1));
                }
            } else {
                String str4 = TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("not support_type in template:");
                sb4.append(clone.getClip(i3, true).getClipType());
                Log.d(str4, sb4.toString());
            }
            z7 = z12;
            int i25 = i3 + 1;
            if (i25 >= clone.getTotalClipCount(z)) {
                String str5 = TAG;
                StringBuilder sb5 = new StringBuilder();
                sb5.append("intro:");
                sb5.append(this.mTemplateTypeCountList.get(0));
                sb5.append(" loop:");
                sb5.append(this.mTemplateTypeCountList.get(1));
                sb5.append(" out-ro:");
                sb5.append(this.mTemplateTypeCountList.get(2));
                Log.d(str5, sb5.toString());
                nexproject.updateProject();
                return;
            }
            i15 = i25;
            i11 = i2;
            i13 = i;
            i10 = 0;
            z6 = true;
        }
    }

    public nexProject createProject() {
        return new nexProject();
    }

    /* access modifiers changed from: 0000 */
    public nexColorEffect getColorEffect(int i) {
        return (nexColorEffect) nexColorEffect.getPresetList().get(i);
    }

    /* access modifiers changed from: 0000 */
    public String getValue(JSONObject jSONObject, String str) {
        try {
            return jSONObject.getString(str);
        } catch (JSONException unused) {
            if (str.equals(TAG_EFFECTS)) {
                return "none";
            }
            if (str.equals(TAG_ID) || str.equals(TAG_VOLUME)) {
                return MovieStatUtils.DOWNLOAD_SUCCESS;
            }
            if (str.equals(TAG_SOURCE_TYPE)) {
                return "ALL";
            }
            if (str.equals(TAG_EXTERNAL_VIDEO_PATH) || str.equals(TAG_EXTERNAL_IMAGE_PATH) || str.equals(TAG_SOLID_COLOR) || str.equals(TAG_LUT)) {
                return null;
            }
            return str.equals(TAG_VIGNETTE) ? "clip,no" : str.equals(TAG_CROP_MODE) ? "" : str.equals(TAG_CROP_SPEED) ? MovieStatUtils.DOWNLOAD_SUCCESS : "default";
        }
    }

    /* access modifiers changed from: 0000 */
    public void in2file(Context context, InputStream inputStream, String str) throws Exception {
        OutputStream outputStream;
        byte[] bArr = new byte[1024];
        OutputStream outputStream2 = null;
        try {
            outputStream = context.openFileOutput(str, 1);
            while (true) {
                try {
                    int read = inputStream.read(bArr);
                    if (read <= 0) {
                        break;
                    }
                    outputStream.write(bArr, 0, read);
                } catch (Exception e) {
                    e = e;
                    outputStream2 = outputStream;
                } catch (Throwable th) {
                    th = th;
                    if (inputStream != null) {
                        inputStream.close();
                    }
                    if (outputStream != null) {
                        outputStream.close();
                    }
                    throw th;
                }
            }
            if (inputStream != null) {
                inputStream.close();
            }
            if (outputStream != null) {
                outputStream.close();
            }
        } catch (Exception e2) {
            e = e2;
            try {
                throw e;
            } catch (Throwable th2) {
                th = th2;
                outputStream = outputStream2;
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void initTemplateComposer(nexProject nexproject, Context context, Context context2, String str) throws nexSDKException {
        this.mProject = nexproject;
        this.mAppContext = context;
        this.mResContext = context2;
        this.mCancel = false;
        this.mTemplateID = null;
        this.mTemplateFilePath = null;
        this.mInputStream = null;
        this.mTemplateID = str;
        release();
        this.mTemplateTypeCountList.append(0, Integer.valueOf(0));
        this.mTemplateTypeCountList.append(1, Integer.valueOf(0));
        this.mTemplateTypeCountList.append(2, Integer.valueOf(0));
    }

    /* access modifiers changed from: 0000 */
    public void manageTemplateList(boolean z) {
        if (this.templateList == this.mIntroTemplateList) {
            this.mTemplateTypeCountList.append(0, Integer.valueOf(this.introCount));
        } else if (this.templateList == this.mLoopTemplateList) {
            this.mTemplateTypeCountList.append(1, Integer.valueOf(this.loopCount));
        }
        this.templateListID += 2;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("templateListID/templateList.size:");
        sb.append(this.templateListID);
        sb.append("/");
        sb.append(this.templateList.size());
        Log.d(str, sb.toString());
        if (z) {
            if (this.templateListID < this.templateList.size()) {
                return;
            }
            if (this.templateList == this.mIntroTemplateList) {
                this.templateListID = 0;
                this.templateList = this.mLoopTemplateList;
                Log.d(TAG, "intro -> loop");
            } else if (this.templateList == this.mLoopTemplateList) {
                this.templateListID = 0;
                Log.d(TAG, "loop -> loop");
            }
        } else if (this.templateList == this.mIntroTemplateList) {
            this.templateListID = 0;
            this.templateList = this.mOutroTemplateList;
            this.mTemplateTypeCountList.append(2, Integer.valueOf(1));
            Log.d(TAG, "intro -> outro");
        } else if (this.templateList == this.mLoopTemplateList) {
            this.templateListID = 0;
            this.templateList = this.mOutroTemplateList;
            this.mTemplateTypeCountList.append(2, Integer.valueOf(1));
            Log.d(TAG, "loop -> outro");
        }
    }

    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x0129, code lost:
        r4 = TAG;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:?, code lost:
        r5 = new java.lang.StringBuilder();
        r5.append("Info(name: (");
        r5.append(r0);
        r5.append("))");
        android.util.Log.d(r4, r5.toString());
        r8.mIntroTemplateList.clear();
        r8.mLoopTemplateList.clear();
        r8.mOutroTemplateList.clear();
        r8.mTemplateVersion = "template 1.0";
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x018d, code lost:
        r9 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x0192, code lost:
        return r9.getMessage();
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x0161 A[Catch:{ JSONException -> 0x0193, Exception -> 0x018d }] */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x018d A[ExcHandler: Exception (r9v4 'e' java.lang.Exception A[CUSTOM_DECLARE]), Splitter:B:11:0x0025] */
    public String parsingJSONFile(nexProject nexproject) {
        String str = this.mTemplateID != null ? AssetPackageTemplateJsonToString(this.mTemplateID) : this.mTemplateFilePath != null ? readFromFile(this.mTemplateFilePath) : this.mInputStream != null ? readFromFile(this.mInputStream) : null;
        if (str == null) {
            return "template parsing fail!";
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString(TAG_TEMPLATE_NAME);
            String string2 = jSONObject.getString(TAG_TEMPLATE_VERSION);
            String defaultLetterboxEffect = nexApplicationConfig.getDefaultLetterboxEffect();
            if (jSONObject.has(TAG_TEMPLATE_LETTERBOX)) {
                defaultLetterboxEffect = jSONObject.getString(TAG_TEMPLATE_LETTERBOX);
            }
            nexproject.setLetterboxEffect(defaultLetterboxEffect);
            String string3 = jSONObject.getString(TAG_TEMPLATE_DESCRIPTION);
            if (!string2.equals("v1.x")) {
                if (!string2.equals("v2.0.0")) {
                    this.mTemplateVersion = "template 2.0";
                    this.mTemplate = new c();
                    String a2 = this.mTemplate.a(this.mTemplateFilePath, jSONObject);
                    if (a2 != null) {
                        return a2;
                    }
                    if (this.mTemplateVersion.equals("template 1.0")) {
                        this.mTemplateArray = jSONObject.getJSONArray(TAG_TEMPLATE);
                        for (int i = 0; i < this.mTemplateArray.length(); i++) {
                            this.mTemplateList.add(setParameter2List(this.mTemplateArray.getJSONObject(i)));
                        }
                        applyBGM2Project(nexproject, jSONObject.getString(TAG_TEMPLATE_BGM));
                    }
                    return null;
                }
            }
            this.mTemplateVersion = "template 1.x";
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Info(name, version, description): (");
            sb.append(string);
            sb.append(" ,");
            sb.append(this.mTemplateVersion);
            sb.append(" ,");
            sb.append(string3);
            sb.append("))");
            Log.d(str2, sb.toString());
            applyBGM2Project(nexproject, jSONObject.getString(TAG_TEMPLATE_BGM));
            nexproject.setBGMMasterVolumeScale(Float.parseFloat(jSONObject.getString(TAG_TEMPLATE_BGM_VOLUME)));
            this.mIntroTemplateArray = jSONObject.getJSONArray(TAG_TEMPLATE_INTRO);
            for (int i2 = 0; i2 < this.mIntroTemplateArray.length(); i2++) {
                this.mIntroTemplateList.add(setParameter2List(this.mIntroTemplateArray.getJSONObject(i2)));
            }
            this.mLoopTemplateArray = jSONObject.getJSONArray(TAG_TEMPLATE_LOOP);
            for (int i3 = 0; i3 < this.mLoopTemplateArray.length(); i3++) {
                this.mLoopTemplateList.add(setParameter2List(this.mLoopTemplateArray.getJSONObject(i3)));
            }
            this.mOutroTemplateArray = jSONObject.getJSONArray(TAG_TEMPLATE_OUTRO);
            for (int i4 = 0; i4 < this.mOutroTemplateArray.length(); i4++) {
                this.mOutroTemplateList.add(setParameter2List(this.mOutroTemplateArray.getJSONObject(i4)));
            }
            if (this.mTemplateVersion.equals("template 1.0")) {
            }
            return null;
        } catch (JSONException e) {
            return e.getMessage();
        } catch (Exception e2) {
        }
    }

    /* access modifiers changed from: 0000 */
    public String raw2file(Context context, Context context2, String str) throws Exception {
        int lastIndexOf = str.lastIndexOf("/");
        StringBuilder sb = new StringBuilder();
        sb.append(EditorGlobal.f().getAbsolutePath());
        sb.append(File.separator);
        sb.append(TAG_TEMPLATE);
        sb.append(File.separator);
        int i = lastIndexOf + 1;
        sb.append(str.substring(i, str.length()));
        String sb2 = sb.toString();
        File file = new File(sb2);
        AssetManager assets = context2.getAssets();
        if (file.isFile()) {
            try {
                AssetFileDescriptor openFd = assets.openFd(str);
                if (file.length() == openFd.getLength()) {
                    openFd.close();
                    Log.d(TAG, "bgm file found in sdcard.");
                    this.mBGMPath = sb2;
                    return this.mBGMPath;
                }
                openFd.close();
            } catch (IOException unused) {
                Log.d(TAG, "bgm file found in sdcard.");
                this.mBGMPath = sb2;
                return this.mBGMPath;
            }
        }
        InputStream open = assets.open(str);
        if (open != null) {
            try {
                StringBuilder sb3 = new StringBuilder();
                sb3.append(EditorGlobal.f().getAbsolutePath());
                sb3.append(File.separator);
                sb3.append(TAG_TEMPLATE);
                File file2 = new File(sb3.toString());
                if (!file2.exists()) {
                    file2.mkdirs();
                }
                in2sdcard(open, file);
                Log.d(TAG, "bgm file copy assete to sdcard.");
                open.close();
                this.mBGMPath = sb2;
                return this.mBGMPath;
            } catch (Exception unused2) {
                String substring = str.substring(i, str.length());
                try {
                    in2file(context, open, substring);
                    Log.d(TAG, "bgm file copy assete to temp data.");
                    this.mBGMTempFile = true;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append(context.getFilesDir().getAbsolutePath());
                    sb4.append(File.separator);
                    sb4.append(substring);
                    this.mBGMPath = sb4.toString();
                    return this.mBGMPath;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    public void release() {
        this.introCount = 0;
        this.loopCount = 0;
        this.tempClipID = 0;
        this.mCancel = false;
        if (this.mTemplate != null) {
            this.mTemplate.a();
        }
        if (this.mTemplateList != null) {
            this.mTemplateList.clear();
        }
        if (this.mIntroTemplateList != null) {
            this.mIntroTemplateList.clear();
        }
        if (this.mLoopTemplateList != null) {
            this.mLoopTemplateList.clear();
        }
        if (this.mOutroTemplateList != null) {
            this.mOutroTemplateList.clear();
        }
        if (this.mTemplateTypeCountList != null) {
            this.mTemplateTypeCountList.clear();
        }
        if (this.mOverlayList != null) {
            this.mOverlayList.clear();
        }
        if (this.mBGMPath != null && this.mBGMTempFile) {
            new File(this.mBGMPath).delete();
        }
        this.templateListID = 0;
        this.mTemplateVersion = null;
    }

    /* access modifiers changed from: 0000 */
    public void setCancel() {
        this.mCancel = true;
        if (this.mTemplate != null) {
            Log.d(TAG, "setCancel");
            this.mTemplate.h();
            return;
        }
        Log.d(TAG, "setCancel mTemplate is null");
    }

    /* access modifiers changed from: 0000 */
    public void setOverlappedTransitionFlag(boolean z) {
        this.mOverlappedTransition = z;
    }

    /* access modifiers changed from: 0000 */
    public void setOverlay2Project() {
        Iterator it = this.mOverlayList.iterator();
        while (it.hasNext()) {
            a aVar = (a) it.next();
            nexOverlayItem vignetteOverlayViaRatioMode = vignetteOverlayViaRatioMode("vignette.png", nexApplicationConfig.getAspectProfile().getWidth(), nexApplicationConfig.getAspectProfile().getHeight(), this.mProject.getClip(aVar.a(), true).mStartTime + aVar.c(), aVar.b());
            this.mProject.addOverlay(vignetteOverlayViaRatioMode);
            if (aVar.d()) {
                vignetteOverlayViaRatioMode.clearAnimate();
                vignetteOverlayViaRatioMode.addAnimate(nexAnimate.getAlpha(aVar.e(), aVar.f(), 0.0f, 1.0f).setInterpolator(new AccelerateDecelerateInterpolator()));
                vignetteOverlayViaRatioMode.addAnimate(nexAnimate.getAlpha(aVar.g(), aVar.h(), 1.0f, 0.0f).setInterpolator(new AccelerateDecelerateInterpolator()));
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public HashMap<String, String> setParameter2List(JSONObject jSONObject) {
        JSONObject jSONObject2 = jSONObject;
        HashMap<String, String> hashMap = new HashMap<>();
        String value = getValue(jSONObject2, "type");
        if (value.equals("scene")) {
            String value2 = getValue(jSONObject2, TAG_ID);
            String value3 = getValue(jSONObject2, TAG_SOURCE_TYPE);
            String value4 = getValue(jSONObject2, TAG_DURATION);
            String value5 = getValue(jSONObject2, TAG_VOLUME);
            String value6 = getValue(jSONObject2, TAG_EFFECTS);
            String value7 = getValue(jSONObject2, TAG_BRIGHTNESS);
            String value8 = getValue(jSONObject2, TAG_CONTRAST);
            String value9 = getValue(jSONObject2, TAG_SATURATION);
            String value10 = getValue(jSONObject2, TAG_COLOR_FILTER);
            String value11 = getValue(jSONObject2, TAG_SPEED_CONTROL);
            String value12 = getValue(jSONObject2, TAG_VIGNETTE);
            String value13 = getValue(jSONObject2, TAG_LUT);
            String str = value12;
            String value14 = getValue(jSONObject2, TAG_EXTERNAL_VIDEO_PATH);
            String value15 = getValue(jSONObject2, TAG_EXTERNAL_IMAGE_PATH);
            String value16 = getValue(jSONObject2, TAG_SOLID_COLOR);
            String value17 = getValue(jSONObject2, TAG_CROP_MODE);
            String value18 = getValue(jSONObject2, TAG_CROP_SPEED);
            String value19 = getValue(jSONObject2, TAG_VIDEO_CROP_MODE);
            String value20 = getValue(jSONObject2, TAG_IMAGE_CROP_MODE);
            hashMap.put("type", value);
            hashMap.put(TAG_ID, value2);
            hashMap.put(TAG_SOURCE_TYPE, value3);
            hashMap.put(TAG_DURATION, value4);
            hashMap.put(TAG_VOLUME, value5);
            hashMap.put(TAG_EFFECTS, value6);
            hashMap.put(TAG_BRIGHTNESS, value7);
            hashMap.put(TAG_CONTRAST, value8);
            hashMap.put(TAG_SATURATION, value9);
            hashMap.put(TAG_COLOR_FILTER, value10);
            hashMap.put(TAG_SPEED_CONTROL, value11);
            hashMap.put(TAG_LUT, value13);
            hashMap.put(TAG_CROP_MODE, value17);
            hashMap.put(TAG_CROP_SPEED, value18);
            hashMap.put(TAG_VIDEO_CROP_MODE, value19);
            hashMap.put(TAG_IMAGE_CROP_MODE, value20);
            hashMap.put(TAG_EXTERNAL_VIDEO_PATH, value14);
            hashMap.put(TAG_EXTERNAL_IMAGE_PATH, value15);
            hashMap.put(TAG_SOLID_COLOR, value16);
            hashMap.put(TAG_VIGNETTE, str);
        } else if (value.equals("transition")) {
            String value21 = getValue(jSONObject2, TAG_EFFECTS);
            String value22 = getValue(jSONObject2, TAG_DURATION);
            hashMap.put("type", value);
            hashMap.put(TAG_EFFECTS, value21);
            hashMap.put(TAG_DURATION, value22);
        }
        return hashMap;
    }

    /* access modifiers changed from: 0000 */
    public String setProperty2Clips(nexProject nexproject, String str) {
        if (nexproject.getTotalClipCount(true) == 0) {
            return "no clip in the project";
        }
        if (str.equals("template 1.0")) {
            this.templateList = this.mTemplateList;
        } else {
            this.templateList = this.mIntroTemplateList;
        }
        this.templateListID = 0;
        int i = 0;
        while (!this.mCancel) {
            nexClip clip = nexproject.getClip(i, true);
            if (clip.getClipType() == 4) {
                String property2VideoClip = setProperty2VideoClip(nexproject, clip, i);
                if (property2VideoClip != null) {
                    return property2VideoClip;
                }
            } else if (clip.getClipType() == 1) {
                String property2ImageClip = setProperty2ImageClip(clip, i);
                if (property2ImageClip != null) {
                    return property2ImageClip;
                }
            }
            this.templateListID++;
            if (this.templateListID == this.templateList.size()) {
                this.templateListID = 0;
            }
            i++;
            if (!str.equals("template 1.0")) {
                if (i == ((Integer) this.mTemplateTypeCountList.get(0)).intValue()) {
                    if (((Integer) this.mTemplateTypeCountList.get(1)).intValue() == 0) {
                        this.templateList = this.mOutroTemplateList;
                    } else {
                        this.templateList = this.mLoopTemplateList;
                    }
                    this.templateListID = 0;
                }
                if (this.templateList == this.mLoopTemplateList && i == ((Integer) this.mTemplateTypeCountList.get(0)).intValue() + ((Integer) this.mTemplateTypeCountList.get(1)).intValue()) {
                    this.templateList = this.mOutroTemplateList;
                    this.templateListID = 0;
                }
            }
            if (i == nexproject.getTotalClipCount(true)) {
                clip.getTransitionEffect(true).setEffectNone();
                clip.getTransitionEffect(true).setDuration(0);
            }
            if (i >= nexproject.getTotalClipCount(true)) {
                nexproject.updateProject();
                return null;
            }
        }
        this.mCancel = false;
        return cancelMassage;
    }

    /* access modifiers changed from: 0000 */
    /*  JADX ERROR: IF instruction can be used only in fallback mode
        jadx.core.utils.exceptions.CodegenException: IF instruction can be used only in fallback mode
        	at jadx.core.codegen.InsnGen.fallbackOnlyInsn(InsnGen.java:568)
        	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:474)
        	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:239)
        	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:213)
        	at jadx.core.codegen.RegionGen.makeSimpleBlock(RegionGen.java:109)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:55)
        	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
        	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:98)
        	at jadx.core.codegen.RegionGen.makeLoop(RegionGen.java:193)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:66)
        	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
        	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:98)
        	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:138)
        	at jadx.core.codegen.RegionGen.connectElseIf(RegionGen.java:163)
        	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:144)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
        	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
        	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:98)
        	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:138)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
        	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
        	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:98)
        	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:138)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
        	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
        	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:98)
        	at jadx.core.codegen.RegionGen.makeTryCatch(RegionGen.java:299)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:68)
        	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
        	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:98)
        	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:138)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
        	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:92)
        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:58)
        	at jadx.core.codegen.MethodGen.addRegionInsns(MethodGen.java:210)
        	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:203)
        	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:316)
        	at jadx.core.codegen.ClassGen.addMethods(ClassGen.java:262)
        	at jadx.core.codegen.ClassGen.addClassBody(ClassGen.java:225)
        	at jadx.core.codegen.ClassGen.addClassCode(ClassGen.java:110)
        	at jadx.core.codegen.ClassGen.makeClass(ClassGen.java:76)
        	at jadx.core.codegen.CodeGen.wrapCodeGen(CodeGen.java:44)
        	at jadx.core.codegen.CodeGen.generateJavaCode(CodeGen.java:32)
        	at jadx.core.codegen.CodeGen.generate(CodeGen.java:20)
        	at jadx.core.ProcessClass.process(ProcessClass.java:36)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
        */
    /* JADX WARNING: Removed duplicated region for block: B:103:0x0226 A[SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x01d3 A[Catch:{ nexSDKException -> 0x02f4 }] */
    /* JADX WARNING: Removed duplicated region for block: B:60:0x01d4 A[Catch:{ nexSDKException -> 0x02f4 }] */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x01de A[Catch:{ nexSDKException -> 0x02f4 }] */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x01e8 A[Catch:{ nexSDKException -> 0x02f4 }] */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x01f2 A[Catch:{ nexSDKException -> 0x02f4 }] */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x0213 A[Catch:{ nexSDKException -> 0x02f4 }] */
    /* JADX WARNING: Removed duplicated region for block: B:75:0x0236 A[Catch:{ nexSDKException -> 0x02f4 }] */
    /* JADX WARNING: Removed duplicated region for block: B:79:0x0248 A[Catch:{ nexSDKException -> 0x02f4 }] */
    /* JADX WARNING: Removed duplicated region for block: B:84:0x0274 A[Catch:{ nexSDKException -> 0x02f4 }] */
    public java.lang.String setProperty2ImageClip(com.nexstreaming.nexeditorsdk.nexClip r13, int r14) {
        /*
            r12 = this;
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r0 = r12.templateList
            int r1 = r12.templateListID
            java.lang.Object r0 = r0.get(r1)
            java.util.HashMap r0 = (java.util.HashMap) r0
            java.lang.String r1 = "type"
            java.lang.Object r0 = r0.get(r1)
            java.lang.String r0 = (java.lang.String) r0
            java.lang.String r1 = "scene"
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L_0x02fa
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r0 = r12.templateList
            int r1 = r12.templateListID
            java.lang.Object r0 = r0.get(r1)
            java.util.HashMap r0 = (java.util.HashMap) r0
            java.lang.String r1 = "contrast"
            java.lang.Object r0 = r0.get(r1)
            java.lang.String r0 = (java.lang.String) r0
            java.lang.String r1 = "default"
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L_0x0037
            java.lang.String r0 = "-1"
            goto L_0x0049
        L_0x0037:
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r0 = r12.templateList
            int r1 = r12.templateListID
            java.lang.Object r0 = r0.get(r1)
            java.util.HashMap r0 = (java.util.HashMap) r0
            java.lang.String r1 = "contrast"
            java.lang.Object r0 = r0.get(r1)
            java.lang.String r0 = (java.lang.String) r0
        L_0x0049:
            int r0 = java.lang.Integer.parseInt(r0)
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r1 = r12.templateList
            int r2 = r12.templateListID
            java.lang.Object r1 = r1.get(r2)
            java.util.HashMap r1 = (java.util.HashMap) r1
            java.lang.String r2 = "brightness"
            java.lang.Object r1 = r1.get(r2)
            java.lang.String r1 = (java.lang.String) r1
            java.lang.String r2 = "default"
            boolean r1 = r1.equals(r2)
            if (r1 == 0) goto L_0x006a
            java.lang.String r1 = "-1"
            goto L_0x007c
        L_0x006a:
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r1 = r12.templateList
            int r2 = r12.templateListID
            java.lang.Object r1 = r1.get(r2)
            java.util.HashMap r1 = (java.util.HashMap) r1
            java.lang.String r2 = "brightness"
            java.lang.Object r1 = r1.get(r2)
            java.lang.String r1 = (java.lang.String) r1
        L_0x007c:
            int r1 = java.lang.Integer.parseInt(r1)
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r2 = r12.templateList
            int r3 = r12.templateListID
            java.lang.Object r2 = r2.get(r3)
            java.util.HashMap r2 = (java.util.HashMap) r2
            java.lang.String r3 = "saturation"
            java.lang.Object r2 = r2.get(r3)
            java.lang.String r2 = (java.lang.String) r2
            java.lang.String r3 = "default"
            boolean r2 = r2.equals(r3)
            if (r2 == 0) goto L_0x009d
            java.lang.String r2 = "-1"
            goto L_0x00af
        L_0x009d:
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r2 = r12.templateList
            int r3 = r12.templateListID
            java.lang.Object r2 = r2.get(r3)
            java.util.HashMap r2 = (java.util.HashMap) r2
            java.lang.String r3 = "saturation"
            java.lang.Object r2 = r2.get(r3)
            java.lang.String r2 = (java.lang.String) r2
        L_0x00af:
            int r2 = java.lang.Integer.parseInt(r2)
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r3 = r12.templateList
            int r4 = r12.templateListID
            java.lang.Object r3 = r3.get(r4)
            java.util.HashMap r3 = (java.util.HashMap) r3
            java.lang.String r4 = "color_filter"
            java.lang.Object r3 = r3.get(r4)
            java.lang.String r3 = (java.lang.String) r3
            java.lang.String r4 = "default"
            boolean r3 = r3.equals(r4)
            if (r3 == 0) goto L_0x00d0
            java.lang.String r3 = "-1"
            goto L_0x00e2
        L_0x00d0:
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r3 = r12.templateList
            int r4 = r12.templateListID
            java.lang.Object r3 = r3.get(r4)
            java.util.HashMap r3 = (java.util.HashMap) r3
            java.lang.String r4 = "color_filter"
            java.lang.Object r3 = r3.get(r4)
            java.lang.String r3 = (java.lang.String) r3
        L_0x00e2:
            int r3 = java.lang.Integer.parseInt(r3)
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r4 = r12.templateList
            int r5 = r12.templateListID
            java.lang.Object r4 = r4.get(r5)
            java.util.HashMap r4 = (java.util.HashMap) r4
            java.lang.String r5 = "effects"
            java.lang.Object r4 = r4.get(r5)
            java.lang.String r4 = (java.lang.String) r4
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r5 = r12.templateList
            int r6 = r12.templateListID
            java.lang.Object r5 = r5.get(r6)
            java.util.HashMap r5 = (java.util.HashMap) r5
            java.lang.String r6 = "lut"
            java.lang.Object r5 = r5.get(r6)
            java.lang.String r5 = (java.lang.String) r5
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r6 = r12.templateList
            int r7 = r12.templateListID
            java.lang.Object r6 = r6.get(r7)
            java.util.HashMap r6 = (java.util.HashMap) r6
            java.lang.String r7 = "vignette"
            java.lang.Object r6 = r6.get(r7)
            java.lang.String r6 = (java.lang.String) r6
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r7 = r12.templateList
            int r8 = r12.templateListID
            java.lang.Object r7 = r7.get(r8)
            java.util.HashMap r7 = (java.util.HashMap) r7
            java.lang.String r8 = "crop_mode"
            java.lang.Object r7 = r7.get(r8)
            java.lang.String r7 = (java.lang.String) r7
            java.lang.String r8 = ""
            boolean r8 = r7.equals(r8)
            if (r8 == 0) goto L_0x0148
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r7 = r12.templateList
            int r8 = r12.templateListID
            java.lang.Object r7 = r7.get(r8)
            java.util.HashMap r7 = (java.util.HashMap) r7
            java.lang.String r8 = "image_crop_mode"
            java.lang.Object r7 = r7.get(r8)
            java.lang.String r7 = (java.lang.String) r7
        L_0x0148:
            r8 = 0
            r13.setClipVolume(r8)     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r9 = "none"     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r9 = r4.equals(r9)     // Catch:{ nexSDKException -> 0x02f4 }
            r10 = 1     // Catch:{ nexSDKException -> 0x02f4 }
            if (r9 == 0) goto L_0x015d     // Catch:{ nexSDKException -> 0x02f4 }
            com.nexstreaming.nexeditorsdk.nexClipEffect r4 = r13.getClipEffect(r10)     // Catch:{ nexSDKException -> 0x02f4 }
            r4.setEffectNone()     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x0174     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x015d:
            com.nexstreaming.nexeditorsdk.nexClipEffect r9 = r13.getClipEffect(r10)     // Catch:{ nexSDKException -> 0x02f4 }
            r9.setEffect(r4)     // Catch:{ nexSDKException -> 0x02f4 }
            com.nexstreaming.nexeditorsdk.nexClipEffect r4 = r13.getClipEffect(r10)     // Catch:{ nexSDKException -> 0x02f4 }
            int r9 = r13.getProjectEndTime()     // Catch:{ nexSDKException -> 0x02f4 }
            int r11 = r13.getProjectStartTime()     // Catch:{ nexSDKException -> 0x02f4 }
            int r9 = r9 - r11     // Catch:{ nexSDKException -> 0x02f4 }
            r4.setEffectShowTime(r8, r9)     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x0174:
            r4 = -1     // Catch:{ nexSDKException -> 0x02f4 }
            if (r1 == r4) goto L_0x017a     // Catch:{ nexSDKException -> 0x02f4 }
            r13.setBrightness(r1)     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x017a:
            if (r0 == r4) goto L_0x017f     // Catch:{ nexSDKException -> 0x02f4 }
            r13.setContrast(r0)     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x017f:
            if (r2 == r4) goto L_0x0184     // Catch:{ nexSDKException -> 0x02f4 }
            r13.setSaturation(r2)     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x0184:
            if (r3 == r4) goto L_0x018e     // Catch:{ nexSDKException -> 0x02f4 }
            int r3 = r3 - r10     // Catch:{ nexSDKException -> 0x02f4 }
            com.nexstreaming.nexeditorsdk.nexColorEffect r0 = r12.getColorEffect(r3)     // Catch:{ nexSDKException -> 0x02f4 }
            r13.setColorEffect(r0)     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x018e:
            int r0 = r7.hashCode()     // Catch:{ nexSDKException -> 0x02f4 }
            r1 = 101393(0x18c11, float:1.42082E-40)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r0 == r1) goto L_0x01c5     // Catch:{ nexSDKException -> 0x02f4 }
            r1 = 3143043(0x2ff583, float:4.404341E-39)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r0 == r1) goto L_0x01bb     // Catch:{ nexSDKException -> 0x02f4 }
            r1 = 1054849215(0x3edfb8bf, float:0.43695638)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r0 == r1) goto L_0x01b1     // Catch:{ nexSDKException -> 0x02f4 }
            r1 = 1055207047(0x3ee52e87, float:0.4476206)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r0 == r1) goto L_0x01a7     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x01cf     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x01a7:
            java.lang.String r0 = "pan_rand"     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r0 = r7.equals(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r0 == 0) goto L_0x01cf     // Catch:{ nexSDKException -> 0x02f4 }
            r0 = 1     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x01d0     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x01b1:
            java.lang.String r0 = "pan_face"     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r0 = r7.equals(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r0 == 0) goto L_0x01cf     // Catch:{ nexSDKException -> 0x02f4 }
            r0 = 2     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x01d0     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x01bb:
            java.lang.String r0 = "fill"     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r0 = r7.equals(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r0 == 0) goto L_0x01cf     // Catch:{ nexSDKException -> 0x02f4 }
            r0 = 0     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x01d0     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x01c5:
            java.lang.String r0 = "fit"     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r0 = r7.equals(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r0 == 0) goto L_0x01cf     // Catch:{ nexSDKException -> 0x02f4 }
            r0 = 3     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x01d0     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x01cf:
            r0 = -1     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x01d0:
            switch(r0) {
                case 0: goto L_0x01f2;
                case 1: goto L_0x01e8;
                case 2: goto L_0x01de;
                case 3: goto L_0x01d4;
                default: goto L_0x01d3;
            }     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x01d3:
            goto L_0x01fb     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x01d4:
            com.nexstreaming.nexeditorsdk.nexCrop r0 = r13.getCrop()     // Catch:{ nexSDKException -> 0x02f4 }
            com.nexstreaming.nexeditorsdk.nexCrop$CropMode r1 = com.nexstreaming.nexeditorsdk.nexCrop.CropMode.FIT     // Catch:{ nexSDKException -> 0x02f4 }
            r0.randomizeStartEndPosition(r8, r1)     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x01fb     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x01de:
            com.nexstreaming.nexeditorsdk.nexCrop r0 = r13.getCrop()     // Catch:{ nexSDKException -> 0x02f4 }
            com.nexstreaming.nexeditorsdk.nexCrop$CropMode r1 = com.nexstreaming.nexeditorsdk.nexCrop.CropMode.PAN_FACE     // Catch:{ nexSDKException -> 0x02f4 }
            r0.randomizeStartEndPosition(r8, r1)     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x01fb     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x01e8:
            com.nexstreaming.nexeditorsdk.nexCrop r0 = r13.getCrop()     // Catch:{ nexSDKException -> 0x02f4 }
            com.nexstreaming.nexeditorsdk.nexCrop$CropMode r1 = com.nexstreaming.nexeditorsdk.nexCrop.CropMode.PAN_RAND     // Catch:{ nexSDKException -> 0x02f4 }
            r0.randomizeStartEndPosition(r8, r1)     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x01fb     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x01f2:
            com.nexstreaming.nexeditorsdk.nexCrop r0 = r13.getCrop()     // Catch:{ nexSDKException -> 0x02f4 }
            com.nexstreaming.nexeditorsdk.nexCrop$CropMode r1 = com.nexstreaming.nexeditorsdk.nexCrop.CropMode.FILL     // Catch:{ nexSDKException -> 0x02f4 }
            r0.randomizeStartEndPosition(r8, r1)     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x01fb:
            if (r5 == 0) goto L_0x0226     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r0 = "null"     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r0 = r5.equals(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r0 != 0) goto L_0x0226     // Catch:{ nexSDKException -> 0x02f4 }
            java.util.List r0 = com.nexstreaming.nexeditorsdk.nexColorEffect.getPresetList()     // Catch:{ nexSDKException -> 0x02f4 }
            java.util.Iterator r0 = r0.iterator()     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x020d:
            boolean r1 = r0.hasNext()     // Catch:{ nexSDKException -> 0x02f4 }
            if (r1 == 0) goto L_0x0226     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.Object r1 = r0.next()     // Catch:{ nexSDKException -> 0x02f4 }
            com.nexstreaming.nexeditorsdk.nexColorEffect r1 = (com.nexstreaming.nexeditorsdk.nexColorEffect) r1     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r2 = r1.getPresetName()     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r2 = r2.equals(r5)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r2 == 0) goto L_0x020d     // Catch:{ nexSDKException -> 0x02f4 }
            r13.setColorEffect(r1)     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x0226:
            java.lang.String r0 = ","     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String[] r0 = r6.split(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            r1 = r0[r8]     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r2 = "clip"     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r1 = r1.equals(r2)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r1 == 0) goto L_0x0248     // Catch:{ nexSDKException -> 0x02f4 }
            r14 = r0[r10]     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r0 = "yes"     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r14 = r14.equals(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r14 == 0) goto L_0x0244     // Catch:{ nexSDKException -> 0x02f4 }
            r13.setVignetteEffect(r10)     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x0255     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x0244:
            r13.setVignetteEffect(r8)     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x0255     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x0248:
            r0 = r0[r8]     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r1 = "overlay"     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r0 = r0.equals(r1)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r0 == 0) goto L_0x0255     // Catch:{ nexSDKException -> 0x02f4 }
            r12.addTemplateOverlay(r14, r6)     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x0255:
            int r14 = r12.templateListID     // Catch:{ nexSDKException -> 0x02f4 }
            int r14 = r14 + r10     // Catch:{ nexSDKException -> 0x02f4 }
            r12.templateListID = r14     // Catch:{ nexSDKException -> 0x02f4 }
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r14 = r12.templateList     // Catch:{ nexSDKException -> 0x02f4 }
            int r0 = r12.templateListID     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.Object r14 = r14.get(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            java.util.HashMap r14 = (java.util.HashMap) r14     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r0 = "type"     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.Object r14 = r14.get(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r14 = (java.lang.String) r14     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r0 = "transition"     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r14 = r14.equals(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r14 == 0) goto L_0x02fa     // Catch:{ nexSDKException -> 0x02f4 }
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r14 = r12.templateList     // Catch:{ nexSDKException -> 0x02f4 }
            int r0 = r12.templateListID     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.Object r14 = r14.get(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            java.util.HashMap r14 = (java.util.HashMap) r14     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r0 = "effects"     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.Object r14 = r14.get(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r14 = (java.lang.String) r14     // Catch:{ nexSDKException -> 0x02f4 }
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r0 = r12.templateList     // Catch:{ nexSDKException -> 0x02f4 }
            int r1 = r12.templateListID     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.Object r0 = r0.get(r1)     // Catch:{ nexSDKException -> 0x02f4 }
            java.util.HashMap r0 = (java.util.HashMap) r0     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r1 = "duration"     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.Object r0 = r0.get(r1)     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r0 = (java.lang.String) r0     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r1 = "default"     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r0 = r0.equals(r1)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r0 == 0) goto L_0x02a3     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r0 = "-1"     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x02b5     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x02a3:
            java.util.ArrayList<java.util.HashMap<java.lang.String, java.lang.String>> r0 = r12.templateList     // Catch:{ nexSDKException -> 0x02f4 }
            int r1 = r12.templateListID     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.Object r0 = r0.get(r1)     // Catch:{ nexSDKException -> 0x02f4 }
            java.util.HashMap r0 = (java.util.HashMap) r0     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r1 = "duration"     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.Object r0 = r0.get(r1)     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r0 = (java.lang.String) r0     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x02b5:
            int r0 = java.lang.Integer.parseInt(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r1 = r12.mOverlappedTransition     // Catch:{ nexSDKException -> 0x02f4 }
            if (r1 == 0) goto L_0x02e5     // Catch:{ nexSDKException -> 0x02f4 }
            java.lang.String r1 = "none"     // Catch:{ nexSDKException -> 0x02f4 }
            boolean r1 = r14.equals(r1)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r1 == 0) goto L_0x02d4     // Catch:{ nexSDKException -> 0x02f4 }
            com.nexstreaming.nexeditorsdk.nexTransitionEffect r14 = r13.getTransitionEffect(r10)     // Catch:{ nexSDKException -> 0x02f4 }
            r14.setEffectNone()     // Catch:{ nexSDKException -> 0x02f4 }
            com.nexstreaming.nexeditorsdk.nexTransitionEffect r13 = r13.getTransitionEffect(r10)     // Catch:{ nexSDKException -> 0x02f4 }
            r13.setDuration(r8)     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x02fa     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x02d4:
            com.nexstreaming.nexeditorsdk.nexTransitionEffect r1 = r13.getTransitionEffect(r10)     // Catch:{ nexSDKException -> 0x02f4 }
            r1.setTransitionEffect(r14)     // Catch:{ nexSDKException -> 0x02f4 }
            if (r0 == r4) goto L_0x02fa     // Catch:{ nexSDKException -> 0x02f4 }
            com.nexstreaming.nexeditorsdk.nexTransitionEffect r13 = r13.getTransitionEffect(r10)     // Catch:{ nexSDKException -> 0x02f4 }
            r13.setDuration(r0)     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x02fa     // Catch:{ nexSDKException -> 0x02f4 }
        L_0x02e5:
            com.nexstreaming.nexeditorsdk.nexTransitionEffect r14 = r13.getTransitionEffect(r10)     // Catch:{ nexSDKException -> 0x02f4 }
            r14.setEffectNone()     // Catch:{ nexSDKException -> 0x02f4 }
            com.nexstreaming.nexeditorsdk.nexTransitionEffect r13 = r13.getTransitionEffect(r10)     // Catch:{ nexSDKException -> 0x02f4 }
            r13.setDuration(r8)     // Catch:{ nexSDKException -> 0x02f4 }
            goto L_0x02fa
        L_0x02f4:
            r13 = move-exception
            java.lang.String r13 = r13.getMessage()
            return r13
        L_0x02fa:
            r13 = 0
            return r13
        */
        throw new UnsupportedOperationException("Method not decompiled: com.nexstreaming.nexeditorsdk.nexTemplateComposer.setProperty2ImageClip(com.nexstreaming.nexeditorsdk.nexClip, int):java.lang.String");
    }

    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Removed duplicated region for block: B:101:0x0304 A[Catch:{ nexSDKException -> 0x03e6 }] */
    /* JADX WARNING: Removed duplicated region for block: B:105:0x0317 A[Catch:{ nexSDKException -> 0x03e6 }] */
    /* JADX WARNING: Removed duplicated region for block: B:110:0x0344 A[Catch:{ nexSDKException -> 0x03e6 }] */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x0274 A[Catch:{ nexSDKException -> 0x03e6 }] */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x0275 A[Catch:{ nexSDKException -> 0x03e6 }] */
    /* JADX WARNING: Removed duplicated region for block: B:82:0x0280 A[Catch:{ nexSDKException -> 0x03e6 }] */
    /* JADX WARNING: Removed duplicated region for block: B:83:0x028b A[Catch:{ nexSDKException -> 0x03e6 }] */
    /* JADX WARNING: Removed duplicated region for block: B:84:0x0296 A[Catch:{ nexSDKException -> 0x03e6 }] */
    /* JADX WARNING: Removed duplicated region for block: B:90:0x02ae A[Catch:{ nexSDKException -> 0x03e6 }] */
    /* JADX WARNING: Removed duplicated region for block: B:93:0x02d2 A[Catch:{ nexSDKException -> 0x03e6 }] */
    public String setProperty2VideoClip(nexProject nexproject, nexClip nexclip, int i) {
        char c;
        String[] split;
        nexClip nexclip2 = nexclip;
        int i2 = i;
        int parseInt = Integer.parseInt(((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_VOLUME)).equals("default") ? MovieStatUtils.DOWNLOAD_FAILED : (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_VOLUME));
        int parseInt2 = Integer.parseInt(((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_CONTRAST)).equals("default") ? MovieStatUtils.DOWNLOAD_FAILED : (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_CONTRAST));
        int parseInt3 = Integer.parseInt(((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_BRIGHTNESS)).equals("default") ? MovieStatUtils.DOWNLOAD_FAILED : (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_BRIGHTNESS));
        int parseInt4 = Integer.parseInt(((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SATURATION)).equals("default") ? MovieStatUtils.DOWNLOAD_FAILED : (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SATURATION));
        int parseInt5 = Integer.parseInt(((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_COLOR_FILTER)).equals("default") ? MovieStatUtils.DOWNLOAD_FAILED : (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_COLOR_FILTER));
        int parseInt6 = Integer.parseInt(((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SPEED_CONTROL)).equals("default") ? MovieStatUtils.DOWNLOAD_FAILED : (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_SPEED_CONTROL));
        String str = (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_EFFECTS);
        String str2 = (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_LUT);
        String str3 = (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_VIGNETTE);
        String str4 = (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_CROP_MODE);
        if (str4.equals("")) {
            str4 = (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_VIDEO_CROP_MODE);
        }
        try {
            if (str.equals("none")) {
                nexclip2.getClipEffect(true).setEffectNone();
            } else {
                nexclip2.getClipEffect(true).setEffect(str);
                if (this.mUseProjectSpeed && nexclip.getVideoClipEdit().getSpeedControl() != 100) {
                    parseInt6 = nexclip.getVideoClipEdit().getSpeedControl();
                }
                nexclip2.getClipEffect(true).setEffectShowTime(0, 0);
                String substring = str.substring(str.lastIndexOf("."));
                if (substring.equals(".opening") || substring.equals(".middle") || substring.equals(".ending")) {
                    nexclip2.getClipEffect(true).setTitle(0, " ");
                    nexclip2.getClipEffect(true).setTitle(1, " ");
                }
            }
            if (parseInt != -1) {
                nexclip2.setClipVolume(parseInt);
            }
            if (parseInt3 != -1) {
                nexclip2.setBrightness(parseInt3);
            }
            if (parseInt2 != -1) {
                nexclip2.setContrast(parseInt2);
            }
            if (parseInt4 != -1) {
                nexclip2.setSaturation(parseInt4);
            }
            if (parseInt5 != -1) {
                nexclip2.setColorEffect(getColorEffect(parseInt5 - 1));
            }
            if (parseInt6 != -1) {
                nexclip.getVideoClipEdit().setSpeedControl(parseInt6);
            }
            int hashCode = str4.hashCode();
            if (hashCode != 101393) {
                if (hashCode != 3143043) {
                    if (hashCode != 1054849215) {
                        if (hashCode == 1055207047) {
                            if (str4.equals("pan_rand")) {
                                c = 1;
                                switch (c) {
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
                                }
                                if (str2 != null && !str2.equals("null")) {
                                    if (this.mTemplateID != null) {
                                        nexColorEffect lutColorEffect = nexColorEffect.getLutColorEffect(str2);
                                        if (lutColorEffect != null) {
                                            String str5 = TAG;
                                            StringBuilder sb = new StringBuilder();
                                            sb.append("lut color effect set =");
                                            sb.append(lutColorEffect.getPresetName());
                                            Log.d(str5, sb.toString());
                                            nexclip2.setColorEffect(lutColorEffect);
                                        }
                                    } else {
                                        Iterator it = nexColorEffect.getPresetList().iterator();
                                        while (true) {
                                            if (it.hasNext()) {
                                                nexColorEffect nexcoloreffect = (nexColorEffect) it.next();
                                                if (nexcoloreffect.getPresetName().equals(str2)) {
                                                    nexclip2.setColorEffect(nexcoloreffect);
                                                }
                                            }
                                        }
                                    }
                                }
                                split = str3.split(",");
                                if (split[0].equals("clip")) {
                                    if (split[1].equals("yes")) {
                                        nexclip2.setVignetteEffect(true);
                                    } else {
                                        nexclip2.setVignetteEffect(false);
                                    }
                                } else if (split[0].equals("overlay")) {
                                    addTemplateOverlay(i2, str3);
                                }
                                this.templateListID++;
                                if (((String) ((HashMap) this.templateList.get(this.templateListID)).get("type")).equals("transition")) {
                                    String str6 = (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_EFFECTS);
                                    int parseInt7 = Integer.parseInt(((String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_DURATION)).equals("default") ? MovieStatUtils.DOWNLOAD_FAILED : (String) ((HashMap) this.templateList.get(this.templateListID)).get(TAG_DURATION));
                                    if (this.mOverlappedTransition) {
                                        int[] transitionDurationTimeGuideLine = nexproject.getTransitionDurationTimeGuideLine(i2, parseInt7);
                                        if (transitionDurationTimeGuideLine[0] == 0 && transitionDurationTimeGuideLine[1] == 0) {
                                            nexclip2.getTransitionEffect(true).setEffectNone();
                                            nexclip2.getTransitionEffect(true).setDuration(0);
                                        } else if (str6.equals("none")) {
                                            nexclip2.getTransitionEffect(true).setEffectNone();
                                            nexclip2.getTransitionEffect(true).setDuration(0);
                                        } else {
                                            nexclip2.getTransitionEffect(true).setTransitionEffect(str6);
                                            if (parseInt7 != -1) {
                                                nexclip2.getTransitionEffect(true).setDuration(parseInt7);
                                            }
                                        }
                                    } else {
                                        nexclip2.getTransitionEffect(true).setEffectNone();
                                        nexclip2.getTransitionEffect(true).setDuration(0);
                                    }
                                }
                                return null;
                            }
                        }
                    } else if (str4.equals("pan_face")) {
                        c = 2;
                        switch (c) {
                            case 0:
                                break;
                            case 1:
                                break;
                            case 2:
                                break;
                            case 3:
                                break;
                        }
                        if (this.mTemplateID != null) {
                        }
                        split = str3.split(",");
                        if (split[0].equals("clip")) {
                        }
                        this.templateListID++;
                        if (((String) ((HashMap) this.templateList.get(this.templateListID)).get("type")).equals("transition")) {
                        }
                        return null;
                    }
                } else if (str4.equals("fill")) {
                    c = 0;
                    switch (c) {
                        case 0:
                            break;
                        case 1:
                            break;
                        case 2:
                            break;
                        case 3:
                            break;
                    }
                    if (this.mTemplateID != null) {
                    }
                    split = str3.split(",");
                    if (split[0].equals("clip")) {
                    }
                    this.templateListID++;
                    if (((String) ((HashMap) this.templateList.get(this.templateListID)).get("type")).equals("transition")) {
                    }
                    return null;
                }
            } else if (str4.equals("fit")) {
                c = 3;
                switch (c) {
                    case 0:
                        break;
                    case 1:
                        break;
                    case 2:
                        break;
                    case 3:
                        break;
                }
                if (this.mTemplateID != null) {
                }
                split = str3.split(",");
                if (split[0].equals("clip")) {
                }
                this.templateListID++;
                if (((String) ((HashMap) this.templateList.get(this.templateListID)).get("type")).equals("transition")) {
                }
                return null;
            }
            c = 65535;
            switch (c) {
                case 0:
                    break;
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
            }
            if (this.mTemplateID != null) {
            }
            split = str3.split(",");
            if (split[0].equals("clip")) {
            }
            this.templateListID++;
            if (((String) ((HashMap) this.templateList.get(this.templateListID)).get("type")).equals("transition")) {
            }
            return null;
        } catch (nexSDKException e) {
            return e.getMessage();
        }
    }

    /* access modifiers changed from: 0000 */
    public String setTemplateEffect() {
        String str;
        String parsingJSONFile = parsingJSONFile(this.mProject);
        if (parsingJSONFile != null) {
            return parsingJSONFile;
        }
        if (this.mTemplateVersion.equals("template 1.0")) {
            consistProjectViaVer1(this.mProject);
            if (this.mCancel) {
                return cancelMassage;
            }
            str = setProperty2Clips(this.mProject, this.mTemplateVersion);
        } else if (this.mTemplateVersion.equals("template 1.x")) {
            consistProjectViaVer2(this.mProject);
            if (this.mCancel) {
                return cancelMassage;
            }
            str = setProperty2Clips(this.mProject, this.mTemplateVersion);
        } else {
            str = applyTemplateOnProject(this.mProject);
        }
        if (str != null) {
            return str;
        }
        setOverlay2Project();
        return null;
    }

    public String setTemplateEffects2Project(nexProject nexproject, Context context, Context context2, String str, boolean z) throws nexSDKException {
        initTemplateComposer(nexproject, context, context2, str);
        return setTemplateEffect();
    }

    /* access modifiers changed from: 0000 */
    public void setUseProjectSpeed(boolean z) {
        this.mUseProjectSpeed = z;
    }

    /* access modifiers changed from: 0000 */
    public nexOverlayItem vignetteOverlayViaRatioMode(final String str, final int i, final int i2, int i3, int i4) {
        nexOverlayItem nexoverlayitem = new nexOverlayItem(new nexOverlayImage("template_overlay", i, i2, (runTimeMakeBitMap) new runTimeMakeBitMap() {
            public int getBitmapID() {
                return 100;
            }

            public boolean isAniMate() {
                return false;
            }

            public Bitmap makeBitmap() {
                try {
                    return Bitmap.createScaledBitmap(BitmapFactory.decodeStream(nexTemplateComposer.this.mResContext.getResources().getAssets().open(str), null, null), i, i2, true);
                } catch (IOException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }), i / 2, i2 / 2, i3, i3 + i4);
        return nexoverlayitem;
    }
}
