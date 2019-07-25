package com.miui.gallery.discovery;

import android.app.job.JobInfo;
import android.app.job.JobInfo.Builder;
import android.content.ComponentName;
import android.content.Context;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.assistant.process.ExistImageFeatureTask;
import com.miui.gallery.pendingtask.PendingTaskManager;
import com.miui.gallery.provider.AlbumSnapshotHelper;
import com.miui.gallery.provider.PeopleFaceSnapshotHelper;
import com.miui.gallery.util.Log;
import java.util.concurrent.atomic.AtomicBoolean;

public class DailyCheckJob extends AbstractJob {
    private static AtomicBoolean isRunning = new AtomicBoolean(false);

    private void doCheck() {
        PendingTaskManager.getInstance().checkTaskList();
        if (PrintSilentInstallTask.isPrintSilentInstallEnable()) {
            PendingTaskManager.getInstance().postTask(4, null, null);
        }
        if (ImageFeatureManager.isImageFeatureCalculationEnable()) {
            PendingTaskManager.getInstance().postTask(6, null, ExistImageFeatureTask.class.getSimpleName());
        }
        AlbumSnapshotHelper.queryAndPersist(GalleryApp.sGetAndroidContext());
        PeopleFaceSnapshotHelper.queryAndPersist(GalleryApp.sGetAndroidContext());
    }

    public Object execJob() {
        if (isRunning.compareAndSet(false, true)) {
            doCheck();
            isRunning.set(false);
        } else {
            Log.d("DailyCheckJob", "A same job is still running.");
        }
        return null;
    }

    public JobInfo getJobInfo(Context context, ComponentName componentName) {
        return new Builder(this.mJobId, componentName).setRequiresDeviceIdle(true).setPeriodic(86400000).build();
    }
}
