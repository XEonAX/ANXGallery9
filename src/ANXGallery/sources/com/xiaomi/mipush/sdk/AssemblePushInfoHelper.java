package com.xiaomi.mipush.sdk;

import com.xiaomi.xmpush.thrift.ConfigKey;
import java.util.HashMap;

public class AssemblePushInfoHelper {
    private static HashMap<AssemblePush, ManageClassInfo> mHashMaps = new HashMap<>();

    static class ManageClassInfo {
        public String className;
        public String methodName;

        public ManageClassInfo(String str, String str2) {
            this.className = str;
            this.methodName = str2;
        }
    }

    static {
        add(AssemblePush.ASSEMBLE_PUSH_HUAWEI, new ManageClassInfo("com.xiaomi.assemble.control.HmsPushManager", "newInstance"));
        add(AssemblePush.ASSEMBLE_PUSH_FCM, new ManageClassInfo("com.xiaomi.assemble.control.FCMPushManager", "newInstance"));
        add(AssemblePush.ASSEMBLE_PUSH_COS, new ManageClassInfo("com.xiaomi.assemble.control.COSPushManager", "newInstance"));
        add(AssemblePush.ASSEMBLE_PUSH_FTOS, new ManageClassInfo("com.xiaomi.assemble.control.FTOSPushManager", "newInstance"));
    }

    private static void add(AssemblePush assemblePush, ManageClassInfo manageClassInfo) {
        if (manageClassInfo != null) {
            mHashMaps.put(assemblePush, manageClassInfo);
        }
    }

    public static ConfigKey getConfigKeyByType(AssemblePush assemblePush) {
        return ConfigKey.AggregatePushSwitch;
    }

    public static ManageClassInfo getManageClassInfoByType(AssemblePush assemblePush) {
        return (ManageClassInfo) mHashMaps.get(assemblePush);
    }

    public static RetryType getRetryType(AssemblePush assemblePush) {
        switch (assemblePush) {
            case ASSEMBLE_PUSH_HUAWEI:
                return RetryType.UPLOAD_HUAWEI_TOKEN;
            case ASSEMBLE_PUSH_FCM:
                return RetryType.UPLOAD_FCM_TOKEN;
            case ASSEMBLE_PUSH_COS:
                return RetryType.UPLOAD_COS_TOKEN;
            case ASSEMBLE_PUSH_FTOS:
                return RetryType.UPLOAD_FTOS_TOKEN;
            default:
                return null;
        }
    }
}
