package com.miui.gallery.search.statistics;

import android.app.job.JobInfo;
import android.app.job.JobInfo.Builder;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.discovery.AbstractJob;
import com.miui.gallery.util.BackgroundServiceHelper;

public class SearchStatReportJob extends AbstractJob {
    public Object execJob() {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Intent intent = new Intent(sGetAndroidContext, SearchStatReportService.class);
        intent.putExtra(SearchStatReportService.EXTRA_UPLOAD, true);
        BackgroundServiceHelper.startForegroundServiceIfNeed(sGetAndroidContext, intent);
        return null;
    }

    public JobInfo getJobInfo(Context context, ComponentName componentName) {
        return new Builder(this.mJobId, componentName).setRequiredNetworkType(2).setRequiresCharging(true).setRequiresDeviceIdle(true).setPeriodic(86400000).build();
    }
}
