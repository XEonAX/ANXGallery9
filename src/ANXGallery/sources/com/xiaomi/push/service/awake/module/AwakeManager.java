package com.xiaomi.push.service.awake.module;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.push.service.awake.AwakeUploadHelper;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

public final class AwakeManager {
    private static volatile AwakeManager sInstance;
    private String mAppId;
    private Context mContext;
    private HashMap<HelpType, IAwakeModule> mModuleMap = new HashMap<>();
    private int mOnLineCmd;
    private String mPackageName;
    private IProcessData mSendDataIml;

    private AwakeManager(Context context) {
        this.mContext = context;
        this.mModuleMap.put(HelpType.SERVICE_ACTION, new ServiceActionAwakeModule());
        this.mModuleMap.put(HelpType.SERVICE_COMPONENT, new ServiceComponentAwakeModule());
        this.mModuleMap.put(HelpType.ACTIVITY, new ActivityActionAwakeModule());
        this.mModuleMap.put(HelpType.PROVIDER, new ProviderAwakeModule());
    }

    /* access modifiers changed from: private */
    public void doAwake(HelpType helpType, Context context, AwakeInfo awakeInfo) {
        ((IAwakeModule) this.mModuleMap.get(helpType)).doAwake(context, awakeInfo);
    }

    public static AwakeManager getInstance(Context context) {
        if (sInstance == null) {
            synchronized (AwakeManager.class) {
                if (sInstance == null) {
                    sInstance = new AwakeManager(context);
                }
            }
        }
        return sInstance;
    }

    public String getAppId() {
        return this.mAppId;
    }

    public int getOnLineCmd() {
        return this.mOnLineCmd;
    }

    public String getPackageName() {
        return this.mPackageName;
    }

    public IProcessData getSendDataIml() {
        return this.mSendDataIml;
    }

    public void sendResult(HelpType helpType, Context context, Intent intent, String str) {
        if (helpType != null) {
            ((IAwakeModule) this.mModuleMap.get(helpType)).doSendAwakeResult(context, intent, str);
        } else {
            AwakeUploadHelper.uploadData(context, "null", 1008, "A receive a incorrect message with empty type");
        }
    }

    public void setAppId(String str) {
        this.mAppId = str;
    }

    public void setOnLineCmd(int i) {
        this.mOnLineCmd = i;
    }

    public void setPackageInfo(String str, String str2, int i, IProcessData iProcessData) {
        setAppId(str);
        setPackageName(str2);
        setOnLineCmd(i);
        setSendDataIml(iProcessData);
    }

    public void setPackageName(String str) {
        this.mPackageName = str;
    }

    public void setSendDataIml(IProcessData iProcessData) {
        this.mSendDataIml = iProcessData;
    }

    public void wakeup(Context context, String str, int i, String str2, String str3) {
        if (context == null || TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || TextUtils.isEmpty(str3)) {
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(str);
            AwakeUploadHelper.uploadData(context, sb.toString(), 1008, "A receive a incorrect message");
            return;
        }
        setOnLineCmd(i);
        ScheduledJobManager instance = ScheduledJobManager.getInstance(this.mContext);
        final String str4 = str;
        final Context context2 = context;
        final String str5 = str2;
        final String str6 = str3;
        AnonymousClass1 r0 = new Runnable() {
            public void run() {
                if (!TextUtils.isEmpty(str4)) {
                    try {
                        AwakeUploadHelper.uploadData(context2, str4, 1001, "get message");
                        JSONObject jSONObject = new JSONObject(str4);
                        String optString = jSONObject.optString("action");
                        String optString2 = jSONObject.optString("awakened_app_packagename");
                        String optString3 = jSONObject.optString("awake_app_packagename");
                        String optString4 = jSONObject.optString("awake_app");
                        String optString5 = jSONObject.optString("awake_type");
                        if (str5.equals(optString3)) {
                            if (str6.equals(optString4)) {
                                if (TextUtils.isEmpty(optString5) || TextUtils.isEmpty(optString3) || TextUtils.isEmpty(optString4) || TextUtils.isEmpty(optString2)) {
                                    AwakeUploadHelper.uploadData(context2, str4, 1008, "A receive a incorrect message with empty type");
                                } else {
                                    AwakeManager.this.setPackageName(optString3);
                                    AwakeManager.this.setAppId(optString4);
                                    AwakeInfo awakeInfo = new AwakeInfo();
                                    awakeInfo.setAction(optString);
                                    awakeInfo.setTargetPackageName(optString2);
                                    awakeInfo.setAwakeInfo(str4);
                                    if ("service".equals(optString5)) {
                                        if (!TextUtils.isEmpty(optString)) {
                                            AwakeManager.this.doAwake(HelpType.SERVICE_ACTION, context2, awakeInfo);
                                        } else {
                                            awakeInfo.setClassName("com.xiaomi.mipush.sdk.PushMessageHandler");
                                            AwakeManager.this.doAwake(HelpType.SERVICE_COMPONENT, context2, awakeInfo);
                                        }
                                    } else if (HelpType.ACTIVITY.typeValue.equals(optString5)) {
                                        AwakeManager.this.doAwake(HelpType.ACTIVITY, context2, awakeInfo);
                                    } else if (HelpType.PROVIDER.typeValue.equals(optString5)) {
                                        AwakeManager.this.doAwake(HelpType.PROVIDER, context2, awakeInfo);
                                    } else {
                                        Context context = context2;
                                        String str = str4;
                                        StringBuilder sb = new StringBuilder();
                                        sb.append("A receive a incorrect message with unknown type ");
                                        sb.append(optString5);
                                        AwakeUploadHelper.uploadData(context, str, 1008, sb.toString());
                                    }
                                }
                            }
                        }
                        Context context2 = context2;
                        String str2 = str4;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("A receive a incorrect message with incorrect package info");
                        sb2.append(optString3);
                        AwakeUploadHelper.uploadData(context2, str2, 1008, sb2.toString());
                    } catch (JSONException e) {
                        MyLog.e((Throwable) e);
                        AwakeUploadHelper.uploadData(context2, str4, 1008, "A meet a exception when receive the message");
                    }
                } else {
                    AwakeUploadHelper.uploadData(context2, "null", 1008, "A receive a incorrect message with empty info");
                }
            }
        };
        instance.addOneShootJob(r0);
    }
}
