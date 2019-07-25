package com.xiaomi.push.service;

import android.annotation.TargetApi;
import android.app.Service;
import android.app.job.JobParameters;
import android.app.job.JobService;
import android.content.Intent;
import android.os.Binder;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.reflect.JavaCalls;
import com.xiaomi.push.service.timers.Alarm;

public class XMJobService extends Service {
    static Service sServiceInstance;
    private IBinder mJobBinder = null;

    @TargetApi(21)
    static class JobServiceImpl extends JobService {
        Binder binder;
        private Handler mHandler;

        private static class JobHandler extends Handler {
            JobService service;

            JobHandler(JobService jobService) {
                super(jobService.getMainLooper());
                this.service = jobService;
            }

            public void handleMessage(Message message) {
                if (message.what == 1) {
                    JobParameters jobParameters = (JobParameters) message.obj;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Job finished ");
                    sb.append(jobParameters.getJobId());
                    MyLog.w(sb.toString());
                    this.service.jobFinished(jobParameters, false);
                    if (jobParameters.getJobId() == 1) {
                        Alarm.registerPing(false);
                    }
                }
            }
        }

        JobServiceImpl(Service service) {
            this.binder = null;
            this.binder = (Binder) JavaCalls.callMethod(this, "onBind", new Intent());
            JavaCalls.callMethod(this, "attachBaseContext", service);
        }

        public boolean onStartJob(JobParameters jobParameters) {
            StringBuilder sb = new StringBuilder();
            sb.append("Job started ");
            sb.append(jobParameters.getJobId());
            MyLog.w(sb.toString());
            Intent intent = new Intent(this, XMPushService.class);
            intent.setAction("com.xiaomi.push.timer");
            intent.setPackage(getPackageName());
            startService(intent);
            if (this.mHandler == null) {
                this.mHandler = new JobHandler(this);
            }
            this.mHandler.sendMessage(Message.obtain(this.mHandler, 1, jobParameters));
            return true;
        }

        public boolean onStopJob(JobParameters jobParameters) {
            StringBuilder sb = new StringBuilder();
            sb.append("Job stop ");
            sb.append(jobParameters.getJobId());
            MyLog.w(sb.toString());
            return false;
        }
    }

    static Service getRunningService() {
        return sServiceInstance;
    }

    public IBinder onBind(Intent intent) {
        return this.mJobBinder != null ? this.mJobBinder : new Binder();
    }

    public void onCreate() {
        super.onCreate();
        if (VERSION.SDK_INT >= 21) {
            this.mJobBinder = new JobServiceImpl(this).binder;
        }
        sServiceInstance = this;
    }

    public void onDestroy() {
        super.onDestroy();
        sServiceInstance = null;
    }
}
