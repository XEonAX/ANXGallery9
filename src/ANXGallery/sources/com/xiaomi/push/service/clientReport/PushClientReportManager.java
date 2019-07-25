package com.xiaomi.push.service.clientReport;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.xiaomi.clientreport.data.BaseClientReport;
import com.xiaomi.clientreport.data.EventClientReport;
import com.xiaomi.clientreport.data.PerfClientReport;
import com.xiaomi.clientreport.manager.ClientReportClient;

public class PushClientReportManager {
    private static volatile PushClientReportManager sInstance;
    private Context mContext;

    private PushClientReportManager(Context context) {
        this.mContext = context;
    }

    private void collectData(BaseClientReport baseClientReport) {
        if (baseClientReport instanceof PerfClientReport) {
            ClientReportClient.reportPerf(this.mContext, (PerfClientReport) baseClientReport);
        } else if (baseClientReport instanceof EventClientReport) {
            ClientReportClient.reportEvent(this.mContext, (EventClientReport) baseClientReport);
        }
    }

    public static PushClientReportManager getInstance(Context context) {
        if (sInstance == null) {
            synchronized (PushClientReportManager.class) {
                if (sInstance == null) {
                    sInstance = new PushClientReportManager(context);
                }
            }
        }
        return sInstance;
    }

    public void reportEvent(String str, Intent intent, int i, String str2) {
        if (intent != null) {
            String str3 = str;
            reportEvent(str3, PushClientReportHelper.getInterfaceIdByType(intent.getIntExtra("eventMessageType", -1)), intent.getStringExtra("messageId"), i, System.currentTimeMillis(), str2);
        }
    }

    public void reportEvent(String str, String str2, String str3, int i, long j, String str4) {
        if (!TextUtils.isEmpty(str2) && !TextUtils.isEmpty(str3)) {
            EventClientReport reportEvent2Object = PushClientReportHelper.reportEvent2Object(this.mContext, str2, str3, i, j, str4);
            reportEvent2Object.setAppPackageName(str);
            reportEvent2Object.setSdkVersion("3_6_19");
            collectData(reportEvent2Object);
        }
    }

    public void reportEvent(String str, String str2, String str3, int i, String str4) {
        reportEvent(str, str2, str3, i, System.currentTimeMillis(), str4);
    }

    public void reportEvent4DUPMD(String str, String str2, String str3, String str4) {
        reportEvent(str, str2, str3, 4002, System.currentTimeMillis(), str4);
    }

    public void reportEvent4ERROR(String str, Intent intent, String str2) {
        if (intent != null) {
            String str3 = str;
            reportEvent(str3, PushClientReportHelper.getInterfaceIdByType(intent.getIntExtra("eventMessageType", -1)), intent.getStringExtra("messageId"), 5001, System.currentTimeMillis(), str2);
        }
    }

    public void reportEvent4ERROR(String str, Intent intent, Throwable th) {
        if (intent != null) {
            String str2 = str;
            reportEvent(str2, PushClientReportHelper.getInterfaceIdByType(intent.getIntExtra("eventMessageType", -1)), intent.getStringExtra("messageId"), 5001, System.currentTimeMillis(), th.getMessage());
        }
    }

    public void reportEvent4ERROR(String str, String str2, String str3, String str4) {
        reportEvent(str, str2, str3, 5001, System.currentTimeMillis(), str4);
    }

    public void reportEvent4ERROR(String str, String str2, String str3, Throwable th) {
        reportEvent(str, str2, str3, 5001, System.currentTimeMillis(), th.getMessage());
    }

    public void reportEvent4NeedDrop(String str, String str2, String str3, String str4) {
        reportEvent(str, str2, str3, 5002, System.currentTimeMillis(), str4);
    }

    public void reportPerf(String str, int i, long j, long j2) {
        if (i >= 0 && j2 >= 0 && j > 0) {
            PerfClientReport reportPerf2Object = PushClientReportHelper.reportPerf2Object(this.mContext, i, j, j2);
            reportPerf2Object.setAppPackageName(str);
            reportPerf2Object.setSdkVersion("3_6_19");
            collectData(reportPerf2Object);
        }
    }
}
