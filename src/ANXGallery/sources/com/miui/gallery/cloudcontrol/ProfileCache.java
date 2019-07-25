package com.miui.gallery.cloudcontrol;

import android.content.Context;
import android.database.Cursor;
import android.support.v4.util.Pair;
import android.text.TextUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.miui.gallery.R;
import com.miui.gallery.cloudcontrol.FeatureProfile.Deserializer;
import com.miui.gallery.cloudcontrol.FeatureProfile.Status;
import com.miui.gallery.cloudcontrol.observers.FeatureStatusObserver;
import com.miui.gallery.cloudcontrol.observers.FeatureStrategyObserver;
import com.miui.gallery.cloudcontrol.strategies.BaseStrategy;
import com.miui.gallery.provider.GalleryContract.CloudControl;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import io.reactivex.Observer;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Function;
import io.reactivex.functions.Predicate;
import io.reactivex.subjects.PublishSubject;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

class ProfileCache {
    private HashMap<String, FeatureProfile> mCloudCache = new HashMap<>();
    private HashMap<String, Object> mCloudStrategyCache = new HashMap<>();
    private volatile boolean mIsLoadFinished;
    private HashMap<String, FeatureProfile> mLocalCache = new HashMap<>();
    private HashMap<String, Object> mLocalStrategyCache = new HashMap<>();
    private volatile boolean mPendingNotify;
    private final PublishSubject<Pair<String, Status>> mStatusSubject = PublishSubject.create();
    private final PublishSubject<String> mStrategySubject = PublishSubject.create();
    private final Object mSyncLock = new Object();

    ProfileCache() {
    }

    public static /* synthetic */ Object lambda$loadFromDB$3(ProfileCache profileCache, long j, Cursor cursor) {
        if (cursor == null || cursor.isClosed()) {
            Log.e("CloudControl.ProfileCache", "Fill cache failed with a null cursor.");
        } else {
            synchronized (profileCache.mSyncLock) {
                while (cursor.moveToNext()) {
                    FeatureDBItem fromCursor = FeatureDBItem.fromCursor(cursor);
                    profileCache.mCloudCache.put(fromCursor.getName(), fromCursor);
                }
            }
            Log.d("CloudControl.ProfileCache", "Load %d items from database, cost %d ms.", Integer.valueOf(cursor.getCount()), Long.valueOf(System.currentTimeMillis() - j));
        }
        return null;
    }

    static /* synthetic */ boolean lambda$registerStatusObserver$0(String str, Pair pair) throws Exception {
        return !TextUtils.isEmpty((CharSequence) pair.first) && ((String) pair.first).equals(str);
    }

    public static /* synthetic */ Pair lambda$registerStrategyObserver$2(ProfileCache profileCache, Class cls, Merger merger, String str) throws Exception {
        return new Pair(str, profileCache.queryStrategy(str, cls, merger));
    }

    private void loadFromDB(Context context) {
        Context context2 = context;
        SafeDBUtil.safeQuery(context2, CloudControl.URI, FeatureDBItem.PROJECTION, (String) null, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler(System.currentTimeMillis()) {
            private final /* synthetic */ long f$1;

            {
                this.f$1 = r2;
            }

            public final Object handle(Cursor cursor) {
                return ProfileCache.lambda$loadFromDB$3(ProfileCache.this, this.f$1, cursor);
            }
        });
    }

    private void loadFromLocalFile(Reader reader) {
        try {
            GsonBuilder gsonBuilder = new GsonBuilder();
            gsonBuilder.registerTypeAdapter(FeatureProfile.class, new Deserializer());
            ArrayList arrayList = (ArrayList) gsonBuilder.create().fromJson(reader, new TypeToken<ArrayList<FeatureProfile>>() {
            }.getType());
            synchronized (this.mSyncLock) {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    FeatureProfile featureProfile = (FeatureProfile) it.next();
                    this.mLocalCache.put(featureProfile.getName(), featureProfile);
                }
            }
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (Exception e2) {
            try {
                Log.e("CloudControl.ProfileCache", "Failed to load from local file, errorClause: %s, errorMessage: %s.", e2.getCause(), e2.getMessage());
                e2.printStackTrace();
                Map generatorCommonParams = GallerySamplingStatHelper.generatorCommonParams();
                generatorCommonParams.put("errorMsg", e2.getMessage());
                GallerySamplingStatHelper.recordErrorEvent("cloud_control", "parse_local_file_failed", generatorCommonParams);
            } finally {
                try {
                    reader.close();
                } catch (IOException e3) {
                    e3.printStackTrace();
                }
            }
        }
    }

    private void notifyStatusChanged(String str, String str2) {
        this.mStatusSubject.onNext(new Pair(str, Status.fromValue(str2)));
    }

    private void notifyStrategyChanged(String str) {
        this.mStrategySubject.onNext(str);
    }

    /* access modifiers changed from: 0000 */
    public void clearCloudCache() {
        synchronized (this.mSyncLock) {
            for (Entry key : this.mCloudCache.entrySet()) {
                String str = (String) key.getKey();
                notifyStatusChanged(str, this.mLocalCache.get(str) != null ? ((FeatureProfile) this.mLocalCache.get(str)).getStatus() : Status.UNAVAILABLE.getValue());
            }
            this.mCloudCache.clear();
            this.mCloudStrategyCache.clear();
        }
    }

    /* access modifiers changed from: 0000 */
    public void insertToCloudCache(FeatureProfile featureProfile) {
        String name = featureProfile.getName();
        String status = featureProfile.getStatus();
        String strategy = featureProfile.getStrategy();
        FeatureProfile featureProfile2 = (FeatureProfile) this.mCloudCache.get(name);
        synchronized (this.mSyncLock) {
            if (Status.REMOVE.getValue().equals(status)) {
                if (featureProfile2 != null) {
                    this.mCloudCache.remove(name);
                    this.mCloudStrategyCache.remove(name);
                }
                notifyStatusChanged(name, status);
            } else if (featureProfile2 != null) {
                if (featureProfile2.getStatus() != null && featureProfile2.getStatus().equals(Status.ENABLE.getValue())) {
                    status = Status.ENABLE.getValue();
                }
                if (!TextUtils.equals(featureProfile2.getStrategy(), strategy)) {
                    featureProfile2.setStrategy(strategy);
                    this.mCloudStrategyCache.remove(name);
                    notifyStrategyChanged(name);
                }
                if (!TextUtils.equals(featureProfile2.getStatus(), status)) {
                    featureProfile2.setStatus(status);
                    notifyStatusChanged(name, status);
                }
            } else {
                FeatureProfile featureProfile3 = new FeatureProfile();
                featureProfile3.setStrategy(strategy);
                featureProfile3.setStatus(status);
                featureProfile3.setName(name);
                this.mCloudCache.put(name, featureProfile3);
                notifyStatusChanged(name, status);
                notifyStrategyChanged(name);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void load(Context context) {
        loadFromDB(context);
        loadFromLocalFile(new InputStreamReader(context.getResources().openRawResource(R.raw.cloud_control)));
        this.mIsLoadFinished = true;
    }

    /* access modifiers changed from: 0000 */
    public void notifyAfterLoadFinished() {
        synchronized (this.mSyncLock) {
            if (this.mPendingNotify) {
                Log.d("CloudControl.ProfileCache", "Notify all feature status after cache load finished:");
                for (Entry entry : this.mCloudCache.entrySet()) {
                    if (!TextUtils.isEmpty((CharSequence) entry.getKey()) && entry.getValue() != null) {
                        Log.d("CloudControl.ProfileCache", "Feature name: %s, feature status: %s", entry.getKey(), String.valueOf(((FeatureProfile) entry.getValue()).getStatus()));
                        notifyStatusChanged((String) entry.getKey(), ((FeatureProfile) entry.getValue()).getStatus());
                        notifyStrategyChanged((String) entry.getKey());
                    }
                }
                this.mPendingNotify = false;
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public Status queryStatus(String str) {
        if (TextUtils.isEmpty(str)) {
            return Status.UNAVAILABLE;
        }
        synchronized (this.mSyncLock) {
            if (this.mIsLoadFinished) {
                String str2 = null;
                if (this.mCloudCache.get(str) != null) {
                    str2 = ((FeatureProfile) this.mCloudCache.get(str)).getStatus();
                } else if (this.mLocalCache.get(str) != null) {
                    str2 = ((FeatureProfile) this.mLocalCache.get(str)).getStatus();
                }
                if (TextUtils.isEmpty(str2)) {
                    Status status = Status.UNAVAILABLE;
                    return status;
                }
                try {
                    Status fromValue = Status.fromValue(str2);
                    return fromValue;
                } catch (Exception unused) {
                    return Status.UNAVAILABLE;
                }
            } else {
                this.mPendingNotify = true;
                Status status2 = Status.UNAVAILABLE;
                return status2;
            }
        }
    }

    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x007d  */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x00b1 A[ADDED_TO_REGION] */
    /* JADX WARNING: Removed duplicated region for block: B:55:0x00bf  */
    public <T extends BaseStrategy> T queryStrategy(String str, Class<T> cls, Merger<T> merger) {
        BaseStrategy baseStrategy;
        Object obj;
        BaseStrategy baseStrategy2 = null;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        synchronized (this.mSyncLock) {
            if (this.mIsLoadFinished) {
                Object obj2 = this.mCloudStrategyCache.get(str);
                if (obj2 != null && cls.isAssignableFrom(obj2.getClass())) {
                    baseStrategy = (BaseStrategy) obj2;
                } else if (this.mCloudCache.get(str) != null) {
                    String strategy = ((FeatureProfile) this.mCloudCache.get(str)).getStrategy();
                    try {
                        baseStrategy = (BaseStrategy) new Gson().fromJson(strategy, cls);
                        if (baseStrategy != null) {
                            try {
                                baseStrategy.doAdditionalProcessing();
                                this.mCloudStrategyCache.put(str, baseStrategy);
                            } catch (Exception e) {
                                e = e;
                            }
                        }
                    } catch (Exception e2) {
                        e = e2;
                        baseStrategy = null;
                        Log.e("CloudControl.ProfileCache", "Failed to deserialize strategy: %s", (Object) strategy);
                        e.printStackTrace();
                        obj = this.mLocalStrategyCache.get(str);
                        if (obj == null) {
                        }
                        if (this.mLocalCache.get(str) != null) {
                        }
                        if (merger == null) {
                        }
                        if (baseStrategy != null) {
                        }
                        return baseStrategy2;
                    }
                } else {
                    baseStrategy = null;
                }
                obj = this.mLocalStrategyCache.get(str);
                if (obj == null && cls.isAssignableFrom(obj.getClass())) {
                    baseStrategy2 = (BaseStrategy) obj;
                } else if (this.mLocalCache.get(str) != null) {
                    String strategy2 = ((FeatureProfile) this.mLocalCache.get(str)).getStrategy();
                    try {
                        BaseStrategy baseStrategy3 = (BaseStrategy) new Gson().fromJson(strategy2, cls);
                        if (baseStrategy3 != null) {
                            try {
                                baseStrategy3.doAdditionalProcessing();
                                this.mLocalStrategyCache.put(str, baseStrategy3);
                            } catch (Exception e3) {
                                e = e3;
                                baseStrategy2 = baseStrategy3;
                            }
                        }
                        baseStrategy2 = baseStrategy3;
                    } catch (Exception e4) {
                        e = e4;
                        Log.e("CloudControl.ProfileCache", "Failed to deserialize strategy: %s", (Object) strategy2);
                        e.printStackTrace();
                        if (merger == null) {
                        }
                        if (baseStrategy != null) {
                        }
                        return baseStrategy2;
                    }
                }
                if (merger == null && baseStrategy != null && baseStrategy2 != null) {
                    T t = (BaseStrategy) merger.merge(baseStrategy2, baseStrategy);
                    return t;
                } else if (baseStrategy != null) {
                    baseStrategy2 = baseStrategy;
                }
            } else {
                this.mPendingNotify = true;
                return null;
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public Status registerStatusObserver(String str, FeatureStatusObserver featureStatusObserver) {
        if (!TextUtils.isEmpty(str)) {
            if (featureStatusObserver != null) {
                this.mStatusSubject.filter(new Predicate(str) {
                    private final /* synthetic */ String f$0;

                    {
                        this.f$0 = r1;
                    }

                    public final boolean test(Object obj) {
                        return ProfileCache.lambda$registerStatusObserver$0(this.f$0, (Pair) obj);
                    }
                }).observeOn(AndroidSchedulers.mainThread()).subscribe((Observer<? super T>) featureStatusObserver);
            }
            return queryStatus(str);
        }
        throw new IllegalArgumentException("feature should not be empty or null.");
    }

    /* access modifiers changed from: 0000 */
    public <T extends BaseStrategy> T registerStrategyObserver(String str, Class<T> cls, Merger<T> merger, FeatureStrategyObserver<T> featureStrategyObserver) {
        if (!TextUtils.isEmpty(str)) {
            if (featureStrategyObserver != null) {
                this.mStrategySubject.filter(new Predicate(str) {
                    private final /* synthetic */ String f$0;

                    {
                        this.f$0 = r1;
                    }

                    public final boolean test(Object obj) {
                        return ((String) obj).equals(this.f$0);
                    }
                }).map(new Function(cls, merger) {
                    private final /* synthetic */ Class f$1;
                    private final /* synthetic */ Merger f$2;

                    {
                        this.f$1 = r2;
                        this.f$2 = r3;
                    }

                    public final Object apply(Object obj) {
                        return ProfileCache.lambda$registerStrategyObserver$2(ProfileCache.this, this.f$1, this.f$2, (String) obj);
                    }
                }).observeOn(AndroidSchedulers.mainThread()).subscribe((Observer<? super T>) featureStrategyObserver);
            }
            return queryStrategy(str, cls, merger);
        }
        throw new IllegalArgumentException("feature should not be empty or null.");
    }

    /* access modifiers changed from: 0000 */
    public void unregisterStatusObserver(FeatureStatusObserver featureStatusObserver) {
        if (!featureStatusObserver.isDisposed()) {
            featureStatusObserver.dispose();
        }
    }

    /* access modifiers changed from: 0000 */
    public void unregisterStrategyObserver(FeatureStrategyObserver featureStrategyObserver) {
        if (!featureStrategyObserver.isDisposed()) {
            featureStrategyObserver.dispose();
        }
    }
}
