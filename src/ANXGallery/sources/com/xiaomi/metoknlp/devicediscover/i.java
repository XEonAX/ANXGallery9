package com.xiaomi.metoknlp.devicediscover;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.net.DhcpInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.net.InetAddress;
import java.net.UnknownHostException;

/* compiled from: DiscoverUtils */
class i {
    /* JADX WARNING: Removed duplicated region for block: B:13:0x002a A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x002b  */
    public static String a(Context context, int i) {
        WifiInfo wifiInfo;
        try {
            WifiManager wifiManager = (WifiManager) context.getSystemService("wifi");
            if (wifiManager == null || !wifiManager.isWifiEnabled()) {
                return null;
            }
            try {
                if (context.getPackageManager().checkPermission("android.permission.ACCESS_WIFI_STATE", context.getPackageName()) == 0) {
                    wifiInfo = wifiManager.getConnectionInfo();
                    if (wifiInfo != null) {
                        return null;
                    }
                    if (i == 0) {
                        return wifiInfo.getMacAddress();
                    }
                    if (i == 1) {
                        return wifiInfo.getBSSID();
                    }
                    if (i == 2) {
                        return l(wifiInfo.getSSID());
                    }
                    return null;
                }
            } catch (Exception unused) {
            }
            wifiInfo = null;
            if (wifiInfo != null) {
            }
        } catch (Exception unused2) {
        }
    }

    public static void a(Context context, String str, String str2) {
        Editor edit = context.getSharedPreferences("devicediscover", 0).edit();
        edit.putString(str, str2);
        edit.commit();
    }

    public static DhcpInfo b(Context context) {
        DhcpInfo dhcpInfo = null;
        if (context == null) {
            return null;
        }
        WifiManager wifiManager = (WifiManager) context.getSystemService("wifi");
        if (wifiManager == null || !wifiManager.isWifiEnabled()) {
            return null;
        }
        try {
            if (context.getPackageManager().checkPermission("android.permission.ACCESS_WIFI_STATE", context.getPackageName()) == 0) {
                dhcpInfo = wifiManager.getDhcpInfo();
            }
        } catch (Exception unused) {
        }
        return dhcpInfo;
    }

    public static String b(Context context, String str, String str2) {
        return context.getSharedPreferences("devicediscover", 0).getString(str, str2);
    }

    public static String c(Context context) {
        try {
            DhcpInfo b = b(context);
            if (b == null) {
                return null;
            }
            return intToInetAddress(b.gateway).getHostAddress();
        } catch (Exception unused) {
            return null;
        }
    }

    public static String d(Context context) {
        try {
            DhcpInfo b = b(context);
            if (b == null) {
                return null;
            }
            return intToInetAddress(b.serverAddress).getHostAddress();
        } catch (Exception unused) {
            return null;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x003d A[SYNTHETIC, Splitter:B:23:0x003d] */
    /* JADX WARNING: Removed duplicated region for block: B:37:? A[RETURN, SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:38:? A[RETURN, SYNTHETIC] */
    public static String e(Context context) {
        String a = a(context, 0);
        if (a != null && !a.isEmpty() && !"02:00:00:00:00:00".equals(a)) {
            return a;
        }
        FileReader fileReader = null;
        try {
            char[] cArr = new char[1024];
            FileReader fileReader2 = new FileReader("/sys/class/net/wlan0/address");
            try {
                String trim = new String(cArr, 0, fileReader2.read(cArr, 0, 1024)).trim();
                try {
                    fileReader2.close();
                } catch (Exception unused) {
                }
                return trim;
            } catch (FileNotFoundException unused2) {
                fileReader = fileReader2;
                if (fileReader == null) {
                    return a;
                }
                try {
                    fileReader.close();
                    return a;
                } catch (Exception unused3) {
                    return a;
                }
            } catch (Exception unused4) {
                fileReader = fileReader2;
                if (fileReader == null) {
                    return a;
                }
                fileReader.close();
                return a;
            } catch (Throwable th) {
                th = th;
                fileReader = fileReader2;
                if (fileReader != null) {
                    try {
                        fileReader.close();
                    } catch (Exception unused5) {
                    }
                }
                throw th;
            }
        } catch (FileNotFoundException unused6) {
            if (fileReader == null) {
            }
            fileReader.close();
            return a;
        } catch (Exception unused7) {
            if (fileReader == null) {
            }
            fileReader.close();
            return a;
        } catch (Throwable th2) {
            th = th2;
            if (fileReader != null) {
            }
            throw th;
        }
    }

    public static InetAddress intToInetAddress(int i) {
        try {
            return InetAddress.getByAddress(new byte[]{(byte) (i & 255), (byte) ((i >> 8) & 255), (byte) ((i >> 16) & 255), (byte) ((i >> 24) & 255)});
        } catch (UnknownHostException unused) {
            throw new AssertionError();
        }
    }

    private static String l(String str) {
        return (!str.startsWith("\"") || !str.endsWith("\"")) ? str : str.substring(1, str.length() - 1);
    }
}
