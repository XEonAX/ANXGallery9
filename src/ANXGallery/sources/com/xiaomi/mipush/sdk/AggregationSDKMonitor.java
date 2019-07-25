package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.xmpush.thrift.ConfigKey;
import java.util.ArrayList;

public class AggregationSDKMonitor {
    public static StackTraceElement[] mRegisterPushCallStack;

    /* access modifiers changed from: private */
    public static String buildCallStackString(int i) {
        if (mRegisterPushCallStack == null || mRegisterPushCallStack.length <= 4) {
            return "";
        }
        ArrayList arrayList = new ArrayList();
        int i2 = 4;
        while (i2 < mRegisterPushCallStack.length && i2 < i + 4) {
            try {
                arrayList.add(mRegisterPushCallStack[i2].toString());
                i2++;
            } catch (Exception unused) {
                return "";
            }
        }
        return arrayList.toString();
    }

    /* access modifiers changed from: private */
    public static boolean canUploadCallStack(Context context) {
        OnlineConfig instance = OnlineConfig.getInstance(context);
        if (!instance.getBooleanValue(ConfigKey.AggregationSdkMonitorSwitch.getValue(), false)) {
            return false;
        }
        return Math.abs(System.currentTimeMillis() - context.getSharedPreferences("mipush_extra", 0).getLong("last_upload_call_stack_timestamp", 0)) >= ((long) Math.max(60, instance.getIntValue(ConfigKey.AggregationSdkMonitorFrequency.getValue(), 86400)));
    }

    public static void getRegisterPushCallStack() {
        try {
            mRegisterPushCallStack = (StackTraceElement[]) Thread.getAllStackTraces().get(Thread.currentThread());
        } catch (Throwable unused) {
        }
    }

    /* access modifiers changed from: private */
    public static void updateCallStackUploadTimeStamp(Context context) {
        Editor edit = context.getSharedPreferences("mipush_extra", 0).edit();
        edit.putLong("last_upload_call_stack_timestamp", System.currentTimeMillis());
        edit.commit();
    }

    public static void uploadCallStack(final Context context) {
        ScheduledJobManager.getInstance(context).addOneShootJob((Runnable) new Runnable() {
            public void run() {
                if (AggregationSDKMonitor.canUploadCallStack(context)) {
                    String access$100 = AggregationSDKMonitor.buildCallStackString(OnlineConfig.getInstance(context).getIntValue(ConfigKey.AggregationSdkMonitorDepth.getValue(), 4));
                    if (!TextUtils.isEmpty(access$100)) {
                        MiTinyDataClient.upload(context, "monitor_upload", "call_stack", 1, access$100);
                        AggregationSDKMonitor.updateCallStackUploadTimeStamp(context);
                    }
                }
            }
        }, 20);
    }
}
