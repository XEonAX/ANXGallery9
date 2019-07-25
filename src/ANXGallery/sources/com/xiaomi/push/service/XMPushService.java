package com.xiaomi.push.service;

import android.annotation.TargetApi;
import android.app.Notification;
import android.app.Notification.Builder;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageManager.NameNotFoundException;
import android.database.ContentObserver;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.State;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Messenger;
import android.os.Parcelable;
import android.os.Process;
import android.os.SystemClock;
import android.provider.Settings.Secure;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.android.MIUIUtils;
import com.xiaomi.channel.commonutils.android.Region;
import com.xiaomi.channel.commonutils.android.SystemUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.BuildSettings;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.channel.commonutils.misc.ThreadUtils;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.channel.commonutils.string.MD5;
import com.xiaomi.clientreport.data.Config;
import com.xiaomi.clientreport.util.ClientReportUtil;
import com.xiaomi.network.HostManager;
import com.xiaomi.push.log.LogUploader;
import com.xiaomi.push.protobuf.ChannelMessage.PushServiceConfigMsg;
import com.xiaomi.push.service.MIPushAccountUtils.PushAccountChangeListener;
import com.xiaomi.push.service.PushClientsManager.ClientChangeListener;
import com.xiaomi.push.service.PushClientsManager.ClientLoginInfo;
import com.xiaomi.push.service.PushClientsManager.ClientStatus;
import com.xiaomi.push.service.awake.module.AwakeManager;
import com.xiaomi.push.service.clientReport.PushClientReportHelper;
import com.xiaomi.push.service.clientReport.PushClientReportManager;
import com.xiaomi.push.service.timers.Alarm;
import com.xiaomi.slim.Blob;
import com.xiaomi.slim.SlimConnection;
import com.xiaomi.smack.Connection;
import com.xiaomi.smack.ConnectionConfiguration;
import com.xiaomi.smack.ConnectionListener;
import com.xiaomi.smack.PacketListener;
import com.xiaomi.smack.SmackConfiguration;
import com.xiaomi.smack.XMPPException;
import com.xiaomi.smack.filter.PacketFilter;
import com.xiaomi.smack.packet.IQ;
import com.xiaomi.smack.packet.Message;
import com.xiaomi.smack.packet.Packet;
import com.xiaomi.smack.packet.Presence;
import com.xiaomi.smack.util.TrafficUtils;
import com.xiaomi.stats.StatsHandler;
import com.xiaomi.stats.StatsHelper;
import com.xiaomi.tinyData.TinyDataCacheProcessor;
import com.xiaomi.tinyData.TinyDataManager;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import com.xiaomi.xmpush.thrift.ConfigKey;
import com.xiaomi.xmpush.thrift.XmPushActionContainer;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import com.xiaomi.xmpush.thrift.XmPushActionRegistration;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.thrift.TException;

public class XMPushService extends Service implements ConnectionListener {
    /* access modifiers changed from: private */
    public static final int PID = Process.myPid();
    public static int START_STICKY = 1;
    /* access modifiers changed from: private */
    public ConnectionConfiguration connConfig;
    private long lastAlive = 0;
    private ClientEventDispatcher mClientEventDispatcher;
    private ConnectionChangeReceiver mConnectionChangeReceiver;
    /* access modifiers changed from: private */
    public Connection mCurrentConnection;
    private ContentObserver mExtremePowerModeObserver;
    protected Class mJobClazz = XMJobService.class;
    /* access modifiers changed from: private */
    public JobScheduler mJobController = null;
    private PacketListener mPacketListener = new PacketListener() {
        public void process(Blob blob) {
            XMPushService.this.executeJob(new BlobReceiveJob(blob));
        }

        public void processPacket(Packet packet) {
            XMPushService.this.executeJob(new PacketReceiveJob(packet));
        }
    };
    /* access modifiers changed from: private */
    public PacketSync mPacketSync = null;
    private ReconnectionManager mReconnManager;
    /* access modifiers changed from: private */
    public String mRegion;
    private SlimConnection mSlimConnection;
    Messenger messenger = null;
    private Collection<NetworkListener> networkListeners = Collections.synchronizedCollection(new ArrayList());
    private ArrayList<PingCallBack> pingCallBacks = new ArrayList<>();

    class BindJob extends Job {
        ClientLoginInfo mLoginInfo = null;

        public BindJob(ClientLoginInfo clientLoginInfo) {
            super(9);
            this.mLoginInfo = clientLoginInfo;
        }

        public String getDesc() {
            StringBuilder sb = new StringBuilder();
            sb.append("bind the client. ");
            sb.append(this.mLoginInfo.chid);
            return sb.toString();
        }

        public void process() {
            try {
                if (!XMPushService.this.isConnected()) {
                    MyLog.e("trying bind while the connection is not created, quit!");
                    return;
                }
                ClientLoginInfo clientLoginInfoByChidAndUserId = PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(this.mLoginInfo.chid, this.mLoginInfo.userId);
                if (clientLoginInfoByChidAndUserId == null) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("ignore bind because the channel ");
                    sb.append(this.mLoginInfo.chid);
                    sb.append(" is removed ");
                    MyLog.w(sb.toString());
                } else if (clientLoginInfoByChidAndUserId.status == ClientStatus.unbind) {
                    clientLoginInfoByChidAndUserId.setStatus(ClientStatus.binding, 0, 0, null, null);
                    XMPushService.this.mCurrentConnection.bind(clientLoginInfoByChidAndUserId);
                    StatsHelper.statsBind(XMPushService.this, clientLoginInfoByChidAndUserId);
                } else {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("trying duplicate bind, ingore! ");
                    sb2.append(clientLoginInfoByChidAndUserId.status);
                    MyLog.w(sb2.toString());
                }
            } catch (Exception e) {
                MyLog.e((Throwable) e);
                XMPushService.this.disconnect(10, e);
            } catch (Throwable unused) {
            }
        }
    }

    static class BindTimeoutJob extends Job {
        private final ClientLoginInfo mLoginInfo;

        public BindTimeoutJob(ClientLoginInfo clientLoginInfo) {
            super(12);
            this.mLoginInfo = clientLoginInfo;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof BindTimeoutJob)) {
                return false;
            }
            return TextUtils.equals(((BindTimeoutJob) obj).mLoginInfo.chid, this.mLoginInfo.chid);
        }

        public String getDesc() {
            StringBuilder sb = new StringBuilder();
            sb.append("bind time out. chid=");
            sb.append(this.mLoginInfo.chid);
            return sb.toString();
        }

        public int hashCode() {
            return this.mLoginInfo.chid.hashCode();
        }

        public void process() {
            this.mLoginInfo.setStatus(ClientStatus.unbind, 1, 21, null, null);
        }
    }

    class BlobReceiveJob extends Job {
        private Blob mBlob = null;

        public BlobReceiveJob(Blob blob) {
            super(8);
            this.mBlob = blob;
        }

        public String getDesc() {
            return "receive a message.";
        }

        public void process() {
            XMPushService.this.mPacketSync.onBlobReceive(this.mBlob);
        }
    }

    public class ConnectJob extends Job {
        ConnectJob() {
            super(1);
        }

        public String getDesc() {
            return "do reconnect..";
        }

        public void process() {
            if (XMPushService.this.shouldReconnect()) {
                XMPushService.this.connect();
            } else {
                MyLog.w("should not connect. quit the job.");
            }
        }
    }

    class ConnectionChangeReceiver extends BroadcastReceiver {
        ConnectionChangeReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            XMPushService.this.onStart(intent, XMPushService.START_STICKY);
        }
    }

    public class DisconnectJob extends Job {
        public Exception e;
        public int reason;

        DisconnectJob(int i, Exception exc) {
            super(2);
            this.reason = i;
            this.e = exc;
        }

        public String getDesc() {
            return "disconnect the connection.";
        }

        public void process() {
            XMPushService.this.disconnect(this.reason, this.e);
        }
    }

    class InitJob extends Job {
        InitJob() {
            super(65535);
        }

        public String getDesc() {
            return "Init Job";
        }

        public void process() {
            XMPushService.this.postOnCreate();
        }
    }

    class IntentJob extends Job {
        private Intent mIntent = null;

        public IntentJob(Intent intent) {
            super(15);
            this.mIntent = intent;
        }

        public String getDesc() {
            StringBuilder sb = new StringBuilder();
            sb.append("Handle intent action = ");
            sb.append(this.mIntent.getAction());
            return sb.toString();
        }

        public void process() {
            XMPushService.this.handleIntent(this.mIntent);
        }
    }

    public static abstract class Job extends com.xiaomi.push.service.JobScheduler.Job {
        public Job(int i) {
            super(i);
        }

        public abstract String getDesc();

        public abstract void process();

        public void run() {
            if (!(this.type == 4 || this.type == 8)) {
                StringBuilder sb = new StringBuilder();
                sb.append("JOB: ");
                sb.append(getDesc());
                MyLog.w(sb.toString());
            }
            process();
        }
    }

    class KillJob extends Job {
        public KillJob() {
            super(5);
        }

        public String getDesc() {
            return "ask the job queue to quit";
        }

        public void process() {
            XMPushService.this.mJobController.quit();
        }
    }

    class PacketReceiveJob extends Job {
        private Packet mPacket = null;

        public PacketReceiveJob(Packet packet) {
            super(8);
            this.mPacket = packet;
        }

        public String getDesc() {
            return "receive a message.";
        }

        public void process() {
            XMPushService.this.mPacketSync.onPacketReceive(this.mPacket);
        }
    }

    public interface PingCallBack {
        void pingFollowUpAction();
    }

    class PingJob extends Job {
        boolean isPong;

        public PingJob(boolean z) {
            super(4);
            this.isPong = z;
        }

        public String getDesc() {
            return "send ping..";
        }

        public void process() {
            if (XMPushService.this.isConnected()) {
                try {
                    if (!this.isPong) {
                        StatsHelper.pingStarted();
                    }
                    XMPushService.this.mCurrentConnection.ping(this.isPong);
                } catch (XMPPException e) {
                    MyLog.e((Throwable) e);
                    XMPushService.this.disconnect(10, e);
                }
            }
        }
    }

    class ReBindJob extends Job {
        ClientLoginInfo mLoginInfo = null;

        public ReBindJob(ClientLoginInfo clientLoginInfo) {
            super(4);
            this.mLoginInfo = clientLoginInfo;
        }

        public String getDesc() {
            StringBuilder sb = new StringBuilder();
            sb.append("rebind the client. ");
            sb.append(this.mLoginInfo.chid);
            return sb.toString();
        }

        public void process() {
            try {
                this.mLoginInfo.setStatus(ClientStatus.unbind, 1, 16, null, null);
                XMPushService.this.mCurrentConnection.unbind(this.mLoginInfo.chid, this.mLoginInfo.userId);
                this.mLoginInfo.setStatus(ClientStatus.binding, 1, 16, null, null);
                XMPushService.this.mCurrentConnection.bind(this.mLoginInfo);
            } catch (XMPPException e) {
                MyLog.e((Throwable) e);
                XMPushService.this.disconnect(10, e);
            }
        }
    }

    class ResetConnectionJob extends Job {
        ResetConnectionJob() {
            super(3);
        }

        public String getDesc() {
            return "reset the connection.";
        }

        public void process() {
            XMPushService.this.disconnect(11, null);
            if (XMPushService.this.shouldReconnect()) {
                XMPushService.this.connect();
            }
        }
    }

    class UnbindJob extends Job {
        String kickType;
        ClientLoginInfo mLoginInfo = null;
        int mNotifyType;
        String reason;

        public UnbindJob(ClientLoginInfo clientLoginInfo, int i, String str, String str2) {
            super(9);
            this.mLoginInfo = clientLoginInfo;
            this.mNotifyType = i;
            this.kickType = str;
            this.reason = str2;
        }

        public String getDesc() {
            StringBuilder sb = new StringBuilder();
            sb.append("unbind the channel. ");
            sb.append(this.mLoginInfo.chid);
            return sb.toString();
        }

        public void process() {
            if (!(this.mLoginInfo.status == ClientStatus.unbind || XMPushService.this.mCurrentConnection == null)) {
                try {
                    XMPushService.this.mCurrentConnection.unbind(this.mLoginInfo.chid, this.mLoginInfo.userId);
                } catch (XMPPException e) {
                    MyLog.e((Throwable) e);
                    XMPushService.this.disconnect(10, e);
                }
            }
            this.mLoginInfo.setStatus(ClientStatus.unbind, this.mNotifyType, 0, this.reason, this.kickType);
        }
    }

    static {
        HostManager.addReservedHost("cn.app.chat.xiaomi.net", "cn.app.chat.xiaomi.net");
        HostManager.addReservedHost("cn.app.chat.xiaomi.net", "42.62.94.2:443");
        HostManager.addReservedHost("cn.app.chat.xiaomi.net", "114.54.23.2");
        HostManager.addReservedHost("cn.app.chat.xiaomi.net", "111.13.142.2");
        HostManager.addReservedHost("cn.app.chat.xiaomi.net", "111.206.200.2");
    }

    private void broadcastNetworkAvailable(boolean z) {
        try {
            if (!SystemUtils.isBootCompleted()) {
                return;
            }
            if (z) {
                sendBroadcast(new Intent("miui.intent.action.NETWORK_CONNECTED"));
                for (NetworkListener onNetwrokAvaible : (NetworkListener[]) this.networkListeners.toArray(new NetworkListener[0])) {
                    onNetwrokAvaible.onNetwrokAvaible();
                }
                return;
            }
            sendBroadcast(new Intent("miui.intent.action.NETWORK_BLOCKED"));
        } catch (Exception e) {
            MyLog.e((Throwable) e);
        }
    }

    private boolean canOpenForegroundService() {
        if (TextUtils.equals(getPackageName(), "com.xiaomi.xmsf")) {
            return false;
        }
        return OnlineConfig.getInstance(this).getBooleanValue(ConfigKey.ForegroundServiceSwitch.getValue(), false);
    }

    private void checkAlive(boolean z) {
        this.lastAlive = System.currentTimeMillis();
        if (!isConnected()) {
            scheduleConnect(true);
        } else if (this.mCurrentConnection.isReadAlive() || this.mCurrentConnection.isWriteAlive() || Network.isWIFIConnected(this)) {
            executeJobNow(new PingJob(z));
        } else {
            executeJobNow(new DisconnectJob(17, null));
            scheduleConnect(true);
        }
    }

    private void clearPingCallbacks() {
        synchronized (this.pingCallBacks) {
            this.pingCallBacks.clear();
        }
    }

    private void closeAllChannelByChid(String str, int i) {
        Collection<ClientLoginInfo> allClientLoginInfoByChid = PushClientsManager.getInstance().getAllClientLoginInfoByChid(str);
        if (allClientLoginInfoByChid != null) {
            for (ClientLoginInfo clientLoginInfo : allClientLoginInfoByChid) {
                if (clientLoginInfo != null) {
                    UnbindJob unbindJob = new UnbindJob(clientLoginInfo, i, null, null);
                    executeJob(unbindJob);
                }
            }
        }
        PushClientsManager.getInstance().deactivateAllClientByChid(str);
    }

    /* access modifiers changed from: private */
    public void connect() {
        if (this.mCurrentConnection != null && this.mCurrentConnection.isConnecting()) {
            MyLog.e("try to connect while connecting.");
        } else if (this.mCurrentConnection == null || !this.mCurrentConnection.isConnected()) {
            this.connConfig.setConnectionPoint(Network.getActiveConnPoint(this));
            connectBySlim();
            if (this.mCurrentConnection == null) {
                PushClientsManager.getInstance().notifyConnectionFailed(this);
                broadcastNetworkAvailable(false);
            }
        } else {
            MyLog.e("try to connect while is connected.");
        }
    }

    private void connectBySlim() {
        try {
            this.mSlimConnection.addPacketListener(this.mPacketListener, new PacketFilter() {
                public boolean accept(Packet packet) {
                    return true;
                }
            });
            this.mSlimConnection.connect();
            this.mCurrentConnection = this.mSlimConnection;
        } catch (XMPPException e) {
            MyLog.e("fail to create Slim connection", e);
            this.mSlimConnection.disconnect(3, e);
        }
    }

    private void doAWLogic(Intent intent) {
        int i;
        try {
            AwakeManager.getInstance(getApplicationContext()).setSendDataIml(new PushLayerProcessIml());
            String stringExtra = intent.getStringExtra("mipush_app_package");
            byte[] byteArrayExtra = intent.getByteArrayExtra("mipush_payload");
            if (byteArrayExtra != null) {
                XmPushActionNotification xmPushActionNotification = new XmPushActionNotification();
                XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionNotification, byteArrayExtra);
                String appId = xmPushActionNotification.getAppId();
                Map extra = xmPushActionNotification.getExtra();
                if (extra != null) {
                    String str = (String) extra.get("extra_help_aw_info");
                    String str2 = (String) extra.get("extra_aw_app_online_cmd");
                    if (!TextUtils.isEmpty(str2)) {
                        try {
                            i = Integer.parseInt(str2);
                        } catch (NumberFormatException unused) {
                            i = 0;
                        }
                        if (!TextUtils.isEmpty(stringExtra) && !TextUtils.isEmpty(appId) && !TextUtils.isEmpty(str)) {
                            AwakeManager.getInstance(getApplicationContext()).wakeup(this, str, i, stringExtra, appId);
                        }
                    }
                }
            }
        } catch (TException e) {
            StringBuilder sb = new StringBuilder();
            sb.append("aw_logic: translate fail. ");
            sb.append(e.getMessage());
            MyLog.e(sb.toString());
        }
    }

    private void doAWPingCMD(Intent intent, int i) {
        byte[] byteArrayExtra = intent.getByteArrayExtra("mipush_payload");
        boolean booleanExtra = intent.getBooleanExtra("com.xiaomi.mipush.MESSAGE_CACHE", true);
        XmPushActionNotification xmPushActionNotification = new XmPushActionNotification();
        try {
            XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionNotification, byteArrayExtra);
            ScheduledJobManager.getInstance(getApplicationContext()).addRepeatJob(new AwakeAppPingJob(xmPushActionNotification, new WeakReference(this), booleanExtra), i);
        } catch (TException unused) {
            MyLog.e("aw_ping : send help app ping  error");
        }
    }

    private void enableForegroundService() {
        if (VERSION.SDK_INT < 18) {
            startForeground(PID, new Notification());
        } else {
            bindService(new Intent(this, this.mJobClazz), new ServiceConnection() {
                public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("onServiceConnected ");
                    sb.append(iBinder);
                    MyLog.i(sb.toString());
                    Service runningService = XMJobService.getRunningService();
                    if (runningService != null) {
                        XMPushService.this.startForeground(XMPushService.PID, XMPushService.getPushServiceNotification(XMPushService.this));
                        runningService.startForeground(XMPushService.PID, XMPushService.getPushServiceNotification(XMPushService.this));
                        runningService.stopForeground(true);
                        XMPushService.this.unbindService(this);
                        return;
                    }
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("XMService connected but innerService is null ");
                    sb2.append(iBinder);
                    MyLog.w(sb2.toString());
                }

                public void onServiceDisconnected(ComponentName componentName) {
                }
            }, 1);
        }
    }

    private String ensureRegionAvaible() {
        String str;
        ThreadUtils.checkNotUIThread();
        long elapsedRealtime = SystemClock.elapsedRealtime();
        Object obj = new Object();
        String str2 = null;
        if ("com.xiaomi.xmsf".equals(getPackageName())) {
            PushProvision instance = PushProvision.getInstance(this);
            str = null;
            while (true) {
                if (!TextUtils.isEmpty(str) && instance.getProvisioned() != 0) {
                    break;
                }
                if (TextUtils.isEmpty(str)) {
                    str = MIUIUtils.getProperty("ro.miui.region");
                    if (TextUtils.isEmpty(str)) {
                        str = MIUIUtils.getProperty("ro.product.locale.region");
                    }
                }
                try {
                    synchronized (obj) {
                        obj.wait(100);
                    }
                } catch (InterruptedException unused) {
                }
            }
        } else {
            str = MIUIUtils.getCountryCode();
        }
        if (!TextUtils.isEmpty(str)) {
            AppRegionStorage.getInstance(getApplicationContext()).setCountryCode(str);
            str2 = MIUIUtils.getRegion(str).name();
        }
        long elapsedRealtime2 = SystemClock.elapsedRealtime() - elapsedRealtime;
        StringBuilder sb = new StringBuilder();
        sb.append("wait region :");
        sb.append(str2);
        sb.append(" cost = ");
        sb.append(elapsedRealtime2);
        MyLog.w(sb.toString());
        return str2;
    }

    private void executeJobNow(Job job) {
        this.mJobController.executeJobNow(job);
    }

    @TargetApi(11)
    public static Notification getPushServiceNotification(Context context) {
        Intent intent = new Intent(context, XMPushService.class);
        if (VERSION.SDK_INT >= 11) {
            Builder builder = new Builder(context);
            builder.setSmallIcon(context.getApplicationInfo().icon);
            builder.setContentTitle("Push Service");
            builder.setContentText("Push Service");
            builder.setContentIntent(PendingIntent.getActivity(context, 0, intent, 0));
            return builder.getNotification();
        }
        Notification notification = new Notification();
        PendingIntent service = PendingIntent.getService(context, 0, intent, 0);
        try {
            notification.getClass().getMethod("setLatestEventInfo", new Class[]{Context.class, CharSequence.class, CharSequence.class, PendingIntent.class}).invoke(notification, new Object[]{context, "Push Service", "Push Service", service});
        } catch (Exception e) {
            MyLog.e((Throwable) e);
        }
        return notification;
    }

    /* access modifiers changed from: private */
    public void handleIntent(Intent intent) {
        int i;
        String str;
        PushClientsManager instance = PushClientsManager.getInstance();
        boolean z = true;
        if (PushConstants.ACTION_OPEN_CHANNEL.equalsIgnoreCase(intent.getAction()) || PushConstants.ACTION_FORCE_RECONNECT.equalsIgnoreCase(intent.getAction())) {
            String stringExtra = intent.getStringExtra(PushConstants.EXTRA_CHANNEL_ID);
            if (TextUtils.isEmpty(intent.getStringExtra(PushConstants.EXTRA_SECURITY))) {
                MyLog.w("security is empty. ignore.");
            } else if (stringExtra != null) {
                boolean shouldRebind = shouldRebind(stringExtra, intent);
                ClientLoginInfo updatePushClient = updatePushClient(stringExtra, intent);
                if (!Network.hasNetwork(this)) {
                    this.mClientEventDispatcher.notifyChannelOpenResult(this, updatePushClient, false, 2, null);
                } else if (!isConnected()) {
                    scheduleConnect(true);
                } else if (updatePushClient.status == ClientStatus.unbind) {
                    executeJobNow(new BindJob(updatePushClient));
                } else if (shouldRebind) {
                    executeJobNow(new ReBindJob(updatePushClient));
                } else if (updatePushClient.status == ClientStatus.binding) {
                    MyLog.w(String.format("the client is binding. %1$s %2$s.", new Object[]{updatePushClient.chid, ClientLoginInfo.getResource(updatePushClient.userId)}));
                } else if (updatePushClient.status == ClientStatus.binded) {
                    this.mClientEventDispatcher.notifyChannelOpenResult(this, updatePushClient, true, 0, null);
                }
            } else {
                MyLog.e("channel id is empty, do nothing!");
            }
        } else if (PushConstants.ACTION_CLOSE_CHANNEL.equalsIgnoreCase(intent.getAction())) {
            String stringExtra2 = intent.getStringExtra(PushConstants.EXTRA_PACKAGE_NAME);
            String stringExtra3 = intent.getStringExtra(PushConstants.EXTRA_CHANNEL_ID);
            String stringExtra4 = intent.getStringExtra(PushConstants.EXTRA_USER_ID);
            StringBuilder sb = new StringBuilder();
            sb.append("Service called close channel chid = ");
            sb.append(stringExtra3);
            sb.append(" res = ");
            sb.append(ClientLoginInfo.getResource(stringExtra4));
            MyLog.w(sb.toString());
            if (TextUtils.isEmpty(stringExtra3)) {
                for (String closeAllChannelByChid : instance.queryChannelIdByPackage(stringExtra2)) {
                    closeAllChannelByChid(closeAllChannelByChid, 2);
                }
            } else if (TextUtils.isEmpty(stringExtra4)) {
                closeAllChannelByChid(stringExtra3, 2);
            } else {
                closeChannel(stringExtra3, stringExtra4, 2, null, null);
            }
        } else if (PushConstants.ACTION_SEND_MESSAGE.equalsIgnoreCase(intent.getAction())) {
            sendMessage(intent);
        } else if (PushConstants.ACTION_BATCH_SEND_MESSAGE.equalsIgnoreCase(intent.getAction())) {
            sendMessages(intent);
        } else if (PushConstants.ACTION_SEND_IQ.equalsIgnoreCase(intent.getAction())) {
            Packet preparePacket = preparePacket(new IQ(intent.getBundleExtra("ext_packet")), intent.getStringExtra(PushConstants.EXTRA_PACKAGE_NAME), intent.getStringExtra(PushConstants.EXTRA_SESSION));
            if (preparePacket != null) {
                executeJobNow(new SendMessageJob(this, Blob.from(preparePacket, instance.getClientLoginInfoByChidAndUserId(preparePacket.getChannelId(), preparePacket.getFrom()).security)));
            }
        } else if (PushConstants.ACTION_SEND_PRESENCE.equalsIgnoreCase(intent.getAction())) {
            Packet preparePacket2 = preparePacket(new Presence(intent.getBundleExtra("ext_packet")), intent.getStringExtra(PushConstants.EXTRA_PACKAGE_NAME), intent.getStringExtra(PushConstants.EXTRA_SESSION));
            if (preparePacket2 != null) {
                executeJobNow(new SendMessageJob(this, Blob.from(preparePacket2, instance.getClientLoginInfoByChidAndUserId(preparePacket2.getChannelId(), preparePacket2.getFrom()).security)));
            }
        } else if (PushConstants.ACTION_RESET_CONNECTION.equals(intent.getAction())) {
            String stringExtra5 = intent.getStringExtra(PushConstants.EXTRA_CHANNEL_ID);
            String stringExtra6 = intent.getStringExtra(PushConstants.EXTRA_USER_ID);
            if (stringExtra5 != null) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("request reset connection from chid = ");
                sb2.append(stringExtra5);
                MyLog.w(sb2.toString());
                ClientLoginInfo clientLoginInfoByChidAndUserId = PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(stringExtra5, stringExtra6);
                if (clientLoginInfoByChidAndUserId != null && clientLoginInfoByChidAndUserId.security.equals(intent.getStringExtra(PushConstants.EXTRA_SECURITY)) && clientLoginInfoByChidAndUserId.status == ClientStatus.binded) {
                    Connection currentConnection = getCurrentConnection();
                    if (currentConnection == null || !currentConnection.isReadAlive(System.currentTimeMillis() - 15000)) {
                        executeJobNow(new ResetConnectionJob());
                    }
                }
            }
        } else {
            ClientLoginInfo clientLoginInfo = null;
            if (PushConstants.ACTION_UPDATE_CHANNEL_INFO.equals(intent.getAction())) {
                String stringExtra7 = intent.getStringExtra(PushConstants.EXTRA_PACKAGE_NAME);
                List queryChannelIdByPackage = instance.queryChannelIdByPackage(stringExtra7);
                if (queryChannelIdByPackage.isEmpty()) {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("open channel should be called first before update info, pkg=");
                    sb3.append(stringExtra7);
                    MyLog.w(sb3.toString());
                    return;
                }
                String stringExtra8 = intent.getStringExtra(PushConstants.EXTRA_CHANNEL_ID);
                String stringExtra9 = intent.getStringExtra(PushConstants.EXTRA_USER_ID);
                if (TextUtils.isEmpty(stringExtra8)) {
                    stringExtra8 = (String) queryChannelIdByPackage.get(0);
                }
                if (TextUtils.isEmpty(stringExtra9)) {
                    Collection allClientLoginInfoByChid = instance.getAllClientLoginInfoByChid(stringExtra8);
                    if (allClientLoginInfoByChid != null && !allClientLoginInfoByChid.isEmpty()) {
                        clientLoginInfo = (ClientLoginInfo) allClientLoginInfoByChid.iterator().next();
                    }
                } else {
                    clientLoginInfo = instance.getClientLoginInfoByChidAndUserId(stringExtra8, stringExtra9);
                }
                if (clientLoginInfo != null) {
                    if (intent.hasExtra(PushConstants.EXTRA_CLIENT_ATTR)) {
                        clientLoginInfo.clientExtra = intent.getStringExtra(PushConstants.EXTRA_CLIENT_ATTR);
                    }
                    if (intent.hasExtra(PushConstants.EXTRA_CLOUD_ATTR)) {
                        clientLoginInfo.cloudExtra = intent.getStringExtra(PushConstants.EXTRA_CLOUD_ATTR);
                    }
                }
            } else if ("com.xiaomi.mipush.REGISTER_APP".equals(intent.getAction())) {
                if (!PushProvision.getInstance(getApplicationContext()).checkProvisioned() || PushProvision.getInstance(getApplicationContext()).getProvisioned() != 0) {
                    final byte[] byteArrayExtra = intent.getByteArrayExtra("mipush_payload");
                    final String stringExtra10 = intent.getStringExtra("mipush_app_package");
                    boolean booleanExtra = intent.getBooleanExtra("mipush_env_chanage", false);
                    final int intExtra = intent.getIntExtra("mipush_env_type", 1);
                    MIPushAppInfo.getInstance(this).removeUnRegisteredPkg(stringExtra10);
                    if (!booleanExtra || "com.xiaomi.xmsf".equals(getPackageName())) {
                        registerForMiPushApp(byteArrayExtra, stringExtra10);
                    } else {
                        AnonymousClass8 r5 = new Job(14) {
                            public String getDesc() {
                                return "clear account cache.";
                            }

                            public void process() {
                                MIPushAccountUtils.clearAccount(XMPushService.this);
                                PushClientsManager.getInstance().deactivateAllClientByChid("5");
                                BuildSettings.setEnvType(intExtra);
                                XMPushService.this.connConfig.setHost(ConnectionConfiguration.getXmppServerHost());
                                XMPushService.this.registerForMiPushApp(byteArrayExtra, stringExtra10);
                            }
                        };
                        executeJobNow(r5);
                    }
                } else {
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("register without being provisioned. ");
                    sb4.append(intent.getStringExtra("mipush_app_package"));
                    MyLog.w(sb4.toString());
                }
            } else if ("com.xiaomi.mipush.SEND_MESSAGE".equals(intent.getAction()) || "com.xiaomi.mipush.UNREGISTER_APP".equals(intent.getAction())) {
                String stringExtra11 = intent.getStringExtra("mipush_app_package");
                byte[] byteArrayExtra2 = intent.getByteArrayExtra("mipush_payload");
                boolean booleanExtra2 = intent.getBooleanExtra("com.xiaomi.mipush.MESSAGE_CACHE", true);
                if ("com.xiaomi.mipush.UNREGISTER_APP".equals(intent.getAction())) {
                    MIPushAppInfo.getInstance(this).addUnRegisteredPkg(stringExtra11);
                }
                sendMessage(stringExtra11, byteArrayExtra2, booleanExtra2);
            } else if (PushServiceConstants.ACTION_UNINSTALL.equals(intent.getAction())) {
                String stringExtra12 = intent.getStringExtra("uninstall_pkg_name");
                if (stringExtra12 != null && !TextUtils.isEmpty(stringExtra12.trim())) {
                    try {
                        getPackageManager().getPackageInfo(stringExtra12, 0);
                        z = false;
                    } catch (NameNotFoundException unused) {
                    }
                    if (!"com.xiaomi.channel".equals(stringExtra12) || PushClientsManager.getInstance().getAllClientLoginInfoByChid("1").isEmpty() || !z) {
                        SharedPreferences sharedPreferences = getSharedPreferences("pref_registered_pkg_names", 0);
                        String string = sharedPreferences.getString(stringExtra12, null);
                        if (!TextUtils.isEmpty(string) && z) {
                            Editor edit = sharedPreferences.edit();
                            edit.remove(stringExtra12);
                            edit.commit();
                            if (MIPushNotificationHelper.hasLocalNotifyType(this, stringExtra12)) {
                                MIPushNotificationHelper.clearLocalNotifyType(this, stringExtra12);
                            }
                            MIPushNotificationHelper.clearNotification(this, stringExtra12);
                            if (isConnected() && string != null) {
                                try {
                                    MIPushHelper.sendPacket(this, MIPushHelper.contructAppAbsentMessage(stringExtra12, string));
                                    StringBuilder sb5 = new StringBuilder();
                                    sb5.append("uninstall ");
                                    sb5.append(stringExtra12);
                                    sb5.append(" msg sent");
                                    MyLog.w(sb5.toString());
                                } catch (XMPPException e) {
                                    StringBuilder sb6 = new StringBuilder();
                                    sb6.append("Fail to send Message: ");
                                    sb6.append(e.getMessage());
                                    MyLog.e(sb6.toString());
                                    disconnect(10, e);
                                }
                            }
                        }
                    } else {
                        closeAllChannelByChid("1", 0);
                        MyLog.w("close the miliao channel as the app is uninstalled.");
                    }
                }
            } else if ("com.xiaomi.mipush.CLEAR_NOTIFICATION".equals(intent.getAction())) {
                String stringExtra13 = intent.getStringExtra(PushConstants.EXTRA_PACKAGE_NAME);
                int intExtra2 = intent.getIntExtra(PushConstants.EXTRA_NOTIFY_ID, -2);
                if (!TextUtils.isEmpty(stringExtra13)) {
                    if (intExtra2 >= -1) {
                        MIPushNotificationHelper.clearNotification(this, stringExtra13, intExtra2);
                    } else {
                        MIPushNotificationHelper.clearNotification(this, stringExtra13, intent.getStringExtra(PushConstants.EXTRA_NOTIFY_TITLE), intent.getStringExtra(PushConstants.EXTRA_NOTIFY_DESCRIPTION));
                    }
                }
            } else if ("com.xiaomi.mipush.SET_NOTIFICATION_TYPE".equals(intent.getAction())) {
                String stringExtra14 = intent.getStringExtra(PushConstants.EXTRA_PACKAGE_NAME);
                String stringExtra15 = intent.getStringExtra(PushConstants.EXTRA_SIG);
                if (intent.hasExtra(PushConstants.EXTRA_NOTIFY_TYPE)) {
                    i = intent.getIntExtra(PushConstants.EXTRA_NOTIFY_TYPE, 0);
                    StringBuilder sb7 = new StringBuilder();
                    sb7.append(stringExtra14);
                    sb7.append(i);
                    str = MD5.MD5_16(sb7.toString());
                    z = false;
                } else {
                    str = MD5.MD5_16(stringExtra14);
                    i = 0;
                }
                if (TextUtils.isEmpty(stringExtra14) || !TextUtils.equals(stringExtra15, str)) {
                    StringBuilder sb8 = new StringBuilder();
                    sb8.append("invalid notification for ");
                    sb8.append(stringExtra14);
                    MyLog.e(sb8.toString());
                } else if (z) {
                    MIPushNotificationHelper.clearLocalNotifyType(this, stringExtra14);
                } else {
                    MIPushNotificationHelper.setLocalNotifyType(this, stringExtra14, i);
                }
            } else if ("com.xiaomi.mipush.DISABLE_PUSH".equals(intent.getAction())) {
                String stringExtra16 = intent.getStringExtra("mipush_app_package");
                if (!TextUtils.isEmpty(stringExtra16)) {
                    MIPushAppInfo.getInstance(this).addDisablePushPkg(stringExtra16);
                }
                if (!"com.xiaomi.xmsf".equals(getPackageName())) {
                    disconnect(19, null);
                    updateAlarmTimer();
                    stopSelf();
                }
            } else if ("com.xiaomi.mipush.DISABLE_PUSH_MESSAGE".equals(intent.getAction()) || "com.xiaomi.mipush.ENABLE_PUSH_MESSAGE".equals(intent.getAction())) {
                String stringExtra17 = intent.getStringExtra("mipush_app_package");
                byte[] byteArrayExtra3 = intent.getByteArrayExtra("mipush_payload");
                String stringExtra18 = intent.getStringExtra("mipush_app_id");
                String stringExtra19 = intent.getStringExtra("mipush_app_token");
                if ("com.xiaomi.mipush.DISABLE_PUSH_MESSAGE".equals(intent.getAction())) {
                    MIPushAppInfo.getInstance(this).addDisablePushPkgCache(stringExtra17);
                }
                if ("com.xiaomi.mipush.ENABLE_PUSH_MESSAGE".equals(intent.getAction())) {
                    MIPushAppInfo.getInstance(this).removeDisablePushPkg(stringExtra17);
                    MIPushAppInfo.getInstance(this).removeDisablePushPkgCache(stringExtra17);
                }
                if (byteArrayExtra3 == null) {
                    MIPushClientManager.notifyError(this, stringExtra17, byteArrayExtra3, 70000003, "null payload");
                } else {
                    MIPushClientManager.addPendingMessages(stringExtra17, byteArrayExtra3);
                    MIPushAppRegisterJob mIPushAppRegisterJob = new MIPushAppRegisterJob(this, stringExtra17, stringExtra18, stringExtra19, byteArrayExtra3);
                    executeJob(mIPushAppRegisterJob);
                    if ("com.xiaomi.mipush.ENABLE_PUSH_MESSAGE".equals(intent.getAction()) && this.mConnectionChangeReceiver == null) {
                        this.mConnectionChangeReceiver = new ConnectionChangeReceiver();
                        registerReceiver(this.mConnectionChangeReceiver, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
                    }
                }
            } else if ("com.xiaomi.mipush.SEND_TINYDATA".equals(intent.getAction())) {
                String stringExtra20 = intent.getStringExtra("mipush_app_package");
                byte[] byteArrayExtra4 = intent.getByteArrayExtra("mipush_payload");
                ClientUploadDataItem clientUploadDataItem = new ClientUploadDataItem();
                try {
                    XmPushThriftSerializeUtils.convertByteArrayToThriftObject(clientUploadDataItem, byteArrayExtra4);
                    TinyDataManager.getInstance(this).upload(clientUploadDataItem, stringExtra20);
                } catch (TException e2) {
                    MyLog.e((Throwable) e2);
                }
            } else if ("com.xiaomi.push.timer".equalsIgnoreCase(intent.getAction())) {
                MyLog.w("Service called on timer");
                Alarm.registerPing(false);
                if (shouldCheckAlive()) {
                    checkAlive(false);
                }
            } else if ("com.xiaomi.push.check_alive".equalsIgnoreCase(intent.getAction())) {
                MyLog.w("Service called on check alive.");
                if (shouldCheckAlive()) {
                    checkAlive(false);
                }
            } else if ("com.xiaomi.mipush.thirdparty".equals(intent.getAction())) {
                StringBuilder sb9 = new StringBuilder();
                sb9.append("on thirdpart push :");
                sb9.append(intent.getStringExtra("com.xiaomi.mipush.thirdparty_DESC"));
                MyLog.w(sb9.toString());
                Alarm.changePolicy(this, intent.getIntExtra("com.xiaomi.mipush.thirdparty_LEVEL", 0));
            } else if ("android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
                networkChanged();
            } else if ("action_cr_config".equals(intent.getAction())) {
                boolean booleanExtra3 = intent.getBooleanExtra("action_cr_event_switch", false);
                long longExtra = intent.getLongExtra("action_cr_event_frequency", 86400);
                boolean booleanExtra4 = intent.getBooleanExtra("action_cr_perf_switch", false);
                long longExtra2 = intent.getLongExtra("action_cr_perf_frequency", 86400);
                boolean booleanExtra5 = intent.getBooleanExtra("action_cr_event_en", true);
                long longExtra3 = intent.getLongExtra("action_cr_max_file_size", 1048576);
                Config build = Config.getBuilder().setEventUploadSwitchOpen(booleanExtra3).setEventUploadFrequency(longExtra).setPerfUploadSwitchOpen(booleanExtra4).setPerfUploadFrequency(longExtra2).setAESKey(ClientReportUtil.getEventKeyWithDefault(getApplicationContext())).setEventEncrypted(booleanExtra5).setMaxFileLength(longExtra3).build(getApplicationContext());
                if (!"com.xiaomi.xmsf".equals(getPackageName()) && longExtra > 0 && longExtra2 > 0 && longExtra3 > 0) {
                    PushClientReportHelper.initEventPerfLogic(getApplicationContext(), build);
                }
            } else if ("action_help_ping".equals(intent.getAction())) {
                boolean booleanExtra6 = intent.getBooleanExtra("extra_help_ping_switch", false);
                int intExtra3 = intent.getIntExtra("extra_help_ping_frequency", 0);
                if (intExtra3 >= 0 && intExtra3 < 30) {
                    MyLog.v("aw_ping: frquency need > 30s.");
                    intExtra3 = 30;
                }
                if (intExtra3 < 0) {
                    booleanExtra6 = false;
                }
                StringBuilder sb10 = new StringBuilder();
                sb10.append("aw_ping: receive a aw_ping message. switch: ");
                sb10.append(booleanExtra6);
                sb10.append(" frequency: ");
                sb10.append(intExtra3);
                MyLog.w(sb10.toString());
                if (booleanExtra6 && intExtra3 > 0 && !"com.xiaomi.xmsf".equals(getPackageName())) {
                    doAWPingCMD(intent, intExtra3);
                }
            } else if ("action_aw_app_logic".equals(intent.getAction())) {
                doAWLogic(intent);
            }
        }
    }

    /* access modifiers changed from: private */
    public boolean isExtremePowerSaveMode() {
        boolean z = false;
        if (!"com.xiaomi.xmsf".equals(getPackageName())) {
            return false;
        }
        if (Secure.getInt(getContentResolver(), "EXTREME_POWER_MODE_ENABLE", 0) == 1) {
            z = true;
        }
        return z;
    }

    private boolean isPushEnabled() {
        return "com.xiaomi.xmsf".equals(getPackageName()) || !MIPushAppInfo.getInstance(this).isPushDisabled(getPackageName());
    }

    private void networkChanged() {
        NetworkInfo networkInfo;
        try {
            networkInfo = ((ConnectivityManager) getSystemService("connectivity")).getActiveNetworkInfo();
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            networkInfo = null;
        }
        if (networkInfo != null) {
            StringBuilder sb = new StringBuilder("[");
            sb.append("type: ");
            sb.append(networkInfo.getTypeName());
            sb.append("[");
            sb.append(networkInfo.getSubtypeName());
            sb.append("], state: ");
            sb.append(networkInfo.getState());
            sb.append("/");
            sb.append(networkInfo.getDetailedState());
            StringBuilder sb2 = new StringBuilder();
            sb2.append("network changed,");
            sb2.append(sb.toString());
            MyLog.w(sb2.toString());
            State state = networkInfo.getState();
            if (state == State.SUSPENDED || state == State.UNKNOWN) {
                return;
            }
        } else {
            MyLog.w("network changed, no active network");
        }
        if (StatsHandler.getContext() != null) {
            StatsHandler.getContext().statsChannelIfNeed();
        }
        TrafficUtils.notifyNetworkChanage(this);
        this.mSlimConnection.clearCachedStatus();
        if (Network.hasNetwork(this)) {
            if (isConnected() && shouldCheckAlive()) {
                checkAlive(false);
            }
            if (!isConnected() && !isConnecting()) {
                this.mJobController.removeJobs(1);
                executeJob(new ConnectJob());
            }
            LogUploader.getInstance(this).checkUpload();
        } else {
            executeJob(new DisconnectJob(2, null));
        }
        updateAlarmTimer();
    }

    /* access modifiers changed from: private */
    public void postOnCreate() {
        AppRegionStorage instance = AppRegionStorage.getInstance(getApplicationContext());
        String region = instance.getRegion();
        if (TextUtils.isEmpty(region)) {
            region = ensureRegionAvaible();
        }
        if (!TextUtils.isEmpty(region)) {
            this.mRegion = region;
            instance.setRegion(region);
            if (Region.Global.name().equals(this.mRegion)) {
                ConnectionConfiguration.setXmppServerHost("app.chat.global.xiaomi.net");
            } else if (Region.Europe.name().equals(this.mRegion)) {
                ConnectionConfiguration.setXmppServerHost("fr.app.chat.global.xiaomi.net");
            } else if (Region.Russia.name().equals(this.mRegion)) {
                ConnectionConfiguration.setXmppServerHost("ru.app.chat.global.xiaomi.net");
            } else if (Region.India.name().equals(this.mRegion)) {
                ConnectionConfiguration.setXmppServerHost("idmb.app.chat.global.xiaomi.net");
            }
        } else {
            this.mRegion = Region.China.name();
        }
        if (Region.China.name().equals(this.mRegion)) {
            ConnectionConfiguration.setXmppServerHost("cn.app.chat.xiaomi.net");
        }
        if (isPushEnabled()) {
            final AnonymousClass6 r0 = new Job(11) {
                public String getDesc() {
                    return "prepare the mi push account.";
                }

                public void process() {
                    MIPushHelper.prepareMIPushAccount(XMPushService.this);
                    if (Network.hasNetwork(XMPushService.this)) {
                        XMPushService.this.scheduleConnect(true);
                    }
                }
            };
            executeJob(r0);
            MIPushAccountUtils.setAccountChangeListener(new PushAccountChangeListener() {
                public void onChange() {
                    XMPushService.this.executeJob(r0);
                }
            });
        }
        try {
            if (SystemUtils.isBootCompleted()) {
                this.mClientEventDispatcher.notifyServiceStarted(this);
            }
        } catch (Exception e) {
            MyLog.e((Throwable) e);
        }
    }

    private Packet preparePacket(Packet packet, String str, String str2) {
        PushClientsManager instance = PushClientsManager.getInstance();
        List queryChannelIdByPackage = instance.queryChannelIdByPackage(str);
        if (queryChannelIdByPackage.isEmpty()) {
            StringBuilder sb = new StringBuilder();
            sb.append("open channel should be called first before sending a packet, pkg=");
            sb.append(str);
            MyLog.w(sb.toString());
        } else {
            packet.setPackageName(str);
            String channelId = packet.getChannelId();
            if (TextUtils.isEmpty(channelId)) {
                channelId = (String) queryChannelIdByPackage.get(0);
                packet.setChannelId(channelId);
            }
            ClientLoginInfo clientLoginInfoByChidAndUserId = instance.getClientLoginInfoByChidAndUserId(channelId, packet.getFrom());
            if (!isConnected()) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("drop a packet as the channel is not connected, chid=");
                sb2.append(channelId);
                MyLog.w(sb2.toString());
            } else if (clientLoginInfoByChidAndUserId == null || clientLoginInfoByChidAndUserId.status != ClientStatus.binded) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("drop a packet as the channel is not opened, chid=");
                sb3.append(channelId);
                MyLog.w(sb3.toString());
            } else if (TextUtils.equals(str2, clientLoginInfoByChidAndUserId.session)) {
                return packet;
            } else {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("invalid session. ");
                sb4.append(str2);
                MyLog.w(sb4.toString());
            }
        }
        return null;
    }

    private void sendMessage(Intent intent) {
        String stringExtra = intent.getStringExtra(PushConstants.EXTRA_PACKAGE_NAME);
        String stringExtra2 = intent.getStringExtra(PushConstants.EXTRA_SESSION);
        Bundle bundleExtra = intent.getBundleExtra("ext_packet");
        PushClientsManager instance = PushClientsManager.getInstance();
        Blob blob = null;
        if (bundleExtra != null) {
            Message message = (Message) preparePacket(new Message(bundleExtra), stringExtra, stringExtra2);
            if (message != null) {
                blob = Blob.from(message, instance.getClientLoginInfoByChidAndUserId(message.getChannelId(), message.getFrom()).security);
            } else {
                return;
            }
        } else {
            byte[] byteArrayExtra = intent.getByteArrayExtra("ext_raw_packet");
            if (byteArrayExtra != null) {
                long longExtra = intent.getLongExtra(PushConstants.EXTRA_USER_ID, 0);
                String stringExtra3 = intent.getStringExtra(PushConstants.EXTRA_USER_RES);
                String stringExtra4 = intent.getStringExtra("ext_chid");
                ClientLoginInfo clientLoginInfoByChidAndUserId = instance.getClientLoginInfoByChidAndUserId(stringExtra4, Long.toString(longExtra));
                if (clientLoginInfoByChidAndUserId != null) {
                    Blob blob2 = new Blob();
                    try {
                        blob2.setChannelId(Integer.parseInt(stringExtra4));
                    } catch (NumberFormatException unused) {
                    }
                    blob2.setCmd("SECMSG", null);
                    blob2.setFrom(longExtra, "xiaomi.com", stringExtra3);
                    blob2.setPacketID(intent.getStringExtra("ext_pkt_id"));
                    blob2.setPayload(byteArrayExtra, clientLoginInfoByChidAndUserId.security);
                    blob = blob2;
                }
            }
        }
        if (blob != null) {
            executeJobNow(new SendMessageJob(this, blob));
        }
    }

    private void sendMessages(Intent intent) {
        String stringExtra = intent.getStringExtra(PushConstants.EXTRA_PACKAGE_NAME);
        String stringExtra2 = intent.getStringExtra(PushConstants.EXTRA_SESSION);
        Parcelable[] parcelableArrayExtra = intent.getParcelableArrayExtra("ext_packets");
        Message[] messageArr = new Message[parcelableArrayExtra.length];
        intent.getBooleanExtra("ext_encrypt", true);
        int i = 0;
        while (i < parcelableArrayExtra.length) {
            messageArr[i] = new Message((Bundle) parcelableArrayExtra[i]);
            messageArr[i] = (Message) preparePacket(messageArr[i], stringExtra, stringExtra2);
            if (messageArr[i] != null) {
                i++;
            } else {
                return;
            }
        }
        PushClientsManager instance = PushClientsManager.getInstance();
        Blob[] blobArr = new Blob[messageArr.length];
        for (int i2 = 0; i2 < messageArr.length; i2++) {
            Message message = messageArr[i2];
            blobArr[i2] = Blob.from(message, instance.getClientLoginInfoByChidAndUserId(message.getChannelId(), message.getFrom()).security);
        }
        executeJobNow(new BatchSendMessageJob(this, blobArr));
    }

    private boolean shouldCheckAlive() {
        if (System.currentTimeMillis() - this.lastAlive < 30000) {
            return false;
        }
        return Network.isConnected(this);
    }

    private boolean shouldRebind(String str, Intent intent) {
        ClientLoginInfo clientLoginInfoByChidAndUserId = PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(str, intent.getStringExtra(PushConstants.EXTRA_USER_ID));
        boolean z = false;
        if (clientLoginInfoByChidAndUserId == null || str == null) {
            return false;
        }
        String stringExtra = intent.getStringExtra(PushConstants.EXTRA_SESSION);
        String stringExtra2 = intent.getStringExtra(PushConstants.EXTRA_SECURITY);
        if (!TextUtils.isEmpty(clientLoginInfoByChidAndUserId.session) && !TextUtils.equals(stringExtra, clientLoginInfoByChidAndUserId.session)) {
            StringBuilder sb = new StringBuilder();
            sb.append("session changed. old session=");
            sb.append(clientLoginInfoByChidAndUserId.session);
            sb.append(", new session=");
            sb.append(stringExtra);
            sb.append(" chid = ");
            sb.append(str);
            MyLog.w(sb.toString());
            z = true;
        }
        if (stringExtra2.equals(clientLoginInfoByChidAndUserId.security)) {
            return z;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("security changed. chid = ");
        sb2.append(str);
        sb2.append(" sechash = ");
        sb2.append(MD5.MD5_32(stringExtra2));
        MyLog.w(sb2.toString());
        return true;
    }

    private void unregisterReceiverSafely(BroadcastReceiver broadcastReceiver) {
        if (broadcastReceiver != null) {
            try {
                unregisterReceiver(broadcastReceiver);
            } catch (IllegalArgumentException e) {
                MyLog.e((Throwable) e);
            }
        }
    }

    /* access modifiers changed from: private */
    public void updateAlarmTimer() {
        if (!shouldReconnect()) {
            Alarm.stop();
        } else if (!Alarm.isAlive()) {
            Alarm.registerPing(true);
        }
    }

    private ClientLoginInfo updatePushClient(String str, Intent intent) {
        ClientLoginInfo clientLoginInfoByChidAndUserId = PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(str, intent.getStringExtra(PushConstants.EXTRA_USER_ID));
        if (clientLoginInfoByChidAndUserId == null) {
            clientLoginInfoByChidAndUserId = new ClientLoginInfo(this);
        }
        clientLoginInfoByChidAndUserId.chid = intent.getStringExtra(PushConstants.EXTRA_CHANNEL_ID);
        clientLoginInfoByChidAndUserId.userId = intent.getStringExtra(PushConstants.EXTRA_USER_ID);
        clientLoginInfoByChidAndUserId.token = intent.getStringExtra(PushConstants.EXTRA_TOKEN);
        clientLoginInfoByChidAndUserId.pkgName = intent.getStringExtra(PushConstants.EXTRA_PACKAGE_NAME);
        clientLoginInfoByChidAndUserId.clientExtra = intent.getStringExtra(PushConstants.EXTRA_CLIENT_ATTR);
        clientLoginInfoByChidAndUserId.cloudExtra = intent.getStringExtra(PushConstants.EXTRA_CLOUD_ATTR);
        clientLoginInfoByChidAndUserId.kick = intent.getBooleanExtra(PushConstants.EXTRA_KICK, false);
        clientLoginInfoByChidAndUserId.security = intent.getStringExtra(PushConstants.EXTRA_SECURITY);
        clientLoginInfoByChidAndUserId.session = intent.getStringExtra(PushConstants.EXTRA_SESSION);
        clientLoginInfoByChidAndUserId.authMethod = intent.getStringExtra(PushConstants.EXTRA_AUTH_METHOD);
        clientLoginInfoByChidAndUserId.mClientEventDispatcher = this.mClientEventDispatcher;
        clientLoginInfoByChidAndUserId.watch((Messenger) intent.getParcelableExtra(PushConstants.EXTRA_MESSENGER));
        clientLoginInfoByChidAndUserId.context = getApplicationContext();
        PushClientsManager.getInstance().addActiveClient(clientLoginInfoByChidAndUserId);
        return clientLoginInfoByChidAndUserId;
    }

    public void addPingCallBack(PingCallBack pingCallBack) {
        synchronized (this.pingCallBacks) {
            this.pingCallBacks.add(pingCallBack);
        }
    }

    public void batchSendPacket(Blob[] blobArr) throws XMPPException {
        if (this.mCurrentConnection != null) {
            this.mCurrentConnection.batchSend(blobArr);
            return;
        }
        throw new XMPPException("try send msg while connection is null.");
    }

    public void closeChannel(String str, String str2, int i, String str3, String str4) {
        ClientLoginInfo clientLoginInfoByChidAndUserId = PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(str, str2);
        if (clientLoginInfoByChidAndUserId != null) {
            UnbindJob unbindJob = new UnbindJob(clientLoginInfoByChidAndUserId, i, str4, str3);
            executeJob(unbindJob);
        }
        PushClientsManager.getInstance().deactivateClient(str, str2);
    }

    public void connectionClosed(Connection connection, int i, Exception exc) {
        StatsHandler.getContext().connectionClosed(connection, i, exc);
        scheduleConnect(false);
    }

    public void connectionStarted(Connection connection) {
        MyLog.v("begin to connect...");
        StatsHandler.getContext().connectionStarted(connection);
    }

    public ClientEventDispatcher createClientEventDispatcher() {
        return new ClientEventDispatcher();
    }

    public void disconnect(int i, Exception exc) {
        StringBuilder sb = new StringBuilder();
        sb.append("disconnect ");
        sb.append(hashCode());
        sb.append(", ");
        sb.append(this.mCurrentConnection == null ? null : Integer.valueOf(this.mCurrentConnection.hashCode()));
        MyLog.w(sb.toString());
        if (this.mCurrentConnection != null) {
            this.mCurrentConnection.disconnect(i, exc);
            this.mCurrentConnection = null;
        }
        removeJobs(7);
        removeJobs(4);
        PushClientsManager.getInstance().resetAllClients(this, i);
    }

    public void executeJob(Job job) {
        executeJobDelayed(job, 0);
    }

    public void executeJobDelayed(Job job, long j) {
        try {
            this.mJobController.executeJobDelayed(job, j);
        } catch (IllegalStateException unused) {
        }
    }

    public ClientEventDispatcher getClientEventDispatcher() {
        return this.mClientEventDispatcher;
    }

    public Connection getCurrentConnection() {
        return this.mCurrentConnection;
    }

    public boolean hasJob(int i) {
        return this.mJobController.hasJob(i);
    }

    public boolean isConnected() {
        return this.mCurrentConnection != null && this.mCurrentConnection.isConnected();
    }

    public boolean isConnecting() {
        return this.mCurrentConnection != null && this.mCurrentConnection.isConnecting();
    }

    public boolean isPushDisabled() {
        boolean z = false;
        try {
            Class cls = Class.forName("miui.os.Build");
            Field field = cls.getField("IS_CM_CUSTOMIZATION_TEST");
            Field field2 = cls.getField("IS_CU_CUSTOMIZATION_TEST");
            Field field3 = cls.getField("IS_CT_CUSTOMIZATION_TEST");
            if (field.getBoolean(null) || field2.getBoolean(null) || field3.getBoolean(null)) {
                z = true;
            }
            return z;
        } catch (Throwable unused) {
            return false;
        }
    }

    public IBinder onBind(Intent intent) {
        return this.messenger.getBinder();
    }

    public void onCreate() {
        super.onCreate();
        SystemUtils.initialize(this);
        MIPushAccount mIPushAccount = MIPushAccountUtils.getMIPushAccount(this);
        if (mIPushAccount != null) {
            BuildSettings.setEnvType(mIPushAccount.envType);
        }
        this.messenger = new Messenger(new Handler() {
            public void handleMessage(android.os.Message message) {
                super.handleMessage(message);
                if (message != null) {
                    try {
                        switch (message.what) {
                            case 17:
                                if (message.obj != null) {
                                    XMPushService.this.onStart((Intent) message.obj, XMPushService.START_STICKY);
                                    return;
                                }
                                return;
                            case 18:
                                android.os.Message obtain = android.os.Message.obtain(null, 0);
                                obtain.what = 18;
                                Bundle bundle = new Bundle();
                                bundle.putString("xmsf_region", XMPushService.this.mRegion);
                                obtain.setData(bundle);
                                message.replyTo.send(obtain);
                                return;
                            default:
                                return;
                        }
                    } catch (Throwable unused) {
                    }
                }
            }
        });
        PushHostManagerFactory.init(this);
        AnonymousClass3 r2 = new ConnectionConfiguration(null, 5222, "xiaomi.com", null) {
            public byte[] getConnectionBlob() {
                try {
                    PushServiceConfigMsg pushServiceConfigMsg = new PushServiceConfigMsg();
                    pushServiceConfigMsg.setClientVersion(ServiceConfig.getInstance().getConfigVersion());
                    return pushServiceConfigMsg.toByteArray();
                } catch (Exception e) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("getOBBString err: ");
                    sb.append(e.toString());
                    MyLog.w(sb.toString());
                    return null;
                }
            }
        };
        this.connConfig = r2;
        this.connConfig.setDebuggerEnabled(true);
        this.mSlimConnection = new SlimConnection(this, this.connConfig);
        this.mClientEventDispatcher = createClientEventDispatcher();
        Alarm.initialize(this);
        this.mSlimConnection.addConnectionListener(this);
        this.mPacketSync = new PacketSync(this);
        this.mReconnManager = new ReconnectionManager(this);
        new CommonPacketExtensionProvider().register();
        StatsHandler.getInstance().init(this);
        this.mJobController = new JobScheduler("Connection Controller Thread");
        PushClientsManager instance = PushClientsManager.getInstance();
        instance.removeAllClientChangeListeners();
        instance.addClientChangeListener(new ClientChangeListener() {
            public void onChange() {
                XMPushService.this.updateAlarmTimer();
                if (PushClientsManager.getInstance().getActiveClientCount() <= 0) {
                    XMPushService.this.executeJob(new DisconnectJob(12, null));
                }
            }
        });
        if (canOpenForegroundService()) {
            enableForegroundService();
        }
        TinyDataManager.getInstance(this).addUploader(new LongConnUploader(this), "UPLOADER_PUSH_CHANNEL");
        addPingCallBack(new TinyDataCacheProcessor(this));
        executeJob(new InitJob());
        this.networkListeners.add(Sync.getInstance(this));
        if (isPushEnabled()) {
            this.mConnectionChangeReceiver = new ConnectionChangeReceiver();
            registerReceiver(this.mConnectionChangeReceiver, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
        }
        if ("com.xiaomi.xmsf".equals(getPackageName())) {
            Uri uriFor = Secure.getUriFor("EXTREME_POWER_MODE_ENABLE");
            if (uriFor != null) {
                this.mExtremePowerModeObserver = new ContentObserver(new Handler(Looper.getMainLooper())) {
                    public void onChange(boolean z) {
                        super.onChange(z);
                        boolean access$200 = XMPushService.this.isExtremePowerSaveMode();
                        StringBuilder sb = new StringBuilder();
                        sb.append("ExtremePowerMode:");
                        sb.append(access$200);
                        MyLog.w(sb.toString());
                        if (access$200) {
                            XMPushService.this.executeJob(new DisconnectJob(23, null));
                        } else {
                            XMPushService.this.scheduleConnect(true);
                        }
                    }
                };
                try {
                    getContentResolver().registerContentObserver(uriFor, false, this.mExtremePowerModeObserver);
                } catch (Throwable th) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("register observer err:");
                    sb.append(th.getMessage());
                    MyLog.w(sb.toString());
                }
            }
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("XMPushService created pid = ");
        sb2.append(PID);
        MyLog.w(sb2.toString());
    }

    public void onDestroy() {
        if (this.mConnectionChangeReceiver != null) {
            unregisterReceiverSafely(this.mConnectionChangeReceiver);
            this.mConnectionChangeReceiver = null;
        }
        if ("com.xiaomi.xmsf".equals(getPackageName()) && this.mExtremePowerModeObserver != null) {
            try {
                getContentResolver().unregisterContentObserver(this.mExtremePowerModeObserver);
            } catch (Throwable th) {
                StringBuilder sb = new StringBuilder();
                sb.append("unregister observer err:");
                sb.append(th.getMessage());
                MyLog.w(sb.toString());
            }
        }
        this.networkListeners.clear();
        this.mJobController.removeAllJobs();
        executeJob(new Job(2) {
            public String getDesc() {
                return "disconnect for service destroy.";
            }

            public void process() {
                if (XMPushService.this.mCurrentConnection != null) {
                    XMPushService.this.mCurrentConnection.disconnect(15, null);
                    XMPushService.this.mCurrentConnection = null;
                }
            }
        });
        executeJob(new KillJob());
        PushClientsManager.getInstance().removeAllClientChangeListeners();
        PushClientsManager.getInstance().resetAllClients(this, 15);
        PushClientsManager.getInstance().removeActiveClients();
        this.mSlimConnection.removeConnectionListener(this);
        ServiceConfig.getInstance().clear();
        Alarm.stop();
        clearPingCallbacks();
        super.onDestroy();
        MyLog.w("Service destroyed");
    }

    /* access modifiers changed from: 0000 */
    public void onPong() {
        Iterator it = new ArrayList(this.pingCallBacks).iterator();
        while (it.hasNext()) {
            ((PingCallBack) it.next()).pingFollowUpAction();
        }
    }

    public void onStart(Intent intent, int i) {
        if (intent == null) {
            MyLog.e("onStart() with intent NULL");
        } else {
            MyLog.v(String.format("onStart() with intent.Action = %s, chid = %s", new Object[]{intent.getAction(), intent.getStringExtra(PushConstants.EXTRA_CHANNEL_ID)}));
        }
        if (intent != null && intent.getAction() != null) {
            if ("com.xiaomi.push.timer".equalsIgnoreCase(intent.getAction()) || "com.xiaomi.push.check_alive".equalsIgnoreCase(intent.getAction())) {
                if (this.mJobController.isBlocked()) {
                    MyLog.e("ERROR, the job controller is blocked.");
                    PushClientsManager.getInstance().resetAllClients(this, 14);
                    stopSelf();
                    return;
                }
                executeJob(new IntentJob(intent));
            } else if (!"com.xiaomi.push.network_status_changed".equalsIgnoreCase(intent.getAction())) {
                executeJob(new IntentJob(intent));
            }
        }
    }

    public int onStartCommand(Intent intent, int i, int i2) {
        onStart(intent, i2);
        return START_STICKY;
    }

    public void reconnectionFailed(Connection connection, Exception exc) {
        StatsHandler.getContext().reconnectionFailed(connection, exc);
        broadcastNetworkAvailable(false);
        scheduleConnect(false);
    }

    public void reconnectionSuccessful(Connection connection) {
        StatsHandler.getContext().reconnectionSuccessful(connection);
        broadcastNetworkAvailable(true);
        this.mReconnManager.onConnectSucceeded();
        Iterator it = PushClientsManager.getInstance().getAllClients().iterator();
        while (it.hasNext()) {
            executeJob(new BindJob((ClientLoginInfo) it.next()));
        }
    }

    public void registerForMiPushApp(byte[] bArr, String str) {
        if (bArr == null) {
            MIPushClientManager.notifyError(this, str, bArr, 70000003, "null payload");
            MyLog.w("register request without payload");
            return;
        }
        XmPushActionContainer xmPushActionContainer = new XmPushActionContainer();
        try {
            XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionContainer, bArr);
            if (xmPushActionContainer.action == ActionType.Registration) {
                XmPushActionRegistration xmPushActionRegistration = new XmPushActionRegistration();
                try {
                    XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionRegistration, xmPushActionContainer.getPushAction());
                    MIPushClientManager.registerApp(xmPushActionContainer.getPackageName(), bArr);
                    MIPushAppRegisterJob mIPushAppRegisterJob = new MIPushAppRegisterJob(this, xmPushActionContainer.getPackageName(), xmPushActionRegistration.getAppId(), xmPushActionRegistration.getToken(), bArr);
                    executeJob(mIPushAppRegisterJob);
                    PushClientReportManager.getInstance(getApplicationContext()).reportEvent(xmPushActionContainer.getPackageName(), "E100003", xmPushActionRegistration.getId(), 6002, "send a register message to server");
                } catch (TException e) {
                    MyLog.e((Throwable) e);
                    MIPushClientManager.notifyError(this, str, bArr, 70000003, " data action error.");
                }
            } else {
                MIPushClientManager.notifyError(this, str, bArr, 70000003, " registration action required.");
                MyLog.w("register request with invalid payload");
            }
        } catch (TException e2) {
            MyLog.e((Throwable) e2);
            MIPushClientManager.notifyError(this, str, bArr, 70000003, " data container error.");
        }
    }

    public void removeJobs(int i) {
        this.mJobController.removeJobs(i);
    }

    public void removeJobs(Job job) {
        this.mJobController.removeJobs(job.type, job);
    }

    public void scheduleConnect(boolean z) {
        this.mReconnManager.tryReconnect(z);
    }

    public void scheduleRebindChannel(ClientLoginInfo clientLoginInfo) {
        if (clientLoginInfo != null) {
            long nextRetryInterval = clientLoginInfo.getNextRetryInterval();
            StringBuilder sb = new StringBuilder();
            sb.append("schedule rebind job in ");
            sb.append(nextRetryInterval / 1000);
            MyLog.w(sb.toString());
            executeJobDelayed(new BindJob(clientLoginInfo), nextRetryInterval);
        }
    }

    /* access modifiers changed from: 0000 */
    public void sendMessage(final String str, final byte[] bArr, boolean z) {
        Collection allClientLoginInfoByChid = PushClientsManager.getInstance().getAllClientLoginInfoByChid("5");
        if (allClientLoginInfoByChid.isEmpty()) {
            if (z) {
                MIPushClientManager.addPendingMessages(str, bArr);
            }
        } else if (((ClientLoginInfo) allClientLoginInfoByChid.iterator().next()).status == ClientStatus.binded) {
            executeJob(new Job(4) {
                public String getDesc() {
                    return "send mi push message";
                }

                public void process() {
                    try {
                        MIPushHelper.sendPacket(XMPushService.this, str, bArr);
                    } catch (XMPPException e) {
                        MyLog.e((Throwable) e);
                        XMPushService.this.disconnect(10, e);
                    }
                }
            });
        } else if (z) {
            MIPushClientManager.addPendingMessages(str, bArr);
        }
    }

    public void sendPacket(Blob blob) throws XMPPException {
        if (this.mCurrentConnection != null) {
            this.mCurrentConnection.send(blob);
            return;
        }
        throw new XMPPException("try send msg while connection is null.");
    }

    /* access modifiers changed from: 0000 */
    public void sendPongIfNeed() {
        if (System.currentTimeMillis() - this.lastAlive >= ((long) SmackConfiguration.getCheckAliveInterval()) && Network.isConnected(this)) {
            checkAlive(true);
        }
    }

    public boolean shouldReconnect() {
        return Network.hasNetwork(this) && PushClientsManager.getInstance().getActiveClientCount() > 0 && !isPushDisabled() && isPushEnabled() && !isExtremePowerSaveMode();
    }
}
