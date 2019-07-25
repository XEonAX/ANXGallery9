package com.miui.gallery.util;

import android.content.Context;
import android.content.pm.ResolveInfo;
import android.os.AsyncTask;
import android.text.TextUtils;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ShareComponentSorter {
    private static volatile ShareComponentSorter sInstance;
    /* access modifiers changed from: private */
    public Context mApplication;
    /* access modifiers changed from: private */
    public Gauss mGauss = new Gauss(0.0d, 1.0d);
    /* access modifiers changed from: private */
    public boolean mHasPendingSave;
    private boolean mInitialized;
    /* access modifiers changed from: private */
    public List<OnInitializedListener> mOnInitializedListeners = new ArrayList();
    /* access modifiers changed from: private */
    public Map<Tag, ComponentRecord> mRecords;
    /* access modifiers changed from: private */
    public Map<Tag, List<Long>> mTmpRecords;

    private static class ComponentComparator implements Comparator<ResolveInfo> {
        private Map<Tag, Integer> mPriority;
        private Tag mTemp = new Tag();

        public ComponentComparator(Map<Tag, Integer> map) {
            this.mPriority = map;
        }

        public int compare(ResolveInfo resolveInfo, ResolveInfo resolveInfo2) {
            this.mTemp.mPackage = resolveInfo.activityInfo.packageName;
            this.mTemp.mClass = resolveInfo.activityInfo.name;
            int unbox = Numbers.unbox((Integer) this.mPriority.get(this.mTemp), 0);
            this.mTemp.mPackage = resolveInfo2.activityInfo.packageName;
            this.mTemp.mClass = resolveInfo2.activityInfo.name;
            int unbox2 = Numbers.unbox((Integer) this.mPriority.get(this.mTemp), 0);
            if (unbox > unbox2) {
                return -1;
            }
            return unbox == unbox2 ? 0 : 1;
        }
    }

    private static class ComponentRecord {
        /* access modifiers changed from: private */
        public static final long ONE_DAY = TimeUnit.DAYS.toMillis(1);
        /* access modifiers changed from: private */
        public String mComponent;
        private int mCountOfToday;
        private TreeMap<Long, Integer> mHistory;
        /* access modifiers changed from: private */
        public String mPackage;
        private long mRecent;
        private long mToday;

        interface Evaluator {
            float evaluate(long j, int i);
        }

        ComponentRecord(String str, String str2) {
            this(str, str2, 0, new TreeMap());
        }

        private ComponentRecord(String str, String str2, long j, TreeMap<Long, Integer> treeMap) {
            this.mPackage = str;
            this.mComponent = str2;
            this.mRecent = j;
            this.mHistory = treeMap;
            this.mToday = this.mRecent / ONE_DAY;
            this.mCountOfToday = Numbers.unbox((Integer) this.mHistory.get(Long.valueOf(this.mToday)), 0);
        }

        static ComponentRecord fromJson(JSONObject jSONObject) {
            try {
                ComponentRecord componentRecord = new ComponentRecord(jSONObject.getString("package"), jSONObject.getString("component"), jSONObject.optLong("recent"), readHistory(jSONObject.getJSONObject("history")));
                return componentRecord;
            } catch (JSONException e) {
                Log.w("ShareComponentSorter", (Throwable) e);
                return null;
            }
        }

        private static TreeMap<Long, Integer> readHistory(JSONObject jSONObject) {
            TreeMap<Long, Integer> treeMap = new TreeMap<>();
            Iterator keys = jSONObject.keys();
            while (keys.hasNext()) {
                try {
                    String str = (String) keys.next();
                    treeMap.put(Long.valueOf(Long.parseLong(str)), Integer.valueOf(jSONObject.getInt(str)));
                } catch (JSONException e) {
                    Log.w("ShareComponentSorter", (Throwable) e);
                } catch (NumberFormatException e2) {
                    Log.w("ShareComponentSorter", (Throwable) e2);
                }
            }
            Log.d("ShareComponentSorter", "finish read history[%d] from json[%d]", Integer.valueOf(treeMap.size()), Integer.valueOf(jSONObject.length()));
            return treeMap;
        }

        static JSONObject toJson(ComponentRecord componentRecord) {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("package", componentRecord.mPackage);
                jSONObject.put("component", componentRecord.mComponent);
                jSONObject.put("recent", componentRecord.mRecent);
                jSONObject.put("history", writeHistory(componentRecord.mHistory));
            } catch (JSONException e) {
                Log.w("ShareComponentSorter", (Throwable) e);
            }
            return jSONObject;
        }

        private static JSONObject writeHistory(TreeMap<Long, Integer> treeMap) {
            JSONObject jSONObject = new JSONObject();
            if (treeMap.isEmpty()) {
                return jSONObject;
            }
            long longValue = ((Long) treeMap.navigableKeySet().last()).longValue();
            Iterator it = treeMap.descendingMap().entrySet().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Entry entry = (Entry) it.next();
                Long l = (Long) entry.getKey();
                if (l == null || l.longValue() == 0) {
                    Log.d("ShareComponentSorter", "receive an invalid value[%s], skip", (Object) l);
                } else {
                    try {
                        if (longValue - l.longValue() > 30) {
                            Log.d("ShareComponentSorter", "record is out of date(%dd), skip", (Object) Long.valueOf(longValue - l.longValue()));
                            break;
                        }
                        jSONObject.put(String.valueOf(entry.getKey()), entry.getValue());
                    } catch (JSONException e) {
                        Log.w("ShareComponentSorter", (Throwable) e);
                    }
                }
            }
            Log.d("ShareComponentSorter", "finish write history[%d] to json[%d]", Integer.valueOf(treeMap.size()), Integer.valueOf(jSONObject.length()));
            return jSONObject;
        }

        /* access modifiers changed from: 0000 */
        public void append(long j) {
            if (Math.abs(j - this.mRecent) >= 0) {
                this.mRecent = j;
                long j2 = j / ONE_DAY;
                if (j2 != this.mToday) {
                    Log.d("ShareComponentSorter", "switch day: %d->%d", Long.valueOf(this.mToday), Long.valueOf(j2));
                    this.mToday = j2;
                    this.mCountOfToday = Numbers.unbox((Integer) this.mHistory.get(Long.valueOf(this.mToday)), 0);
                }
                TreeMap<Long, Integer> treeMap = this.mHistory;
                Long valueOf = Long.valueOf(this.mToday);
                int i = this.mCountOfToday + 1;
                this.mCountOfToday = i;
                treeMap.put(valueOf, Integer.valueOf(i));
            }
        }

        /* access modifiers changed from: 0000 */
        public float calcPriority(Evaluator evaluator) {
            float f = 0.0f;
            for (Entry entry : this.mHistory.entrySet()) {
                f += evaluator.evaluate(Numbers.unbox((Long) entry.getKey(), 0), Numbers.unbox((Integer) entry.getValue(), 0));
            }
            return f;
        }
    }

    private static class DummyComparator implements Comparator<ResolveInfo> {
        private DummyComparator() {
        }

        public int compare(ResolveInfo resolveInfo, ResolveInfo resolveInfo2) {
            return 0;
        }
    }

    private class GaussEvaluator implements Evaluator {
        private double mCoefficient;
        private long mToday;

        private GaussEvaluator() {
            this.mToday = System.currentTimeMillis() / ComponentRecord.ONE_DAY;
            this.mCoefficient = 10.0d;
        }

        public float evaluate(long j, int i) {
            Gauss access$1500 = ShareComponentSorter.this.mGauss;
            double d = (double) (this.mToday - j);
            double d2 = this.mCoefficient;
            Double.isNaN(d);
            double value = access$1500.value(d / d2);
            double d3 = (double) i;
            Double.isNaN(d3);
            return (float) (value * d3);
        }
    }

    private class LoadTask extends AsyncTask<String, Void, Map<Tag, ComponentRecord>> {
        private LoadTask() {
        }

        /* access modifiers changed from: protected */
        /* JADX WARNING: Removed duplicated region for block: B:25:0x0061 A[SYNTHETIC, Splitter:B:25:0x0061] */
        /* JADX WARNING: Removed duplicated region for block: B:33:0x0070 A[SYNTHETIC, Splitter:B:33:0x0070] */
        /* JADX WARNING: Removed duplicated region for block: B:39:0x0084  */
        /* JADX WARNING: Removed duplicated region for block: B:41:0x008c  */
        /* JADX WARNING: Removed duplicated region for block: B:59:0x00fa A[SYNTHETIC, Splitter:B:59:0x00fa] */
        public Map<Tag, ComponentRecord> doInBackground(String... strArr) {
            FileReader fileReader;
            String sb;
            boolean z;
            Throwable e;
            Throwable e2;
            long currentTimeMillis = System.currentTimeMillis();
            HashMap hashMap = new HashMap();
            File file = new File(ShareComponentSorter.this.mApplication.getFilesDir(), strArr[0]);
            if (!file.exists()) {
                Log.d("ShareComponentSorter", "no file found, create a empty record");
                return hashMap;
            }
            Log.d("ShareComponentSorter", "read records from file");
            StringBuilder sb2 = new StringBuilder();
            try {
                fileReader = new FileReader(file);
                try {
                    char[] cArr = new char[512];
                    while (fileReader.read(cArr) != -1) {
                        sb2.append(cArr);
                    }
                } catch (FileNotFoundException e3) {
                    e = e3;
                    Log.w("ShareComponentSorter", e);
                    if (fileReader != null) {
                        fileReader.close();
                    }
                    sb = sb2.toString();
                    if (TextUtils.isEmpty(sb)) {
                    }
                } catch (IOException e4) {
                    e2 = e4;
                    try {
                        Log.w("ShareComponentSorter", e2);
                        if (fileReader != null) {
                            fileReader.close();
                        }
                        sb = sb2.toString();
                        if (TextUtils.isEmpty(sb)) {
                        }
                    } catch (Throwable th) {
                        th = th;
                        if (fileReader != null) {
                            try {
                                fileReader.close();
                            } catch (IOException e5) {
                                Log.w("ShareComponentSorter", (Throwable) e5);
                            }
                        }
                        throw th;
                    }
                }
                try {
                    fileReader.close();
                } catch (IOException e6) {
                    Log.w("ShareComponentSorter", (Throwable) e6);
                }
            } catch (FileNotFoundException e7) {
                Throwable th2 = e7;
                fileReader = null;
                e = th2;
                Log.w("ShareComponentSorter", e);
                if (fileReader != null) {
                }
                sb = sb2.toString();
                if (TextUtils.isEmpty(sb)) {
                }
            } catch (IOException e8) {
                Throwable th3 = e8;
                fileReader = null;
                e2 = th3;
                Log.w("ShareComponentSorter", e2);
                if (fileReader != null) {
                }
                sb = sb2.toString();
                if (TextUtils.isEmpty(sb)) {
                }
            } catch (Throwable th4) {
                th = th4;
                fileReader = null;
                if (fileReader != null) {
                }
                throw th;
            }
            sb = sb2.toString();
            if (TextUtils.isEmpty(sb)) {
                Log.d("ShareComponentSorter", "record file is empty, skip");
                return hashMap;
            }
            try {
                JSONArray jSONArray = new JSONArray(sb);
                Log.d("ShareComponentSorter", "start parsing %d records", (Object) Integer.valueOf(jSONArray.length()));
                z = false;
                for (int i = 0; i < jSONArray.length(); i++) {
                    ComponentRecord fromJson = ComponentRecord.fromJson(jSONArray.getJSONObject(i));
                    if (fromJson != null) {
                        hashMap.put(new Tag(fromJson.mPackage, fromJson.mComponent), fromJson);
                    } else {
                        z = true;
                    }
                }
            } catch (JSONException e9) {
                Log.w("ShareComponentSorter", "read history failed, abort:");
                Log.w("ShareComponentSorter", (Throwable) e9);
                z = true;
            }
            if (z) {
                Log.w("ShareComponentSorter", "file is illegal, delete file: %b", Boolean.valueOf(file.delete()));
            }
            Log.d("ShareComponentSorter", "read from file: %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            return hashMap;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Map<Tag, ComponentRecord> map) {
            super.onPostExecute(map);
            Log.d("ShareComponentSorter", "initialized finish.");
            ShareComponentSorter.this.mRecords = map;
            if (ShareComponentSorter.this.mTmpRecords != null && !ShareComponentSorter.this.mTmpRecords.isEmpty()) {
                Log.d("ShareComponentSorter", "has temp records, do transfer");
                for (Entry entry : ShareComponentSorter.this.mTmpRecords.entrySet()) {
                    for (Long longValue : (List) entry.getValue()) {
                        ShareComponentSorter.this.append(((Tag) entry.getKey()).mPackage, ((Tag) entry.getKey()).mClass, longValue.longValue());
                    }
                }
            }
            if (ShareComponentSorter.this.mHasPendingSave) {
                Log.d("ShareComponentSorter", "requested save when initializing, do save");
                ShareComponentSorter.this.save();
                ShareComponentSorter.this.mHasPendingSave = false;
            }
            for (OnInitializedListener onInitialized : ShareComponentSorter.this.mOnInitializedListeners) {
                onInitialized.onInitialized();
            }
        }
    }

    public interface OnInitializedListener {
        void onInitialized();
    }

    private class SaveTask extends AsyncTask<String, Void, Void> {
        private SaveTask() {
        }

        /* access modifiers changed from: protected */
        /* JADX WARNING: Removed duplicated region for block: B:25:0x0082 A[SYNTHETIC, Splitter:B:25:0x0082] */
        /* JADX WARNING: Removed duplicated region for block: B:33:0x00a0 A[SYNTHETIC, Splitter:B:33:0x00a0] */
        public Void doInBackground(String... strArr) {
            FileWriter fileWriter;
            long currentTimeMillis = System.currentTimeMillis();
            File file = new File(ShareComponentSorter.this.mApplication.getFilesDir(), strArr[0]);
            JSONArray jSONArray = new JSONArray();
            synchronized (ShareComponentSorter.this.mRecords) {
                for (Entry value : ShareComponentSorter.this.mRecords.entrySet()) {
                    jSONArray.put(ComponentRecord.toJson((ComponentRecord) value.getValue()));
                }
                Log.d("ShareComponentSorter", "write %d records to file", (Object) Integer.valueOf(ShareComponentSorter.this.mRecords.size()));
            }
            try {
                fileWriter = new FileWriter(file);
                try {
                    fileWriter.write(jSONArray.toString());
                    fileWriter.flush();
                } catch (IOException e) {
                    e = e;
                    try {
                        Log.w("ShareComponentSorter", (Throwable) e);
                        if (fileWriter != null) {
                            fileWriter.close();
                        }
                        Log.d("ShareComponentSorter", "write to file: %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                        return null;
                    } catch (Throwable th) {
                        th = th;
                        if (fileWriter != null) {
                            try {
                                fileWriter.close();
                            } catch (IOException e2) {
                                Log.w("ShareComponentSorter", (Throwable) e2);
                            }
                        }
                        throw th;
                    }
                }
                try {
                    fileWriter.close();
                } catch (IOException e3) {
                    Log.w("ShareComponentSorter", (Throwable) e3);
                }
            } catch (IOException e4) {
                e = e4;
                fileWriter = null;
                Log.w("ShareComponentSorter", (Throwable) e);
                if (fileWriter != null) {
                }
                Log.d("ShareComponentSorter", "write to file: %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                return null;
            } catch (Throwable th2) {
                th = th2;
                fileWriter = null;
                if (fileWriter != null) {
                }
                throw th;
            }
            Log.d("ShareComponentSorter", "write to file: %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            return null;
        }
    }

    private static class Tag {
        /* access modifiers changed from: private */
        public String mClass;
        /* access modifiers changed from: private */
        public String mPackage;

        private Tag() {
        }

        public Tag(String str, String str2) {
            this.mPackage = str;
            this.mClass = str2;
        }

        public boolean equals(Object obj) {
            boolean z = true;
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof Tag)) {
                return false;
            }
            Tag tag = (Tag) obj;
            if (!this.mPackage.equals(tag.mPackage) || !this.mClass.equals(tag.mClass)) {
                z = false;
            }
            return z;
        }

        public int hashCode() {
            return this.mPackage.hashCode() ^ this.mClass.hashCode();
        }
    }

    /* access modifiers changed from: private */
    public void append(String str, String str2, long j) {
        Tag tag = new Tag(str, str2);
        if (this.mRecords == null) {
            Log.d("ShareComponentSorter", "not initialized, use a temp record");
            if (this.mTmpRecords == null) {
                this.mTmpRecords = new HashMap();
            }
            List list = (List) this.mTmpRecords.get(tag);
            if (list == null) {
                list = new ArrayList();
                this.mTmpRecords.put(tag, list);
            }
            list.add(Long.valueOf(j));
            return;
        }
        synchronized (this.mRecords) {
            Log.d("ShareComponentSorter", "initialized, inserting");
            ComponentRecord componentRecord = (ComponentRecord) this.mRecords.get(tag);
            if (componentRecord == null) {
                componentRecord = new ComponentRecord(str, str2);
                this.mRecords.put(tag, componentRecord);
            }
            componentRecord.append(j);
        }
    }

    public static synchronized ShareComponentSorter getInstance() {
        ShareComponentSorter shareComponentSorter;
        synchronized (ShareComponentSorter.class) {
            if (sInstance == null) {
                sInstance = new ShareComponentSorter();
            }
            shareComponentSorter = sInstance;
        }
        return shareComponentSorter;
    }

    public Comparator<ResolveInfo> createComparator() {
        ComponentComparator componentComparator;
        if (this.mRecords != null) {
            synchronized (this.mRecords) {
                long currentTimeMillis = System.currentTimeMillis();
                Log.d("ShareComponentSorter", "initialized create a new comparator");
                HashMap hashMap = new HashMap();
                GaussEvaluator gaussEvaluator = new GaussEvaluator();
                for (Entry entry : this.mRecords.entrySet()) {
                    float calcPriority = ((ComponentRecord) entry.getValue()).calcPriority(gaussEvaluator);
                    Log.d("ShareComponentSorter", "[%s] -> %f", ((Tag) entry.getKey()).mClass, Float.valueOf(calcPriority));
                    hashMap.put(entry.getKey(), Integer.valueOf((int) (calcPriority * 1000.0f)));
                }
                Log.d("ShareComponentSorter", "create a gauss comparator costs %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                componentComparator = new ComponentComparator(hashMap);
            }
            return componentComparator;
        }
        Log.d("ShareComponentSorter", "not initialized, use a dummy comparator");
        return new DummyComparator();
    }

    public void initialize(Context context) {
        if (!this.mInitialized) {
            if (context == context.getApplicationContext()) {
                this.mApplication = context;
                new LoadTask().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new String[]{"components-history.json"});
                this.mInitialized = true;
                return;
            }
            throw new IllegalArgumentException("please initialize with application");
        }
    }

    public boolean initialized() {
        return this.mInitialized;
    }

    public void registerOnInitializedListener(OnInitializedListener onInitializedListener) {
        this.mOnInitializedListeners.add(onInitializedListener);
    }

    public void removeOnInitializedListener(OnInitializedListener onInitializedListener) {
        this.mOnInitializedListeners.remove(onInitializedListener);
    }

    public void save() {
        if (this.mRecords != null) {
            new SaveTask().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new String[]{"components-history.json"});
        } else {
            this.mHasPendingSave = true;
        }
    }

    public void touch(String str, String str2) {
        append(str, str2, System.currentTimeMillis());
    }
}
