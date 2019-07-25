package com.miui.gallery.data;

import android.util.LruCache;
import com.miui.gallery.cloud.peopleface.PeopleFace;
import com.miui.gallery.provider.deprecated.NormalPeopleFaceMediaSet;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import java.util.ArrayList;

public class CacheOfAllFacesInOnePhoto {
    private static CacheOfAllFacesInOnePhoto mInstance;
    private LruCache<String, ArrayList<PeopleFace>> mFacesCache = new LruCache<>(5);

    public interface PhotoViewProvider {
        void onInvalidated();
    }

    public static CacheOfAllFacesInOnePhoto getInstance() {
        if (mInstance == null) {
            mInstance = new CacheOfAllFacesInOnePhoto();
        }
        return mInstance;
    }

    public void clearCache() {
        synchronized (this.mFacesCache) {
            this.mFacesCache.trimToSize(-1);
        }
    }

    public ArrayList<PeopleFace> requestFacesOfThePhoto(final PhotoViewProvider photoViewProvider, final String str) {
        ArrayList<PeopleFace> arrayList;
        synchronized (this.mFacesCache) {
            arrayList = (ArrayList) this.mFacesCache.get(str);
        }
        if (arrayList == null) {
            ThreadManager.getMiscPool().submit(new Job<ArrayList<PeopleFace>>() {
                public ArrayList<PeopleFace> run(JobContext jobContext) {
                    return NormalPeopleFaceMediaSet.getBrothers(str);
                }
            }, new FutureListener<ArrayList<PeopleFace>>() {
                public void onFutureDone(Future<ArrayList<PeopleFace>> future) {
                    if (future.get() != null) {
                        CacheOfAllFacesInOnePhoto.this.saveFacesOfThePhoto((ArrayList) future.get(), str);
                        photoViewProvider.onInvalidated();
                    }
                }
            });
        }
        return arrayList;
    }

    public void saveFacesOfThePhoto(ArrayList<PeopleFace> arrayList, String str) {
        synchronized (this.mFacesCache) {
            this.mFacesCache.put(str, arrayList);
        }
    }
}
