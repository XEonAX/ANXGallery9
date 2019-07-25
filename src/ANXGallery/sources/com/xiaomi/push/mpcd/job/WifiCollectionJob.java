package com.xiaomi.push.mpcd.job;

import android.content.Context;
import android.content.pm.PackageManager;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.CollectionUtils;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import com.xiaomi.xmpush.thrift.ClientCollectionType;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class WifiCollectionJob extends CollectionJob {
    private Comparator<ScanResult> comparator = new Comparator<ScanResult>() {
        public int compare(ScanResult scanResult, ScanResult scanResult2) {
            return scanResult2.level - scanResult.level;
        }
    };

    public WifiCollectionJob(Context context, int i) {
        super(context, i);
    }

    private boolean hasPermission() {
        PackageManager packageManager = this.context.getPackageManager();
        String packageName = this.context.getPackageName();
        if (VERSION.SDK_INT >= 23) {
            if (packageManager.checkPermission("android.permission.ACCESS_WIFI_STATE", packageName) == 0 && (packageManager.checkPermission("android.permission.ACCESS_COARSE_LOCATION", packageName) == 0 || packageManager.checkPermission("android.permission.ACCESS_FINE_LOCATION", packageName) == 0)) {
                return true;
            }
        } else if (packageManager.checkPermission("android.permission.ACCESS_WIFI_STATE", packageName) == 0) {
            return true;
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean checkPermission() {
        return true;
    }

    public String collectInfo() {
        StringBuilder sb = new StringBuilder();
        try {
            WifiManager wifiManager = (WifiManager) this.context.getSystemService("wifi");
            if (wifiManager == null) {
                return "";
            }
            if (wifiManager.isWifiEnabled()) {
                WifiInfo connectionInfo = wifiManager.getConnectionInfo();
                if (connectionInfo != null) {
                    String ssid = connectionInfo.getSSID();
                    String bssid = connectionInfo.getBSSID();
                    if (!hasPermission()) {
                        if (TextUtils.isEmpty(ssid)) {
                            ssid = "<unknown ssid>";
                        }
                        if (TextUtils.isEmpty(bssid) || bssid.length() != 17 || "ff:ff:ff:ff:ff:ff".equals(bssid)) {
                            bssid = "02:00:00:00:00:00";
                        }
                    } else if (TextUtils.isEmpty(bssid) || bssid.length() != 17 || "ff:ff:ff:ff:ff:ff".equals(bssid)) {
                        bssid = "00:00:00:00:00:00";
                    }
                    sb.append(ssid);
                    sb.append(",");
                    sb.append(XMStringUtils.toUpperCase(bssid));
                    sb.append("|");
                }
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append("MAC_FIX mac ssid and mac: ");
            sb2.append(sb.toString());
            MyLog.v(sb2.toString());
            List scanResults = wifiManager.getScanResults();
            if (!CollectionUtils.isEmpty(scanResults)) {
                Collections.sort(scanResults, this.comparator);
                for (int i = 0; i < Math.min(10, scanResults.size()); i++) {
                    ScanResult scanResult = (ScanResult) scanResults.get(i);
                    if (i > 0) {
                        sb.append(";");
                    }
                    if (scanResult != null) {
                        sb.append(scanResult.SSID);
                        sb.append(",");
                        sb.append(XMStringUtils.toUpperCase(scanResult.BSSID));
                        sb.append(",");
                        sb.append(scanResult.level);
                    }
                }
            }
            StringBuilder sb3 = new StringBuilder();
            sb3.append("MAC_FIX mac ssid group : ");
            sb3.append(sb.toString());
            MyLog.v(sb3.toString());
            return sb.toString();
        } catch (Throwable unused) {
        }
    }

    public ClientCollectionType getCollectionType() {
        return ClientCollectionType.WIFI;
    }

    public int getJobId() {
        return 8;
    }
}
