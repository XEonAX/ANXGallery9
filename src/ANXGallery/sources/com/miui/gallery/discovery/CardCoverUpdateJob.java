package com.miui.gallery.discovery;

import android.app.job.JobInfo;
import android.app.job.JobInfo.Builder;
import android.content.ComponentName;
import android.content.Context;
import com.miui.gallery.card.CardManager;
import com.miui.gallery.util.Log;
import java.util.concurrent.atomic.AtomicBoolean;

public class CardCoverUpdateJob extends AbstractJob {
    private static AtomicBoolean isRunning = new AtomicBoolean(false);

    public Object execJob() {
        if (isRunning.compareAndSet(false, true)) {
            CardManager.getInstance().updateCardCovers();
            isRunning.set(false);
        } else {
            Log.d("CardCoverUpdateJob", "A same job is still running.");
        }
        return null;
    }

    public JobInfo getJobInfo(Context context, ComponentName componentName) {
        return new Builder(this.mJobId, componentName).setRequiresCharging(true).setPeriodic(86400000).build();
    }
}
