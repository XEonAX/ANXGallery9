package com.miui.gallery.pendingtask.base;

import android.app.job.JobInfo;
import android.app.job.JobParameters;
import android.app.job.JobScheduler;
import android.app.job.JobService;
import android.content.Context;
import com.miui.gallery.pendingtask.PendingTaskManager;
import com.miui.gallery.pendingtask.base.PendingTask.Callback;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.ThreadPool;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.Log;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class PendingTaskService extends JobService {
    /* access modifiers changed from: private */
    public Map<Integer, Future> mRunningQueue = null;
    private ThreadPool mThreadPool;

    private class PendingTaskJob implements Job<Void> {
        private JobParameters mParams;

        public PendingTaskJob(JobParameters jobParameters) {
            this.mParams = jobParameters;
        }

        public Void run(final JobContext jobContext) {
            PendingTaskManager.getInstance().executeTask(this.mParams, (Callback) new Callback() {
                public boolean isCancelled() {
                    return jobContext.isCancelled();
                }
            });
            PendingTaskService.this.jobFinished(this.mParams, false);
            PendingTaskService.this.mRunningQueue.remove(Integer.valueOf(this.mParams.getJobId()));
            return null;
        }
    }

    public static void cancelJob(Context context, int i) {
        ((JobScheduler) context.getSystemService("jobscheduler")).cancel(i);
    }

    public static List<JobInfo> getAllPendingJob(Context context) {
        return ((JobScheduler) context.getSystemService("jobscheduler")).getAllPendingJobs();
    }

    public static void scheduleJob(Context context, JobInfo jobInfo) {
        Log.i("PendingTaskService", "scheduleJob jobId: %s", (Object) Integer.valueOf(jobInfo.getId()));
        ((JobScheduler) context.getSystemService("jobscheduler")).schedule(jobInfo);
    }

    public void onCreate() {
        super.onCreate();
        Log.d("PendingTaskService", "onCreate");
        this.mThreadPool = new ThreadPool(2, 4);
        this.mRunningQueue = new ConcurrentHashMap();
    }

    public void onDestroy() {
        super.onDestroy();
        Log.d("PendingTaskService", "onDestroy");
        this.mThreadPool.shutdown();
    }

    public boolean onStartJob(JobParameters jobParameters) {
        Log.d("PendingTaskService", "onStartJob jobId: %s", (Object) Integer.valueOf(jobParameters.getJobId()));
        this.mRunningQueue.put(Integer.valueOf(jobParameters.getJobId()), this.mThreadPool.submit(new PendingTaskJob(jobParameters)));
        return true;
    }

    public boolean onStopJob(JobParameters jobParameters) {
        Log.d("PendingTaskService", "onStopJob jobId: %s", (Object) Integer.valueOf(jobParameters.getJobId()));
        Future future = (Future) this.mRunningQueue.remove(Integer.valueOf(jobParameters.getJobId()));
        if (future != null) {
            future.cancel();
        }
        return false;
    }
}
