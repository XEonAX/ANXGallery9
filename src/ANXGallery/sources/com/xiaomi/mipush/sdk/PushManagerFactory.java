package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.reflect.JavaCalls;

public class PushManagerFactory {
    public static AbstractPushManager getManager(Context context, AssemblePush assemblePush) {
        return getManagerByType(context, assemblePush);
    }

    private static AbstractPushManager getManagerByType(Context context, AssemblePush assemblePush) {
        ManageClassInfo manageClassInfoByType = AssemblePushInfoHelper.getManageClassInfoByType(assemblePush);
        if (manageClassInfoByType == null || TextUtils.isEmpty(manageClassInfoByType.className) || TextUtils.isEmpty(manageClassInfoByType.methodName)) {
            return null;
        }
        return (AbstractPushManager) JavaCalls.callStaticMethod(manageClassInfoByType.className, manageClassInfoByType.methodName, context);
    }
}
