package com.xiaomi.mipush.sdk.stat.db;

import android.content.Context;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.mipush.sdk.stat.db.base.DbManager;
import com.xiaomi.mipush.sdk.stat.db.base.DbManager.BaseJob;
import com.xiaomi.mipush.sdk.stat.util.FileUtil;
import java.lang.ref.WeakReference;

public class DbSizeControlJob implements Runnable {
    private String mPath;
    private WeakReference<Context> mWRContext;

    public DbSizeControlJob(String str, WeakReference<Context> weakReference) {
        this.mPath = str;
        this.mWRContext = weakReference;
    }

    public void run() {
        if (this.mWRContext != null) {
            Context context = (Context) this.mWRContext.get();
            if (context != null) {
                if (FileUtil.getFileSize(this.mPath) > DataBaseConfig.MAX_DB_SIZE) {
                    MessageDeleteJob deleteUploadedJob = MessageDeleteJob.deleteUploadedJob(this.mPath);
                    MessageCountQueryJob messageCountJob = MessageCountQueryJob.getMessageCountJob(this.mPath);
                    deleteUploadedJob.append(messageCountJob);
                    messageCountJob.append(HistoryDataDeleteJob.deleteHistoryJob(context, this.mPath, 1000));
                    DbManager.getInstance(context).exec((BaseJob) deleteUploadedJob);
                } else {
                    MyLog.i("=====> do not need clean db");
                }
            }
        }
    }
}
