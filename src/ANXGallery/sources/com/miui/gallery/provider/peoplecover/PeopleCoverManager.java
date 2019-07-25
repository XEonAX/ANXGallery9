package com.miui.gallery.provider.peoplecover;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.nexstreaming.nexeditorsdk.nexCrop;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class PeopleCoverManager {
    private static final int[] SCORES = {0, 1, 11, BaiduSceneResult.WESTERN_ARCHITECTURE, 1111, 11111, 111111, 1111111};
    private static final int[] SCORE_STAGE = {0, 1, 2, 3, 4, 5, 6, 7};
    private static PeopleCoverManager sInstance;
    private ArrayList<String> mCoverIds = new ArrayList<>();
    /* access modifiers changed from: private */
    public ArrayList<BaseStrategy> mCoverStrategies = new ArrayList<>();
    private volatile boolean mLoadPeopleCoverDone = false;
    /* access modifiers changed from: private */
    public int mMaxCoverScore = 0;

    private PeopleCoverManager() {
        registerCoverStrategy(new CoverImageSizeStrategy(nexCrop.ABSTRACT_DIMENSION), nexCrop.ABSTRACT_DIMENSION);
        registerCoverStrategy(new CoverScaleStrategy(10000), 10000);
        registerCoverStrategy(new CoverCountStrategy(1000), 1000);
        registerCoverStrategy(new CoverCenterStrategy(100), 100);
        registerCoverStrategy(new CoverEyeXStrategy(10), 10);
        registerCoverStrategy(new CoverEyeYStrategy(1), 1);
        registerCoverStrategy(new CoverColorStrategy(1000000), 1000000);
    }

    /* access modifiers changed from: private */
    public int doChoosePeopleCover(String str, String str2, PeopleCover peopleCover) {
        if (TextUtils.isEmpty(str)) {
            return 0;
        }
        final long currentTimeMillis = System.currentTimeMillis();
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Uri uri = PeopleFace.ONE_PERSON_URI;
        String[] strArr = BaseStrategy.PROJECTION;
        String[] strArr2 = {str, MovieStatUtils.DOWNLOAD_FAILED};
        final String str3 = str;
        final String str4 = str2;
        final PeopleCover peopleCover2 = peopleCover;
        AnonymousClass2 r2 = new QueryHandler<Integer>() {
            public Integer handle(Cursor cursor) {
                int i;
                int i2 = 0;
                if (cursor == null || cursor.getCount() == 0) {
                    return Integer.valueOf(0);
                }
                if (cursor.moveToFirst()) {
                    int i3 = 0;
                    int i4 = 0;
                    while (true) {
                        Iterator it = PeopleCoverManager.this.mCoverStrategies.iterator();
                        int i5 = 0;
                        while (it.hasNext()) {
                            BaseStrategy baseStrategy = (BaseStrategy) it.next();
                            i5 += baseStrategy.getWeight() * (baseStrategy.isValid(cursor) ? 1 : 0);
                        }
                        if (i5 > i3) {
                            i = cursor.getPosition();
                            if (i5 == PeopleCoverManager.this.mMaxCoverScore) {
                                i2 = i5;
                                break;
                            }
                            i4 = i;
                            i3 = i5;
                        }
                        if (!cursor.moveToNext()) {
                            i2 = i3;
                            i = i4;
                            break;
                        }
                    }
                } else {
                    i = 0;
                }
                if (i2 != 0) {
                    Log.d("PeopleCoverManager", "success choose cover for person: %s, position: %d, cost : %d", str3, Integer.valueOf(i), Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                    cursor.moveToPosition(i);
                    PeopleCoverManager.this.setPeopleCover(str3, cursor.getString(10), str4, peopleCover2, i2);
                } else {
                    Log.d("PeopleCoverManager", "choose no cover for person: %s, cost : %d", str3, Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                    PeopleCoverManager.this.setPeopleCover(str3, null, str4, peopleCover2, i2);
                }
                return Integer.valueOf(i2);
            }
        };
        return ((Integer) SafeDBUtil.safeQuery(sGetAndroidContext, uri, strArr, (String) null, strArr2, "dateTaken DESC ", (QueryHandler<T>) r2)).intValue();
    }

    private void ensureLoadPeopleCoverDone() {
        if (!this.mLoadPeopleCoverDone) {
            long currentTimeMillis = System.currentTimeMillis();
            synchronized (this.mCoverIds) {
                if (!this.mLoadPeopleCoverDone) {
                    loadPeopleCover();
                }
            }
            Log.d("PeopleCoverManager", "wait for load cost : %d ", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        }
    }

    /* access modifiers changed from: private */
    public void finishChoosePeopleCover() {
        Iterator it = this.mCoverStrategies.iterator();
        while (it.hasNext()) {
            ((BaseStrategy) it.next()).onFinish();
        }
    }

    /* access modifiers changed from: private */
    public int generatorScoreStage(int i) {
        int length = SCORES.length;
        for (int i2 = 0; i2 < length; i2++) {
            if (i <= SCORES[i2]) {
                return i2;
            }
        }
        return 0;
    }

    public static synchronized PeopleCoverManager getInstance() {
        PeopleCoverManager peopleCoverManager;
        synchronized (PeopleCoverManager.class) {
            if (sInstance == null) {
                sInstance = new PeopleCoverManager();
            }
            peopleCoverManager = sInstance;
        }
        return peopleCoverManager;
    }

    private synchronized void loadPeopleCover() {
        long currentTimeMillis = System.currentTimeMillis();
        List<PeopleCover> query = GalleryEntityManager.getInstance().query(PeopleCover.class, null, null, null, null);
        if (MiscUtil.isValid(query)) {
            this.mCoverIds.clear();
            for (PeopleCover coverId : query) {
                String coverId2 = coverId.getCoverId();
                if (!TextUtils.isEmpty(coverId2)) {
                    this.mCoverIds.add(coverId2);
                }
            }
            Log.d("PeopleCoverManager", "finish load people cover, cost time: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        }
        this.mLoadPeopleCoverDone = true;
    }

    private void registerCoverStrategy(BaseStrategy baseStrategy, int i) {
        this.mCoverStrategies.add(baseStrategy);
        this.mMaxCoverScore += i;
    }

    /* access modifiers changed from: private */
    public void statPeopleCover(float f, int i) {
        GallerySamplingStatHelper.recordNumericPropertyEvent("people", "people_cover_score", (long) GallerySamplingStatHelper.generatorValueStage(f, SCORE_STAGE));
        GallerySamplingStatHelper.recordNumericPropertyEvent("people", "people_cover_success_count", (long) i);
    }

    public ArrayList getCoverIds() {
        ensureLoadPeopleCoverDone();
        return new ArrayList(this.mCoverIds);
    }

    public synchronized void onAccountDelete() {
        if (this.mCoverIds != null) {
            this.mCoverIds.clear();
        }
        this.mLoadPeopleCoverDone = false;
        GalleryEntityManager.getInstance().deleteAll(PeopleCover.class);
        Log.d("PeopleCoverManager", "on account delete");
    }

    public synchronized void setPeopleCover(String str, String str2, String str3, PeopleCover peopleCover, int i) {
        GalleryEntityManager instance = GalleryEntityManager.getInstance();
        if (peopleCover == null) {
            instance.insert((Entity) new PeopleCover(str, str2, str3, i));
        } else {
            peopleCover.setCoverId(str2);
            peopleCover.setServerTag(str3);
            peopleCover.setCoverScore(i);
            instance.update(peopleCover);
        }
    }

    public void startChooseCoverForAllPeople() {
        SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), PeopleFace.PEOPLE_TAG_URI, new String[]{"serverId", "eTag"}, (String) null, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Object>() {
            public Object handle(Cursor cursor) {
                if (cursor == null || cursor.getCount() == 0) {
                    return null;
                }
                long currentTimeMillis = System.currentTimeMillis();
                int i = 0;
                int i2 = 0;
                while (cursor.moveToNext()) {
                    String string = cursor.getString(0);
                    String string2 = cursor.getString(1);
                    PeopleCover peopleCover = (PeopleCover) GalleryEntityManager.getInstance().find(PeopleCover.class, string);
                    int access$000 = (peopleCover == null || !TextUtils.equals(peopleCover.getServerTag(), string2)) ? PeopleCoverManager.this.doChoosePeopleCover(string, string2, peopleCover) : peopleCover.getCoverScore();
                    i += PeopleCoverManager.this.generatorScoreStage(access$000);
                    if (access$000 > 0) {
                        i2++;
                    }
                }
                Log.d("PeopleCoverManager", "finish choose cover for all people, cost time: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                PeopleCoverManager.this.statPeopleCover((((float) i) * 1.0f) / ((float) cursor.getCount()), i2);
                PeopleCoverManager.this.finishChoosePeopleCover();
                return null;
            }
        });
    }
}
