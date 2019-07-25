package com.xiaomi.clientreport.job;

import android.content.Context;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager.Job;
import com.xiaomi.clientreport.manager.ClientReportLogicManager;

public class PerfUploadJob extends Job {
    private Context mContext;

    public PerfUploadJob(Context context) {
        this.mContext = context;
    }

    private boolean checkPerfNeedUpload() {
        return ClientReportLogicManager.getInstance(this.mContext).getConfig().isPerfUploadSwitchOpen();
    }

    public int getJobId() {
        return 100887;
    }

    public void run() {
        try {
            if (checkPerfNeedUpload()) {
                ClientReportLogicManager.getInstance(this.mContext).sendPerf();
                StringBuilder sb = new StringBuilder();
                sb.append(this.mContext.getPackageName());
                sb.append("perf  begin upload");
                MyLog.v(sb.toString());
            }
        } catch (Exception e) {
            MyLog.e((Throwable) e);
        }
    }
}
