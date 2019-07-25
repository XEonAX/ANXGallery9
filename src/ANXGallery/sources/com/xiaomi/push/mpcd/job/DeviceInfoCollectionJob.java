package com.xiaomi.push.mpcd.job;

import android.content.Context;
import android.os.Build.VERSION;
import android.provider.Settings.Secure;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import com.xiaomi.xmpush.thrift.ClientCollectionType;

public class DeviceInfoCollectionJob extends CollectionJob {
    private boolean androidIdSwitch;
    private boolean androidVcSwitch;
    private boolean androidVnSwitch;
    private boolean operatorSwitch;
    private boolean screenSizeSwitch;

    public DeviceInfoCollectionJob(Context context, int i, boolean z, boolean z2, boolean z3, boolean z4, boolean z5) {
        super(context, i);
        this.screenSizeSwitch = z;
        this.androidVnSwitch = z2;
        this.androidVcSwitch = z3;
        this.androidIdSwitch = z4;
        this.operatorSwitch = z5;
    }

    private String getAndroidIdInfo() {
        if (!this.androidIdSwitch) {
            return "off";
        }
        try {
            return Secure.getString(this.context.getContentResolver(), "android_id");
        } catch (Throwable unused) {
            return "";
        }
    }

    private String getAndroidVcInfo() {
        if (!this.androidVcSwitch) {
            return "off";
        }
        try {
            return String.valueOf(VERSION.SDK_INT);
        } catch (Throwable unused) {
            return "";
        }
    }

    private String getAndroidVnInfo() {
        if (!this.androidVnSwitch) {
            return "off";
        }
        try {
            return VERSION.RELEASE;
        } catch (Throwable unused) {
            return "";
        }
    }

    private String getOperatorInfo() {
        if (!this.operatorSwitch) {
            return "off";
        }
        try {
            return ((TelephonyManager) this.context.getSystemService("phone")).getSimOperator();
        } catch (Throwable unused) {
            return "";
        }
    }

    private String getScreenSizeInfo() {
        if (!this.screenSizeSwitch) {
            return "off";
        }
        try {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            ((WindowManager) this.context.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
            StringBuilder sb = new StringBuilder();
            sb.append(displayMetrics.heightPixels);
            sb.append(",");
            sb.append(displayMetrics.widthPixels);
            return sb.toString();
        } catch (Throwable unused) {
            return "";
        }
    }

    public String collectInfo() {
        StringBuilder sb = new StringBuilder();
        sb.append(getScreenSizeInfo());
        sb.append("|");
        sb.append(getAndroidVnInfo());
        sb.append("|");
        sb.append(getAndroidVcInfo());
        sb.append("|");
        sb.append(getAndroidIdInfo());
        sb.append("|");
        sb.append(getOperatorInfo());
        return sb.toString();
    }

    public ClientCollectionType getCollectionType() {
        return ClientCollectionType.DeviceInfoV2;
    }

    public int getJobId() {
        return 3;
    }
}
