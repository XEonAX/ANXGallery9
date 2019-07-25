package com.xiaomi.push.service.awake.module;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.ComponentHelper;
import com.xiaomi.push.service.awake.AwakeDataHelper;
import com.xiaomi.push.service.awake.AwakeUploadHelper;

class ServiceComponentAwakeModule implements IAwakeModule {
    ServiceComponentAwakeModule() {
    }

    private void awakeByServiceName(Context context, String str, String str2, String str3) {
        if (context == null || TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            if (TextUtils.isEmpty(str3)) {
                AwakeUploadHelper.uploadData(context, "service", 1008, "argument error");
            } else {
                AwakeUploadHelper.uploadData(context, str3, 1008, "argument error");
            }
        } else if (!ComponentHelper.checkService(context, str)) {
            AwakeUploadHelper.uploadData(context, str3, 1003, "B is not ready");
        } else {
            AwakeUploadHelper.uploadData(context, str3, 1002, "B is ready");
            AwakeUploadHelper.uploadData(context, str3, 1004, "A is ready");
            try {
                Intent intent = new Intent();
                intent.setClassName(str, str2);
                intent.setAction("com.xiaomi.mipush.sdk.WAKEUP");
                intent.putExtra("waker_pkgname", context.getPackageName());
                intent.putExtra("awake_info", AwakeDataHelper.encode(str3));
                if (context.startService(intent) != null) {
                    AwakeUploadHelper.uploadData(context, str3, 1005, "A is successful");
                    AwakeUploadHelper.uploadData(context, str3, 1006, "The job is finished");
                    return;
                }
                AwakeUploadHelper.uploadData(context, str3, 1008, "A is fail to help B's service");
            } catch (Exception e) {
                MyLog.e((Throwable) e);
                AwakeUploadHelper.uploadData(context, str3, 1008, "A meet a exception when help B's service");
            }
        }
    }

    private void parseService(Service service, Intent intent) {
        if ("com.xiaomi.mipush.sdk.WAKEUP".equals(intent.getAction())) {
            String stringExtra = intent.getStringExtra("waker_pkgname");
            String stringExtra2 = intent.getStringExtra("awake_info");
            if (TextUtils.isEmpty(stringExtra)) {
                AwakeUploadHelper.uploadData(service.getApplicationContext(), "service", 1007, "old version message");
            } else if (!TextUtils.isEmpty(stringExtra2)) {
                String decode = AwakeDataHelper.decode(stringExtra2);
                if (!TextUtils.isEmpty(decode)) {
                    AwakeUploadHelper.uploadData(service.getApplicationContext(), decode, 1007, "old version message ");
                } else {
                    AwakeUploadHelper.uploadData(service.getApplicationContext(), "service", 1008, "B get a incorrect message");
                }
            } else {
                AwakeUploadHelper.uploadData(service.getApplicationContext(), stringExtra, 1007, "play with service ");
            }
        }
    }

    public void doAwake(Context context, AwakeInfo awakeInfo) {
        if (awakeInfo != null) {
            awakeByServiceName(context, awakeInfo.getTargetPackageName(), awakeInfo.getClassName(), awakeInfo.getAwakeInfo());
        }
    }

    public void doSendAwakeResult(Context context, Intent intent, String str) {
        if (context != null && (context instanceof Service)) {
            parseService((Service) context, intent);
        }
    }
}
