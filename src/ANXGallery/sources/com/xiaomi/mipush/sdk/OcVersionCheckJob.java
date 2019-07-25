package com.xiaomi.mipush.sdk;

import android.content.Context;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager.Job;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.push.service.OnlineConfigHelper;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.ConfigListType;
import com.xiaomi.xmpush.thrift.NotificationType;
import com.xiaomi.xmpush.thrift.XmPushActionCheckClientInfo;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;

public class OcVersionCheckJob extends Job {
    private Context context;

    public OcVersionCheckJob(Context context2) {
        this.context = context2;
    }

    public int getJobId() {
        return 2;
    }

    public void run() {
        OnlineConfig instance = OnlineConfig.getInstance(this.context);
        XmPushActionCheckClientInfo xmPushActionCheckClientInfo = new XmPushActionCheckClientInfo();
        xmPushActionCheckClientInfo.setMiscConfigVersion(OnlineConfigHelper.getVersion(instance, ConfigListType.MISC_CONFIG));
        xmPushActionCheckClientInfo.setPluginConfigVersion(OnlineConfigHelper.getVersion(instance, ConfigListType.PLUGIN_CONFIG));
        XmPushActionNotification xmPushActionNotification = new XmPushActionNotification(MovieStatUtils.DOWNLOAD_FAILED, false);
        xmPushActionNotification.setType(NotificationType.DailyCheckClientConfig.value);
        xmPushActionNotification.setBinaryExtra(XmPushThriftSerializeUtils.convertThriftObjectToBytes(xmPushActionCheckClientInfo));
        PushServiceClient.getInstance(this.context).sendMessage(xmPushActionNotification, ActionType.Notification, null);
    }
}
