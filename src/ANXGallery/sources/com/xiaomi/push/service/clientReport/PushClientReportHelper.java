package com.xiaomi.push.service.clientReport;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.clientreport.data.Config;
import com.xiaomi.clientreport.data.EventClientReport;
import com.xiaomi.clientreport.data.PerfClientReport;
import com.xiaomi.clientreport.manager.ClientReportClient;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.push.service.TinyDataHelper;
import com.xiaomi.push.service.TinyDataStorage;
import com.xiaomi.push.service.xmpush.Command;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import com.xiaomi.xmpush.thrift.ConfigKey;
import com.xiaomi.xmpush.thrift.NotificationType;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PushClientReportHelper {
    private static Uploader mUploader;
    private static Map<String, NotificationType> notificationTypeMap;

    public interface Uploader {
        void uploader(Context context, ClientUploadDataItem clientUploadDataItem);
    }

    public static int changeOrdinalToCode(Enum enumR) {
        if (enumR != null) {
            if (enumR instanceof ActionType) {
                return enumR.ordinal() + 1001;
            }
            if (enumR instanceof NotificationType) {
                return enumR.ordinal() + 2001;
            }
            if (enumR instanceof Command) {
                return enumR.ordinal() + 3001;
            }
        }
        return -1;
    }

    public static int changeValueToCode(int i) {
        if (i > 0) {
            return i + 1000;
        }
        return -1;
    }

    public static NotificationType changeValueToNotificationType(String str) {
        NotificationType[] values;
        if (notificationTypeMap == null) {
            synchronized (NotificationType.class) {
                if (notificationTypeMap == null) {
                    notificationTypeMap = new HashMap();
                    for (NotificationType notificationType : NotificationType.values()) {
                        notificationTypeMap.put(notificationType.value.toLowerCase(), notificationType);
                    }
                }
            }
        }
        NotificationType notificationType2 = (NotificationType) notificationTypeMap.get(str.toLowerCase());
        return notificationType2 != null ? notificationType2 : NotificationType.Invalid;
    }

    public static void checkConfigChange(Context context) {
        ClientReportClient.updateConfig(context, getConfig(context));
    }

    public static Config getConfig(Context context) {
        boolean booleanValue = OnlineConfig.getInstance(context).getBooleanValue(ConfigKey.PerfUploadSwitch.getValue(), false);
        boolean booleanValue2 = OnlineConfig.getInstance(context).getBooleanValue(ConfigKey.EventUploadSwitch.getValue(), false);
        int intValue = OnlineConfig.getInstance(context).getIntValue(ConfigKey.PerfUploadFrequency.getValue(), 86400);
        return Config.getBuilder().setEventUploadSwitchOpen(booleanValue2).setEventUploadFrequency((long) OnlineConfig.getInstance(context).getIntValue(ConfigKey.EventUploadFrequency.getValue(), 86400)).setPerfUploadSwitchOpen(booleanValue).setPerfUploadFrequency((long) intValue).build(context);
    }

    public static String getInterfaceIdByType(int i) {
        return i == 1000 ? "E100000" : i == 3000 ? "E100002" : i == 2000 ? "E100001" : i == 6000 ? "E100003" : "";
    }

    public static void initEventPerfLogic(Context context, Config config) {
        ClientReportClient.init(context, config, new MIPushEventDataProcessor(context), new MIPushPerfDataProcessor(context));
    }

    public static boolean isInXmsf(Context context) {
        return context != null && !TextUtils.isEmpty(context.getPackageName()) && "com.xiaomi.xmsf".equals(context.getPackageName());
    }

    public static EventClientReport newEvent(String str) {
        EventClientReport eventClientReport = new EventClientReport();
        eventClientReport.production = 1000;
        eventClientReport.reportType = 1001;
        eventClientReport.clientInterfaceId = str;
        return eventClientReport;
    }

    public static PerfClientReport newPerf() {
        PerfClientReport perfClientReport = new PerfClientReport();
        perfClientReport.production = 1000;
        perfClientReport.reportType = 1000;
        perfClientReport.clientInterfaceId = "P100000";
        return perfClientReport;
    }

    public static EventClientReport reportEvent2Object(Context context, String str, String str2, int i, long j, String str3) {
        EventClientReport newEvent = newEvent(str);
        newEvent.eventId = str2;
        newEvent.eventType = i;
        newEvent.eventTime = j;
        newEvent.eventContent = str3;
        return newEvent;
    }

    public static PerfClientReport reportPerf2Object(Context context, int i, long j, long j2) {
        PerfClientReport newPerf = newPerf();
        newPerf.code = i;
        newPerf.perfCounts = j;
        newPerf.perfLatencies = j2;
        return newPerf;
    }

    private static void sendByTinyData(Context context, ClientUploadDataItem clientUploadDataItem) {
        if (isInXmsf(context.getApplicationContext())) {
            TinyDataStorage.cacheTinyData(context.getApplicationContext(), clientUploadDataItem);
        } else if (mUploader != null) {
            mUploader.uploader(context, clientUploadDataItem);
        }
    }

    public static void sendData(Context context, List<String> list) {
        if (list != null) {
            try {
                for (String wrapperData : list) {
                    ClientUploadDataItem wrapperData2 = wrapperData(context, wrapperData);
                    if (TinyDataHelper.verify(wrapperData2, false)) {
                        StringBuilder sb = new StringBuilder();
                        sb.append(wrapperData2.getId());
                        sb.append("is not valid...");
                        MyLog.v(sb.toString());
                    } else {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("send event/perf data item id:");
                        sb2.append(wrapperData2.getId());
                        MyLog.v(sb2.toString());
                        sendByTinyData(context, wrapperData2);
                    }
                }
            } catch (Throwable th) {
                MyLog.e(th.getMessage());
            }
        }
    }

    public static void setUploader(Uploader uploader) {
        mUploader = uploader;
    }

    public static ClientUploadDataItem wrapperData(Context context, String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        ClientUploadDataItem clientUploadDataItem = new ClientUploadDataItem();
        clientUploadDataItem.setCategory("category_client_report_data");
        clientUploadDataItem.setChannel("push_sdk_channel");
        clientUploadDataItem.setCounter(1);
        clientUploadDataItem.setData(str);
        clientUploadDataItem.setFromSdk(true);
        clientUploadDataItem.setTimestamp(System.currentTimeMillis());
        clientUploadDataItem.setPkgName(context.getPackageName());
        clientUploadDataItem.setSourcePackage("com.xiaomi.xmsf");
        clientUploadDataItem.setId(TinyDataHelper.nextTinyDataItemId());
        clientUploadDataItem.setName("quality_support");
        return clientUploadDataItem;
    }
}
