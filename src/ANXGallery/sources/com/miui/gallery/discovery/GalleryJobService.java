package com.miui.gallery.discovery;

import android.app.job.JobInfo;
import android.app.job.JobParameters;
import android.app.job.JobScheduler;
import android.app.job.JobService;
import android.content.ComponentName;
import android.content.Context;
import com.miui.gallery.cloudcontrol.FetchCloudControlDataJob;
import com.miui.gallery.provider.peoplecover.PeopleCoverJob;
import com.miui.gallery.search.statistics.SearchStatReportJob;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import miui.util.async.Task;
import miui.util.async.TaskManager;

public class GalleryJobService extends JobService {
    /* access modifiers changed from: private */
    public static Map<Integer, Class> sJobs = new HashMap();

    private class JobTask extends Task {
        private AbstractJob mJob;
        private JobParameters mJobParams;

        public JobTask(JobParameters jobParameters) {
            this.mJobParams = jobParameters;
        }

        public Object doLoad() throws Exception {
            Class cls = (Class) GalleryJobService.sJobs.get(Integer.valueOf(this.mJobParams.getJobId()));
            if (cls == null) {
                return null;
            }
            this.mJob = (AbstractJob) cls.newInstance();
            this.mJob.setJobId(this.mJobParams.getJobId());
            Log.d("GalleryJobService", "Exec job %d", (Object) Integer.valueOf(this.mJobParams.getJobId()));
            GallerySamplingStatHelper.recordCountEvent("JobServiceStarted", cls.getName(), GallerySamplingStatHelper.generatorCommonParams());
            return this.mJob.execJob();
        }

        public void onResult(TaskManager taskManager, Object obj) {
            String str;
            String str2;
            Map generatorCommonParams = GallerySamplingStatHelper.generatorCommonParams();
            boolean z = false;
            if (obj == null || !(obj instanceof Boolean) || ((Boolean) obj).booleanValue()) {
                GalleryJobService.this.jobFinished(this.mJobParams, false);
                Log.d("GalleryJobService", "Job %d done", (Object) Integer.valueOf(this.mJobParams.getJobId()));
                String str3 = "JobServiceDone";
                if (this.mJob != null) {
                    str = this.mJob.getClass().getName();
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("jobId: ");
                    sb.append(this.mJobParams.getJobId());
                    str = sb.toString();
                }
                GallerySamplingStatHelper.recordCountEvent(str3, str, generatorCommonParams);
                return;
            }
            if (this.mJob != null && this.mJob.needsReschedule()) {
                z = true;
            }
            GalleryJobService.this.jobFinished(this.mJobParams, z);
            Log.d("GalleryJobService", "Job %d failed, rescheduled: %b.", Integer.valueOf(this.mJobParams.getJobId()), Boolean.valueOf(z));
            String str4 = "JobServiceFailed";
            if (this.mJob != null) {
                str2 = this.mJob.getClass().getName();
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("jobId: ");
                sb2.append(this.mJobParams.getJobId());
                str2 = sb2.toString();
            }
            GallerySamplingStatHelper.recordErrorEvent(str4, str2, generatorCommonParams);
            if (z) {
                GallerySamplingStatHelper.recordErrorEvent("JobServiceRescheduled", this.mJob.getClass().getName(), generatorCommonParams);
            }
        }
    }

    static {
        sJobs.put(Integer.valueOf(0), ScanMediaJob.class);
        sJobs.put(Integer.valueOf(3), RecentMediaCleanupJob.class);
        sJobs.put(Integer.valueOf(4), CollectLocationJob.class);
        sJobs.put(Integer.valueOf(5), FetchCloudControlDataJob.class);
        sJobs.put(Integer.valueOf(6), StatisticsJob.class);
        sJobs.put(Integer.valueOf(7), SearchStatReportJob.class);
        sJobs.put(Integer.valueOf(8), RequestSyncJob.class);
        sJobs.put(Integer.valueOf(10), DailyCheckJob.class);
        sJobs.put(Integer.valueOf(11), FileHandleServiceCheckJob.class);
        sJobs.put(Integer.valueOf(12), PersistentResponseCleanupJob.class);
        sJobs.put(Integer.valueOf(13), PeopleCoverJob.class);
        sJobs.put(Integer.valueOf(15), DeleteRecordCleanJob.class);
        sJobs.put(Integer.valueOf(16), CardScenarioJob.class);
        sJobs.put(Integer.valueOf(17), CardCoverUpdateJob.class);
    }

    public static void scheduleJob(Context context, AbstractJob abstractJob) {
        boolean z;
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        List allPendingJobs = jobScheduler.getAllPendingJobs();
        JobInfo jobInfo = abstractJob.getJobInfo(context, new ComponentName(context, GalleryJobService.class));
        if (MiscUtil.isValid(allPendingJobs)) {
            Iterator it = allPendingJobs.iterator();
            while (true) {
                if (it.hasNext()) {
                    if (abstractJob.equals(jobInfo, (JobInfo) it.next())) {
                        z = true;
                        break;
                    }
                } else {
                    break;
                }
            }
        }
        z = false;
        if (z) {
            Log.d("GalleryJobService", "scheduledJob %d", (Object) Integer.valueOf(abstractJob.getJobId()));
            return;
        }
        Log.d("GalleryJobService", "to scheduleJob %d", (Object) Integer.valueOf(abstractJob.getJobId()));
        if (jobInfo == null) {
            jobScheduler.cancel(abstractJob.getJobId());
            Log.d("GalleryJobService", "cancel Job %d", (Object) Integer.valueOf(abstractJob.getJobId()));
        } else if (jobScheduler.schedule(jobInfo) > 0) {
            Log.d("GalleryJobService", "scheduleJob %d success", (Object) Integer.valueOf(abstractJob.getJobId()));
            GallerySamplingStatHelper.recordCountEvent("JobServiceScheduled", abstractJob.getClass().getName(), GallerySamplingStatHelper.generatorCommonParams());
        }
    }

    public static void scheduleJobs(Context context) {
        if (sJobs != null && sJobs.size() != 0) {
            for (Entry entry : sJobs.entrySet()) {
                try {
                    AbstractJob abstractJob = (AbstractJob) ((Class) entry.getValue()).newInstance();
                    abstractJob.setJobId(((Integer) entry.getKey()).intValue());
                    scheduleJob(context, abstractJob);
                } catch (InstantiationException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e2) {
                    e2.printStackTrace();
                }
            }
        }
    }

    public boolean onStartJob(JobParameters jobParameters) {
        TaskManager.getDefault().add(new JobTask(jobParameters));
        return true;
    }

    public boolean onStopJob(JobParameters jobParameters) {
        return false;
    }
}
