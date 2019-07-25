package com.xiaomi.mipush.sdk;

import android.content.Context;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.push.service.OnlineConfig.OCUpdateCallback;
import com.xiaomi.xmpush.thrift.ConfigKey;
import java.util.HashMap;
import java.util.Map;

public class AssemblePushCollectionsManager implements AbstractPushManager {
    private static volatile AssemblePushCollectionsManager sInstance;
    private PushConfiguration mConfiguration;
    /* access modifiers changed from: private */
    public Context mContext;
    private Map<AssemblePush, AbstractPushManager> mManagers = new HashMap();
    /* access modifiers changed from: private */
    public boolean oldOCValue = false;

    private AssemblePushCollectionsManager(Context context) {
        this.mContext = context.getApplicationContext();
    }

    public static AssemblePushCollectionsManager getInstance(Context context) {
        if (sInstance == null) {
            synchronized (AssemblePushCollectionsManager.class) {
                if (sInstance == null) {
                    sInstance = new AssemblePushCollectionsManager(context);
                }
            }
        }
        return sInstance;
    }

    private void initAssemblePushManager() {
        if (this.mConfiguration != null) {
            if (this.mConfiguration.getOpenHmsPush()) {
                StringBuilder sb = new StringBuilder();
                sb.append(" HW user switch : ");
                sb.append(this.mConfiguration.getOpenHmsPush());
                sb.append(" HW online switch : ");
                sb.append(AssemblePushHelper.isOpenAssemblePushOnlineSwitch(this.mContext, AssemblePush.ASSEMBLE_PUSH_HUAWEI));
                sb.append(" HW isSupport : ");
                sb.append(PhoneBrand.HUAWEI.equals(AssemblePushUtils.getPhoneBrand(this.mContext)));
                StringBuilder sb2 = new StringBuilder();
                sb2.append("ASSEMBLE_PUSH : ");
                sb2.append(sb.toString());
                MyLog.w(sb2.toString());
            }
            if (this.mConfiguration.getOpenHmsPush() && AssemblePushHelper.isOpenAssemblePushOnlineSwitch(this.mContext, AssemblePush.ASSEMBLE_PUSH_HUAWEI) && PhoneBrand.HUAWEI.equals(AssemblePushUtils.getPhoneBrand(this.mContext))) {
                if (!contain(AssemblePush.ASSEMBLE_PUSH_HUAWEI)) {
                    addManager(AssemblePush.ASSEMBLE_PUSH_HUAWEI, PushManagerFactory.getManager(this.mContext, AssemblePush.ASSEMBLE_PUSH_HUAWEI));
                }
                MyLog.v("hw manager add to list");
            } else if (contain(AssemblePush.ASSEMBLE_PUSH_HUAWEI)) {
                AbstractPushManager manager = getManager(AssemblePush.ASSEMBLE_PUSH_HUAWEI);
                if (manager != null) {
                    removeManager(AssemblePush.ASSEMBLE_PUSH_HUAWEI);
                    manager.unregister();
                }
            }
            if (this.mConfiguration.getOpenFCMPush()) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append(" FCM user switch : ");
                sb3.append(this.mConfiguration.getOpenFCMPush());
                sb3.append(" FCM online switch : ");
                sb3.append(AssemblePushHelper.isOpenAssemblePushOnlineSwitch(this.mContext, AssemblePush.ASSEMBLE_PUSH_FCM));
                sb3.append(" FCM isSupport : ");
                sb3.append(AssemblePushUtils.isGoogleServiceSatisfied(this.mContext));
                StringBuilder sb4 = new StringBuilder();
                sb4.append("ASSEMBLE_PUSH : ");
                sb4.append(sb3.toString());
                MyLog.w(sb4.toString());
            }
            if (this.mConfiguration.getOpenFCMPush() && AssemblePushHelper.isOpenAssemblePushOnlineSwitch(this.mContext, AssemblePush.ASSEMBLE_PUSH_FCM) && AssemblePushUtils.isGoogleServiceSatisfied(this.mContext)) {
                if (!contain(AssemblePush.ASSEMBLE_PUSH_FCM)) {
                    addManager(AssemblePush.ASSEMBLE_PUSH_FCM, PushManagerFactory.getManager(this.mContext, AssemblePush.ASSEMBLE_PUSH_FCM));
                }
                MyLog.v("fcm manager add to list");
            } else if (contain(AssemblePush.ASSEMBLE_PUSH_FCM)) {
                AbstractPushManager manager2 = getManager(AssemblePush.ASSEMBLE_PUSH_FCM);
                if (manager2 != null) {
                    removeManager(AssemblePush.ASSEMBLE_PUSH_FCM);
                    manager2.unregister();
                }
            }
            if (this.mConfiguration.getOpenCOSPush()) {
                StringBuilder sb5 = new StringBuilder();
                sb5.append(" COS user switch : ");
                sb5.append(this.mConfiguration.getOpenCOSPush());
                sb5.append(" COS online switch : ");
                sb5.append(AssemblePushHelper.isOpenAssemblePushOnlineSwitch(this.mContext, AssemblePush.ASSEMBLE_PUSH_COS));
                sb5.append(" COS isSupport : ");
                sb5.append(AssemblePushUtils.isColorOSPushSupport(this.mContext));
                StringBuilder sb6 = new StringBuilder();
                sb6.append("ASSEMBLE_PUSH : ");
                sb6.append(sb5.toString());
                MyLog.w(sb6.toString());
            }
            if (this.mConfiguration.getOpenCOSPush() && AssemblePushHelper.isOpenAssemblePushOnlineSwitch(this.mContext, AssemblePush.ASSEMBLE_PUSH_COS) && AssemblePushUtils.isColorOSPushSupport(this.mContext)) {
                addManager(AssemblePush.ASSEMBLE_PUSH_COS, PushManagerFactory.getManager(this.mContext, AssemblePush.ASSEMBLE_PUSH_COS));
            } else if (contain(AssemblePush.ASSEMBLE_PUSH_COS)) {
                AbstractPushManager manager3 = getManager(AssemblePush.ASSEMBLE_PUSH_COS);
                if (manager3 != null) {
                    removeManager(AssemblePush.ASSEMBLE_PUSH_COS);
                    manager3.unregister();
                }
            }
            if (this.mConfiguration.getOpenFTOSPush() && AssemblePushHelper.isOpenAssemblePushOnlineSwitch(this.mContext, AssemblePush.ASSEMBLE_PUSH_FTOS) && AssemblePushUtils.isFunTouchOSPushSupport(this.mContext)) {
                addManager(AssemblePush.ASSEMBLE_PUSH_FTOS, PushManagerFactory.getManager(this.mContext, AssemblePush.ASSEMBLE_PUSH_FTOS));
            } else if (contain(AssemblePush.ASSEMBLE_PUSH_FTOS)) {
                AbstractPushManager manager4 = getManager(AssemblePush.ASSEMBLE_PUSH_FTOS);
                if (manager4 != null) {
                    removeManager(AssemblePush.ASSEMBLE_PUSH_FTOS);
                    manager4.unregister();
                }
            }
        }
    }

    public void addManager(AssemblePush assemblePush, AbstractPushManager abstractPushManager) {
        if (abstractPushManager != null) {
            if (this.mManagers.containsKey(assemblePush)) {
                this.mManagers.remove(assemblePush);
            }
            this.mManagers.put(assemblePush, abstractPushManager);
        }
    }

    public boolean contain(AssemblePush assemblePush) {
        return this.mManagers.containsKey(assemblePush);
    }

    public AbstractPushManager getManager(AssemblePush assemblePush) {
        return (AbstractPushManager) this.mManagers.get(assemblePush);
    }

    public boolean getUserSwitch(AssemblePush assemblePush) {
        boolean z = false;
        switch (assemblePush) {
            case ASSEMBLE_PUSH_HUAWEI:
                if (this.mConfiguration != null) {
                    return this.mConfiguration.getOpenHmsPush();
                }
                return false;
            case ASSEMBLE_PUSH_FCM:
                if (this.mConfiguration != null) {
                    return this.mConfiguration.getOpenFCMPush();
                }
                return false;
            case ASSEMBLE_PUSH_COS:
                if (this.mConfiguration != null) {
                    z = this.mConfiguration.getOpenCOSPush();
                    break;
                }
                break;
            case ASSEMBLE_PUSH_FTOS:
                break;
            default:
                return false;
        }
        return this.mConfiguration != null ? this.mConfiguration.getOpenFTOSPush() : z;
    }

    public void register() {
        MyLog.w("ASSEMBLE_PUSH : assemble push register");
        if (this.mManagers.size() <= 0) {
            initAssemblePushManager();
        }
        if (this.mManagers.size() > 0) {
            for (AbstractPushManager abstractPushManager : this.mManagers.values()) {
                if (abstractPushManager != null) {
                    abstractPushManager.register();
                }
            }
            AssemblePushHelper.checkAssemblePushStatus(this.mContext);
        }
    }

    public void removeManager(AssemblePush assemblePush) {
        this.mManagers.remove(assemblePush);
    }

    public void setConfiguration(PushConfiguration pushConfiguration) {
        this.mConfiguration = pushConfiguration;
        this.oldOCValue = OnlineConfig.getInstance(this.mContext).getBooleanValue(ConfigKey.AggregatePushSwitch.getValue(), true);
        if (this.mConfiguration.getOpenHmsPush() || this.mConfiguration.getOpenFCMPush() || this.mConfiguration.getOpenCOSPush()) {
            OnlineConfig.getInstance(this.mContext).addOCUpdateCallbacks(new OCUpdateCallback(BaiduSceneResult.SHOOTING, "assemblePush") {
                /* access modifiers changed from: protected */
                public void onCallback() {
                    boolean booleanValue = OnlineConfig.getInstance(AssemblePushCollectionsManager.this.mContext).getBooleanValue(ConfigKey.AggregatePushSwitch.getValue(), true);
                    if (AssemblePushCollectionsManager.this.oldOCValue != booleanValue) {
                        AssemblePushCollectionsManager.this.oldOCValue = booleanValue;
                        AssemblePushHelper.registerAssemblePush(AssemblePushCollectionsManager.this.mContext);
                    }
                }
            });
        }
    }

    public void unregister() {
        MyLog.w("ASSEMBLE_PUSH : assemble push unregister");
        for (AbstractPushManager abstractPushManager : this.mManagers.values()) {
            if (abstractPushManager != null) {
                abstractPushManager.unregister();
            }
        }
        this.mManagers.clear();
    }
}
