package com.miui.gallery.util.baby;

import android.database.Cursor;
import android.text.TextUtils;
import android.util.SparseArray;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.preference.GalleryPreferences.Baby;
import com.miui.gallery.provider.FaceManager;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import java.util.ArrayList;

public class BabyAlbumRecommendationFinder {
    /* access modifiers changed from: private */
    public volatile Future<RecommendationDatas> mFuture;
    /* access modifiers changed from: private */
    public String mPeopleId;
    /* access modifiers changed from: private */
    public volatile RecommendationDatas mRecommandationDatas;
    /* access modifiers changed from: private */
    public volatile RecommendationFoundListener mRecommandationFoundListener;

    public static final class RecommendationDatas {
        public ArrayList<Long> ids;
        public String peopleLocalId;
        public String peopleServerId;
        public int totalFaceCountInFaceAlbum;

        public int getRecommendationSize() {
            if (this.ids != null) {
                return this.ids.size();
            }
            return 0;
        }

        public boolean hasNewRecommendation() {
            return this.ids != null && this.ids.size() > 0;
        }
    }

    public interface RecommendationFoundListener {
        void onRecommendationFound(RecommendationDatas recommendationDatas);
    }

    public BabyAlbumRecommendationFinder(String str) {
        this.mPeopleId = str;
    }

    public void findRecommendation(final SparseArray<Boolean> sparseArray, final String str) {
        if (this.mFuture == null) {
            this.mFuture = ThreadManager.getMiscPool().submit(new Job<RecommendationDatas>() {
                /* JADX WARNING: Code restructure failed: missing block: B:18:0x0090, code lost:
                    if (r2 != null) goto L_0x00a5;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:26:0x00a3, code lost:
                    if (r2 != null) goto L_0x00a5;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:28:0x00a5, code lost:
                    r11.totalFaceCountInFaceAlbum = r2.getCount();
                    r2.close();
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:29:0x00ae, code lost:
                    return r11;
                 */
                /* JADX WARNING: Removed duplicated region for block: B:22:0x0098  */
                public RecommendationDatas run(JobContext jobContext) {
                    Cursor cursor;
                    Throwable th;
                    RecommendationDatas recommendationDatas = new RecommendationDatas();
                    recommendationDatas.peopleServerId = BabyAlbumRecommendationFinder.this.mPeopleId;
                    recommendationDatas.peopleLocalId = String.valueOf(FaceManager.getPeopleLocalIdByServerId(BabyAlbumRecommendationFinder.this.mPeopleId));
                    try {
                        cursor = GalleryApp.sGetAndroidContext().getContentResolver().query(PeopleFace.ONE_PERSON_URI, new String[]{"_id", "title", "mixedDateTime"}, null, new String[]{recommendationDatas.peopleServerId, recommendationDatas.peopleLocalId}, null);
                        while (cursor != null) {
                            try {
                                if (!cursor.moveToNext()) {
                                    break;
                                } else if (!TextUtils.isEmpty(cursor.getString(1)) && sparseArray.get(cursor.getString(1).hashCode()) == null && cursor.getLong(2) > Baby.getLastClickBabyPhotosRecommandationTime(str)) {
                                    if (recommendationDatas.ids == null) {
                                        recommendationDatas.ids = new ArrayList<>();
                                    }
                                    recommendationDatas.ids.add(Long.valueOf(cursor.getLong(0)));
                                }
                            } catch (Exception unused) {
                            } catch (Throwable th2) {
                                th = th2;
                                if (cursor != null) {
                                    recommendationDatas.totalFaceCountInFaceAlbum = cursor.getCount();
                                    cursor.close();
                                }
                                throw th;
                            }
                        }
                    } catch (Exception unused2) {
                        cursor = null;
                    } catch (Throwable th3) {
                        cursor = null;
                        th = th3;
                        if (cursor != null) {
                        }
                        throw th;
                    }
                }
            }, new FutureListener<RecommendationDatas>() {
                public void onFutureDone(Future<RecommendationDatas> future) {
                    if (!future.isCancelled()) {
                        BabyAlbumRecommendationFinder.this.mRecommandationDatas = (RecommendationDatas) future.get();
                        RecommendationFoundListener access$200 = BabyAlbumRecommendationFinder.this.mRecommandationFoundListener;
                        if (access$200 != null) {
                            access$200.onRecommendationFound(BabyAlbumRecommendationFinder.this.mRecommandationDatas);
                        }
                    }
                    if (future == BabyAlbumRecommendationFinder.this.mFuture) {
                        BabyAlbumRecommendationFinder.this.mFuture = null;
                    }
                }
            });
        }
    }

    public void setRecommendationFoundListener(RecommendationFoundListener recommendationFoundListener) {
        this.mRecommandationFoundListener = recommendationFoundListener;
    }
}
