package com.miui.gallery.video.editor;

import android.content.Context;
import android.util.Log;
import com.nexstreaming.nexeditorsdk.nexApplicationConfig;
import com.nexstreaming.nexeditorsdk.nexConfig;
import com.nexstreaming.nexeditorsdk.nexEngine;

public class NexEngine {
    private static nexEngine mEngine;
    private static boolean mIsInit;
    /* access modifiers changed from: private */
    public static Boolean mIsInitFinished = Boolean.valueOf(false);

    public static synchronized nexEngine getEngine(Context context) {
        nexEngine nexengine;
        synchronized (NexEngine.class) {
            if (mIsInit) {
                if (mEngine == null) {
                    nexEngine.setLoadListAsync(true);
                    mEngine = new nexEngine(context.getApplicationContext());
                }
                nexengine = mEngine;
            } else {
                throw new IllegalStateException("call init first");
            }
        }
        return nexengine;
    }

    public static void init(Context context, int i, final Runnable runnable) {
        if (!mIsInit) {
            nexApplicationConfig.setAspectMode(i);
            Context applicationContext = context.getApplicationContext();
            nexApplicationConfig.createApp(applicationContext);
            nexConfig.set(24883200, 4, 250, false, 8294400);
            nexApplicationConfig.init(applicationContext, "MiuiGallery");
            mIsInit = true;
            nexApplicationConfig.waitForLoading(context, new Runnable() {
                public void run() {
                    NexEngine.mIsInitFinished = Boolean.valueOf(true);
                    runnable.run();
                }
            });
            return;
        }
        runnable.run();
    }

    public static void releaseEngine() {
        if (mIsInitFinished.booleanValue()) {
            Log.d("NexEngine", "releaseEngine");
            mEngine = null;
            try {
                nexApplicationConfig.releaseApp();
            } catch (Exception e) {
                e.printStackTrace();
            }
            mIsInit = false;
            mIsInitFinished = Boolean.valueOf(false);
        }
    }
}
