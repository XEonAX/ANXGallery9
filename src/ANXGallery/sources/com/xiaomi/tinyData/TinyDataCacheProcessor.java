package com.xiaomi.tinyData;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.push.service.XMPushService.PingCallBack;
import com.xiaomi.xmpush.thrift.ConfigKey;
import java.io.File;

public class TinyDataCacheProcessor implements PingCallBack {
    private static boolean mIsTinyDataExtracting;
    private Context mContext;
    private int mPeriod;
    private boolean mUploadSwitch;

    public TinyDataCacheProcessor(Context context) {
        this.mContext = context;
    }

    private boolean canUpload(TinyDataUploader tinyDataUploader) {
        return Network.hasNetwork(this.mContext) && tinyDataUploader != null && !TextUtils.isEmpty(getAppId(this.mContext.getPackageName())) && new File(this.mContext.getFilesDir(), "tiny_data.data").exists() && !mIsTinyDataExtracting;
    }

    private String getAppId(String str) {
        return "com.xiaomi.xmsf".equals(str) ? "1000271" : this.mContext.getSharedPreferences("pref_registered_pkg_names", 0).getString(str, null);
    }

    private void readOnlineConfig(Context context) {
        this.mUploadSwitch = OnlineConfig.getInstance(context).getBooleanValue(ConfigKey.TinyDataUploadSwitch.getValue(), true);
        this.mPeriod = OnlineConfig.getInstance(context).getIntValue(ConfigKey.TinyDataUploadFrequency.getValue(), 7200);
        this.mPeriod = Math.max(60, this.mPeriod);
    }

    public static void setIsTinyDataExtracting(boolean z) {
        mIsTinyDataExtracting = z;
    }

    private boolean verifyUploadPeriod() {
        return Math.abs((System.currentTimeMillis() / 1000) - this.mContext.getSharedPreferences("mipush_extra", 4).getLong("last_tiny_data_upload_timestamp", -1)) > ((long) this.mPeriod);
    }

    public void pingFollowUpAction() {
        readOnlineConfig(this.mContext);
        if (this.mUploadSwitch && verifyUploadPeriod()) {
            StringBuilder sb = new StringBuilder();
            sb.append("TinyData TinyDataCacheProcessor.pingFollowUpAction ts:");
            sb.append(System.currentTimeMillis());
            MyLog.w(sb.toString());
            TinyDataUploader uploader = TinyDataManager.getInstance(this.mContext).getUploader();
            if (!canUpload(uploader)) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("TinyData TinyDataCacheProcessor.pingFollowUpAction !canUpload(uploader) ts:");
                sb2.append(System.currentTimeMillis());
                MyLog.w(sb2.toString());
                return;
            }
            mIsTinyDataExtracting = true;
            TinyDataCacheReader.addTinyDataCacheReadJob(this.mContext, uploader);
        }
    }
}
