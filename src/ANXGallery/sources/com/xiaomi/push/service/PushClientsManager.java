package com.xiaomi.push.service;

import android.content.Context;
import android.os.IBinder.DeathRecipient;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.XMPushService.Job;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public class PushClientsManager {
    private static PushClientsManager sInstance;
    private List<ClientChangeListener> clientChangeListeners = new ArrayList();
    private ConcurrentHashMap<String, HashMap<String, ClientLoginInfo>> mActiveClients = new ConcurrentHashMap<>();

    public interface ClientChangeListener {
        void onChange();
    }

    public static class ClientLoginInfo {
        public String authMethod;
        public String chid;
        public String clientExtra;
        public String cloudExtra;
        public Context context;
        private int currentRetrys = 0;
        private boolean hasPeerSupport = false;
        public boolean kick;
        public ClientEventDispatcher mClientEventDispatcher;
        /* access modifiers changed from: private */
        public XMPushService mPushService;
        ClientStatus notifiedStatus = null;
        final NotifyClientJob notifyClientJob = new NotifyClientJob();
        Messenger peer;
        DeathRecipient peerWatcher = null;
        public String pkgName;
        public String security;
        public String session;
        ClientStatus status = ClientStatus.unbind;
        private List<ClientStatusListener> statusChangeListeners = new ArrayList();
        /* access modifiers changed from: private */
        public BindTimeoutJob timeOutJob = new BindTimeoutJob(this);
        public String token;
        public String userId;

        public interface ClientStatusListener {
            void onChange(ClientStatus clientStatus, ClientStatus clientStatus2, int i);
        }

        class NotifyClientJob extends Job {
            String errorType;
            int notifyType;
            int reason;
            String reasonMessage;

            public NotifyClientJob() {
                super(0);
            }

            public Job build(int i, int i2, String str, String str2) {
                this.notifyType = i;
                this.reason = i2;
                this.errorType = str2;
                this.reasonMessage = str;
                return this;
            }

            public String getDesc() {
                return "notify job";
            }

            public void process() {
                if (ClientLoginInfo.this.shouldNotifyClient(this.notifyType, this.reason, this.errorType)) {
                    ClientLoginInfo.this.notifyClientStatus(this.notifyType, this.reason, this.reasonMessage, this.errorType);
                    return;
                }
                StringBuilder sb = new StringBuilder();
                sb.append(" ignore notify client :");
                sb.append(ClientLoginInfo.this.chid);
                MyLog.i(sb.toString());
            }
        }

        class PeerWatcher implements DeathRecipient {
            final ClientLoginInfo info;
            final Messenger peer;

            PeerWatcher(ClientLoginInfo clientLoginInfo, Messenger messenger) {
                this.info = clientLoginInfo;
                this.peer = messenger;
            }

            public void binderDied() {
                StringBuilder sb = new StringBuilder();
                sb.append("peer died, chid = ");
                sb.append(this.info.chid);
                MyLog.i(sb.toString());
                ClientLoginInfo.this.mPushService.executeJobDelayed(new Job(0) {
                    public String getDesc() {
                        return "clear peer job";
                    }

                    public void process() {
                        if (PeerWatcher.this.peer == PeerWatcher.this.info.peer) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("clean peer, chid = ");
                            sb.append(PeerWatcher.this.info.chid);
                            MyLog.i(sb.toString());
                            PeerWatcher.this.info.peer = null;
                        }
                    }
                }, 0);
                if ("9".equals(this.info.chid) && "com.xiaomi.xmsf".equals(ClientLoginInfo.this.mPushService.getPackageName())) {
                    ClientLoginInfo.this.mPushService.executeJobDelayed(new Job(0) {
                        public String getDesc() {
                            return "check peer job";
                        }

                        public void process() {
                            if (PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(PeerWatcher.this.info.chid, PeerWatcher.this.info.userId).peer == null) {
                                ClientLoginInfo.this.mPushService.closeChannel(PeerWatcher.this.info.chid, PeerWatcher.this.info.userId, 2, null, null);
                            }
                        }
                    }, 60000);
                }
            }
        }

        public ClientLoginInfo() {
        }

        public ClientLoginInfo(XMPushService xMPushService) {
            this.mPushService = xMPushService;
            addClientStatusListener(new ClientStatusListener() {
                public void onChange(ClientStatus clientStatus, ClientStatus clientStatus2, int i) {
                    if (clientStatus2 == ClientStatus.binding) {
                        ClientLoginInfo.this.mPushService.executeJobDelayed(ClientLoginInfo.this.timeOutJob, 60000);
                    } else {
                        ClientLoginInfo.this.mPushService.removeJobs((Job) ClientLoginInfo.this.timeOutJob);
                    }
                }
            });
        }

        public static String getResource(String str) {
            String str2 = "";
            if (TextUtils.isEmpty(str)) {
                return str2;
            }
            int lastIndexOf = str.lastIndexOf("/");
            if (lastIndexOf != -1) {
                str2 = str.substring(lastIndexOf + 1);
            }
            return str2;
        }

        private boolean isSpeicalErr(int i, int i2, String str) {
            switch (i) {
                case 1:
                    return this.status != ClientStatus.binded && this.mPushService.isConnected() && i2 != 21 && (i2 != 7 || !"wait".equals(str));
                case 2:
                    return this.mPushService.isConnected();
                case 3:
                    return !"wait".equals(str);
                default:
                    return false;
            }
        }

        /* access modifiers changed from: private */
        public void notifyClientStatus(int i, int i2, String str, String str2) {
            this.notifiedStatus = this.status;
            if (i == 2) {
                this.mClientEventDispatcher.notifyChannelClosed(this.context, this, i2);
            } else if (i == 3) {
                this.mClientEventDispatcher.notifyKickedByServer(this.context, this, str2, str);
            } else if (i == 1) {
                boolean z = this.status == ClientStatus.binded;
                if (!z && "wait".equals(str2)) {
                    this.currentRetrys++;
                } else if (z) {
                    this.currentRetrys = 0;
                    if (this.peer != null) {
                        try {
                            this.peer.send(Message.obtain(null, 16, this.mPushService.messenger));
                        } catch (RemoteException unused) {
                        }
                    }
                }
                this.mClientEventDispatcher.notifyChannelOpenResult(this.mPushService, this, z, i2, str);
            }
        }

        /* access modifiers changed from: private */
        public boolean shouldNotifyClient(int i, int i2, String str) {
            if (this.notifiedStatus == null || !this.hasPeerSupport) {
                return true;
            }
            if (this.notifiedStatus == this.status) {
                StringBuilder sb = new StringBuilder();
                sb.append(" status recovered, don't notify client:");
                sb.append(this.chid);
                MyLog.i(sb.toString());
                return false;
            } else if (this.peer == null || !this.hasPeerSupport) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("peer died, ignore notify ");
                sb2.append(this.chid);
                MyLog.i(sb2.toString());
                return false;
            } else {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Peer alive notify status to client:");
                sb3.append(this.chid);
                MyLog.i(sb3.toString());
                return true;
            }
        }

        public void addClientStatusListener(ClientStatusListener clientStatusListener) {
            synchronized (this.statusChangeListeners) {
                this.statusChangeListeners.add(clientStatusListener);
            }
        }

        public String getDesc(int i) {
            switch (i) {
                case 1:
                    return "OPEN";
                case 2:
                    return "CLOSE";
                case 3:
                    return "KICK";
                default:
                    return "unknown";
            }
        }

        public long getNextRetryInterval() {
            return (((long) ((Math.random() * 20.0d) - 10.0d)) + ((long) ((this.currentRetrys + 1) * 15))) * 1000;
        }

        public void removeClientStatusListener(ClientStatusListener clientStatusListener) {
            synchronized (this.statusChangeListeners) {
                this.statusChangeListeners.remove(clientStatusListener);
            }
        }

        public void setStatus(ClientStatus clientStatus, int i, int i2, String str, String str2) {
            synchronized (this.statusChangeListeners) {
                for (ClientStatusListener onChange : this.statusChangeListeners) {
                    onChange.onChange(this.status, clientStatus, i2);
                }
            }
            int i3 = 0;
            if (this.status != clientStatus) {
                MyLog.w(String.format("update the client %7$s status. %1$s->%2$s %3$s %4$s %5$s %6$s", new Object[]{this.status, clientStatus, getDesc(i), PushConstants.getErrorDesc(i2), str, str2, this.chid}));
                this.status = clientStatus;
            }
            if (this.mClientEventDispatcher == null) {
                MyLog.e("status changed while the client dispatcher is missing");
            } else if (clientStatus != ClientStatus.binding) {
                if (this.notifiedStatus != null && this.hasPeerSupport) {
                    i3 = (this.peer == null || !this.hasPeerSupport) ? 10100 : 1000;
                }
                this.mPushService.removeJobs((Job) this.notifyClientJob);
                if (isSpeicalErr(i, i2, str2)) {
                    notifyClientStatus(i, i2, str, str2);
                } else {
                    this.mPushService.executeJobDelayed(this.notifyClientJob.build(i, i2, str, str2), (long) i3);
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void unwatch() {
            try {
                Messenger messenger = this.peer;
                if (!(messenger == null || this.peerWatcher == null)) {
                    messenger.getBinder().unlinkToDeath(this.peerWatcher, 0);
                }
            } catch (Exception unused) {
            }
            this.notifiedStatus = null;
        }

        /* access modifiers changed from: 0000 */
        public void watch(Messenger messenger) {
            unwatch();
            if (messenger != null) {
                try {
                    this.peer = messenger;
                    this.hasPeerSupport = true;
                    this.peerWatcher = new PeerWatcher(this, messenger);
                    messenger.getBinder().linkToDeath(this.peerWatcher, 0);
                } catch (Exception e) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("peer linkToDeath err: ");
                    sb.append(e.getMessage());
                    MyLog.i(sb.toString());
                    this.peer = null;
                    this.hasPeerSupport = false;
                }
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("peer linked with old sdk chid = ");
                sb2.append(this.chid);
                MyLog.i(sb2.toString());
            }
        }
    }

    public enum ClientStatus {
        unbind,
        binding,
        binded
    }

    private PushClientsManager() {
    }

    public static synchronized PushClientsManager getInstance() {
        PushClientsManager pushClientsManager;
        synchronized (PushClientsManager.class) {
            if (sInstance == null) {
                sInstance = new PushClientsManager();
            }
            pushClientsManager = sInstance;
        }
        return pushClientsManager;
    }

    private String getSmtpLocalPart(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        int indexOf = str.indexOf("@");
        return indexOf > 0 ? str.substring(0, indexOf) : str;
    }

    public synchronized void addActiveClient(ClientLoginInfo clientLoginInfo) {
        HashMap hashMap = (HashMap) this.mActiveClients.get(clientLoginInfo.chid);
        if (hashMap == null) {
            hashMap = new HashMap();
            this.mActiveClients.put(clientLoginInfo.chid, hashMap);
        }
        hashMap.put(getSmtpLocalPart(clientLoginInfo.userId), clientLoginInfo);
        for (ClientChangeListener onChange : this.clientChangeListeners) {
            onChange.onChange();
        }
    }

    public synchronized void addClientChangeListener(ClientChangeListener clientChangeListener) {
        this.clientChangeListeners.add(clientChangeListener);
    }

    public synchronized void deactivateAllClientByChid(String str) {
        HashMap hashMap = (HashMap) this.mActiveClients.get(str);
        if (hashMap != null) {
            for (ClientLoginInfo unwatch : hashMap.values()) {
                unwatch.unwatch();
            }
            hashMap.clear();
            this.mActiveClients.remove(str);
        }
        for (ClientChangeListener onChange : this.clientChangeListeners) {
            onChange.onChange();
        }
    }

    public synchronized void deactivateClient(String str, String str2) {
        HashMap hashMap = (HashMap) this.mActiveClients.get(str);
        if (hashMap != null) {
            ClientLoginInfo clientLoginInfo = (ClientLoginInfo) hashMap.get(getSmtpLocalPart(str2));
            if (clientLoginInfo != null) {
                clientLoginInfo.unwatch();
            }
            hashMap.remove(getSmtpLocalPart(str2));
            if (hashMap.isEmpty()) {
                this.mActiveClients.remove(str);
            }
        }
        for (ClientChangeListener onChange : this.clientChangeListeners) {
            onChange.onChange();
        }
    }

    public synchronized int getActiveClientCount() {
        return this.mActiveClients.size();
    }

    public synchronized Collection<ClientLoginInfo> getAllClientLoginInfoByChid(String str) {
        if (!this.mActiveClients.containsKey(str)) {
            return new ArrayList();
        }
        return ((HashMap) ((HashMap) this.mActiveClients.get(str)).clone()).values();
    }

    public synchronized ArrayList<ClientLoginInfo> getAllClients() {
        ArrayList<ClientLoginInfo> arrayList;
        arrayList = new ArrayList<>();
        for (HashMap values : this.mActiveClients.values()) {
            arrayList.addAll(values.values());
        }
        return arrayList;
    }

    public synchronized ClientLoginInfo getClientLoginInfoByChidAndUserId(String str, String str2) {
        HashMap hashMap = (HashMap) this.mActiveClients.get(str);
        if (hashMap == null) {
            return null;
        }
        return (ClientLoginInfo) hashMap.get(getSmtpLocalPart(str2));
    }

    public synchronized void notifyConnectionFailed(Context context) {
        for (HashMap values : this.mActiveClients.values()) {
            for (ClientLoginInfo status : values.values()) {
                status.setStatus(ClientStatus.unbind, 1, 3, null, null);
            }
        }
    }

    public synchronized List<String> queryChannelIdByPackage(String str) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        for (HashMap values : this.mActiveClients.values()) {
            for (ClientLoginInfo clientLoginInfo : values.values()) {
                if (str.equals(clientLoginInfo.pkgName)) {
                    arrayList.add(clientLoginInfo.chid);
                }
            }
        }
        return arrayList;
    }

    public synchronized void removeActiveClients() {
        Iterator it = getAllClients().iterator();
        while (it.hasNext()) {
            ((ClientLoginInfo) it.next()).unwatch();
        }
        this.mActiveClients.clear();
    }

    public synchronized void removeAllClientChangeListeners() {
        this.clientChangeListeners.clear();
    }

    public synchronized void resetAllClients(Context context, int i) {
        for (HashMap values : this.mActiveClients.values()) {
            for (ClientLoginInfo status : values.values()) {
                status.setStatus(ClientStatus.unbind, 2, i, null, null);
            }
        }
    }
}
