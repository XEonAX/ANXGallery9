package com.miui.gallery.discovery;

import android.annotation.SuppressLint;
import android.app.job.JobInfo;
import android.content.ComponentName;
import android.content.Context;
import android.os.PersistableBundle;
import android.text.TextUtils;

public abstract class AbstractJob {
    protected int mJobId;

    public AbstractJob() {
        this.mJobId = -1;
        this.mJobId = getClass().getSimpleName().hashCode();
    }

    @SuppressLint({"NewApi"})
    private static boolean isJobExtrasEquals(PersistableBundle persistableBundle, PersistableBundle persistableBundle2) {
        return (persistableBundle.isEmpty() && persistableBundle2.isEmpty()) || TextUtils.equals(persistableBundle.toString(), persistableBundle2.toString());
    }

    @SuppressLint({"NewApi"})
    public boolean equals(JobInfo jobInfo, JobInfo jobInfo2) {
        return jobInfo != null && jobInfo2 != null && jobInfo.getId() == jobInfo2.getId() && jobInfo.getService().equals(jobInfo2.getService()) && jobInfo.isPeriodic() == jobInfo2.isPeriodic() && jobInfo.getIntervalMillis() == jobInfo2.getIntervalMillis() && jobInfo.getInitialBackoffMillis() == jobInfo2.getInitialBackoffMillis() && jobInfo.getBackoffPolicy() == jobInfo2.getBackoffPolicy() && jobInfo.getNetworkType() == jobInfo2.getNetworkType() && jobInfo.isRequireCharging() == jobInfo2.isRequireCharging() && jobInfo.isRequireDeviceIdle() == jobInfo2.isRequireDeviceIdle() && isJobExtrasEquals(jobInfo.getExtras(), jobInfo2.getExtras());
    }

    public abstract Object execJob();

    public int getJobId() {
        return this.mJobId;
    }

    public abstract JobInfo getJobInfo(Context context, ComponentName componentName);

    public boolean needsReschedule() {
        return false;
    }

    public void setJobId(int i) {
        this.mJobId = i;
    }
}
