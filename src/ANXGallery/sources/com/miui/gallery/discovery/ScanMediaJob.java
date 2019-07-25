package com.miui.gallery.discovery;

import android.app.job.JobInfo;
import android.app.job.JobInfo.Builder;
import android.content.ComponentName;
import android.content.Context;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.scanner.MediaScannerUtil;
import com.miui.gallery.util.Log;

public class ScanMediaJob extends AbstractJob {
    public Object execJob() {
        Log.i("ScanMediaJob", "execJob %d", (Object) Long.valueOf(System.currentTimeMillis()));
        MediaScannerUtil.scanVolume(GalleryApp.sGetAndroidContext(), "external");
        MediaScannerUtil.refreshIgnoreListIfNeeded(GalleryApp.sGetAndroidContext());
        return null;
    }

    public JobInfo getJobInfo(Context context, ComponentName componentName) {
        return new Builder(this.mJobId, componentName).setRequiredNetworkType(0).setRequiresCharging(true).setRequiresDeviceIdle(true).setPeriodic(86400000).build();
    }
}
