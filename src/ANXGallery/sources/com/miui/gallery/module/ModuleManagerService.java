package com.miui.gallery.module;

import android.app.job.JobParameters;
import android.app.job.JobService;
import android.content.Intent;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.Log;
import miui.net.ConnectivityHelper;

public class ModuleManagerService extends JobService {
    /* access modifiers changed from: private */
    public String TAG = "ModuleManagerService";

    public int onStartCommand(Intent intent, int i, int i2) {
        return 0;
    }

    public boolean onStartJob(final JobParameters jobParameters) {
        Log.d(this.TAG, "onStartJob");
        if (jobParameters != null) {
            final String string = jobParameters.getExtras().getString("module");
            if (string != null) {
                Log.d(this.TAG, "onStartLoadingModulesFromCloud");
                ThreadManager.getMiscPool().submit(new Job<Void>() {
                    public Void run(JobContext jobContext) {
                        if (CTA.canConnectNetwork() && ConnectivityHelper.getInstance().isUnmeteredNetworkConnected() && new CacheRepository(ModuleManagerService.this.getApplicationContext(), false).cache(string) == null) {
                            Log.d(ModuleManagerService.this.TAG, "cache %s failed", (Object) string);
                        }
                        ModuleManagerService.this.jobFinished(jobParameters, false);
                        return null;
                    }
                });
                return true;
            }
        }
        return false;
    }

    public boolean onStopJob(JobParameters jobParameters) {
        Log.d(this.TAG, "onStopJob");
        return false;
    }
}
