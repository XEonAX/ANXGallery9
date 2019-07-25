package com.xiaomi.clientreport.manager;

import android.content.Context;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.clientreport.data.BaseClientReport;
import com.xiaomi.clientreport.data.Config;
import com.xiaomi.clientreport.data.EventClientReport;
import com.xiaomi.clientreport.data.PerfClientReport;
import com.xiaomi.clientreport.job.DataPreProcessJob;
import com.xiaomi.clientreport.job.EventUploadJob;
import com.xiaomi.clientreport.job.PerfUploadJob;
import com.xiaomi.clientreport.job.ReadAndSendJob;
import com.xiaomi.clientreport.job.WriteJob;
import com.xiaomi.clientreport.processor.IEventProcessor;
import com.xiaomi.clientreport.processor.IPerfProcessor;
import com.xiaomi.clientreport.util.ClientReportUtil;
import com.xiaomi.clientreport.util.SPManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ClientReportLogicManager {
    private static volatile ClientReportLogicManager sInstance;
    private Config mConfig;
    /* access modifiers changed from: private */
    public Context mContext;
    private HashMap<String, ArrayList<BaseClientReport>> mEventMap = new HashMap<>();
    /* access modifiers changed from: private */
    public IEventProcessor mEventProcessor;
    /* access modifiers changed from: private */
    public ExecutorService mExecutor = Executors.newSingleThreadExecutor();
    private HashMap<String, HashMap<String, BaseClientReport>> mPerfMap = new HashMap<>();
    /* access modifiers changed from: private */
    public IPerfProcessor mPerfProcessor;

    private ClientReportLogicManager(Context context) {
        this.mContext = context;
    }

    private void delayRunJob(Runnable runnable, int i) {
        ScheduledJobManager.getInstance(this.mContext).addOneShootJob(runnable, i);
    }

    public static ClientReportLogicManager getInstance(Context context) {
        if (sInstance == null) {
            synchronized (ClientReportLogicManager.class) {
                if (sInstance == null) {
                    sInstance = new ClientReportLogicManager(context);
                }
            }
        }
        return sInstance;
    }

    private void startEventUploadJob() {
        if (getInstance(this.mContext).getConfig().isEventUploadSwitchOpen()) {
            final EventUploadJob eventUploadJob = new EventUploadJob(this.mContext);
            int eventUploadFrequency = (int) getInstance(this.mContext).getConfig().getEventUploadFrequency();
            if (eventUploadFrequency < 1800) {
                eventUploadFrequency = 1800;
            }
            if (System.currentTimeMillis() - SPManager.getInstance(this.mContext).getLongValue("sp_client_report_status", "event_last_upload_time", 0) > ((long) (eventUploadFrequency * 1000))) {
                ScheduledJobManager.getInstance(this.mContext).addOneShootJob((Runnable) new Runnable() {
                    public void run() {
                        eventUploadJob.run();
                    }
                }, 10);
            }
            synchronized (ClientReportLogicManager.class) {
                if (!ScheduledJobManager.getInstance(this.mContext).addRepeatJob(eventUploadJob, eventUploadFrequency)) {
                    ScheduledJobManager.getInstance(this.mContext).cancelJob(100886);
                    ScheduledJobManager.getInstance(this.mContext).addRepeatJob(eventUploadJob, eventUploadFrequency);
                }
            }
        }
    }

    private void startPerfUploadJob() {
        if (getInstance(this.mContext).getConfig().isPerfUploadSwitchOpen()) {
            final PerfUploadJob perfUploadJob = new PerfUploadJob(this.mContext);
            int perfUploadFrequency = (int) getInstance(this.mContext).getConfig().getPerfUploadFrequency();
            if (perfUploadFrequency < 1800) {
                perfUploadFrequency = 1800;
            }
            if (System.currentTimeMillis() - SPManager.getInstance(this.mContext).getLongValue("sp_client_report_status", "perf_last_upload_time", 0) > ((long) (perfUploadFrequency * 1000))) {
                ScheduledJobManager.getInstance(this.mContext).addOneShootJob((Runnable) new Runnable() {
                    public void run() {
                        perfUploadJob.run();
                    }
                }, 15);
            }
            synchronized (ClientReportLogicManager.class) {
                if (!ScheduledJobManager.getInstance(this.mContext).addRepeatJob(perfUploadJob, perfUploadFrequency)) {
                    ScheduledJobManager.getInstance(this.mContext).cancelJob(100887);
                    ScheduledJobManager.getInstance(this.mContext).addRepeatJob(perfUploadJob, perfUploadFrequency);
                }
            }
        }
    }

    public synchronized Config getConfig() {
        if (this.mConfig == null) {
            this.mConfig = Config.defaultConfig(this.mContext);
        }
        return this.mConfig;
    }

    public void init(Config config, IEventProcessor iEventProcessor, IPerfProcessor iPerfProcessor) {
        this.mConfig = config;
        this.mEventProcessor = iEventProcessor;
        this.mPerfProcessor = iPerfProcessor;
        this.mEventProcessor.setEventMap(this.mEventMap);
        this.mPerfProcessor.setPerfMap(this.mPerfMap);
    }

    public void sendEvent() {
        if (getConfig().isEventUploadSwitchOpen()) {
            ReadAndSendJob readAndSendJob = new ReadAndSendJob();
            readAndSendJob.setContext(this.mContext);
            readAndSendJob.setReadAndSender(this.mEventProcessor);
            this.mExecutor.execute(readAndSendJob);
        }
    }

    public void sendPerf() {
        if (getConfig().isPerfUploadSwitchOpen()) {
            ReadAndSendJob readAndSendJob = new ReadAndSendJob();
            readAndSendJob.setReadAndSender(this.mPerfProcessor);
            readAndSendJob.setContext(this.mContext);
            this.mExecutor.execute(readAndSendJob);
        }
    }

    public void startScheduleJob() {
        getInstance(this.mContext).startEventUploadJob();
        getInstance(this.mContext).startPerfUploadJob();
    }

    public void updateConfig(boolean z, boolean z2, long j, long j2) {
        if (this.mConfig == null) {
            return;
        }
        if (z != this.mConfig.isEventUploadSwitchOpen() || z2 != this.mConfig.isPerfUploadSwitchOpen() || j != this.mConfig.getEventUploadFrequency() || j2 != this.mConfig.getPerfUploadFrequency()) {
            long eventUploadFrequency = this.mConfig.getEventUploadFrequency();
            long perfUploadFrequency = this.mConfig.getPerfUploadFrequency();
            Config build = Config.getBuilder().setAESKey(ClientReportUtil.getEventKeyWithDefault(this.mContext)).setEventEncrypted(this.mConfig.isEventEncrypted()).setEventUploadSwitchOpen(z).setEventUploadFrequency(j).setPerfUploadSwitchOpen(z2).setPerfUploadFrequency(j2).build(this.mContext);
            this.mConfig = build;
            if (!this.mConfig.isEventUploadSwitchOpen()) {
                ScheduledJobManager.getInstance(this.mContext).cancelJob(100886);
            } else if (eventUploadFrequency != build.getEventUploadFrequency()) {
                StringBuilder sb = new StringBuilder();
                sb.append(this.mContext.getPackageName());
                sb.append("reset event job ");
                sb.append(build.getEventUploadFrequency());
                MyLog.v(sb.toString());
                startEventUploadJob();
            }
            if (!this.mConfig.isPerfUploadSwitchOpen()) {
                ScheduledJobManager.getInstance(this.mContext).cancelJob(100887);
            } else if (perfUploadFrequency != build.getPerfUploadFrequency()) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(this.mContext.getPackageName());
                sb2.append("reset perf job ");
                sb2.append(build.getPerfUploadFrequency());
                MyLog.v(sb2.toString());
                startPerfUploadJob();
            }
        }
    }

    public void writeEvent(EventClientReport eventClientReport) {
        if (getConfig().isEventUploadSwitchOpen()) {
            this.mExecutor.execute(new DataPreProcessJob(this.mContext, eventClientReport, this.mEventProcessor));
            delayRunJob(new Runnable() {
                public void run() {
                    ClientReportLogicManager.this.mExecutor.execute(new WriteJob(ClientReportLogicManager.this.mContext, ClientReportLogicManager.this.mEventProcessor));
                }
            }, 30);
        }
    }

    public void writePerf(PerfClientReport perfClientReport) {
        if (getConfig().isPerfUploadSwitchOpen()) {
            this.mExecutor.execute(new DataPreProcessJob(this.mContext, perfClientReport, this.mPerfProcessor));
            delayRunJob(new Runnable() {
                public void run() {
                    ClientReportLogicManager.this.mExecutor.execute(new WriteJob(ClientReportLogicManager.this.mContext, ClientReportLogicManager.this.mPerfProcessor));
                }
            }, 30);
        }
    }
}
