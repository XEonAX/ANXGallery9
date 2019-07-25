package com.xiaomi.push.service;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.xiaomi.channel.commonutils.android.SharedPrefsCompat;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.DebugUtils;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.channel.commonutils.network.Network;
import java.util.concurrent.ConcurrentHashMap;

public final class Sync implements NetworkListener {
    /* access modifiers changed from: private */
    public static volatile Sync sSync;
    /* access modifiers changed from: private */
    public volatile boolean isSyncing = false;
    Context mContext;
    /* access modifiers changed from: private */
    public ConcurrentHashMap<String, SyncJob> mCurJobs = new ConcurrentHashMap<>();
    private long mLastSyncTime;
    /* access modifiers changed from: private */
    public SharedPreferences mPrefs;

    public static abstract class SyncJob implements Runnable {
        String group;
        long period;

        SyncJob(String str, long j) {
            this.group = str;
            this.period = j;
        }

        public void run() {
            if (Sync.sSync != null) {
                Context context = Sync.sSync.mContext;
                if (Network.isConnected(context)) {
                    long currentTimeMillis = System.currentTimeMillis();
                    SharedPreferences access$300 = Sync.sSync.mPrefs;
                    StringBuilder sb = new StringBuilder();
                    sb.append(":ts-");
                    sb.append(this.group);
                    if (currentTimeMillis - access$300.getLong(sb.toString(), 0) > this.period || DebugUtils.isTesting(context)) {
                        Editor edit = Sync.sSync.mPrefs.edit();
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(":ts-");
                        sb2.append(this.group);
                        SharedPrefsCompat.apply(edit.putLong(sb2.toString(), System.currentTimeMillis()));
                        sync(Sync.sSync);
                    }
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public abstract void sync(Sync sync);
    }

    private Sync(Context context) {
        this.mContext = context.getApplicationContext();
        this.mPrefs = context.getSharedPreferences("sync", 0);
    }

    public static Sync getInstance(Context context) {
        if (sSync == null) {
            synchronized (Sync.class) {
                if (sSync == null) {
                    sSync = new Sync(context);
                }
            }
        }
        return sSync;
    }

    public String getString(String str, String str2) {
        SharedPreferences sharedPreferences = this.mPrefs;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(":");
        sb.append(str2);
        return sharedPreferences.getString(sb.toString(), "");
    }

    public void onNetwrokAvaible() {
        if (!this.isSyncing) {
            long currentTimeMillis = System.currentTimeMillis();
            if (currentTimeMillis - this.mLastSyncTime >= 3600000) {
                this.mLastSyncTime = currentTimeMillis;
                this.isSyncing = true;
                ScheduledJobManager.getInstance(this.mContext).addOneShootJob((Runnable) new Runnable() {
                    public void run() {
                        try {
                            for (SyncJob run : Sync.this.mCurJobs.values()) {
                                run.run();
                            }
                        } catch (Exception e) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("Sync job exception :");
                            sb.append(e.getMessage());
                            MyLog.w(sb.toString());
                        }
                        Sync.this.isSyncing = false;
                    }
                }, (int) (Math.random() * 10.0d));
            }
        }
    }

    public void put(String str, String str2, String str3) {
        Editor edit = sSync.mPrefs.edit();
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(":");
        sb.append(str2);
        SharedPrefsCompat.apply(edit.putString(sb.toString(), str3));
    }

    public void schedSync(SyncJob syncJob) {
        if (this.mCurJobs.putIfAbsent(syncJob.group, syncJob) == null) {
            ScheduledJobManager.getInstance(this.mContext).addOneShootJob((Runnable) syncJob, ((int) (Math.random() * 30.0d)) + 10);
        }
    }
}
