package com.miui.gallery.pendingtask;

import android.app.job.JobInfo;
import android.app.job.JobInfo.Builder;
import android.app.job.JobParameters;
import android.content.ComponentName;
import android.os.PersistableBundle;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.pendingtask.base.PendingTask;
import com.miui.gallery.pendingtask.base.PendingTask.Callback;
import com.miui.gallery.pendingtask.base.PendingTaskInfo;
import com.miui.gallery.pendingtask.base.PendingTaskService;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class PendingTaskManager {
    private static final int[] TIME_STAGE = {1, 2, 3, 6, 12, 24, 48, 72, 168};
    private static PendingTaskManager instance;

    private PendingTaskManager() {
    }

    private void cancelJob(long j) {
        PendingTaskService.cancelJob(GalleryApp.sGetAndroidContext(), generateJobId(j));
    }

    private int generateJobId(long j) {
        return (int) ((j % 1000) + 1000);
    }

    public static synchronized PendingTaskManager getInstance() {
        PendingTaskManager pendingTaskManager;
        synchronized (PendingTaskManager.class) {
            if (instance == null) {
                instance = new PendingTaskManager();
            }
            pendingTaskManager = instance;
        }
        return pendingTaskManager;
    }

    private static void recordDropReason(int i, String str) {
        HashMap hashMap = new HashMap();
        hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, String.valueOf(i));
        hashMap.put("reason", str);
        GallerySamplingStatHelper.recordCountEvent("pending_task", "pending_task_drop_reason", hashMap);
    }

    private static void recordExpireCount() {
        long currentTimeMillis = System.currentTimeMillis() - 604800000;
        List query = GalleryEntityManager.getInstance().query(PendingTaskInfo.class, String.format("%s > %s AND %s < %s", new Object[]{"createTime", Long.valueOf(currentTimeMillis - 86400000), "createTime", Long.valueOf(currentTimeMillis)}), null);
        if (query != null && query.size() > 0) {
            HashMap hashMap = new HashMap();
            hashMap.put("count", String.valueOf(query.size()));
            GallerySamplingStatHelper.recordCountEvent("pending_task", "pending_task_expire_count", hashMap);
            Log.w("PendingTaskManager", "%s tasks expire.", Integer.valueOf(query.size()));
        }
    }

    private static void recordFinishDuration(long j) {
        float f = (((float) j) * 1.0f) / 3600000.0f;
        int generatorValueStage = GallerySamplingStatHelper.generatorValueStage(f, TIME_STAGE);
        HashMap hashMap = new HashMap();
        hashMap.put("stage", String.valueOf(generatorValueStage));
        GallerySamplingStatHelper.recordCountEvent("pending_task", "pending_task_finish_duration", hashMap);
        Log.d("PendingTaskManager", "task spend %s hour since post, record stage %s.", new DecimalFormat("#.00").format((double) f), Integer.valueOf(generatorValueStage));
    }

    private static void recordProcessDuration(int i, long j) {
        if (j >= 600000) {
            HashMap hashMap = new HashMap();
            hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, String.valueOf(i));
            hashMap.put("cost", String.valueOf(j));
            GallerySamplingStatHelper.recordCountEvent("pending_task", "pending_task_process_cost", hashMap);
        }
    }

    private static void recordRescheduleCount(int i) {
        HashMap hashMap = new HashMap();
        hashMap.put("count", String.valueOf(i));
        GallerySamplingStatHelper.recordCountEvent("pending_task", "pending_task_reschedule", hashMap);
    }

    private void scheduleTask(PendingTaskInfo pendingTaskInfo) {
        Log.d("PendingTaskManager", "scheduleTask type: %s taskId: %s", Integer.valueOf(pendingTaskInfo.getTaskType()), Long.valueOf(pendingTaskInfo.getId()));
        ComponentName componentName = new ComponentName(GalleryApp.sGetAndroidContext(), PendingTaskService.class);
        PersistableBundle persistableBundle = new PersistableBundle();
        persistableBundle.putLong("taskId", pendingTaskInfo.getId());
        long minLatencyMillis = pendingTaskInfo.getMinLatencyMillis() - (System.currentTimeMillis() - pendingTaskInfo.getCreateTime());
        int i = 2;
        switch (pendingTaskInfo.getNetType()) {
            case 0:
                i = 0;
                break;
            case 2:
                i = 1;
                break;
        }
        Builder requiredNetworkType = new Builder(generateJobId(pendingTaskInfo.getId()), componentName).setExtras(persistableBundle).setRequiresCharging(pendingTaskInfo.isRequireCharging()).setRequiresDeviceIdle(pendingTaskInfo.isRequireDeviceIdle()).setRequiredNetworkType(i);
        long j = 0;
        if (minLatencyMillis > 0) {
            j = minLatencyMillis;
        }
        PendingTaskService.scheduleJob(GalleryApp.sGetAndroidContext(), requiredNetworkType.setMinimumLatency(j).build());
    }

    public void cancel(int i, String str) {
        Log.d("PendingTaskManager", "cancel task. type: %s tag: %s", Integer.valueOf(i), str);
        if (!TextUtils.isEmpty(str)) {
            GalleryEntityManager instance2 = GalleryEntityManager.getInstance();
            Object[] objArr = {"taskType", Integer.valueOf(i), "taskTag", str};
            PendingTaskInfo pendingTaskInfo = (PendingTaskInfo) instance2.find(PendingTaskInfo.class, String.format("%s=%s and %s='%s'", objArr), null);
            instance2.delete(pendingTaskInfo);
            if (pendingTaskInfo != null) {
                cancelJob(pendingTaskInfo.getId());
            }
        }
    }

    public void cancelAll(int i) {
        Log.d("PendingTaskManager", "cancel all. type: %s", (Object) Integer.valueOf(i));
        GalleryEntityManager instance2 = GalleryEntityManager.getInstance();
        String format = String.format("%s=%s", new Object[]{"taskType", Integer.valueOf(i)});
        List<PendingTaskInfo> query = instance2.query(PendingTaskInfo.class, format, null);
        if (query != null && !query.isEmpty()) {
            for (PendingTaskInfo id : query) {
                cancelJob(id.getId());
            }
            instance2.delete(PendingTaskInfo.class, format, null);
        }
    }

    public void checkTaskList() {
        boolean z;
        recordExpireCount();
        List<PendingTaskInfo> query = GalleryEntityManager.getInstance().query(PendingTaskInfo.class, String.format("%s > %s", new Object[]{"createTime", Long.valueOf(System.currentTimeMillis() - 604800000)}), null);
        if (query != null && !query.isEmpty()) {
            List allPendingJob = PendingTaskService.getAllPendingJob(GalleryApp.sGetAndroidContext());
            int i = 0;
            for (PendingTaskInfo pendingTaskInfo : query) {
                int generateJobId = generateJobId(pendingTaskInfo.getId());
                if (allPendingJob == null) {
                    scheduleTask(pendingTaskInfo);
                } else {
                    Iterator it = allPendingJob.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            if (((JobInfo) it.next()).getId() == generateJobId) {
                                z = true;
                                break;
                            }
                        } else {
                            z = false;
                            break;
                        }
                    }
                    if (!z) {
                        i++;
                        scheduleTask(pendingTaskInfo);
                    }
                }
            }
            recordRescheduleCount(i);
        }
    }

    public void executeTask(long j, Callback callback) {
        boolean z;
        Log.d("PendingTaskManager", "executeTask taskId: %s", (Object) Long.valueOf(j));
        GalleryEntityManager instance2 = GalleryEntityManager.getInstance();
        PendingTaskInfo pendingTaskInfo = (PendingTaskInfo) instance2.find(PendingTaskInfo.class, j);
        if (pendingTaskInfo == null) {
            Log.e("PendingTaskManager", "can't find taskInfo %s", (Object) Long.valueOf(j));
            return;
        }
        int taskType = pendingTaskInfo.getTaskType();
        long expireTime = pendingTaskInfo.getExpireTime();
        long currentTimeMillis = System.currentTimeMillis();
        if (expireTime <= 0 || expireTime >= currentTimeMillis) {
            PendingTask create = PendingTaskFactory.create(taskType);
            if (create == null) {
                Log.e("PendingTaskManager", "can't find PendingTask of this type %s", (Object) Integer.valueOf(taskType));
                instance2.delete(pendingTaskInfo);
                recordDropReason(taskType, "create_task");
                return;
            }
            create.setCallback(callback);
            Object obj = null;
            try {
                obj = create.parseData(pendingTaskInfo.getData());
            } catch (Exception e) {
                Log.e("PendingTaskManager", "task %s parseData error.\n", Integer.valueOf(taskType), e);
            }
            if (obj == null) {
                instance2.delete(pendingTaskInfo);
                recordDropReason(taskType, "data_parse");
                return;
            }
            long currentTimeMillis2 = System.currentTimeMillis();
            try {
                Log.d("PendingTaskManager", "task %s begin process.\n", (Object) Integer.valueOf(pendingTaskInfo.getTaskType()));
                z = create.process(obj);
            } catch (Exception e2) {
                Log.e("PendingTaskManager", "task %s process error.\n", Integer.valueOf(pendingTaskInfo.getTaskType()), e2);
                z = false;
            }
            long currentTimeMillis3 = System.currentTimeMillis() - currentTimeMillis2;
            recordProcessDuration(taskType, currentTimeMillis3);
            if (z) {
                pendingTaskInfo.increaseRetryTime();
                if (pendingTaskInfo.getRetryTime() >= 3) {
                    Log.w("PendingTaskManager", "task %s retry %s times, drop it!", Integer.valueOf(taskType), Integer.valueOf(pendingTaskInfo.getRetryTime()));
                    instance2.delete(pendingTaskInfo);
                    recordDropReason(taskType, "over_time");
                } else {
                    instance2.update(pendingTaskInfo);
                    scheduleTask(pendingTaskInfo);
                }
            } else {
                recordFinishDuration(System.currentTimeMillis() - pendingTaskInfo.getCreateTime());
                instance2.delete(pendingTaskInfo);
            }
            Log.d("PendingTaskManager", "execute taskId %s done, cost %s ms, need retry %s", Long.valueOf(j), Long.valueOf(currentTimeMillis3), Boolean.valueOf(z));
            return;
        }
        Log.w("PendingTaskManager", "task %s is out of date", Integer.valueOf(taskType));
        instance2.delete(pendingTaskInfo);
        recordDropReason(taskType, "out_date");
    }

    public void executeTask(JobParameters jobParameters, Callback callback) {
        Log.d("PendingTaskManager", "executeTask jobId: %s", (Object) Integer.valueOf(jobParameters.getJobId()));
        PersistableBundle extras = jobParameters.getExtras();
        if (extras != null) {
            long j = extras.getLong("taskId", 0);
            if (j != 0) {
                executeTask(j, callback);
            }
        }
    }

    public <T> void postTask(int i, T t) {
        postTask(i, t, null);
    }

    public <T> void postTask(int i, T t, String str) {
        postTask(i, t, str, 0);
    }

    public <T> void postTask(int i, T t, String str, long j) {
        if (!TextUtils.isEmpty(str)) {
            cancel(i, str);
        }
        Log.d("PendingTaskManager", "postTask type: %s tag: %s", Integer.valueOf(i), str);
        PendingTask create = PendingTaskFactory.create(i);
        if (create != null) {
            PendingTaskInfo pendingTaskInfo = new PendingTaskInfo();
            pendingTaskInfo.setTaskType(i);
            pendingTaskInfo.setTaskTag(str);
            pendingTaskInfo.setCreateTime(System.currentTimeMillis());
            pendingTaskInfo.setExpireTime(j);
            pendingTaskInfo.setNetType(create.getNetworkType());
            pendingTaskInfo.setRequireCharging(create.requireCharging());
            pendingTaskInfo.setRequireDeviceIdle(create.requireDeviceIdle());
            pendingTaskInfo.setMinLatencyMillis(create.getMinLatency());
            try {
                pendingTaskInfo.setData(create.wrapData(t));
                GalleryEntityManager.getInstance().insert((Entity) pendingTaskInfo);
                scheduleTask(pendingTaskInfo);
            } catch (Exception e) {
                Log.e("PendingTaskManager", "postTask %s wrapData error.\n", Integer.valueOf(i), e);
            }
        } else {
            throw new RuntimeException("Can't find PendingTask of this type");
        }
    }
}
