package com.xiaomi.push.log;

import android.content.Context;
import android.content.SharedPreferences;
import com.xiaomi.channel.commonutils.file.SDCardUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.SerializedAsyncTaskProcessor.SerializedAsyncTask;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.push.service.ServiceConfig;
import com.xiaomi.smack.util.TaskExecutor;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import org.json.JSONException;
import org.json.JSONObject;

public class LogUploader {
    private static volatile LogUploader sInstance;
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public final ConcurrentLinkedQueue<Task> mTasks = new ConcurrentLinkedQueue<>();

    class CleanUpTask extends Task {
        CleanUpTask() {
            super();
        }

        public void process() {
            LogUploader.this.cleanUp();
        }
    }

    class Task extends SerializedAsyncTask {
        long timestamp = System.currentTimeMillis();

        Task() {
        }

        public boolean canExcuteNow() {
            return true;
        }

        /* access modifiers changed from: 0000 */
        public final boolean isExpired() {
            return System.currentTimeMillis() - this.timestamp > 172800000;
        }

        public void process() {
        }
    }

    class UploadTask extends Task {
        File file;
        boolean force;
        int retryNum;
        String token;
        boolean uploaded;
        String url;

        UploadTask(String str, String str2, File file2, boolean z) {
            super();
            this.url = str;
            this.token = str2;
            this.file = file2;
            this.force = z;
        }

        /* JADX WARNING: Removed duplicated region for block: B:12:0x0039  */
        /* JADX WARNING: Removed duplicated region for block: B:15:0x003e  */
        private boolean checkLimit() {
            long j;
            int i;
            SharedPreferences sharedPreferences = LogUploader.this.mContext.getSharedPreferences("log.timestamp", 0);
            try {
                JSONObject jSONObject = new JSONObject(sharedPreferences.getString("log.requst", ""));
                j = jSONObject.getLong("time");
                try {
                    i = jSONObject.getInt("times");
                } catch (JSONException unused) {
                    i = 0;
                    if (System.currentTimeMillis() - j >= 86400000) {
                    }
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("time", j);
                    jSONObject2.put("times", i + 1);
                    sharedPreferences.edit().putString("log.requst", jSONObject2.toString()).commit();
                    return true;
                }
            } catch (JSONException unused2) {
                j = System.currentTimeMillis();
                i = 0;
                if (System.currentTimeMillis() - j >= 86400000) {
                }
                JSONObject jSONObject22 = new JSONObject();
                jSONObject22.put("time", j);
                jSONObject22.put("times", i + 1);
                sharedPreferences.edit().putString("log.requst", jSONObject22.toString()).commit();
                return true;
            }
            if (System.currentTimeMillis() - j >= 86400000) {
                j = System.currentTimeMillis();
                i = 0;
            } else if (i > 10) {
                return false;
            }
            JSONObject jSONObject222 = new JSONObject();
            try {
                jSONObject222.put("time", j);
                jSONObject222.put("times", i + 1);
                sharedPreferences.edit().putString("log.requst", jSONObject222.toString()).commit();
            } catch (JSONException e) {
                StringBuilder sb = new StringBuilder();
                sb.append("JSONException on put ");
                sb.append(e.getMessage());
                MyLog.v(sb.toString());
            }
            return true;
        }

        public boolean canExcuteNow() {
            return Network.isWIFIConnected(LogUploader.this.mContext) || (this.force && Network.hasNetwork(LogUploader.this.mContext));
        }

        public void postProcess() {
            if (!this.uploaded) {
                this.retryNum++;
                if (this.retryNum < 3) {
                    LogUploader.this.mTasks.add(this);
                }
            }
            if (this.uploaded || this.retryNum >= 3) {
                this.file.delete();
            }
            LogUploader.this.uploadIfNeed((long) ((1 << this.retryNum) * 1000));
        }

        public void process() {
            try {
                if (checkLimit()) {
                    HashMap hashMap = new HashMap();
                    hashMap.put("uid", ServiceConfig.getDeviceUUID());
                    hashMap.put("token", this.token);
                    hashMap.put("net", Network.getActiveConnPoint(LogUploader.this.mContext));
                    Network.uploadFile(this.url, hashMap, this.file, "file");
                }
                this.uploaded = true;
            } catch (IOException unused) {
            }
        }
    }

    private LogUploader(Context context) {
        this.mContext = context;
        this.mTasks.add(new CleanUpTask());
        executeTask(0);
    }

    private void cleanExpiredTask() {
        while (!this.mTasks.isEmpty()) {
            Task task = (Task) this.mTasks.peek();
            if (task != null) {
                if (task.isExpired() || this.mTasks.size() > 6) {
                    MyLog.v("remove Expired task");
                    this.mTasks.remove(task);
                } else {
                    return;
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void cleanUp() {
        if (!SDCardUtils.isSDCardBusy() && !SDCardUtils.isSDCardUnavailable()) {
            try {
                StringBuilder sb = new StringBuilder();
                sb.append(this.mContext.getExternalFilesDir(null));
                sb.append("/.logcache");
                File file = new File(sb.toString());
                if (file.exists() && file.isDirectory()) {
                    for (File delete : file.listFiles()) {
                        delete.delete();
                    }
                }
            } catch (NullPointerException unused) {
            }
        }
    }

    private void executeTask(long j) {
        if (!this.mTasks.isEmpty()) {
            TaskExecutor.execute(new SerializedAsyncTask() {
                SerializedAsyncTask current;

                public void postProcess() {
                    if (this.current != null) {
                        this.current.postProcess();
                    }
                }

                public void process() {
                    Task task = (Task) LogUploader.this.mTasks.peek();
                    if (task != null && task.canExcuteNow()) {
                        if (LogUploader.this.mTasks.remove(task)) {
                            this.current = task;
                        }
                        if (this.current != null) {
                            this.current.process();
                        }
                    }
                }
            }, j);
        }
    }

    public static LogUploader getInstance(Context context) {
        if (sInstance == null) {
            synchronized (LogUploader.class) {
                if (sInstance == null) {
                    sInstance = new LogUploader(context);
                }
            }
        }
        sInstance.mContext = context;
        return sInstance;
    }

    /* access modifiers changed from: private */
    public void uploadIfNeed(long j) {
        Task task = (Task) this.mTasks.peek();
        if (task != null && task.canExcuteNow()) {
            executeTask(j);
        }
    }

    public void checkUpload() {
        cleanExpiredTask();
        uploadIfNeed(0);
    }

    public void upload(String str, String str2, Date date, Date date2, int i, boolean z) {
        ConcurrentLinkedQueue<Task> concurrentLinkedQueue = this.mTasks;
        final int i2 = i;
        final Date date3 = date;
        final Date date4 = date2;
        final String str3 = str;
        final String str4 = str2;
        final boolean z2 = z;
        AnonymousClass1 r0 = new Task() {
            File file;

            public void postProcess() {
                if (this.file != null && this.file.exists()) {
                    ConcurrentLinkedQueue access$100 = LogUploader.this.mTasks;
                    UploadTask uploadTask = new UploadTask(str3, str4, this.file, z2);
                    access$100.add(uploadTask);
                }
                LogUploader.this.uploadIfNeed(0);
            }

            public void process() {
                if (SDCardUtils.isSDCardUseful()) {
                    try {
                        StringBuilder sb = new StringBuilder();
                        sb.append(LogUploader.this.mContext.getExternalFilesDir(null));
                        sb.append("/.logcache");
                        File file2 = new File(sb.toString());
                        file2.mkdirs();
                        if (file2.isDirectory()) {
                            LogFilter logFilter = new LogFilter();
                            logFilter.setMaxLen(i2);
                            this.file = logFilter.filter(LogUploader.this.mContext, date3, date4, file2);
                        }
                    } catch (NullPointerException unused) {
                    }
                }
            }
        };
        concurrentLinkedQueue.add(r0);
        executeTask(0);
    }
}
