package com.xiaomi.push.service.awake.module;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.ComponentHelper;
import com.xiaomi.push.service.awake.AwakeDataHelper;
import com.xiaomi.push.service.awake.AwakeUploadHelper;

class ActivityActionAwakeModule implements IAwakeModule {
    ActivityActionAwakeModule() {
    }

    private void awakeByActivity(Context context, String str, String str2, String str3) {
        if (context == null || TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || TextUtils.isEmpty(str3)) {
            if (TextUtils.isEmpty(str3)) {
                AwakeUploadHelper.uploadData(context, "activity", 1008, "argument error");
            } else {
                AwakeUploadHelper.uploadData(context, str3, 1008, "argument error");
            }
        } else if (!ComponentHelper.checkActivity(context, str, str2)) {
            AwakeUploadHelper.uploadData(context, str3, 1003, "B is not ready");
        } else {
            AwakeUploadHelper.uploadData(context, str3, 1002, "B is ready");
            AwakeUploadHelper.uploadData(context, str3, 1004, "A is ready");
            Intent intent = new Intent(str2);
            intent.setPackage(str);
            intent.putExtra("awake_info", AwakeDataHelper.encode(str3));
            intent.addFlags(276824064);
            intent.setAction(str2);
            try {
                context.startActivity(intent);
                AwakeUploadHelper.uploadData(context, str3, 1005, "A is successful");
                AwakeUploadHelper.uploadData(context, str3, 1006, "The job is finished");
            } catch (Exception e) {
                MyLog.e((Throwable) e);
                AwakeUploadHelper.uploadData(context, str3, 1008, "A meet a exception when help B's activity");
            }
        }
    }

    private void parseActivity(Activity activity, Intent intent) {
        String stringExtra = intent.getStringExtra("awake_info");
        if (!TextUtils.isEmpty(stringExtra)) {
            String decode = AwakeDataHelper.decode(stringExtra);
            if (!TextUtils.isEmpty(decode)) {
                AwakeUploadHelper.uploadData(activity.getApplicationContext(), decode, 1007, "play with activity successfully");
            } else {
                AwakeUploadHelper.uploadData(activity.getApplicationContext(), "activity", 1008, "B get incorrect message");
            }
        } else {
            AwakeUploadHelper.uploadData(activity.getApplicationContext(), "activity", 1008, "B get incorrect message");
        }
    }

    public void doAwake(Context context, AwakeInfo awakeInfo) {
        if (awakeInfo != null) {
            awakeByActivity(context, awakeInfo.getTargetPackageName(), awakeInfo.getAction(), awakeInfo.getAwakeInfo());
        } else {
            AwakeUploadHelper.uploadData(context, "activity", 1008, "A receive incorrect message");
        }
    }

    public void doSendAwakeResult(Context context, Intent intent, String str) {
        if (context == null || !(context instanceof Activity) || intent == null) {
            AwakeUploadHelper.uploadData(context, "activity", 1008, "B receive incorrect message");
        } else {
            parseActivity((Activity) context, intent);
        }
    }
}
