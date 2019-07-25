package com.xiaomi.push.mpcd.job;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.JobMutualExclusor;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import com.xiaomi.metoknlp.MetokApplication;
import com.xiaomi.metoknlp.devicediscover.DataListener;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.xmpush.thrift.ClientCollectionType;
import com.xiaomi.xmpush.thrift.ConfigKey;
import org.json.JSONObject;

public class WifiDevicesMacCollectionJob extends CollectionJob {
    /* access modifiers changed from: private */
    public String mDevicesMac;
    private DataListener mMacDataListener = new DataListener() {
        public void onDataCollect(String str) {
            WifiDevicesMacCollectionJob.this.mDevicesMac = WifiDevicesMacCollectionJob.getMacsFromJSON(str);
            synchronized (WifiDevicesMacCollectionJob.this.object) {
                try {
                    WifiDevicesMacCollectionJob.this.object.notify();
                } catch (Exception e) {
                    MyLog.e((Throwable) e);
                }
            }
        }
    };
    private SharedPreferences mSharedPreference;
    /* access modifiers changed from: private */
    public final Object object = new Object();

    public WifiDevicesMacCollectionJob(Context context, int i) {
        super(context, i);
        initMetokNLP(context);
    }

    /* access modifiers changed from: private */
    public static String getMacsFromJSON(String str) {
        try {
            String jSONArray = new JSONObject(str).getJSONArray("devices").toString();
            String substring = jSONArray.substring(1, jSONArray.length() - 1);
            if (!TextUtils.isEmpty(substring)) {
                return XMStringUtils.toUpperCase(substring);
            }
        } catch (Throwable unused) {
        }
        return "";
    }

    private void initMetokNLP(Context context) {
        MetokApplication.create(context).init();
        MetokApplication.get().registerDataListener(this.mMacDataListener, 1);
    }

    /* access modifiers changed from: protected */
    public boolean checkPeriodAndRecord() {
        if (isWifiChanged()) {
            return JobMutualExclusor.checkPeriodAndRecordWithFileLock(this.context, String.valueOf(getJobId()), (long) this.period);
        }
        int max = Math.max(3600, OnlineConfig.getInstance(this.context).getIntValue(ConfigKey.WifiDevicesMacWifiUnchangedCollectionFrequency.getValue(), 7200));
        long currentTimeMillis = System.currentTimeMillis();
        this.mSharedPreference = this.context.getSharedPreferences("mipush_extra", 4);
        boolean z = false;
        boolean z2 = ((float) Math.abs(currentTimeMillis - this.mSharedPreference.getLong("last_mac_upload_timestamp", 0))) >= ((float) (max * 1000)) * 0.9f;
        boolean checkPeriodAndRecordWithFileLock = JobMutualExclusor.checkPeriodAndRecordWithFileLock(this.context, String.valueOf(getJobId()), (long) max);
        if (z2 && checkPeriodAndRecordWithFileLock) {
            z = true;
        }
        return z;
    }

    public String collectInfo() {
        if (Network.isWIFIConnected(this.context)) {
            MetokApplication.get().fecthDeviceImmediately();
            synchronized (this.object) {
                try {
                    this.object.wait(10000);
                } catch (Exception e) {
                    MyLog.e((Throwable) e);
                }
            }
            this.mSharedPreference = this.context.getSharedPreferences("mipush_extra", 4);
            Editor edit = this.mSharedPreference.edit();
            edit.putLong("last_mac_upload_timestamp", System.currentTimeMillis());
            edit.commit();
        }
        String str = this.mDevicesMac;
        this.mDevicesMac = "";
        return str;
    }

    public ClientCollectionType getCollectionType() {
        return ClientCollectionType.WifiDevicesMac;
    }

    public int getJobId() {
        return 14;
    }

    public boolean isWifiChanged() {
        try {
            this.mSharedPreference = this.context.getSharedPreferences("mipush_extra", 4);
            String string = this.mSharedPreference.getString("last_wifi_ssid", "");
            WifiManager wifiManager = (WifiManager) this.context.getSystemService("wifi");
            if (wifiManager.isWifiEnabled()) {
                WifiInfo connectionInfo = wifiManager.getConnectionInfo();
                if (connectionInfo != null) {
                    Editor edit = this.mSharedPreference.edit();
                    edit.putString("last_wifi_ssid", connectionInfo.getSSID());
                    edit.commit();
                    if (TextUtils.isEmpty(string)) {
                        return false;
                    }
                    return true ^ TextUtils.equals(connectionInfo.getSSID(), string);
                }
            }
        } catch (Throwable unused) {
        }
        return true;
    }
}
