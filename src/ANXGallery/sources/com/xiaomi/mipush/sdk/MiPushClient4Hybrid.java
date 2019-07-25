package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.mipush.sdk.AppInfoHolder.ClientInfoData;
import com.xiaomi.push.service.xmpush.Command;
import com.xiaomi.xmpush.thrift.XmPushActionRegistrationResult;
import com.xiaomi.xmpush.thrift.XmPushActionUnRegistrationResult;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MiPushClient4Hybrid {
    private static Map<String, ClientInfoData> dataMap = new HashMap();
    private static MiPushCallback sCallback;
    private static Map<String, Long> sRegisterTimeMap = new HashMap();

    public static class MiPushCallback {
        public void onReceiveRegisterResult(String str, MiPushCommandMessage miPushCommandMessage) {
        }

        public void onReceiveUnregisterResult(String str, MiPushCommandMessage miPushCommandMessage) {
        }
    }

    public static void onReceiveRegisterResult(Context context, XmPushActionRegistrationResult xmPushActionRegistrationResult) {
        String packageName = xmPushActionRegistrationResult.getPackageName();
        if (xmPushActionRegistrationResult.getErrorCode() == 0) {
            ClientInfoData clientInfoData = (ClientInfoData) dataMap.get(packageName);
            if (clientInfoData != null) {
                clientInfoData.setHybridRegIdAndSecret(xmPushActionRegistrationResult.regId, xmPushActionRegistrationResult.regSecret);
                AppInfoHolder.getInstance(context).saveHybridAppInfo(packageName, clientInfoData);
            }
        }
        ArrayList arrayList = null;
        if (!TextUtils.isEmpty(xmPushActionRegistrationResult.regId)) {
            arrayList = new ArrayList();
            arrayList.add(xmPushActionRegistrationResult.regId);
        }
        MiPushCommandMessage generateCommandMessage = PushMessageHelper.generateCommandMessage(Command.COMMAND_REGISTER.value, arrayList, xmPushActionRegistrationResult.errorCode, xmPushActionRegistrationResult.reason, null);
        if (sCallback != null) {
            sCallback.onReceiveRegisterResult(packageName, generateCommandMessage);
        }
    }

    public static void onReceiveUnregisterResult(Context context, XmPushActionUnRegistrationResult xmPushActionUnRegistrationResult) {
        MiPushCommandMessage generateCommandMessage = PushMessageHelper.generateCommandMessage(Command.COMMAND_UNREGISTER.value, null, xmPushActionUnRegistrationResult.errorCode, xmPushActionUnRegistrationResult.reason, null);
        String packageName = xmPushActionUnRegistrationResult.getPackageName();
        if (sCallback != null) {
            sCallback.onReceiveUnregisterResult(packageName, generateCommandMessage);
        }
    }
}
