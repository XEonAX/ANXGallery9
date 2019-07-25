package com.miui.gallery.util;

import android.accounts.Account;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Looper;
import android.support.v4.content.LocalBroadcastManager;
import android.text.TextUtils;
import com.miui.account.AccountHelper;
import com.miui.gallery.agreement.AgreementsUtils;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.cloud.SyncConditionManager;
import com.miui.gallery.cloud.UpDownloadManager;
import com.miui.gallery.cloud.base.SyncRequest;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.cloud.policy.IPolicy;
import com.miui.gallery.cloud.policy.SyncPolicyManager;
import com.miui.gallery.cloud.syncstate.SyncStateManager;
import com.miui.gallery.preference.GalleryPreferences.Sync;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.GalleryIntent.CloudGuideSource;
import com.miui.gallery.util.deprecated.Preference;
import com.xiaomi.micloudsdk.sync.MiCloudResolver;
import java.util.HashMap;
import miui.gallery.support.SyncCompat;

public class SyncUtil {
    /* access modifiers changed from: private */
    public static void doRequestSync(Context context, SyncRequest syncRequest) {
        Context applicationContext = context.getApplicationContext();
        if (isGalleryCloudSyncable(applicationContext)) {
            if (isSyncPause(applicationContext)) {
                SyncLog.d("SyncUtil", "sync has pause");
                return;
            }
            SyncType wrapSyncType = wrapSyncType(applicationContext, syncRequest.getSyncType());
            SyncRequest build = new Builder().cloneFrom(syncRequest).setSyncType(wrapSyncType).build();
            SyncLog.d("SyncUtil", "requestSync: request[%s] %s", build, TextUtils.join("\n\t", Thread.currentThread().getStackTrace()));
            Account xiaomiAccount = AccountHelper.getXiaomiAccount(applicationContext);
            if (xiaomiAccount == null) {
                SyncLog.w("SyncUtil", "account is null");
                return;
            }
            long syncReason = SyncStateManager.getInstance().getSyncReason();
            if (ContentResolver.isSyncActive(xiaomiAccount, "com.miui.gallery.cloud.provider")) {
                if (SyncStateManager.getInstance().containsReason(build.getSyncReason())) {
                    SyncStateManager.getInstance().setSyncType(wrapSyncType, false);
                    SyncLog.d("SyncUtil", "sync active, reason contain, no need request. active reason[%s], request reason[%s]", Long.toBinaryString(syncReason), Long.toBinaryString(build.getSyncReason()));
                    return;
                }
            } else if (ContentResolver.isSyncPending(xiaomiAccount, "com.miui.gallery.cloud.provider")) {
                SyncType syncType = SyncStateManager.getInstance().getSyncType();
                if (SyncStateManager.getInstance().containsReason(build.getSyncReason())) {
                    if (SyncType.compare(syncType, wrapSyncType) >= 0) {
                        SyncLog.d("SyncUtil", "sync pending, reason contain, no need request, active type[%s], active reason[%s], request type[%s], request reason[%s]", syncType, Long.toBinaryString(syncReason), wrapSyncType, Long.toBinaryString(build.getSyncReason()));
                        return;
                    }
                    SyncLog.d("SyncUtil", "sync pending, reason contain, type upgrade, cancel type[%s], request type[%s]", syncType, wrapSyncType);
                    ContentResolver.cancelSync(xiaomiAccount, "com.miui.gallery.cloud.provider");
                } else if (SyncType.compare(syncType, wrapSyncType) > 0) {
                    build = new Builder().cloneFrom(build).setSyncType(syncType).build();
                    SyncLog.d("SyncUtil", "sync pending, reason no contain, type downgrade, keep type[%s], request type[%s]", syncType, wrapSyncType);
                }
            } else if (syncReason != 0) {
                SyncLog.w("SyncUtil", "Has reason but no request, clear reason[%s]", Long.toBinaryString(syncReason));
                SyncStateManager.getInstance().unmergeReason(Long.MAX_VALUE);
            }
            SyncStateManager.getInstance().mergeReason(build.getSyncReason());
            SyncLog.d("SyncUtil", "request sync, old reason[%s], merged reason[%s]", Long.valueOf(syncReason), Long.valueOf(SyncStateManager.getInstance().getSyncReason()));
            android.content.SyncRequest packSyncParams = packSyncParams(applicationContext, build);
            if (packSyncParams != null) {
                ContentResolver.requestSync(packSyncParams);
                SyncStateManager.getInstance().setSyncType(wrapSyncType, false);
                LocalBroadcastManager.getInstance(applicationContext).sendBroadcast(new Intent("com.miui.gallery.SYNC_COMMAND_DISPATCHED"));
            } else {
                SyncLog.e("SyncUtil", "sync request null");
            }
        }
    }

    public static boolean existXiaomiAccount(Context context) {
        boolean z = false;
        if (context == null) {
            Log.e("SyncUtil", "existXiaomiAccount context null");
            return false;
        }
        if (AccountHelper.getXiaomiAccount(context) != null) {
            z = true;
        }
        return z;
    }

    public static long getResumeTime(Context context) {
        if (context != null) {
            return MiCloudResolver.getResumeTime(context.getApplicationContext(), "com.miui.gallery.cloud.provider");
        }
        Log.e("SyncUtil", "getResumeTime context null");
        return -1;
    }

    public static boolean isGalleryCloudSyncable(Context context) {
        boolean z = false;
        if (context == null) {
            Log.e("SyncUtil", "isGalleryCloudSyncable context null");
            return false;
        }
        Account xiaomiAccount = AccountHelper.getXiaomiAccount(context);
        if (xiaomiAccount == null) {
            return false;
        }
        if (ContentResolver.getMasterSyncAutomatically() && ContentResolver.getSyncAutomatically(xiaomiAccount, "com.miui.gallery.cloud.provider")) {
            z = true;
        }
        return z;
    }

    private static boolean isMetaDataRequest() {
        return !Preference.sIsFirstSynced();
    }

    public static boolean isSyncPause(Context context) {
        if (context == null) {
            Log.e("SyncUtil", "isSyncPause context null");
            return false;
        }
        Account account = AccountCache.getAccount();
        if (account != null) {
            return MiCloudResolver.isSyncPausing(context, account, "com.miui.gallery.cloud.provider");
        }
        Log.e("SyncUtil", "isSyncPause account null");
        return false;
    }

    /* JADX WARNING: Removed duplicated region for block: B:35:0x00a0  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00ca  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00d1  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x00d8  */
    public static android.content.SyncRequest packSyncParams(Context context, SyncRequest syncRequest) {
        boolean z;
        boolean z2;
        if (context == null) {
            Log.e("SyncUtil", "packSyncParams context null");
            return null;
        }
        Account xiaomiAccount = AccountHelper.getXiaomiAccount(context);
        if (xiaomiAccount == null) {
            return null;
        }
        android.content.SyncRequest.Builder syncOnce = new android.content.SyncRequest.Builder().setSyncAdapter(xiaomiAccount, "com.miui.gallery.cloud.provider").syncOnce();
        IPolicy policy = SyncPolicyManager.getInstance().getPolicy(syncRequest.getSyncType());
        if (policy == null || !policy.isEnable()) {
            Log.w("SyncUtil", "no policy for %s", syncRequest.getSyncType());
            policy = SyncPolicyManager.getInstance().getPolicy(SyncType.NORMAL);
        }
        boolean z3 = false;
        boolean z4 = policy != null && policy.isEnable();
        if (!z4) {
            Log.w("SyncUtil", "policy not valid %s", policy);
        }
        boolean isManual = syncRequest.isManual();
        boolean z5 = syncRequest.getSyncType().isForce() || syncRequest.isManual();
        if (isMetaDataRequest()) {
            z2 = true;
        } else if (z4) {
            z3 = policy.isDisallowMetered();
            z = policy.isRequireCharging();
            z2 = policy.isIgnoreBatteryLow();
            syncOnce.setDisallowMetered(z3).setExpedited(z5).setManual(isManual);
            if (z) {
                SyncCompat.setRequiresCharging(syncOnce, z);
            }
            Bundle bundle = new Bundle();
            bundle.putBoolean("sync_no_delay", !syncRequest.isDelayUpload());
            bundle.putString("sync_type", syncRequest.getSyncType().getIdentifier());
            bundle.putLong("sync_reason", syncRequest.getSyncReason());
            if (!z3) {
                bundle.putBoolean("micloud_ignore_wifi_settings", true);
            }
            if (z2) {
                bundle.putBoolean("micloud_ignore_battery_low", true);
            }
            if (isManual) {
                bundle.putBoolean("micloud_force", true);
                bundle.putBoolean("force", true);
            }
            syncOnce.setExtras(bundle);
            return syncOnce.build();
        } else {
            z2 = false;
            z3 = true;
        }
        z = false;
        syncOnce.setDisallowMetered(z3).setExpedited(z5).setManual(isManual);
        if (z) {
        }
        Bundle bundle2 = new Bundle();
        bundle2.putBoolean("sync_no_delay", !syncRequest.isDelayUpload());
        bundle2.putString("sync_type", syncRequest.getSyncType().getIdentifier());
        bundle2.putLong("sync_reason", syncRequest.getSyncReason());
        if (!z3) {
        }
        if (z2) {
        }
        if (isManual) {
        }
        syncOnce.setExtras(bundle2);
        return syncOnce.build();
    }

    public static void pauseSync(Context context, long j) {
        if (context == null) {
            Log.e("SyncUtil", "pauseSync context null");
            return;
        }
        Account account = AccountCache.getAccount();
        if (account == null) {
            Log.e("SyncUtil", "pauseSync account null");
            return;
        }
        MiCloudResolver.pauseSync(context.getApplicationContext(), account, "com.miui.gallery.cloud.provider", j);
        stopSync(context.getApplicationContext());
    }

    public static void requestSync(Context context, SyncRequest syncRequest) {
        if (context == null) {
            Log.e("SyncUtil", "requestSync context null");
        } else if (!AgreementsUtils.isNetworkingAgreementAccepted()) {
            Log.w("SyncUtil", "networking agreement hasn't accepted");
        } else {
            if (Looper.getMainLooper() == Looper.myLooper()) {
                requestSyncInWorkThread(context, syncRequest);
            } else {
                doRequestSync(context, syncRequest);
            }
        }
    }

    private static void requestSyncInWorkThread(Context context, final SyncRequest syncRequest) {
        final Context applicationContext = context.getApplicationContext();
        ThreadManager.getMiscPool().submit(new Job<Object>() {
            public Object run(JobContext jobContext) {
                SyncUtil.doRequestSync(applicationContext, syncRequest);
                return null;
            }
        });
    }

    public static void resumeSync(Context context) {
        if (context == null) {
            Log.e("SyncUtil", "resumeSync context null");
            return;
        }
        Account account = AccountCache.getAccount();
        if (account == null) {
            Log.e("SyncUtil", "pauseSync account null");
            return;
        }
        MiCloudResolver.resumeSync(context.getApplicationContext(), account, "com.miui.gallery.cloud.provider");
        LocalBroadcastManager.getInstance(context).sendBroadcast(new Intent("com.miui.gallery.SYNC_COMMAND_DISPATCHED"));
    }

    public static void setBackupOnlyWifi(Context context, boolean z) {
        if (context == null) {
            Log.e("SyncUtil", "setBackupOnlyWifi context null");
            return;
        }
        Sync.setBackupOnlyInWifi(z);
        if (!z) {
            Account xiaomiAccount = AccountHelper.getXiaomiAccount(context);
            if (xiaomiAccount != null && !ContentResolver.isSyncActive(xiaomiAccount, "com.miui.gallery.cloud.provider") && ContentResolver.isSyncPending(xiaomiAccount, "com.miui.gallery.cloud.provider")) {
                SyncType wrapSyncType = wrapSyncType(context, SyncStateManager.getInstance().getSyncType());
                if (SyncConditionManager.checkIgnoreCancel(5, wrapSyncType) == 0) {
                    long syncReason = SyncStateManager.getInstance().getSyncReason();
                    if (syncReason == 0) {
                        syncReason = 33;
                    }
                    SyncLog.d("SyncUtil", "not back only wifi, sync pending, but condition ok, request reason[%s]", (Object) Long.toBinaryString(syncReason));
                    requestSync(context, new Builder().setSyncType(wrapSyncType).setSyncReason(syncReason).build());
                }
            }
        }
    }

    public static boolean setSyncAutomatically(Context context, boolean z) {
        if (context == null) {
            Log.e("SyncUtil", "switchBackup context null");
            return false;
        }
        Account xiaomiAccount = AccountHelper.getXiaomiAccount(context);
        if (!z) {
            stopSync(context);
        } else if (!PrivacyAgreementUtils.isCloudServiceAgreementEnable(context) && IntentUtil.startCloudMainPage(context)) {
            return false;
        } else {
            if (xiaomiAccount == null) {
                IntentUtil.guideToLoginXiaomiAccount(context, CloudGuideSource.AUTOBACKUP);
                return false;
            }
        }
        statSyncEnabledEvent(z);
        ContentResolver.setSyncAutomatically(xiaomiAccount, "com.miui.gallery.cloud.provider", z);
        return true;
    }

    public static void statSyncEnabledEvent(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put("state", Boolean.toString(z));
        GallerySamplingStatHelper.recordCountEvent("micloud_sync", "sync_enabled", hashMap);
    }

    public static void stopSync(Context context) {
        if (context == null) {
            Log.e("SyncUtil", "stopSync context null");
            return;
        }
        SyncConditionManager.setCancelledForAllBackground(true);
        UpDownloadManager.cancelAllBackgroundPriority(true, true);
        SyncStateManager.getInstance().setSyncType(SyncType.UNKNOW, true);
        LocalBroadcastManager.getInstance(context).sendBroadcast(new Intent("com.miui.gallery.SYNC_COMMAND_DISPATCHED"));
    }

    public static SyncType unpackSyncType(Bundle bundle) {
        if (bundle != null) {
            if (bundle.containsKey("sync_type")) {
                return SyncType.fromIdentifier(bundle.getString("sync_type"));
            }
            if (bundle.getBoolean("micloud_ignore_wifi_settings", false)) {
                return SyncType.GPRS_FORCE;
            }
            if (bundle.getBoolean("micloud_ignore_battery_low", false)) {
                return SyncType.POWER_FORCE;
            }
        }
        return SyncType.NORMAL;
    }

    private static SyncType wrapSyncType(Context context, SyncType syncType) {
        if (syncType != SyncType.NORMAL && syncType != SyncType.UNKNOW && syncType != SyncType.BACKGROUND) {
            return syncType;
        }
        return MiscUtil.isAppProcessInForeground(context) ? SyncType.NORMAL : SyncType.BACKGROUND;
    }
}
