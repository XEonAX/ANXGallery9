package com.xiaomi.channel.commonutils.misc;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.SparseArray;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ScheduledJobManager {
    private static volatile ScheduledJobManager instance;
    private ScheduledThreadPoolExecutor executor = new ScheduledThreadPoolExecutor(1);
    /* access modifiers changed from: private */
    public SparseArray<ScheduledFuture> jobFutureMap = new SparseArray<>();
    /* access modifiers changed from: private */
    public Object mapLock = new Object();
    /* access modifiers changed from: private */
    public SharedPreferences preferences;

    public static abstract class Job implements Runnable {
        public abstract int getJobId();
    }

    private static class JobWrapper implements Runnable {
        Job job;

        public JobWrapper(Job job2) {
            this.job = job2;
        }

        /* access modifiers changed from: 0000 */
        public void onJobDone() {
        }

        /* access modifiers changed from: 0000 */
        public void onJobStart() {
        }

        public void run() {
            onJobStart();
            this.job.run();
            onJobDone();
        }
    }

    private ScheduledJobManager(Context context) {
        this.preferences = context.getSharedPreferences("mipush_extra", 0);
    }

    private ScheduledFuture getFutureByJobId(Job job) {
        ScheduledFuture scheduledFuture;
        synchronized (this.mapLock) {
            scheduledFuture = (ScheduledFuture) this.jobFutureMap.get(job.getJobId());
        }
        return scheduledFuture;
    }

    public static ScheduledJobManager getInstance(Context context) {
        if (instance == null) {
            synchronized (ScheduledJobManager.class) {
                if (instance == null) {
                    instance = new ScheduledJobManager(context);
                }
            }
        }
        return instance;
    }

    private static String getJobKey(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("last_job_time");
        sb.append(i);
        return sb.toString();
    }

    public void addOneShootJob(Runnable runnable) {
        addOneShootJob(runnable, 0);
    }

    public void addOneShootJob(Runnable runnable, int i) {
        this.executor.schedule(runnable, (long) i, TimeUnit.SECONDS);
    }

    public boolean addOneShootJob(Job job, int i) {
        if (job == null || getFutureByJobId(job) != null) {
            return false;
        }
        ScheduledFuture schedule = this.executor.schedule(new JobWrapper(job) {
            /* access modifiers changed from: 0000 */
            public void onJobDone() {
                synchronized (ScheduledJobManager.this.mapLock) {
                    ScheduledJobManager.this.jobFutureMap.remove(this.job.getJobId());
                }
            }
        }, (long) i, TimeUnit.SECONDS);
        synchronized (this.mapLock) {
            this.jobFutureMap.put(job.getJobId(), schedule);
        }
        return true;
    }

    public boolean addRepeatJob(Job job, int i) {
        return addRepeatJob(job, i, 0);
    }

    public boolean addRepeatJob(Job job, int i, int i2) {
        if (job == null || getFutureByJobId(job) != null) {
            return false;
        }
        final String jobKey = getJobKey(job.getJobId());
        AnonymousClass1 r2 = new JobWrapper(job) {
            /* access modifiers changed from: 0000 */
            public void onJobDone() {
                ScheduledJobManager.this.preferences.edit().putLong(jobKey, System.currentTimeMillis()).commit();
            }

            /* access modifiers changed from: 0000 */
            public void onJobStart() {
                super.onJobStart();
            }
        };
        long abs = Math.abs(System.currentTimeMillis() - this.preferences.getLong(jobKey, 0)) / 1000;
        if (abs < ((long) (i - i2))) {
            i2 = (int) (((long) i) - abs);
        }
        ScheduledFuture scheduleAtFixedRate = this.executor.scheduleAtFixedRate(r2, (long) i2, (long) i, TimeUnit.SECONDS);
        synchronized (this.mapLock) {
            this.jobFutureMap.put(job.getJobId(), scheduleAtFixedRate);
        }
        return true;
    }

    public boolean cancelJob(int i) {
        synchronized (this.mapLock) {
            ScheduledFuture scheduledFuture = (ScheduledFuture) this.jobFutureMap.get(i);
            if (scheduledFuture == null) {
                return false;
            }
            this.jobFutureMap.remove(i);
            return scheduledFuture.cancel(false);
        }
    }
}
