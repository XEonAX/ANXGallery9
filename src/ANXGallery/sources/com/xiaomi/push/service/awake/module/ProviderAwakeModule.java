package com.xiaomi.push.service.awake.module;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.ComponentHelper;
import com.xiaomi.push.service.awake.AwakeDataHelper;
import com.xiaomi.push.service.awake.AwakeUploadHelper;

class ProviderAwakeModule implements IAwakeModule {
    ProviderAwakeModule() {
    }

    private void awakeByProvider(Context context, String str, String str2) {
        if (context == null || TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            if (TextUtils.isEmpty(str2)) {
                AwakeUploadHelper.uploadData(context, "provider", 1008, "argument error");
            } else {
                AwakeUploadHelper.uploadData(context, str2, 1008, "argument error");
            }
        } else if (!ComponentHelper.checkProvider(context, str)) {
            AwakeUploadHelper.uploadData(context, str2, 1003, "B is not ready");
        } else {
            AwakeUploadHelper.uploadData(context, str2, 1002, "B is ready");
            AwakeUploadHelper.uploadData(context, str2, 1004, "A is ready");
            String encode = AwakeDataHelper.encode(str2);
            try {
                if (!TextUtils.isEmpty(encode)) {
                    String type = context.getContentResolver().getType(AwakeDataHelper.getContentUri(str, encode));
                    if (TextUtils.isEmpty(type) || !"success".equals(type)) {
                        AwakeUploadHelper.uploadData(context, str2, 1008, "A is fail to help B's provider");
                        return;
                    }
                    AwakeUploadHelper.uploadData(context, str2, 1005, "A is successful");
                    AwakeUploadHelper.uploadData(context, str2, 1006, "The job is finished");
                    return;
                }
                AwakeUploadHelper.uploadData(context, str2, 1008, "info is empty");
            } catch (Exception e) {
                MyLog.e((Throwable) e);
                AwakeUploadHelper.uploadData(context, str2, 1008, "A meet a exception when help B's provider");
            }
        }
    }

    private void parseProvider(Context context, String str) {
        try {
            if (TextUtils.isEmpty(str) || context == null) {
                AwakeUploadHelper.uploadData(context, "provider", 1008, "B get a incorrect message");
            }
            String[] split = str.split("/");
            if (split.length <= 0 || TextUtils.isEmpty(split[split.length - 1])) {
                AwakeUploadHelper.uploadData(context, "provider", 1008, "B get a incorrect message");
            }
            String str2 = split[split.length - 1];
            if (TextUtils.isEmpty(str2)) {
                AwakeUploadHelper.uploadData(context, "provider", 1008, "B get a incorrect message");
                return;
            }
            String decode = Uri.decode(str2);
            if (TextUtils.isEmpty(decode)) {
                AwakeUploadHelper.uploadData(context, "provider", 1008, "B get a incorrect message");
                return;
            }
            String decode2 = AwakeDataHelper.decode(decode);
            if (!TextUtils.isEmpty(decode2)) {
                AwakeUploadHelper.uploadData(context, decode2, 1007, "play with provider successfully");
            } else {
                AwakeUploadHelper.uploadData(context, "provider", 1008, "B get a incorrect message");
            }
        } catch (Exception e) {
            StringBuilder sb = new StringBuilder();
            sb.append("B meet a exception");
            sb.append(e.getMessage());
            AwakeUploadHelper.uploadData(context, "provider", 1008, sb.toString());
        }
    }

    public void doAwake(Context context, AwakeInfo awakeInfo) {
        if (awakeInfo != null) {
            awakeByProvider(context, awakeInfo.getAction(), awakeInfo.getAwakeInfo());
        } else {
            AwakeUploadHelper.uploadData(context, "provider", 1008, "A receive incorrect message");
        }
    }

    public void doSendAwakeResult(Context context, Intent intent, String str) {
        parseProvider(context, str);
    }
}
