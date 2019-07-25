package com.xiaomi.push.service;

import android.text.TextUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.XMPushService.Job;
import com.xiaomi.tinyData.TinyDataUploader;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import com.xiaomi.xmpush.thrift.PushMetaInfo;
import com.xiaomi.xmpush.thrift.XmPushActionContainer;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class LongConnUploader implements TinyDataUploader {
    /* access modifiers changed from: private */
    public final XMPushService mPushService;

    public LongConnUploader(XMPushService xMPushService) {
        this.mPushService = xMPushService;
    }

    /* access modifiers changed from: private */
    public String getAppId(String str) {
        return "com.xiaomi.xmsf".equals(str) ? "1000271" : this.mPushService.getSharedPreferences("pref_registered_pkg_names", 0).getString(str, null);
    }

    public void upload(List<ClientUploadDataItem> list, String str, String str2) {
        StringBuilder sb = new StringBuilder();
        sb.append("TinyData LongConnUploader.upload items size:");
        sb.append(list.size());
        sb.append("  ts:");
        sb.append(System.currentTimeMillis());
        MyLog.w(sb.toString());
        XMPushService xMPushService = this.mPushService;
        final String str3 = str;
        final List<ClientUploadDataItem> list2 = list;
        final String str4 = str2;
        AnonymousClass1 r1 = new Job(4) {
            public String getDesc() {
                return "Send tiny data.";
            }

            public void process() {
                String access$000 = LongConnUploader.this.getAppId(str3);
                ArrayList pack = TinyDataHelper.pack(list2, str3, access$000, 32768);
                StringBuilder sb = new StringBuilder();
                sb.append("TinyData LongConnUploader.upload pack notifications ");
                sb.append(pack.toString());
                sb.append("  ts:");
                sb.append(System.currentTimeMillis());
                MyLog.w(sb.toString());
                if (pack != null) {
                    Iterator it = pack.iterator();
                    while (it.hasNext()) {
                        XmPushActionNotification xmPushActionNotification = (XmPushActionNotification) it.next();
                        xmPushActionNotification.putToExtra("uploadWay", "longXMPushService");
                        XmPushActionContainer generateRequestContainer = MIPushHelper.generateRequestContainer(str3, access$000, xmPushActionNotification, ActionType.Notification);
                        if (!TextUtils.isEmpty(str4) && !TextUtils.equals(str3, str4)) {
                            if (generateRequestContainer.getMetaInfo() == null) {
                                PushMetaInfo pushMetaInfo = new PushMetaInfo();
                                pushMetaInfo.setId(MovieStatUtils.DOWNLOAD_FAILED);
                                generateRequestContainer.setMetaInfo(pushMetaInfo);
                            }
                            generateRequestContainer.getMetaInfo().putToInternal("ext_traffic_source_pkg", str4);
                        }
                        LongConnUploader.this.mPushService.sendMessage(str3, XmPushThriftSerializeUtils.convertThriftObjectToBytes(generateRequestContainer), true);
                    }
                    for (ClientUploadDataItem clientUploadDataItem : list2) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("TinyData LongConnUploader.upload uploaded by com.xiaomi.push.service.TinyDataUploader.  item");
                        sb2.append(clientUploadDataItem.getId());
                        sb2.append("  ts:");
                        sb2.append(System.currentTimeMillis());
                        MyLog.w(sb2.toString());
                    }
                    return;
                }
                MyLog.e("TinyData LongConnUploader.upload Get a null XmPushActionNotification list when TinyDataHelper.pack() in XMPushService.");
            }
        };
        xMPushService.executeJob(r1);
    }
}
