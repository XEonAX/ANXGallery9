package com.xiaomi.push.mpcd;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build.VERSION;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.push.mpcd.job.AppActiveListCollectionJob;
import com.xiaomi.push.mpcd.job.BatteryCollectionJob;
import com.xiaomi.push.mpcd.job.BroadcastActionCollectionjob;
import com.xiaomi.push.mpcd.job.DeviceBaseInfoCollectionJob;
import com.xiaomi.push.mpcd.job.DeviceInfoCollectionJob;
import com.xiaomi.push.mpcd.job.StorageCollectionJob;
import com.xiaomi.push.mpcd.job.TopAppCollectionJob;
import com.xiaomi.push.mpcd.job.UploadJob;
import com.xiaomi.push.mpcd.job.WifiCollectionJob;
import com.xiaomi.push.mpcd.job.WifiDevicesMacCollectionJob;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.xmpush.thrift.ConfigKey;

public class JobController {
    private static volatile JobController instance;
    private Context context;

    private JobController(Context context2) {
        this.context = context2;
    }

    public static JobController getInstance(Context context2) {
        if (instance == null) {
            synchronized (JobController.class) {
                if (instance == null) {
                    instance = new JobController(context2);
                }
            }
        }
        return instance;
    }

    private int makeSurePeriodNotTooSmall(int i) {
        return Math.max(60, i);
    }

    private boolean scheduleActivityTSJob() {
        if (VERSION.SDK_INT < 14) {
            return false;
        }
        try {
            (this.context instanceof Application ? (Application) this.context : (Application) this.context.getApplicationContext()).registerActivityLifecycleCallbacks(new ActivityLifecycleCallbacksImpl(this.context, String.valueOf(System.currentTimeMillis() / 1000)));
            return true;
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            return false;
        }
    }

    /* access modifiers changed from: private */
    public void trySchedulerCollectJob() {
        ScheduledJobManager instance2 = ScheduledJobManager.getInstance(this.context);
        OnlineConfig instance3 = OnlineConfig.getInstance(this.context);
        SharedPreferences sharedPreferences = this.context.getSharedPreferences("mipush_extra", 0);
        long currentTimeMillis = System.currentTimeMillis();
        long j = sharedPreferences.getLong("first_try_ts", currentTimeMillis);
        if (j == currentTimeMillis) {
            sharedPreferences.edit().putLong("first_try_ts", currentTimeMillis).commit();
        }
        if (Math.abs(currentTimeMillis - j) >= 172800000) {
            boolean booleanValue = instance3.getBooleanValue(ConfigKey.ScreenSizeCollectionSwitch.getValue(), true);
            boolean booleanValue2 = instance3.getBooleanValue(ConfigKey.AndroidVnCollectionSwitch.getValue(), true);
            boolean booleanValue3 = instance3.getBooleanValue(ConfigKey.AndroidVcCollectionSwitch.getValue(), true);
            boolean booleanValue4 = instance3.getBooleanValue(ConfigKey.AndroidIdCollectionSwitch.getValue(), true);
            boolean booleanValue5 = instance3.getBooleanValue(ConfigKey.OperatorSwitch.getValue(), true);
            if (booleanValue || booleanValue2 || booleanValue3 || booleanValue4 || booleanValue5) {
                int makeSurePeriodNotTooSmall = makeSurePeriodNotTooSmall(instance3.getIntValue(ConfigKey.DeviceInfoCollectionFrequency.getValue(), 1209600));
                DeviceInfoCollectionJob deviceInfoCollectionJob = r6;
                DeviceInfoCollectionJob deviceInfoCollectionJob2 = new DeviceInfoCollectionJob(this.context, makeSurePeriodNotTooSmall, booleanValue, booleanValue2, booleanValue3, booleanValue4, booleanValue5);
                instance2.addRepeatJob(deviceInfoCollectionJob, makeSurePeriodNotTooSmall, 30);
            }
            boolean booleanValue6 = instance3.getBooleanValue(ConfigKey.MacCollectionSwitch.getValue(), false);
            boolean booleanValue7 = instance3.getBooleanValue(ConfigKey.IMSICollectionSwitch.getValue(), false);
            boolean booleanValue8 = instance3.getBooleanValue(ConfigKey.IccidCollectionSwitch.getValue(), false);
            boolean booleanValue9 = instance3.getBooleanValue(ConfigKey.DeviceIdSwitch.getValue(), false);
            if (booleanValue6 || booleanValue7 || booleanValue8 || booleanValue9) {
                int makeSurePeriodNotTooSmall2 = makeSurePeriodNotTooSmall(instance3.getIntValue(ConfigKey.DeviceBaseInfoCollectionFrequency.getValue(), 1209600));
                DeviceBaseInfoCollectionJob deviceBaseInfoCollectionJob = new DeviceBaseInfoCollectionJob(this.context, makeSurePeriodNotTooSmall2, booleanValue6, booleanValue7, booleanValue8, booleanValue9);
                instance2.addRepeatJob(deviceBaseInfoCollectionJob, makeSurePeriodNotTooSmall2, 30);
            }
            if (VERSION.SDK_INT < 21 && instance3.getBooleanValue(ConfigKey.AppActiveListCollectionSwitch.getValue(), false)) {
                int makeSurePeriodNotTooSmall3 = makeSurePeriodNotTooSmall(instance3.getIntValue(ConfigKey.AppActiveListCollectionFrequency.getValue(), 900));
                instance2.addRepeatJob(new AppActiveListCollectionJob(this.context, makeSurePeriodNotTooSmall3), makeSurePeriodNotTooSmall3, 30);
            }
            if (instance3.getBooleanValue(ConfigKey.StorageCollectionSwitch.getValue(), true)) {
                int makeSurePeriodNotTooSmall4 = makeSurePeriodNotTooSmall(instance3.getIntValue(ConfigKey.StorageCollectionFrequency.getValue(), 86400));
                instance2.addRepeatJob(new StorageCollectionJob(this.context, makeSurePeriodNotTooSmall4), makeSurePeriodNotTooSmall4, 30);
            }
            if (instance3.getBooleanValue(ConfigKey.WifiCollectionSwitch.getValue(), true)) {
                int makeSurePeriodNotTooSmall5 = makeSurePeriodNotTooSmall(instance3.getIntValue(ConfigKey.WifiCollectionFrequency.getValue(), 900));
                instance2.addRepeatJob(new WifiCollectionJob(this.context, makeSurePeriodNotTooSmall5), makeSurePeriodNotTooSmall5, 30);
            }
            if (instance3.getBooleanValue(ConfigKey.TopAppCollectionSwitch.getValue(), false)) {
                int makeSurePeriodNotTooSmall6 = makeSurePeriodNotTooSmall(instance3.getIntValue(ConfigKey.TopAppCollectionFrequency.getValue(), 300));
                instance2.addRepeatJob(new TopAppCollectionJob(this.context, makeSurePeriodNotTooSmall6), makeSurePeriodNotTooSmall6, 30);
            }
            if (instance3.getBooleanValue(ConfigKey.BroadcastActionCollectionSwitch.getValue(), true)) {
                int makeSurePeriodNotTooSmall7 = makeSurePeriodNotTooSmall(instance3.getIntValue(ConfigKey.BroadcastActionCollectionFrequency.getValue(), 900));
                instance2.addRepeatJob(new BroadcastActionCollectionjob(this.context, makeSurePeriodNotTooSmall7), makeSurePeriodNotTooSmall7, 30);
            }
            if (instance3.getBooleanValue(ConfigKey.WifiDevicesMacCollectionSwitch.getValue(), false)) {
                int makeSurePeriodNotTooSmall8 = makeSurePeriodNotTooSmall(instance3.getIntValue(ConfigKey.WifiDevicesMacCollectionFrequency.getValue(), 900));
                instance2.addRepeatJob(new WifiDevicesMacCollectionJob(this.context, makeSurePeriodNotTooSmall8), makeSurePeriodNotTooSmall8, 30);
            }
            if (instance3.getBooleanValue(ConfigKey.ActivityTSSwitch.getValue(), false)) {
                scheduleActivityTSJob();
            }
            if (instance3.getBooleanValue(ConfigKey.UploadSwitch.getValue(), true)) {
                instance2.addRepeatJob(new UploadJob(this.context), makeSurePeriodNotTooSmall(instance3.getIntValue(ConfigKey.UploadFrequency.getValue(), 86400)), 60);
            }
            if (instance3.getBooleanValue(ConfigKey.BatteryCollectionSwitch.getValue(), false)) {
                int makeSurePeriodNotTooSmall9 = makeSurePeriodNotTooSmall(instance3.getIntValue(ConfigKey.BatteryCollectionFrequency.getValue(), 3600));
                instance2.addRepeatJob(new BatteryCollectionJob(this.context, makeSurePeriodNotTooSmall9), makeSurePeriodNotTooSmall9, 30);
            }
        }
    }

    public void schedulerJob() {
        ScheduledJobManager.getInstance(this.context).addOneShootJob((Runnable) new Runnable() {
            public void run() {
                JobController.this.trySchedulerCollectJob();
            }
        }, 30);
    }
}
