package com.xiaomi.mipush.sdk;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.database.ContentObserver;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.android.MIUIUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.channel.commonutils.string.MD5;
import com.xiaomi.push.clientreport.PerfMessageHelper;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.push.service.PacketHelper;
import com.xiaomi.push.service.PushConstants;
import com.xiaomi.push.service.PushProvision;
import com.xiaomi.push.service.clientReport.PushClientReportManager;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.BootModeType;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import com.xiaomi.xmpush.thrift.ConfigKey;
import com.xiaomi.xmpush.thrift.NotificationType;
import com.xiaomi.xmpush.thrift.PushMetaInfo;
import com.xiaomi.xmpush.thrift.XmPushActionContainer;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import com.xiaomi.xmpush.thrift.XmPushActionRegistration;
import com.xiaomi.xmpush.thrift.XmPushActionUnRegistration;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.apache.thrift.TBase;

public class PushServiceClient {
    private static boolean isBind;
    private static PushServiceClient sInstance;
    private static final ArrayList<BufferedRequest> sPendingRequest = new ArrayList<>();
    private Handler handler = null;
    /* access modifiers changed from: private */
    public boolean isConnectingService = false;
    /* access modifiers changed from: private */
    public Messenger mClientMessenger;
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public Integer mDeviceProvisioned = null;
    private boolean mIsMiuiPushServiceEnabled = false;
    private String mSession;
    /* access modifiers changed from: private */
    public List<Message> pendingMessages = new ArrayList();
    private Intent registerTask = null;

    static class BufferedRequest<T extends TBase<T, ?>> {
        ActionType actionType;
        boolean encrypt;
        T message;

        BufferedRequest() {
        }
    }

    private PushServiceClient(Context context) {
        this.mContext = context.getApplicationContext();
        this.mSession = null;
        this.mIsMiuiPushServiceEnabled = serviceInstalled();
        isBind = useBind();
        this.handler = new Handler(Looper.getMainLooper()) {
            public void dispatchMessage(Message message) {
                if (message.what == 19) {
                    String str = (String) message.obj;
                    int i = message.arg1;
                    synchronized (OperatePushHelper.class) {
                        if (OperatePushHelper.getInstance(PushServiceClient.this.mContext).isMessageOperating(str)) {
                            if (OperatePushHelper.getInstance(PushServiceClient.this.mContext).getRetryCount(str) < 10) {
                                if (RetryType.DISABLE_PUSH.ordinal() == i && "syncing".equals(OperatePushHelper.getInstance(PushServiceClient.this.mContext).getSyncStatus(RetryType.DISABLE_PUSH))) {
                                    PushServiceClient.this.retryPolicy(str, RetryType.DISABLE_PUSH, true, null);
                                } else if (RetryType.ENABLE_PUSH.ordinal() == i && "syncing".equals(OperatePushHelper.getInstance(PushServiceClient.this.mContext).getSyncStatus(RetryType.ENABLE_PUSH))) {
                                    PushServiceClient.this.retryPolicy(str, RetryType.ENABLE_PUSH, true, null);
                                } else if (RetryType.UPLOAD_HUAWEI_TOKEN.ordinal() == i && "syncing".equals(OperatePushHelper.getInstance(PushServiceClient.this.mContext).getSyncStatus(RetryType.UPLOAD_HUAWEI_TOKEN))) {
                                    PushServiceClient.this.retryPolicy(str, RetryType.UPLOAD_HUAWEI_TOKEN, false, AssemblePushHelper.getAssemblePushExtra(PushServiceClient.this.mContext, AssemblePush.ASSEMBLE_PUSH_HUAWEI));
                                } else if (RetryType.UPLOAD_FCM_TOKEN.ordinal() == i && "syncing".equals(OperatePushHelper.getInstance(PushServiceClient.this.mContext).getSyncStatus(RetryType.UPLOAD_FCM_TOKEN))) {
                                    PushServiceClient.this.retryPolicy(str, RetryType.UPLOAD_FCM_TOKEN, false, AssemblePushHelper.getAssemblePushExtra(PushServiceClient.this.mContext, AssemblePush.ASSEMBLE_PUSH_FCM));
                                } else if (RetryType.UPLOAD_COS_TOKEN.ordinal() == i && "syncing".equals(OperatePushHelper.getInstance(PushServiceClient.this.mContext).getSyncStatus(RetryType.UPLOAD_COS_TOKEN))) {
                                    PushServiceClient.this.retryPolicy(str, RetryType.UPLOAD_COS_TOKEN, false, AssemblePushHelper.getAssemblePushExtra(PushServiceClient.this.mContext, AssemblePush.ASSEMBLE_PUSH_COS));
                                } else if (RetryType.UPLOAD_FTOS_TOKEN.ordinal() == i && "syncing".equals(OperatePushHelper.getInstance(PushServiceClient.this.mContext).getSyncStatus(RetryType.UPLOAD_FTOS_TOKEN))) {
                                    PushServiceClient.this.retryPolicy(str, RetryType.UPLOAD_FTOS_TOKEN, false, AssemblePushHelper.getAssemblePushExtra(PushServiceClient.this.mContext, AssemblePush.ASSEMBLE_PUSH_FTOS));
                                }
                                OperatePushHelper.getInstance(PushServiceClient.this.mContext).increaseRetryCount(str);
                            } else {
                                OperatePushHelper.getInstance(PushServiceClient.this.mContext).removeOperateMessage(str);
                            }
                        }
                    }
                }
            }
        };
        Intent createGlobalServiceIntent = createGlobalServiceIntent();
        if (createGlobalServiceIntent != null) {
            startServiceSafely(createGlobalServiceIntent);
        }
    }

    private synchronized void bindServiceSafely(Intent intent) {
        if (this.isConnectingService) {
            Message parseToMessage = parseToMessage(intent);
            if (this.pendingMessages.size() >= 50) {
                this.pendingMessages.remove(0);
            }
            this.pendingMessages.add(parseToMessage);
            return;
        } else if (this.mClientMessenger == null) {
            Context context = this.mContext;
            AnonymousClass3 r1 = new ServiceConnection() {
                public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
                    synchronized (PushServiceClient.this) {
                        PushServiceClient.this.mClientMessenger = new Messenger(iBinder);
                        PushServiceClient.this.isConnectingService = false;
                        for (Message send : PushServiceClient.this.pendingMessages) {
                            try {
                                PushServiceClient.this.mClientMessenger.send(send);
                            } catch (RemoteException e) {
                                MyLog.e((Throwable) e);
                            }
                        }
                        PushServiceClient.this.pendingMessages.clear();
                    }
                }

                public void onServiceDisconnected(ComponentName componentName) {
                    PushServiceClient.this.mClientMessenger = null;
                    PushServiceClient.this.isConnectingService = false;
                }
            };
            Context context2 = this.mContext;
            context.bindService(intent, r1, 1);
            this.isConnectingService = true;
            this.pendingMessages.clear();
            this.pendingMessages.add(parseToMessage(intent));
        } else {
            try {
                this.mClientMessenger.send(parseToMessage(intent));
            } catch (RemoteException unused) {
                this.mClientMessenger = null;
                this.isConnectingService = false;
            }
        }
        return;
    }

    private void callService(Intent intent) {
        int intValue = OnlineConfig.getInstance(this.mContext).getIntValue(ConfigKey.ServiceBootMode.getValue(), BootModeType.START.getValue());
        int serviceBootMode = getServiceBootMode();
        boolean z = intValue == BootModeType.BIND.getValue() && isBind;
        int value = (z ? BootModeType.BIND : BootModeType.START).getValue();
        if (value != serviceBootMode) {
            sendServiceBootMode(value);
        }
        if (z) {
            bindServiceSafely(intent);
        } else {
            startServiceSafely(intent);
        }
    }

    private Intent createGlobalServiceIntent() {
        if (!"com.xiaomi.xmsf".equals(this.mContext.getPackageName())) {
            return createGlobalServiceIntentForApp();
        }
        MyLog.v("pushChannel xmsf create own channel");
        return createMyPushChannelIntent();
    }

    private Intent createGlobalServiceIntentForApp() {
        if (shouldUseMIUIPush()) {
            MyLog.v("pushChannel app start miui china channel");
            return createMIUIPushChannelIntent();
        }
        MyLog.v("pushChannel app start  own channel");
        return createMyPushChannelIntent();
    }

    private Intent createMIUIPushChannelIntent() {
        Intent intent = new Intent();
        String packageName = this.mContext.getPackageName();
        intent.setPackage("com.xiaomi.xmsf");
        intent.setClassName("com.xiaomi.xmsf", getPushServiceName());
        intent.putExtra("mipush_app_package", packageName);
        disableMyPushService();
        return intent;
    }

    private Intent createMyPushChannelIntent() {
        Intent intent = new Intent();
        String packageName = this.mContext.getPackageName();
        enableMyPushService();
        intent.setComponent(new ComponentName(this.mContext, "com.xiaomi.push.service.XMPushService"));
        intent.putExtra("mipush_app_package", packageName);
        return intent;
    }

    private Intent createServiceIntent() {
        return (!shouldUseMIUIPush() || "com.xiaomi.xmsf".equals(this.mContext.getPackageName())) ? createMyPushChannelIntent() : createMIUIPushChannelIntent();
    }

    private void disableMyPushService() {
        try {
            PackageManager packageManager = this.mContext.getPackageManager();
            ComponentName componentName = new ComponentName(this.mContext, "com.xiaomi.push.service.XMPushService");
            if (packageManager.getComponentEnabledSetting(componentName) != 2) {
                packageManager.setComponentEnabledSetting(componentName, 2, 1);
            }
        } catch (Throwable unused) {
        }
    }

    private void enableMyPushService() {
        try {
            PackageManager packageManager = this.mContext.getPackageManager();
            ComponentName componentName = new ComponentName(this.mContext, "com.xiaomi.push.service.XMPushService");
            if (packageManager.getComponentEnabledSetting(componentName) != 1) {
                packageManager.setComponentEnabledSetting(componentName, 1, 1);
            }
        } catch (Throwable unused) {
        }
    }

    public static synchronized PushServiceClient getInstance(Context context) {
        PushServiceClient pushServiceClient;
        synchronized (PushServiceClient.class) {
            if (sInstance == null) {
                sInstance = new PushServiceClient(context);
            }
            pushServiceClient = sInstance;
        }
        return pushServiceClient;
    }

    private String getPushServiceName() {
        try {
            if (this.mContext.getPackageManager().getPackageInfo("com.xiaomi.xmsf", 4).versionCode >= 106) {
                return "com.xiaomi.push.service.XMPushService";
            }
        } catch (Exception unused) {
        }
        return "com.xiaomi.xmsf.push.service.XMPushService";
    }

    private synchronized int getServiceBootMode() {
        return this.mContext.getSharedPreferences("mipush_extra", 0).getInt("service_boot_mode", -1);
    }

    private boolean isAutoTry() {
        String packageName = this.mContext.getPackageName();
        boolean z = true;
        if (packageName.contains("miui") || packageName.contains("xiaomi")) {
            return true;
        }
        if ((this.mContext.getApplicationInfo().flags & 1) == 0) {
            z = false;
        }
        return z;
    }

    private Message parseToMessage(Intent intent) {
        Message obtain = Message.obtain();
        obtain.what = 17;
        obtain.obj = intent;
        return obtain;
    }

    /* access modifiers changed from: private */
    public void retryPolicy(String str, RetryType retryType, boolean z, HashMap<String, String> hashMap) {
        XmPushActionNotification xmPushActionNotification;
        if (AppInfoHolder.getInstance(this.mContext).checkAppInfo() && Network.hasNetwork(this.mContext)) {
            XmPushActionNotification xmPushActionNotification2 = new XmPushActionNotification();
            xmPushActionNotification2.setRequireAck(true);
            Intent createServiceIntent = createServiceIntent();
            if (TextUtils.isEmpty(str)) {
                str = PacketHelper.generatePacketID();
                xmPushActionNotification2.setId(str);
                xmPushActionNotification = z ? new XmPushActionNotification(str, true) : null;
                synchronized (OperatePushHelper.class) {
                    OperatePushHelper.getInstance(this.mContext).resetOperateMessage(str);
                }
            } else {
                xmPushActionNotification2.setId(str);
                xmPushActionNotification = z ? new XmPushActionNotification(str, true) : null;
            }
            switch (retryType) {
                case DISABLE_PUSH:
                    xmPushActionNotification2.setType(NotificationType.DisablePushMessage.value);
                    xmPushActionNotification.setType(NotificationType.DisablePushMessage.value);
                    if (hashMap != null) {
                        xmPushActionNotification2.setExtra(hashMap);
                        xmPushActionNotification.setExtra(hashMap);
                    }
                    createServiceIntent.setAction("com.xiaomi.mipush.DISABLE_PUSH_MESSAGE");
                    break;
                case ENABLE_PUSH:
                    xmPushActionNotification2.setType(NotificationType.EnablePushMessage.value);
                    xmPushActionNotification.setType(NotificationType.EnablePushMessage.value);
                    if (hashMap != null) {
                        xmPushActionNotification2.setExtra(hashMap);
                        xmPushActionNotification.setExtra(hashMap);
                    }
                    createServiceIntent.setAction("com.xiaomi.mipush.ENABLE_PUSH_MESSAGE");
                    break;
                case UPLOAD_HUAWEI_TOKEN:
                case UPLOAD_FCM_TOKEN:
                case UPLOAD_COS_TOKEN:
                case UPLOAD_FTOS_TOKEN:
                    xmPushActionNotification2.setType(NotificationType.ThirdPartyRegUpdate.value);
                    if (hashMap != null) {
                        xmPushActionNotification2.setExtra(hashMap);
                        break;
                    }
                    break;
            }
            xmPushActionNotification2.setAppId(AppInfoHolder.getInstance(this.mContext).getAppID());
            xmPushActionNotification2.setPackageName(this.mContext.getPackageName());
            sendMessage(xmPushActionNotification2, ActionType.Notification, false, null);
            if (z) {
                xmPushActionNotification.setAppId(AppInfoHolder.getInstance(this.mContext).getAppID());
                xmPushActionNotification.setPackageName(this.mContext.getPackageName());
                byte[] convertThriftObjectToBytes = XmPushThriftSerializeUtils.convertThriftObjectToBytes(PushContainerHelper.generateRequestContainer(this.mContext, xmPushActionNotification, ActionType.Notification, false, this.mContext.getPackageName(), AppInfoHolder.getInstance(this.mContext).getAppID()));
                if (convertThriftObjectToBytes != null) {
                    PerfMessageHelper.collectPerfData(this.mContext.getPackageName(), this.mContext, xmPushActionNotification, ActionType.Notification, convertThriftObjectToBytes.length);
                    createServiceIntent.putExtra("mipush_payload", convertThriftObjectToBytes);
                    createServiceIntent.putExtra("com.xiaomi.mipush.MESSAGE_CACHE", true);
                    createServiceIntent.putExtra("mipush_app_id", AppInfoHolder.getInstance(this.mContext).getAppID());
                    createServiceIntent.putExtra("mipush_app_token", AppInfoHolder.getInstance(this.mContext).getAppToken());
                    callService(createServiceIntent);
                }
            }
            Message obtain = Message.obtain();
            obtain.what = 19;
            int ordinal = retryType.ordinal();
            obtain.obj = str;
            obtain.arg1 = ordinal;
            this.handler.sendMessageDelayed(obtain, 5000);
        }
    }

    private synchronized void saveServiceBootMode(int i) {
        this.mContext.getSharedPreferences("mipush_extra", 0).edit().putInt("service_boot_mode", i).commit();
    }

    private boolean serviceInstalled() {
        try {
            PackageInfo packageInfo = this.mContext.getPackageManager().getPackageInfo("com.xiaomi.xmsf", 4);
            return packageInfo != null && packageInfo.versionCode >= 105;
        } catch (Throwable unused) {
            return false;
        }
    }

    private void startServiceSafely(Intent intent) {
        try {
            if (MIUIUtils.isMIUI() || VERSION.SDK_INT < 26) {
                this.mContext.startService(intent);
            } else {
                bindServiceSafely(intent);
            }
        } catch (Exception e) {
            MyLog.e((Throwable) e);
        }
    }

    private boolean useBind() {
        if (shouldUseMIUIPush()) {
            try {
                return this.mContext.getPackageManager().getPackageInfo("com.xiaomi.xmsf", 4).versionCode >= 108;
            } catch (Exception unused) {
            }
        }
        return true;
    }

    public <T extends TBase<T, ?>> void addPendRequest(T t, ActionType actionType, boolean z) {
        BufferedRequest bufferedRequest = new BufferedRequest();
        bufferedRequest.message = t;
        bufferedRequest.actionType = actionType;
        bufferedRequest.encrypt = z;
        synchronized (sPendingRequest) {
            sPendingRequest.add(bufferedRequest);
            if (sPendingRequest.size() > 10) {
                sPendingRequest.remove(0);
            }
        }
    }

    public void awakePushService() {
        startServiceSafely(createServiceIntent());
    }

    public void clearLocalNotificationType() {
        Intent createServiceIntent = createServiceIntent();
        createServiceIntent.setAction("com.xiaomi.mipush.SET_NOTIFICATION_TYPE");
        createServiceIntent.putExtra(PushConstants.EXTRA_PACKAGE_NAME, this.mContext.getPackageName());
        createServiceIntent.putExtra(PushConstants.EXTRA_SIG, MD5.MD5_16(this.mContext.getPackageName()));
        callService(createServiceIntent);
    }

    public void clearNotification(int i) {
        Intent createServiceIntent = createServiceIntent();
        createServiceIntent.setAction("com.xiaomi.mipush.CLEAR_NOTIFICATION");
        createServiceIntent.putExtra(PushConstants.EXTRA_PACKAGE_NAME, this.mContext.getPackageName());
        createServiceIntent.putExtra(PushConstants.EXTRA_NOTIFY_ID, i);
        callService(createServiceIntent);
    }

    public void clearNotification(String str, String str2) {
        Intent createServiceIntent = createServiceIntent();
        createServiceIntent.setAction("com.xiaomi.mipush.CLEAR_NOTIFICATION");
        createServiceIntent.putExtra(PushConstants.EXTRA_PACKAGE_NAME, this.mContext.getPackageName());
        createServiceIntent.putExtra(PushConstants.EXTRA_NOTIFY_TITLE, str);
        createServiceIntent.putExtra(PushConstants.EXTRA_NOTIFY_DESCRIPTION, str2);
        callService(createServiceIntent);
    }

    public final void closePush() {
        Intent createServiceIntent = createServiceIntent();
        createServiceIntent.setAction("com.xiaomi.mipush.DISABLE_PUSH");
        callService(createServiceIntent);
    }

    public boolean isProvisioned() {
        boolean z = true;
        if (!shouldUseMIUIPush() || !isAutoTry()) {
            return true;
        }
        if (this.mDeviceProvisioned == null) {
            this.mDeviceProvisioned = Integer.valueOf(PushProvision.getInstance(this.mContext).getProvisioned());
            if (this.mDeviceProvisioned.intValue() == 0) {
                this.mContext.getContentResolver().registerContentObserver(PushProvision.getInstance(this.mContext).getProvisionedUri(), false, new ContentObserver(new Handler(Looper.getMainLooper())) {
                    public void onChange(boolean z) {
                        PushServiceClient.this.mDeviceProvisioned = Integer.valueOf(PushProvision.getInstance(PushServiceClient.this.mContext).getProvisioned());
                        if (PushServiceClient.this.mDeviceProvisioned.intValue() != 0) {
                            PushServiceClient.this.mContext.getContentResolver().unregisterContentObserver(this);
                            if (Network.hasNetwork(PushServiceClient.this.mContext)) {
                                PushServiceClient.this.processRegisterTask();
                            }
                        }
                    }
                });
            }
        }
        if (this.mDeviceProvisioned.intValue() == 0) {
            z = false;
        }
        return z;
    }

    public void processPendRequest() {
        synchronized (sPendingRequest) {
            Iterator it = sPendingRequest.iterator();
            while (it.hasNext()) {
                BufferedRequest bufferedRequest = (BufferedRequest) it.next();
                sendMessage(bufferedRequest.message, bufferedRequest.actionType, bufferedRequest.encrypt, false, null, true);
            }
            sPendingRequest.clear();
        }
    }

    public void processRegisterTask() {
        if (this.registerTask != null) {
            callService(this.registerTask);
            this.registerTask = null;
        }
    }

    public final void register(XmPushActionRegistration xmPushActionRegistration, boolean z) {
        PushClientReportManager.getInstance(this.mContext.getApplicationContext()).reportEvent(this.mContext.getPackageName(), "E100003", xmPushActionRegistration.getId(), 6001, "construct a register message");
        this.registerTask = null;
        AppInfoHolder.getInstance(this.mContext).appRegRequestId = xmPushActionRegistration.getId();
        Intent createServiceIntent = createServiceIntent();
        byte[] convertThriftObjectToBytes = XmPushThriftSerializeUtils.convertThriftObjectToBytes(PushContainerHelper.generateRequestContainer(this.mContext, xmPushActionRegistration, ActionType.Registration));
        if (convertThriftObjectToBytes == null) {
            MyLog.w("register fail, because msgBytes is null.");
            return;
        }
        createServiceIntent.setAction("com.xiaomi.mipush.REGISTER_APP");
        createServiceIntent.putExtra("mipush_app_id", AppInfoHolder.getInstance(this.mContext).getAppID());
        createServiceIntent.putExtra("mipush_payload", convertThriftObjectToBytes);
        createServiceIntent.putExtra("mipush_session", this.mSession);
        createServiceIntent.putExtra("mipush_env_chanage", z);
        createServiceIntent.putExtra("mipush_env_type", AppInfoHolder.getInstance(this.mContext).getEnvType());
        if (!Network.hasNetwork(this.mContext) || !isProvisioned()) {
            this.registerTask = createServiceIntent;
        } else {
            callService(createServiceIntent);
        }
    }

    /* access modifiers changed from: 0000 */
    public void send3rdPushHint(int i, String str) {
        Intent createServiceIntent = createServiceIntent();
        createServiceIntent.setAction("com.xiaomi.mipush.thirdparty");
        createServiceIntent.putExtra("com.xiaomi.mipush.thirdparty_LEVEL", i);
        createServiceIntent.putExtra("com.xiaomi.mipush.thirdparty_DESC", str);
        startServiceSafely(createServiceIntent);
    }

    public final void sendAssemblePushTokenCommon(String str, RetryType retryType, AssemblePush assemblePush) {
        OperatePushHelper.getInstance(this.mContext).putSyncStatus(retryType, "syncing");
        retryPolicy(str, retryType, false, AssemblePushHelper.getAssemblePushExtra(this.mContext, assemblePush));
    }

    /* access modifiers changed from: 0000 */
    public void sendDataCommon(Intent intent) {
        intent.fillIn(createServiceIntent(), 24);
        callService(intent);
    }

    public final <T extends TBase<T, ?>> void sendMessage(T t, ActionType actionType, PushMetaInfo pushMetaInfo) {
        sendMessage(t, actionType, !actionType.equals(ActionType.Registration), pushMetaInfo);
    }

    public final <T extends TBase<T, ?>> void sendMessage(T t, ActionType actionType, boolean z, PushMetaInfo pushMetaInfo) {
        sendMessage(t, actionType, z, true, pushMetaInfo, true);
    }

    public final <T extends TBase<T, ?>> void sendMessage(T t, ActionType actionType, boolean z, PushMetaInfo pushMetaInfo, boolean z2) {
        sendMessage(t, actionType, z, true, pushMetaInfo, z2);
    }

    public final <T extends TBase<T, ?>> void sendMessage(T t, ActionType actionType, boolean z, boolean z2, PushMetaInfo pushMetaInfo, boolean z3) {
        sendMessage(t, actionType, z, z2, pushMetaInfo, z3, this.mContext.getPackageName(), AppInfoHolder.getInstance(this.mContext).getAppID());
    }

    public final <T extends TBase<T, ?>> void sendMessage(T t, ActionType actionType, boolean z, boolean z2, PushMetaInfo pushMetaInfo, boolean z3, String str, String str2) {
        if (AppInfoHolder.getInstance(this.mContext).appRegistered()) {
            XmPushActionContainer generateRequestContainer = PushContainerHelper.generateRequestContainer(this.mContext, t, actionType, z, str, str2);
            if (pushMetaInfo != null) {
                generateRequestContainer.setMetaInfo(pushMetaInfo);
            }
            byte[] convertThriftObjectToBytes = XmPushThriftSerializeUtils.convertThriftObjectToBytes(generateRequestContainer);
            if (convertThriftObjectToBytes == null) {
                MyLog.w("send message fail, because msgBytes is null.");
                return;
            }
            PerfMessageHelper.collectPerfData(this.mContext.getPackageName(), this.mContext, t, actionType, convertThriftObjectToBytes.length);
            Intent createServiceIntent = createServiceIntent();
            createServiceIntent.setAction("com.xiaomi.mipush.SEND_MESSAGE");
            createServiceIntent.putExtra("mipush_payload", convertThriftObjectToBytes);
            createServiceIntent.putExtra("com.xiaomi.mipush.MESSAGE_CACHE", z3);
            callService(createServiceIntent);
        } else if (z2) {
            addPendRequest(t, actionType, z);
        } else {
            MyLog.w("drop the message before initialization.");
        }
    }

    public final void sendPushEnableDisableMessage(boolean z) {
        sendPushEnableDisableMessage(z, null);
    }

    public final void sendPushEnableDisableMessage(boolean z, String str) {
        if (z) {
            OperatePushHelper.getInstance(this.mContext).putSyncStatus(RetryType.DISABLE_PUSH, "syncing");
            OperatePushHelper.getInstance(this.mContext).putSyncStatus(RetryType.ENABLE_PUSH, "");
            retryPolicy(str, RetryType.DISABLE_PUSH, true, null);
            return;
        }
        OperatePushHelper.getInstance(this.mContext).putSyncStatus(RetryType.ENABLE_PUSH, "syncing");
        OperatePushHelper.getInstance(this.mContext).putSyncStatus(RetryType.DISABLE_PUSH, "");
        retryPolicy(str, RetryType.ENABLE_PUSH, true, null);
    }

    public boolean sendServiceBootMode(int i) {
        if (!AppInfoHolder.getInstance(this.mContext).checkAppInfo()) {
            return false;
        }
        saveServiceBootMode(i);
        XmPushActionNotification xmPushActionNotification = new XmPushActionNotification();
        xmPushActionNotification.setId(PacketHelper.generatePacketID());
        xmPushActionNotification.setAppId(AppInfoHolder.getInstance(this.mContext).getAppID());
        xmPushActionNotification.setPackageName(this.mContext.getPackageName());
        xmPushActionNotification.setType(NotificationType.ClientABTest.value);
        xmPushActionNotification.extra = new HashMap();
        StringBuilder sb = new StringBuilder();
        sb.append(i);
        sb.append("");
        xmPushActionNotification.extra.put("boot_mode", sb.toString());
        getInstance(this.mContext).sendMessage(xmPushActionNotification, ActionType.Notification, false, null);
        return true;
    }

    public final void sendTinyData(ClientUploadDataItem clientUploadDataItem) {
        Intent createServiceIntent = createServiceIntent();
        byte[] convertThriftObjectToBytes = XmPushThriftSerializeUtils.convertThriftObjectToBytes(clientUploadDataItem);
        if (convertThriftObjectToBytes == null) {
            MyLog.w("send TinyData failed, because tinyDataBytes is null.");
            return;
        }
        createServiceIntent.setAction("com.xiaomi.mipush.SEND_TINYDATA");
        createServiceIntent.putExtra("mipush_payload", convertThriftObjectToBytes);
        startServiceSafely(createServiceIntent);
    }

    public boolean shouldUseMIUIPush() {
        return this.mIsMiuiPushServiceEnabled && 1 == AppInfoHolder.getInstance(this.mContext).getEnvType();
    }

    public final void unregister(XmPushActionUnRegistration xmPushActionUnRegistration) {
        byte[] convertThriftObjectToBytes = XmPushThriftSerializeUtils.convertThriftObjectToBytes(PushContainerHelper.generateRequestContainer(this.mContext, xmPushActionUnRegistration, ActionType.UnRegistration));
        if (convertThriftObjectToBytes == null) {
            MyLog.w("unregister fail, because msgBytes is null.");
            return;
        }
        Intent createServiceIntent = createServiceIntent();
        createServiceIntent.setAction("com.xiaomi.mipush.UNREGISTER_APP");
        createServiceIntent.putExtra("mipush_app_id", AppInfoHolder.getInstance(this.mContext).getAppID());
        createServiceIntent.putExtra("mipush_payload", convertThriftObjectToBytes);
        callService(createServiceIntent);
    }
}
