package com.miui.gallery.discovery;

import android.app.job.JobInfo;
import android.app.job.JobInfo.Builder;
import android.content.ComponentName;
import android.content.Context;
import com.miui.gallery.data.LocationManager;

public class CollectLocationJob extends AbstractJob {
    public Object execJob() {
        LocationManager.getInstance().loadAllLocation();
        return null;
    }

    public JobInfo getJobInfo(Context context, ComponentName componentName) {
        return new Builder(this.mJobId, componentName).setPeriodic(86400000).setRequiresCharging(true).setRequiresDeviceIdle(true).setRequiredNetworkType(2).build();
    }
}
