package com.miui.gallery.cloud.jobs;

import android.app.job.JobInfo;
import android.app.job.JobParameters;
import android.app.job.JobScheduler;
import android.app.job.JobService;
import android.content.ComponentName;
import android.content.Context;
import com.miui.gallery.cloud.taskmanager.Task;
import com.miui.gallery.cloud.taskmanager.TaskManager;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

public class SyncJobService extends JobService {
    private TaskManager mTaskManager;

    private static class JobFactory {
        public static AbsSyncJob createJob(int i) {
            Class cls = i != 10000 ? null : BackDownloadJob.class;
            if (cls != null) {
                try {
                    AbsSyncJob absSyncJob = (AbsSyncJob) cls.newInstance();
                    absSyncJob.setJobId(i);
                    return absSyncJob;
                } catch (InstantiationException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e2) {
                    e2.printStackTrace();
                }
            }
            return null;
        }
    }

    private class JobTask extends Task {
        private JobParameters mParameters;

        JobTask(JobParameters jobParameters) {
            this.mParameters = jobParameters;
        }

        public int compareTo(Task task) {
            return 0;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (obj == null || !(obj instanceof JobTask)) {
                return false;
            }
            JobTask jobTask = (JobTask) obj;
            if ((getParameters() == null && jobTask.getParameters() == null) || !(getParameters() == null || jobTask.getParameters() == null || getParameters().getJobId() != jobTask.getParameters().getJobId())) {
                z = true;
            }
            return z;
        }

        public JobParameters getParameters() {
            return this.mParameters;
        }

        public int hashCode() {
            if (this.mParameters == null) {
                return 0;
            }
            return this.mParameters.getJobId();
        }

        /* JADX WARNING: type inference failed for: r0v0 */
        /* JADX WARNING: type inference failed for: r0v1, types: [java.lang.Object] */
        /* JADX WARNING: type inference failed for: r2v3, types: [java.lang.Object] */
        /* JADX WARNING: type inference failed for: r6v0 */
        /* JADX WARNING: type inference failed for: r0v8 */
        /* JADX WARNING: type inference failed for: r0v10 */
        /* JADX WARNING: type inference failed for: r0v11 */
        /* JADX WARNING: type inference failed for: r0v12 */
        /* JADX WARNING: Multi-variable type inference failed */
        /* JADX WARNING: Removed duplicated region for block: B:18:0x004b  */
        /* JADX WARNING: Unknown variable types count: 2 */
        public Object run(JobContext jobContext) {
            ? r0;
            AbsSyncJob absSyncJob;
            Object obj = 0;
            try {
                if (this.mParameters != null) {
                    absSyncJob = JobFactory.createJob(this.mParameters.getJobId());
                    if (absSyncJob != 0) {
                        try {
                            obj = absSyncJob.execute();
                        } catch (Throwable th) {
                            ? r6 = absSyncJob;
                            th = th;
                            r0 = r6;
                            SyncJobService.this.jobFinished(this.mParameters, false);
                            if (r0 != 0) {
                            }
                            throw th;
                        }
                    }
                } else {
                    absSyncJob = 0;
                    obj = obj;
                }
                SyncJobService.this.jobFinished(this.mParameters, false);
                if (absSyncJob != 0) {
                    GallerySamplingStatHelper.recordCountEvent("Sync", String.format(Locale.US, "sync_job_%s", new Object[]{absSyncJob.getClass().getSimpleName()}));
                }
                return obj;
            } catch (Throwable th2) {
                th = th2;
                r0 = obj;
                SyncJobService.this.jobFinished(this.mParameters, false);
                if (r0 != 0) {
                    GallerySamplingStatHelper.recordCountEvent("Sync", String.format(Locale.US, "sync_job_%s", new Object[]{r0.getClass().getSimpleName()}));
                }
                throw th;
            }
        }
    }

    public static int scheduleJob(Context context, int i) {
        if (context == null) {
            return 0;
        }
        AbsSyncJob createJob = JobFactory.createJob(i);
        if (createJob != null) {
            return scheduleJob(context, createJob);
        }
        return 1;
    }

    private static int scheduleJob(Context context, AbsSyncJob absSyncJob) {
        boolean z;
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        List allPendingJobs = jobScheduler.getAllPendingJobs();
        JobInfo jobInfo = absSyncJob.getJobInfo(context, new ComponentName(context, SyncJobService.class));
        Iterator it = allPendingJobs.iterator();
        while (true) {
            if (it.hasNext()) {
                if (absSyncJob.equals(jobInfo, (JobInfo) it.next())) {
                    z = true;
                    break;
                }
            } else {
                z = false;
                break;
            }
        }
        if (z) {
            Log.d("SyncJobService", "scheduledJob %d", (Object) Integer.valueOf(absSyncJob.getJobId()));
            return 1;
        }
        if (jobInfo == null) {
            jobScheduler.cancel(absSyncJob.getJobId());
            Log.d("SyncJobService", "cancel Job %d", (Object) Integer.valueOf(absSyncJob.getJobId()));
        } else if (jobScheduler.schedule(jobInfo) > 0) {
            Log.d("SyncJobService", "scheduleJob %d success", (Object) Integer.valueOf(absSyncJob.getJobId()));
            return 1;
        }
        return 0;
    }

    public void onCreate() {
        super.onCreate();
        this.mTaskManager = new TaskManager(2);
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mTaskManager != null) {
            this.mTaskManager.shutdown();
            this.mTaskManager = null;
        }
    }

    public boolean onStartJob(JobParameters jobParameters) {
        if (jobParameters != null) {
            Log.i("SyncJobService", "onStartJob %s", (Object) Integer.valueOf(jobParameters.getJobId()));
        }
        if (this.mTaskManager != null) {
            this.mTaskManager.submit(new JobTask(jobParameters));
        }
        return true;
    }

    public boolean onStopJob(JobParameters jobParameters) {
        return false;
    }
}
