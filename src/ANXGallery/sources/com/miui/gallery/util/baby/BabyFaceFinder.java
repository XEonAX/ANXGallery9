package com.miui.gallery.util.baby;

import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.model.PeopleContactInfo;
import com.miui.gallery.preference.GalleryPreferences.Baby;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.face.PeopleCursorHelper;

public class BabyFaceFinder implements FutureListener<Boolean> {
    private static final Long TIME_INTERVAL_FOR_CHECK_CANDIDATE_PEOPLE = Long.valueOf(604800000);
    private Boolean mFoundBabyAlbums;
    private Future mFuture;
    private BabyAlbumsFoundListener mListener;

    public interface BabyAlbumsFoundListener {
        void onBabyAlbumsFound(Boolean bool);
    }

    /* access modifiers changed from: private */
    public boolean accept(String str, int i) {
        return PeopleContactInfo.isBabyRelation(i) && !TextUtils.isEmpty(str);
    }

    public synchronized void onFutureDone(Future<Boolean> future) {
        if (!future.isCancelled()) {
            this.mFoundBabyAlbums = (Boolean) future.get();
            if (this.mListener != null) {
                this.mListener.onBabyAlbumsFound(this.mFoundBabyAlbums);
            }
        }
        if (future == this.mFuture) {
            this.mFuture = null;
        }
    }

    public synchronized void setBabyAlbumsFoundListener(BabyAlbumsFoundListener babyAlbumsFoundListener) {
        this.mListener = babyAlbumsFoundListener;
    }

    public synchronized void startFindFace(String str) {
        if (this.mFuture != null) {
            this.mFuture.cancel();
        }
        if (System.currentTimeMillis() - Baby.getLastClickPeopleRecommandationTime(str) >= TIME_INTERVAL_FOR_CHECK_CANDIDATE_PEOPLE.longValue()) {
            this.mFuture = ThreadManager.getMiscPool().submit(new Job<Boolean>() {
                /* JADX WARNING: Code restructure failed: missing block: B:14:0x0039, code lost:
                    if (r0 != null) goto L_0x0049;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:22:0x0047, code lost:
                    if (r0 != null) goto L_0x0049;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:24:0x0049, code lost:
                    r0.close();
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:26:0x0051, code lost:
                    return java.lang.Boolean.valueOf(false);
                 */
                /* JADX WARNING: Removed duplicated region for block: B:18:0x0042  */
                public Boolean run(JobContext jobContext) {
                    Cursor cursor;
                    Throwable th;
                    try {
                        cursor = GalleryApp.sGetAndroidContext().getContentResolver().query(PeopleFace.PERSONS_URI, PeopleCursorHelper.PROJECTION, null, null, null);
                        while (cursor != null) {
                            try {
                                if (!cursor.moveToNext()) {
                                    break;
                                } else if (BabyFaceFinder.this.accept(PeopleCursorHelper.getPeopleName(cursor), PeopleCursorHelper.getRelationType(cursor))) {
                                    Boolean valueOf = Boolean.valueOf(true);
                                    if (cursor != null) {
                                        cursor.close();
                                    }
                                    return valueOf;
                                }
                            } catch (Exception unused) {
                            } catch (Throwable th2) {
                                th = th2;
                                if (cursor != null) {
                                }
                                throw th;
                            }
                        }
                    } catch (Exception unused2) {
                        cursor = null;
                    } catch (Throwable th3) {
                        Throwable th4 = th3;
                        cursor = null;
                        th = th4;
                        if (cursor != null) {
                            cursor.close();
                        }
                        throw th;
                    }
                }
            }, this);
        }
    }
}
