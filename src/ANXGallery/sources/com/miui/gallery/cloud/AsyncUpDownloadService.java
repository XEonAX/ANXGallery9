package com.miui.gallery.cloud;

import android.app.Notification;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.wifi.WifiManager;
import android.net.wifi.WifiManager.WifiLock;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.os.SystemClock;
import android.support.v4.content.LocalBroadcastManager;
import android.text.TextUtils;
import com.google.common.collect.Lists;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.preference.GalleryPreferences.Sync;
import com.miui.gallery.service.ServiceBase;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.BackgroundServiceHelper;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.NotificationHelper;
import com.miui.gallery.util.SyncLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public class AsyncUpDownloadService extends ServiceBase {
    /* access modifiers changed from: private */
    public static final boolean WAKELOCK_ONLY_CHARGING = SyncConditionManager.sGetSyncConfig().isOnlyChargingAcquireWakelock();
    /* access modifiers changed from: private */
    public static final boolean WAKELOCK_ONLY_SCREEN_OFF = SyncConditionManager.sGetSyncConfig().isOnlyScreenOffAcquireWakelock();
    private static final List<String> sPendingRequests = new ArrayList();
    private BroadcastReceiver mBatteryStateReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.BATTERY_CHANGED".equals(intent.getAction())) {
                int intExtra = intent.getIntExtra("status", -1);
                AsyncUpDownloadService.this.handleChargeStateChanged(intExtra == 2 || intExtra == 5);
            }
        }
    };
    final BroadcastReceiver mConnReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            AsyncUpDownloadService.this.tryCancelTasksWhenConnChanged();
        }
    };
    /* access modifiers changed from: private */
    public AtomicBoolean mDoingCancelTasks = new AtomicBoolean(false);
    private ForegroundRef mForegroundRef;
    private BroadcastReceiver mScreenStateReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if ("android.intent.action.SCREEN_OFF".equals(action)) {
                AsyncUpDownloadService.this.handleScreenOnOff(false);
            } else if ("android.intent.action.SCREEN_ON".equals(action)) {
                AsyncUpDownloadService.this.handleScreenOnOff(true);
            }
        }
    };
    private long mStartTime;
    private final BroadcastReceiver mSyncReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            SyncLog.i("AsyncUpDownloadService", "sync receiver thread %s", Thread.currentThread());
            AsyncUpDownloadService.this.handleRequest(intent);
        }
    };
    private WakeLockRef mWakeLockRef;
    private ResourceRef mWifiLockRef;

    private class ForegroundRef extends ResourceRef {
        public ForegroundRef(String str) {
            super(str);
        }

        /* access modifiers changed from: protected */
        public void onAcquire() {
            AsyncUpDownloadService.this.startForeground(4, NotificationHelper.getEmptyNotification(AsyncUpDownloadService.this.getApplicationContext()));
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
            intentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE");
            AsyncUpDownloadService.this.registerReceiver(AsyncUpDownloadService.this.mConnReceiver, intentFilter);
        }

        /* access modifiers changed from: protected */
        public void onRelease() {
            AsyncUpDownloadService.this.stopForeground(true);
            AsyncUpDownloadService.this.stopSelf();
            GalleryUtils.safeUnregisterReceiver(AsyncUpDownloadService.this, AsyncUpDownloadService.this.mConnReceiver);
        }
    }

    static abstract class ResourceRef {
        protected final List<String> mOwners = Lists.newArrayList();
        protected final String mTag;

        public ResourceRef(String str) {
            this.mTag = str;
        }

        private void dump() {
            SyncLog.d(this.mTag, "size=%d", (Object) Integer.valueOf(this.mOwners.size()));
            for (String str : this.mOwners) {
                String str2 = this.mTag;
                StringBuilder sb = new StringBuilder();
                sb.append("name=");
                sb.append(str);
                SyncLog.d(str2, sb.toString());
            }
        }

        public void acquire(String str) {
            if (this.mOwners.isEmpty()) {
                SyncLog.d(this.mTag, "onAcquire");
                onAcquire();
            }
            String str2 = this.mTag;
            StringBuilder sb = new StringBuilder();
            sb.append("add owner: ");
            sb.append(str);
            SyncLog.d(str2, sb.toString());
            this.mOwners.add(str);
        }

        /* access modifiers changed from: protected */
        public abstract void onAcquire();

        /* access modifiers changed from: protected */
        public abstract void onRelease();

        public void release(String str) {
            if (this.mOwners.remove(str)) {
                SyncLog.d(this.mTag, "remove owner success: %s, left owners: %s", str, this.mOwners);
                if (this.mOwners.isEmpty()) {
                    SyncLog.d(this.mTag, "onRelease");
                    onRelease();
                    return;
                }
                return;
            }
            String str2 = this.mTag;
            StringBuilder sb = new StringBuilder();
            sb.append("remove owner failed: ");
            sb.append(str);
            SyncLog.d(str2, sb.toString());
        }

        public void releaseAll() {
            dump();
            if (this.mOwners != null) {
                this.mOwners.clear();
                SyncLog.d(this.mTag, "onRelease");
                onRelease();
            }
        }
    }

    public static final class SyncLock {
        private int mCount = 0;
        /* access modifiers changed from: private */
        public String mIdentifier;
        private final Object mToken = new Object();

        SyncLock(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("#");
            sb.append(SystemClock.elapsedRealtimeNanos());
            this.mIdentifier = sb.toString();
        }

        public void acquire() {
            synchronized (this.mToken) {
                int i = this.mCount;
                this.mCount = i + 1;
                if (i == 0) {
                    SyncLog.d("AsyncUpDownloadService", "thread: %s, %s require lock, identifier: %s", Thread.currentThread(), Integer.valueOf(System.identityHashCode(Thread.currentThread())), this.mIdentifier);
                    ThreadManager.getMainHandler().post(new Runnable() {
                        public void run() {
                            AsyncUpDownloadService.startSyncInBackground(SyncLock.this.mIdentifier, true, true);
                        }
                    });
                }
            }
        }

        public void release() {
            synchronized (this.mToken) {
                int i = this.mCount - 1;
                this.mCount = i;
                if (i == 0) {
                    SyncLog.d("AsyncUpDownloadService", "thread: %s, %s release lock, identifier: %s", Thread.currentThread(), Integer.valueOf(System.identityHashCode(Thread.currentThread())), this.mIdentifier);
                    ThreadManager.getMainHandler().post(new Runnable() {
                        public void run() {
                            AsyncUpDownloadService.stopSyncInBackground(SyncLock.this.mIdentifier, true, true);
                        }
                    });
                }
                if (this.mCount < 0) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("SyncLock under-locked ");
                    sb.append(this.mIdentifier);
                    throw new RuntimeException(sb.toString());
                }
            }
        }
    }

    private class WakeLockRef extends ResourceRef {
        private long mAcquireTime;
        private boolean mIsCharging = isCharging();
        private boolean mIsScreenOn = isScreenOn();
        private final List<String> mPendingOwners = Lists.newArrayList();
        private WakeLock mWakeLock;

        public WakeLockRef(String str) {
            super(str);
        }

        private boolean canBatteryAcquire() {
            return !AsyncUpDownloadService.WAKELOCK_ONLY_CHARGING || this.mIsCharging;
        }

        private boolean canScreenAcquire() {
            return !AsyncUpDownloadService.WAKELOCK_ONLY_SCREEN_OFF || !this.mIsScreenOn;
        }

        private boolean isCharging() {
            return Sync.getIsPlugged();
        }

        private boolean isScreenOn() {
            return ((PowerManager) AsyncUpDownloadService.this.getSystemService("power")).isScreenOn();
        }

        private void releaseTemp() {
            this.mOwners.clear();
            SyncLog.d(this.mTag, "onRelease");
            onRelease();
        }

        private void tryAcquireLock() {
            if (this.mPendingOwners.size() > 0) {
                ArrayList<String> arrayList = new ArrayList<>(this.mPendingOwners);
                this.mPendingOwners.clear();
                for (String acquire : arrayList) {
                    acquire(acquire);
                }
            }
        }

        private void tryReleaseLock() {
            if (this.mOwners.size() > 0) {
                this.mPendingOwners.clear();
                this.mPendingOwners.addAll(this.mOwners);
                releaseTemp();
            }
        }

        public void acquire(String str) {
            boolean canScreenAcquire = canScreenAcquire();
            boolean canBatteryAcquire = canBatteryAcquire();
            if (!canScreenAcquire || !canBatteryAcquire) {
                this.mPendingOwners.add(str);
                SyncLog.d(this.mTag, "can't acquire wakelock, add pending %s, pendings %s, screen %s, charge %s", str, this.mPendingOwners, Boolean.valueOf(canScreenAcquire), Boolean.valueOf(canBatteryAcquire));
                return;
            }
            super.acquire(str);
        }

        /* access modifiers changed from: protected */
        public void onAcquire() {
            if (this.mWakeLock == null || !this.mWakeLock.isHeld()) {
                this.mWakeLock = ((PowerManager) AsyncUpDownloadService.this.getSystemService("power")).newWakeLock(1, this.mTag);
                this.mWakeLock.setReferenceCounted(false);
                this.mWakeLock.acquire();
                this.mAcquireTime = System.currentTimeMillis();
                return;
            }
            SyncLog.e("AsyncUpDownloadService", (Throwable) new IllegalStateException("wakelock acquire and release not balance"));
        }

        public void onChargeStateChanged(boolean z) {
            if (AsyncUpDownloadService.WAKELOCK_ONLY_CHARGING) {
                this.mIsCharging = z;
                if (z) {
                    SyncLog.d(this.mTag, "charging");
                    tryAcquireLock();
                } else {
                    SyncLog.d(this.mTag, "not charging");
                    tryReleaseLock();
                }
            }
        }

        /* access modifiers changed from: protected */
        public void onRelease() {
            if (this.mWakeLock != null) {
                this.mWakeLock.release();
                this.mWakeLock = null;
                HashMap hashMap = new HashMap();
                hashMap.put("wakelock_elapse_time", String.valueOf(Math.round((((float) (System.currentTimeMillis() - this.mAcquireTime)) * 1.0f) / 1000.0f)));
                GallerySamplingStatHelper.recordCountEvent("Sync", "sync_wakelock_time", hashMap);
            }
        }

        public void onScreenOnOff(boolean z) {
            if (AsyncUpDownloadService.WAKELOCK_ONLY_SCREEN_OFF) {
                this.mIsScreenOn = z;
                if (z) {
                    SyncLog.d(this.mTag, "screen on");
                    tryReleaseLock();
                } else {
                    SyncLog.d(this.mTag, "screen off");
                    tryAcquireLock();
                }
            }
        }

        public void release(String str) {
            if (this.mPendingOwners.remove(str)) {
                SyncLog.d(this.mTag, "remove owner from pending success: %s, left pending owners: %s", str, this.mPendingOwners);
                if (this.mPendingOwners.isEmpty()) {
                    SyncLog.d(this.mTag, "onRelease");
                    onRelease();
                    return;
                }
                return;
            }
            if (this.mPendingOwners.size() > 0) {
                SyncLog.d(this.mTag, "remove owner from pending fail, pending owners: %s, owners: %s, owner: %s", this.mPendingOwners, this.mOwners, str);
            }
            super.release(str);
        }

        public void releaseAll() {
            if (!this.mPendingOwners.isEmpty()) {
                onRelease();
            }
            super.releaseAll();
        }
    }

    private class WifiLockRef extends ResourceRef {
        private WifiLock mWifiLock;

        public WifiLockRef(String str) {
            super(str);
        }

        public void onAcquire() {
            this.mWifiLock = ((WifiManager) AsyncUpDownloadService.this.getApplicationContext().getSystemService("wifi")).createWifiLock(3, getClass().getName());
            this.mWifiLock.setReferenceCounted(false);
            this.mWifiLock.acquire();
        }

        public void onRelease() {
            if (this.mWifiLock != null) {
                this.mWifiLock.release();
                this.mWifiLock = null;
            }
        }
    }

    /* access modifiers changed from: private */
    public void handleChargeStateChanged(boolean z) {
        this.mWakeLockRef.onChargeStateChanged(z);
    }

    /* access modifiers changed from: private */
    public void handleScreenOnOff(boolean z) {
        this.mWakeLockRef.onScreenOnOff(z);
    }

    private boolean isLockInitialized() {
        return (this.mWifiLockRef == null || this.mWakeLockRef == null || this.mForegroundRef == null) ? false : true;
    }

    private static boolean needHandleRequest(String str) {
        return sPendingRequests.remove(str);
    }

    public static SyncLock newSyncLock(String str) {
        return new SyncLock(str);
    }

    private void release() {
        if (this.mWifiLockRef != null) {
            this.mWifiLockRef.releaseAll();
            this.mWifiLockRef = null;
        }
        if (this.mWakeLockRef != null) {
            this.mWakeLockRef.releaseAll();
            this.mWakeLockRef = null;
        }
        if (this.mForegroundRef != null) {
            this.mForegroundRef.releaseAll();
            this.mForegroundRef = null;
        }
        LocalBroadcastManager.getInstance(this).unregisterReceiver(this.mSyncReceiver);
        if (WAKELOCK_ONLY_SCREEN_OFF) {
            GalleryUtils.safeUnregisterReceiver(this, this.mScreenStateReceiver);
        }
        if (WAKELOCK_ONLY_CHARGING) {
            GalleryUtils.safeUnregisterReceiver(this, this.mBatteryStateReceiver);
        }
        sPendingRequests.clear();
    }

    /* access modifiers changed from: private */
    public static void startSyncInBackground(String str, boolean z, boolean z2) {
        sPendingRequests.add(str);
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Intent intent = new Intent("com.miui.gallery.ACTION_SYNC_IN_BACKGROUND");
        intent.setPackage(sGetAndroidContext.getPackageName());
        intent.putExtra("com.miui.gallery.EXTRA_SYNC_NAME", str);
        intent.putExtra("com.miui.gallery.EXTRA_SYNC_STOP", false);
        intent.putExtra("com.miui.gallery.EXTRA_SYNC_WIFI", z);
        intent.putExtra("com.miui.gallery.EXTRA_SYNC_WAKE", z2);
        BackgroundServiceHelper.startForegroundServiceIfNeed(sGetAndroidContext, intent);
    }

    /* access modifiers changed from: private */
    public static void stopSyncInBackground(String str, boolean z, boolean z2) {
        sPendingRequests.remove(str);
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Intent intent = new Intent("com.miui.gallery.ACTION_SYNC_IN_BACKGROUND");
        intent.setPackage(sGetAndroidContext.getPackageName());
        intent.putExtra("com.miui.gallery.EXTRA_SYNC_NAME", str);
        intent.putExtra("com.miui.gallery.EXTRA_SYNC_STOP", true);
        intent.putExtra("com.miui.gallery.EXTRA_SYNC_WIFI", z);
        intent.putExtra("com.miui.gallery.EXTRA_SYNC_WAKE", z2);
        LocalBroadcastManager.getInstance(sGetAndroidContext).sendBroadcast(intent);
    }

    /* access modifiers changed from: private */
    public void tryCancelTasksWhenConnChanged() {
        if (this.mDoingCancelTasks.compareAndSet(false, true)) {
            ThreadManager.getMiscPool().submit(new Job() {
                public Object run(JobContext jobContext) {
                    int i = 0;
                    while (i < 14) {
                        try {
                            int check = SyncConditionManager.check(i);
                            if (check != 0) {
                                StringBuilder sb = new StringBuilder();
                                sb.append("net work is changed, cancel all, priority=");
                                sb.append(i);
                                SyncLog.i("AsyncUpDownloadService", sb.toString());
                                if (RequestItemBase.isCancellablePriority(i)) {
                                    UpDownloadManager.cancel(i, 2 == check, true);
                                }
                            }
                            i++;
                        } catch (Throwable th) {
                            AsyncUpDownloadService.this.mDoingCancelTasks.set(false);
                            throw th;
                        }
                    }
                    AsyncUpDownloadService.this.mDoingCancelTasks.set(false);
                    return null;
                }
            });
        }
    }

    /* access modifiers changed from: protected */
    public Notification getNotification() {
        return NotificationHelper.getEmptyNotification(getApplicationContext());
    }

    /* access modifiers changed from: protected */
    public int getNotificationId() {
        return 6;
    }

    /* access modifiers changed from: 0000 */
    public void handleRequest(Intent intent) {
        String action = intent.getAction();
        StringBuilder sb = new StringBuilder();
        sb.append("handleRequest: action=");
        sb.append(action);
        SyncLog.d("AsyncUpDownloadService", sb.toString());
        if ("com.miui.gallery.ACTION_SYNC_IN_BACKGROUND".equals(action)) {
            if (!isLockInitialized()) {
                SyncLog.w("AsyncUpDownloadService", "service has been released");
                release();
                return;
            }
            String stringExtra = intent.getStringExtra("com.miui.gallery.EXTRA_SYNC_NAME");
            if (!TextUtils.isEmpty(stringExtra)) {
                boolean booleanExtra = intent.getBooleanExtra("com.miui.gallery.EXTRA_SYNC_STOP", true);
                boolean booleanExtra2 = intent.getBooleanExtra("com.miui.gallery.EXTRA_SYNC_WIFI", false);
                boolean booleanExtra3 = intent.getBooleanExtra("com.miui.gallery.EXTRA_SYNC_WAKE", true);
                SyncLog.d("AsyncUpDownloadService", "owner=%s, is stop=%s, wifiNeeded=%s, wakeupNeeded=%s", stringExtra, Boolean.valueOf(booleanExtra), Boolean.valueOf(booleanExtra2), Boolean.valueOf(booleanExtra3));
                if (booleanExtra) {
                    if (booleanExtra2) {
                        this.mWifiLockRef.release(stringExtra);
                    }
                    if (booleanExtra3) {
                        this.mWakeLockRef.release(stringExtra);
                    }
                    this.mForegroundRef.release(stringExtra);
                } else if (needHandleRequest(stringExtra)) {
                    this.mForegroundRef.acquire(stringExtra);
                    if (booleanExtra3) {
                        SyncLog.d("AsyncUpDownloadService", "handle request, owner: %s", (Object) stringExtra);
                        this.mWakeLockRef.acquire(stringExtra);
                    }
                    if (booleanExtra2) {
                        this.mWifiLockRef.acquire(stringExtra);
                    }
                } else {
                    SyncLog.w("AsyncUpDownloadService", "no need handle request: %s", stringExtra);
                }
            }
        }
    }

    public void onCreate() {
        super.onCreate();
        SyncLog.d("AsyncUpDownloadService", "onCreate");
        this.mStartTime = SystemClock.uptimeMillis();
        this.mForegroundRef = new ForegroundRef("AsyncUpDownloadService#Foreground");
        this.mWakeLockRef = new WakeLockRef("AsyncUpDownloadService#WakeLock");
        this.mWifiLockRef = new WifiLockRef("AsyncUpDownloadService#WifiLock");
        LocalBroadcastManager.getInstance(this).registerReceiver(this.mSyncReceiver, new IntentFilter("com.miui.gallery.ACTION_SYNC_IN_BACKGROUND"));
        if (WAKELOCK_ONLY_SCREEN_OFF) {
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.intent.action.SCREEN_ON");
            intentFilter.addAction("android.intent.action.SCREEN_OFF");
            registerReceiver(this.mScreenStateReceiver, intentFilter);
        }
        if (WAKELOCK_ONLY_CHARGING) {
            IntentFilter intentFilter2 = new IntentFilter();
            intentFilter2.addAction("android.intent.action.BATTERY_CHANGED");
            registerReceiver(this.mBatteryStateReceiver, intentFilter2);
        }
    }

    public void onDestroy() {
        release();
        StringBuilder sb = new StringBuilder();
        sb.append("onDestroy, elapse time=");
        sb.append(SystemClock.uptimeMillis() - this.mStartTime);
        SyncLog.d("AsyncUpDownloadService", sb.toString());
        super.onDestroy();
        HashMap hashMap = new HashMap();
        hashMap.put("service_elapse_time", String.valueOf(Math.round((((float) (SystemClock.uptimeMillis() - this.mStartTime)) * 1.0f) / 1000.0f)));
        GallerySamplingStatHelper.recordCountEvent("Sync", "sync_service_time", hashMap);
    }

    public int onStartCommand(Intent intent, int i, int i2) {
        super.onStartCommand(intent, i, i2);
        if (intent == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("null intent parameter in onStartCommand! intent=");
            sb.append(intent);
            sb.append(", flags=");
            sb.append(i);
            sb.append(", startId=");
            sb.append(i2);
            SyncLog.e("AsyncUpDownloadService", sb.toString());
            stopSelf();
        } else {
            handleRequest(intent);
        }
        return 2;
    }
}
