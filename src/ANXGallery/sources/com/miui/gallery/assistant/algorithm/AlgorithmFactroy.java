package com.miui.gallery.assistant.algorithm;

import android.util.SparseArray;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.assistant.FlagUtil;
import java.lang.ref.SoftReference;

public class AlgorithmFactroy {
    /* access modifiers changed from: private */
    public static final SparseArray<SoftReference<Algorithm>> sAlgorithmCache = new SparseArray<>();
    private static Runnable sRunnable = new Runnable() {
        public void run() {
            synchronized (AlgorithmFactroy.class) {
                for (int i = 0; i < AlgorithmFactroy.sAlgorithmCache.size(); i++) {
                    SoftReference softReference = (SoftReference) AlgorithmFactroy.sAlgorithmCache.valueAt(i);
                    if (softReference != null) {
                        Log.d("AlgorithmFactroy", "release algorithm flag:%d", (Object) Integer.valueOf(AlgorithmFactroy.sAlgorithmCache.keyAt(i)));
                        softReference.clear();
                    }
                }
            }
        }
    };

    private AlgorithmFactroy() {
    }

    private static synchronized void addAlgorithmToCache(int i, Algorithm algorithm) {
        synchronized (AlgorithmFactroy.class) {
            if (algorithm != null) {
                sAlgorithmCache.put(getCacheKey(i), new SoftReference(algorithm));
                scheduleAlgorithmRelease();
            }
        }
    }

    private static Algorithm createAlgorithmByFlag(int i) {
        Algorithm algorithm = FlagUtil.hasFlag(i, 1) ? new QualityScoreAlgorithm() : FlagUtil.hasFlag(i, 2) ? new SceneFilterAlgorithm() : (FlagUtil.hasFlag(i, 4) || FlagUtil.hasFlag(i, 8)) ? new ClusterAlgorithm() : FlagUtil.hasFlag(i, 16) ? new BaiduSceneFilterAlgorithm() : null;
        if (algorithm != null) {
            algorithm.init();
        }
        return algorithm;
    }

    private static int ensureFlag(int i) {
        if (FlagUtil.hasFlag(i, 1)) {
            return 1;
        }
        if (FlagUtil.hasFlag(i, 2)) {
            return 2;
        }
        if (FlagUtil.hasFlag(i, 4)) {
            return 4;
        }
        return FlagUtil.hasFlag(i, 8) ? 8 : 16;
    }

    public static synchronized <T extends Algorithm> T getAlgorithmByFlag(int i) {
        T algorithmFromCache;
        synchronized (AlgorithmFactroy.class) {
            int ensureFlag = ensureFlag(i);
            algorithmFromCache = getAlgorithmFromCache(ensureFlag);
            if (algorithmFromCache == null) {
                algorithmFromCache = createAlgorithmByFlag(ensureFlag);
                Log.d("AlgorithmFactroy", "Create new algorithm %d", (Object) Integer.valueOf(ensureFlag));
            } else {
                Log.d("AlgorithmFactroy", "Get algorithm %d from Cache", (Object) Integer.valueOf(ensureFlag));
            }
            if (algorithmFromCache != null) {
                addAlgorithmToCache(ensureFlag, algorithmFromCache);
            }
        }
        return algorithmFromCache;
    }

    private static synchronized Algorithm getAlgorithmFromCache(int i) {
        Algorithm algorithm;
        synchronized (AlgorithmFactroy.class) {
            int cacheKey = getCacheKey(i);
            SoftReference softReference = (SoftReference) sAlgorithmCache.get(cacheKey);
            algorithm = null;
            if (softReference != null) {
                algorithm = (Algorithm) softReference.get();
                softReference.clear();
                sAlgorithmCache.remove(cacheKey);
            }
        }
        return algorithm;
    }

    private static int getCacheKey(int i) {
        if (i == 4 || i == 8) {
            return 12;
        }
        return i;
    }

    private static void scheduleAlgorithmRelease() {
        ThreadManager.getWorkHandler().removeCallbacks(sRunnable);
        ThreadManager.getWorkHandler().postDelayed(sRunnable, 5000);
    }
}
