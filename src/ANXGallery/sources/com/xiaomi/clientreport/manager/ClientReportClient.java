package com.xiaomi.clientreport.manager;

import android.content.Context;
import android.os.Process;
import com.xiaomi.channel.commonutils.android.AppInfoUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.clientreport.data.Config;
import com.xiaomi.clientreport.data.EventClientReport;
import com.xiaomi.clientreport.data.PerfClientReport;
import com.xiaomi.clientreport.processor.IEventProcessor;
import com.xiaomi.clientreport.processor.IPerfProcessor;

public class ClientReportClient {
    public static void init(Context context, Config config, IEventProcessor iEventProcessor, IPerfProcessor iPerfProcessor) {
        StringBuilder sb = new StringBuilder();
        sb.append("init in process ");
        sb.append(AppInfoUtils.getProcessName(context));
        sb.append(" pid :");
        sb.append(Process.myPid());
        sb.append(" threadId: ");
        sb.append(Thread.currentThread().getId());
        MyLog.v(sb.toString());
        ClientReportLogicManager.getInstance(context).init(config, iEventProcessor, iPerfProcessor);
        if (AppInfoUtils.isAppMainProc(context)) {
            MyLog.v("init in process　start scheduleJob");
            ClientReportLogicManager.getInstance(context).startScheduleJob();
        }
    }

    public static void reportEvent(Context context, EventClientReport eventClientReport) {
        if (eventClientReport != null) {
            ClientReportLogicManager.getInstance(context).writeEvent(eventClientReport);
        }
    }

    public static void reportPerf(Context context, PerfClientReport perfClientReport) {
        if (perfClientReport != null) {
            ClientReportLogicManager.getInstance(context).writePerf(perfClientReport);
        }
    }

    public static void updateConfig(Context context, Config config) {
        if (config != null) {
            ClientReportLogicManager.getInstance(context).updateConfig(config.isEventUploadSwitchOpen(), config.isPerfUploadSwitchOpen(), config.getEventUploadFrequency(), config.getPerfUploadFrequency());
        }
    }
}
