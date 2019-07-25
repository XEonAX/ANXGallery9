package com.miui.gallery.cloud;

import android.content.Context;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.cloud.policy.IPolicy;
import com.miui.gallery.cloud.policy.SyncPolicyManager;
import com.miui.gallery.cloud.syncstate.SyncStateManager;
import com.miui.gallery.cloud.syncstate.SyncStateUtil;
import com.miui.gallery.cloud.syncstate.SyncStateUtil.CloudSpaceInfo;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.cloudcontrol.strategies.SyncStrategy;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.preference.GalleryPreferences.Sync;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.SyncLog;

public class SyncConditionManager {
    private static final Checker[] sCheckers = new Checker[14];
    private static final CheckerFactory sFactory = new CheckerFactory();
    private static long sSpaceCheckTime = 0;
    private static SyncStrategy sSyncConfig;
    private static Object sSyncConfigLock = new Object();

    private static class BackDownloadChecker extends Checker {
        private BackDownloadChecker() {
        }

        /* access modifiers changed from: protected */
        public int checkInternal(SyncType syncType) {
            if (!GalleryCloudUtils.isGalleryCloudSyncable(GalleryApp.sGetAndroidContext())) {
                return 2;
            }
            boolean z = true;
            boolean z2 = !NetworkUtils.isActiveNetworkMetered();
            boolean isPlugged = Sync.getIsPlugged();
            if (z2 && isPlugged) {
                String priorStoragePath = StorageUtils.getPriorStoragePath();
                long totalBytes = StorageUtils.getTotalBytes(priorStoragePath);
                long availableBytes = StorageUtils.getAvailableBytes(priorStoragePath);
                float autoDownloadSpaceLimit = CloudControlStrategyHelper.getSyncStrategy().getAutoDownloadSpaceLimit();
                if (availableBytes <= 0 || totalBytes <= 0 || (((float) availableBytes) * 1.0f) / ((float) totalBytes) <= autoDownloadSpaceLimit) {
                    z = false;
                }
                if (z) {
                    return 0;
                }
            }
            return 2;
        }
    }

    private static class BackDownloadWeakChecker extends Checker {
        private BackDownloadWeakChecker() {
        }

        /* access modifiers changed from: protected */
        public int checkInternal(SyncType syncType) {
            if (!GalleryCloudUtils.isGalleryCloudSyncable(GalleryApp.sGetAndroidContext())) {
                return 2;
            }
            return (!(NetworkUtils.isActiveNetworkMetered() ^ true) || !Sync.getPowerCanSync() || !MiscUtil.isAppProcessInForeground(GalleryApp.sGetAndroidContext())) ? 2 : 0;
        }
    }

    private static class BackUploadChecker extends ServerTagChecker {
        private BackUploadChecker() {
            super();
        }

        /* access modifiers changed from: protected */
        public int checkInternal(SyncType syncType) {
            int checkInternal = super.checkInternal(syncType);
            if (checkInternal == 0) {
                IPolicy policy = SyncPolicyManager.getInstance().getPolicy(syncType);
                if (policy.isDisallowMetered() && NetworkUtils.isActiveNetworkMetered()) {
                    SyncLog.d("SyncConditionManager", "network is metered");
                    return 2;
                } else if (policy.isRequireCharging() && !Sync.getIsPlugged()) {
                    SyncLog.d("SyncConditionManager", "not charged");
                    return 2;
                }
            }
            return checkInternal;
        }
    }

    private static abstract class Checker {
        private final String TAG = getClass().getSimpleName();
        private volatile boolean mCanceled = false;

        Checker() {
        }

        private boolean isCanceled() {
            return this.mCanceled;
        }

        public int check(SyncType syncType) {
            if (isCanceled()) {
                SyncLog.d(this.TAG, "isCanceled");
                return 2;
            } else if (!NetworkUtils.isNetworkConnected()) {
                SyncLog.d(this.TAG, "network not connected");
                return 2;
            } else {
                int checkInternal = checkInternal(syncType);
                if (checkInternal != 0) {
                    SyncLog.d(this.TAG, "check result %d, sync type %s", Integer.valueOf(checkInternal), syncType);
                }
                return checkInternal;
            }
        }

        public int checkIgnoreCancel(SyncType syncType) {
            if (NetworkUtils.isNetworkConnected()) {
                return checkInternal(syncType);
            }
            SyncLog.d(this.TAG, "network not connected");
            return 2;
        }

        /* access modifiers changed from: protected */
        public abstract int checkInternal(SyncType syncType);

        /* access modifiers changed from: protected */
        public void setCanceled(boolean z) {
            if (z) {
                String str = this.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("setCanceled: ");
                sb.append(z);
                SyncLog.d(str, new Throwable(sb.toString()));
            }
            this.mCanceled = z;
        }
    }

    private static class CheckerFactory {
        private CheckerFactory() {
        }

        public Checker createChecker(int i) {
            switch (i) {
                case 0:
                case 1:
                    return new ServerTagChecker();
                case 2:
                case 3:
                case 4:
                case 5:
                    return new BackUploadChecker();
                case 6:
                case 8:
                    return new BackDownloadChecker();
                case 7:
                    return new BackDownloadWeakChecker();
                case 9:
                case 10:
                    return new ForeDownloadOriginChecker();
                case 11:
                    return new ForceForeDownloadOriginChecker();
                case 12:
                case 13:
                    return new ForeDownloadThumbnailChecker();
                default:
                    return new InvalidChecker();
            }
        }
    }

    private static class ForceForeDownloadOriginChecker extends Checker {
        private ForceForeDownloadOriginChecker() {
        }

        /* access modifiers changed from: protected */
        public int checkInternal(SyncType syncType) {
            return 0;
        }
    }

    private static class ForeDownloadOriginChecker extends Checker {
        private ForeDownloadOriginChecker() {
        }

        /* access modifiers changed from: protected */
        public int checkInternal(SyncType syncType) {
            return NetworkUtils.isActiveNetworkMetered() ^ true ? 0 : 3;
        }
    }

    private static class ForeDownloadThumbnailChecker extends Checker {
        private ForeDownloadThumbnailChecker() {
        }

        /* access modifiers changed from: protected */
        public int checkInternal(SyncType syncType) {
            return 0;
        }
    }

    private static class InvalidChecker extends Checker {
        private InvalidChecker() {
        }

        /* access modifiers changed from: protected */
        public int checkInternal(SyncType syncType) {
            return 2;
        }
    }

    private static class ServerTagChecker extends Checker {
        private ServerTagChecker() {
        }

        /* access modifiers changed from: protected */
        public int checkInternal(SyncType syncType) {
            if (!GalleryCloudUtils.isGalleryCloudSyncable(GalleryApp.sGetAndroidContext())) {
                return 2;
            }
            IPolicy policy = SyncPolicyManager.getInstance().getPolicy(syncType);
            if (policy == null || !policy.isEnable()) {
                SyncLog.d("SyncConditionManager", "policy not enable");
                return 2;
            } else if (policy.isIgnoreBatteryLow() || Sync.getPowerCanSync()) {
                return 0;
            } else {
                SyncLog.d("SyncConditionManager", "battery low");
                return 2;
            }
        }
    }

    public static int check(int i) {
        return checkInternal(i, SyncStateManager.getInstance().getSyncType());
    }

    public static int checkCloudSpace(Context context) {
        if (SpaceFullHandler.isOwnerSpaceFull()) {
            SyncLog.d("SyncConditionManager", "Preference.sGetCloudGallerySpaceFull");
            CloudSpaceInfo cloudSpaceInfo = SyncStateUtil.getCloudSpaceInfo(context);
            long total = cloudSpaceInfo.getTotal() - cloudSpaceInfo.getUsed();
            if (total < 20971520) {
                SyncLog.d("SyncConditionManager", "space free little %s", (Object) Long.valueOf(total));
                long currentTimeMillis = System.currentTimeMillis() - sSpaceCheckTime;
                if (currentTimeMillis > 0 && currentTimeMillis < 3600000) {
                    SyncLog.d("SyncConditionManager", "interval %s", (Object) Long.valueOf(currentTimeMillis));
                    return 2;
                }
            }
            SyncLog.d("SyncConditionManager", "try refresh space full pref entry");
            sSpaceCheckTime = System.currentTimeMillis();
        }
        return 0;
    }

    public static int checkForItem(RequestItemBase requestItemBase) {
        int checkInternal = checkInternal(requestItemBase.priority, SyncStateManager.getInstance().getSyncType());
        if (checkInternal != 0 || requestItemBase.getStatus() == 0) {
            return checkInternal;
        }
        return 3;
    }

    public static int checkIgnoreCancel(int i, SyncType syncType) {
        return checkInternalIgnoreCancel(i, syncType);
    }

    private static int checkInternal(int i, SyncType syncType) {
        if (CTA.canConnectNetwork()) {
            return instance(i).check(syncType);
        }
        SyncLog.d("SyncConditionManager", "check cta false");
        return 2;
    }

    private static int checkInternalIgnoreCancel(int i, SyncType syncType) {
        if (CTA.canConnectNetwork()) {
            return instance(i).checkIgnoreCancel(syncType);
        }
        SyncLog.d("SyncConditionManager", "check cta false");
        return 2;
    }

    private static Checker instance(int i) {
        Checker checker;
        synchronized (sCheckers) {
            if (sCheckers[i] == null) {
                sCheckers[i] = sFactory.createChecker(i);
            }
            checker = sCheckers[i];
        }
        return checker;
    }

    public static SyncStrategy sGetSyncConfig() {
        SyncStrategy syncStrategy;
        synchronized (sSyncConfigLock) {
            if (sSyncConfig == null) {
                sSyncConfig = CloudControlStrategyHelper.getSyncStrategy();
            }
            syncStrategy = sSyncConfig;
        }
        return syncStrategy;
    }

    public static void setCancelled(int i, boolean z) {
        instance(i).setCanceled(z);
    }

    public static void setCancelledForAllBackground(boolean z) {
        for (int i = 0; i < 14; i++) {
            if (RequestItemBase.isBackgroundPriority(i)) {
                setCancelled(i, z);
            }
        }
    }
}
