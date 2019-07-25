package com.xiaomi.push.service;

import android.util.Pair;
import com.xiaomi.channel.commonutils.misc.CollectionUtils;
import com.xiaomi.xmpush.thrift.ConfigListType;
import com.xiaomi.xmpush.thrift.ConfigType;
import com.xiaomi.xmpush.thrift.NormalConfig;
import com.xiaomi.xmpush.thrift.OnlineConfigItem;
import com.xiaomi.xmpush.thrift.XmPushActionCustomConfig;
import com.xiaomi.xmpush.thrift.XmPushActionNormalConfig;
import java.util.ArrayList;
import java.util.List;

public class OnlineConfigHelper {
    private static List<Pair<Integer, Object>> convertMessage(List<OnlineConfigItem> list, boolean z) {
        Object obj;
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (OnlineConfigItem onlineConfigItem : list) {
            int key = onlineConfigItem.getKey();
            ConfigType findByValue = ConfigType.findByValue(onlineConfigItem.getType());
            if (findByValue != null) {
                if (!z || !onlineConfigItem.clear) {
                    switch (findByValue) {
                        case INT:
                            obj = new Pair(Integer.valueOf(key), Integer.valueOf(onlineConfigItem.getIntValue()));
                            break;
                        case LONG:
                            obj = new Pair(Integer.valueOf(key), Long.valueOf(onlineConfigItem.getLongValue()));
                            break;
                        case STRING:
                            obj = new Pair(Integer.valueOf(key), onlineConfigItem.getStringValue());
                            break;
                        case BOOLEAN:
                            obj = new Pair(Integer.valueOf(key), Boolean.valueOf(onlineConfigItem.isBoolValue()));
                            break;
                        default:
                            obj = null;
                            break;
                    }
                    arrayList.add(obj);
                } else {
                    arrayList.add(new Pair(Integer.valueOf(key), null));
                }
            }
        }
        return arrayList;
    }

    public static int getVersion(OnlineConfig onlineConfig, ConfigListType configListType) {
        String versionKey = getVersionKey(configListType);
        int i = 0;
        switch (configListType) {
            case MISC_CONFIG:
                i = 1;
                break;
        }
        return onlineConfig.preferences.getInt(versionKey, i);
    }

    private static String getVersionKey(ConfigListType configListType) {
        StringBuilder sb = new StringBuilder();
        sb.append("oc_version_");
        sb.append(configListType.getValue());
        return sb.toString();
    }

    public static void setVersion(OnlineConfig onlineConfig, ConfigListType configListType, int i) {
        onlineConfig.preferences.edit().putInt(getVersionKey(configListType), i).commit();
    }

    public static void updateCustomConfigs(OnlineConfig onlineConfig, XmPushActionCustomConfig xmPushActionCustomConfig) {
        onlineConfig.updateCustomConfigs(convertMessage(xmPushActionCustomConfig.getCustomConfigs(), true));
        onlineConfig.runCallback();
    }

    public static void updateNormalConfigs(OnlineConfig onlineConfig, XmPushActionNormalConfig xmPushActionNormalConfig) {
        for (NormalConfig normalConfig : xmPushActionNormalConfig.getNormalConfigs()) {
            if (normalConfig.getVersion() > getVersion(onlineConfig, normalConfig.getType())) {
                setVersion(onlineConfig, normalConfig.getType(), normalConfig.getVersion());
                onlineConfig.updateNormalConfigs(convertMessage(normalConfig.configItems, false));
            }
        }
        onlineConfig.runCallback();
    }
}
