package com.miui.gallery.discovery;

import android.app.job.JobInfo;
import android.content.ComponentName;
import android.content.Context;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.cloud.syncstate.SyncStateUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SyncUtil;
import java.util.HashMap;

public class RequestSyncJob extends AbstractJob {
    public Object execJob() {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        if (sGetAndroidContext != null && SyncUtil.isGalleryCloudSyncable(sGetAndroidContext) && SyncStateUtil.getDirtyCount(sGetAndroidContext).getSyncableCount() > 0 && !SyncStateUtil.isSyncing(sGetAndroidContext)) {
            SyncUtil.requestSync(sGetAndroidContext, new Builder().setSyncType(SyncType.NORMAL).setSyncReason(Long.MAX_VALUE).build());
            HashMap hashMap = new HashMap();
            hashMap.put("time", MiscUtil.getCurrentDate());
            GallerySamplingStatHelper.recordCountEvent("Sync", "sync_request_sync_periodic", hashMap);
        }
        return null;
    }

    public JobInfo getJobInfo(Context context, ComponentName componentName) {
        return new JobInfo.Builder(this.mJobId, componentName).setRequiredNetworkType(2).setRequiresCharging(true).setPeriodic(43200000).build();
    }
}
