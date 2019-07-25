package com.xiaomi.mipush.sdk.stat;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.android.SharedPrefsCompat;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager.Job;
import com.xiaomi.mipush.sdk.stat.db.DataBaseConfig;
import com.xiaomi.mipush.sdk.stat.db.DbSizeControlJob;
import com.xiaomi.mipush.sdk.stat.db.MessageInsertJob;
import com.xiaomi.mipush.sdk.stat.db.base.DbManager;
import com.xiaomi.mipush.sdk.stat.db.base.DbManager.BaseJob;
import com.xiaomi.mipush.sdk.stat.upload.IDataSender;
import com.xiaomi.mipush.sdk.stat.upload.IScheduleWorker;
import com.xiaomi.mipush.sdk.stat.upload.UploadDataHelper;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.push.service.TinyDataHelper;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import com.xiaomi.xmpush.thrift.ConfigKey;
import java.lang.ref.WeakReference;

public class PushStatClientManager {
    private static volatile PushStatClientManager sInstance;
    private String mAppId;
    private Job mCheckDbSizeJob = new Job() {
        public int getJobId() {
            return 10054;
        }

        public void run() {
            MyLog.v("exec== DbSizeControlJob");
            DbManager.getInstance(PushStatClientManager.this.mContext).execR(new DbSizeControlJob(PushStatClientManager.this.getDbPath(), new WeakReference(PushStatClientManager.this.mContext)));
            PushStatClientManager.this.updateTime("check_time");
        }
    };
    /* access modifiers changed from: private */
    public Context mContext;
    private IDataSender mDataSender;
    private Job mDeleteJob = new Job() {
        public int getJobId() {
            return 10053;
        }

        public void run() {
            if (PushStatClientManager.this.mScheduleJob != null) {
                PushStatClientManager.this.mScheduleJob.onDelete(PushStatClientManager.this.mContext);
                PushStatClientManager.this.updateTime("delete_time");
            }
        }
    };
    private String mPackageName;
    private final String mSPCheckKey = "check_time";
    private final String mSPDeleteKey = "delete_time";
    private final String mSPName = "push_stat_sp";
    private final String mSPUploadKey = "upload_time";
    /* access modifiers changed from: private */
    public IScheduleWorker mScheduleJob;
    private Job mUploadJob = new Job() {
        public int getJobId() {
            return 10052;
        }

        public void run() {
            MyLog.v("exec== mUploadJob");
            if (PushStatClientManager.this.mScheduleJob != null) {
                PushStatClientManager.this.mScheduleJob.onUpload(PushStatClientManager.this.mContext);
                PushStatClientManager.this.updateTime("upload_time");
            }
        }
    };

    private PushStatClientManager(Context context) {
        this.mContext = context;
    }

    private boolean OCSwitch() {
        return OnlineConfig.getInstance(this.mContext).getBooleanValue(ConfigKey.StatDataSwitch.getValue(), true);
    }

    /* access modifiers changed from: private */
    public String getDbPath() {
        return this.mContext.getDatabasePath(DataBaseConfig.DATABASE_NAME).getAbsolutePath();
    }

    public static PushStatClientManager getInstance(Context context) {
        if (sInstance == null) {
            synchronized (PushStatClientManager.class) {
                if (sInstance == null) {
                    sInstance = new PushStatClientManager(context);
                }
            }
        }
        return sInstance;
    }

    /* access modifiers changed from: private */
    public void updateTime(String str) {
        Editor edit = this.mContext.getSharedPreferences("push_stat_sp", 0).edit();
        edit.putLong(str, System.currentTimeMillis());
        SharedPrefsCompat.apply(edit);
    }

    public void exec(BaseJob baseJob) {
        DbManager.getInstance(this.mContext).exec(baseJob);
    }

    public String getAppId() {
        return this.mAppId;
    }

    public String getPackageName() {
        return this.mPackageName;
    }

    public void onResult(String str, String str2, Boolean bool) {
        if (this.mDataSender == null) {
            return;
        }
        if (bool.booleanValue()) {
            this.mDataSender.onSuccess(this.mContext, str2, str);
        } else {
            this.mDataSender.onFailed(this.mContext, str2, str);
        }
    }

    public void record(ClientUploadDataItem clientUploadDataItem) {
        if (OCSwitch() && TinyDataHelper.shouldUpload(clientUploadDataItem.getPkgName())) {
            exec(MessageInsertJob.buildInsertJob(this.mContext, getDbPath(), clientUploadDataItem));
        }
    }

    public void record(String str) {
        if (OCSwitch() && !TextUtils.isEmpty(str)) {
            record(UploadDataHelper.wrapperData(this.mContext, str));
        }
    }
}
