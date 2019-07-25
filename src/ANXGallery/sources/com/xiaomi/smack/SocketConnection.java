package com.xiaomi.smack;

import android.os.SystemClock;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.network.Fallback;
import com.xiaomi.network.Host;
import com.xiaomi.network.HostManager;
import com.xiaomi.push.service.XMPushService;
import com.xiaomi.push.service.XMPushService.Job;
import com.xiaomi.slim.Blob;
import com.xiaomi.smack.util.TaskExecutor;
import com.xiaomi.stats.StatsHelper;
import java.io.IOException;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Iterator;

public abstract class SocketConnection extends Connection {
    private String connectedHost;
    String connectionID = null;
    private int curShortConnCount;
    protected Exception failedException = null;
    protected volatile long lastConnectedTime = 0;
    protected volatile long lastPingReceived = 0;
    protected volatile long lastPingSent = 0;
    protected XMPushService pushService;
    protected Socket socket;

    public SocketConnection(XMPushService xMPushService, ConnectionConfiguration connectionConfiguration) {
        super(xMPushService, connectionConfiguration);
        this.pushService = xMPushService;
    }

    /* JADX WARNING: Removed duplicated region for block: B:30:0x00ff  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x0166  */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x01cf  */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x023c A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:60:0x023d  */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x01c6 A[SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:67:0x01c6 A[SYNTHETIC] */
    private void connectDirectly(String str, int i) throws XMPPException {
        boolean z;
        boolean z2;
        String str2 = str;
        int i2 = i;
        this.failedException = null;
        ArrayList arrayList = new ArrayList();
        StringBuilder sb = new StringBuilder();
        sb.append("get bucket for host : ");
        sb.append(str2);
        int intValue = MyLog.ps(sb.toString()).intValue();
        Fallback fallback = getFallback(str);
        MyLog.pe(Integer.valueOf(intValue));
        boolean z3 = true;
        if (fallback != null) {
            arrayList = fallback.getHosts(true);
        }
        if (arrayList.isEmpty()) {
            arrayList.add(str2);
        }
        this.lastConnectedTime = 0;
        String activeConnPoint = Network.getActiveConnPoint(this.pushService);
        StringBuilder sb2 = new StringBuilder();
        Iterator it = arrayList.iterator();
        boolean z4 = false;
        while (true) {
            if (!it.hasNext()) {
                z = z4;
                break;
            }
            String str3 = (String) it.next();
            long currentTimeMillis = System.currentTimeMillis();
            this.connTimes++;
            try {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("begin to connect to ");
                sb3.append(str3);
                MyLog.w(sb3.toString());
                this.socket = createSocket();
                this.socket.connect(Host.from(str3, i2), 8000);
                MyLog.w("tcp connected");
                this.socket.setTcpNoDelay(true);
                this.connectedHost = str3;
                initConnection();
                try {
                    this.connectTime = System.currentTimeMillis() - currentTimeMillis;
                    this.connectionPoint = activeConnPoint;
                    if (fallback != null) {
                        fallback.succeedHost(str3, this.connectTime, 0);
                    }
                    this.lastConnectedTime = SystemClock.elapsedRealtime();
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("connected to ");
                    sb4.append(str3);
                    sb4.append(" in ");
                    sb4.append(this.connectTime);
                    MyLog.w(sb4.toString());
                    z = true;
                } catch (Exception e) {
                    e = e;
                    z2 = true;
                    this.failedException = e;
                    if (z) {
                    }
                    z4 = z;
                } catch (Throwable th) {
                    th = th;
                    if (!z3) {
                    }
                    throw th;
                }
            } catch (Exception e2) {
                e = e2;
                z2 = z4;
                this.failedException = e;
                if (z) {
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("SMACK: Could not connect to:");
                    sb5.append(str3);
                    MyLog.e(sb5.toString());
                    sb2.append("SMACK: Could not connect to ");
                    sb2.append(str3);
                    sb2.append(" port:");
                    sb2.append(i2);
                    sb2.append(" err:");
                    sb2.append(this.failedException.getClass().getSimpleName());
                    sb2.append("\n");
                    StatsHelper.connectFail(str3, this.failedException);
                    if (fallback != null) {
                        fallback.failedHost(str3, System.currentTimeMillis() - currentTimeMillis, 0, this.failedException);
                    }
                    if (!TextUtils.equals(activeConnPoint, Network.getActiveConnPoint(this.pushService))) {
                        HostManager.getInstance().persist();
                        if (z) {
                        }
                    }
                } else {
                    continue;
                }
                z4 = z;
            } catch (Throwable th2) {
                th = th2;
                z3 = z4;
                if (!z3) {
                    StringBuilder sb6 = new StringBuilder();
                    sb6.append("SMACK: Could not connect to:");
                    sb6.append(str3);
                    MyLog.e(sb6.toString());
                    sb2.append("SMACK: Could not connect to ");
                    sb2.append(str3);
                    sb2.append(" port:");
                    sb2.append(i2);
                    sb2.append(" err:");
                    sb2.append(this.failedException.getClass().getSimpleName());
                    sb2.append("\n");
                    StatsHelper.connectFail(str3, this.failedException);
                    if (fallback != null) {
                        fallback.failedHost(str3, System.currentTimeMillis() - currentTimeMillis, 0, this.failedException);
                    }
                    if (!TextUtils.equals(activeConnPoint, Network.getActiveConnPoint(this.pushService))) {
                        z = z3;
                        HostManager.getInstance().persist();
                        if (z) {
                        }
                    }
                }
                throw th;
            }
            z4 = z;
        }
        HostManager.getInstance().persist();
        if (z) {
            throw new XMPPException(sb2.toString());
        }
    }

    private void connectUsingConfiguration(ConnectionConfiguration connectionConfiguration) throws XMPPException, IOException {
        connectDirectly(connectionConfiguration.getHost(), connectionConfiguration.getPort());
    }

    public void batchSend(Blob[] blobArr) throws XMPPException {
        throw new XMPPException("Don't support send Blob");
    }

    public synchronized void connect() throws XMPPException {
        try {
            if (!isConnected()) {
                if (!isConnecting()) {
                    setConnectionStatus(0, 0, null);
                    connectUsingConfiguration(this.config);
                    return;
                }
            }
            MyLog.w("WARNING: current xmpp has connected");
        } catch (IOException e) {
            throw new XMPPException((Throwable) e);
        }
    }

    public Socket createSocket() {
        return new Socket();
    }

    public void disconnect(int i, Exception exc) {
        shutdown(i, exc);
        if ((exc != null || i == 18) && this.lastConnectedTime != 0) {
            sinkdownHost(exc);
        }
    }

    public String getChallenge() {
        return this.challenge;
    }

    /* access modifiers changed from: 0000 */
    public Fallback getFallback(final String str) {
        Fallback fallbacksByHost = HostManager.getInstance().getFallbacksByHost(str, false);
        if (!fallbacksByHost.isEffective()) {
            TaskExecutor.execute((Runnable) new Runnable() {
                public void run() {
                    HostManager.getInstance().getFallbacksByHost(str, true);
                }
            });
        }
        return fallbacksByHost;
    }

    public String getHost() {
        return this.connectedHost;
    }

    /* access modifiers changed from: protected */
    public synchronized void initConnection() throws XMPPException, IOException {
    }

    public void notifyConnectionError(final int i, final Exception exc) {
        this.pushService.executeJob(new Job(2) {
            public String getDesc() {
                StringBuilder sb = new StringBuilder();
                sb.append("shutdown the connection. ");
                sb.append(i);
                sb.append(", ");
                sb.append(exc);
                return sb.toString();
            }

            public void process() {
                SocketConnection.this.pushService.disconnect(i, exc);
            }
        });
    }

    public void ping(boolean z) throws XMPPException {
        final long currentTimeMillis = System.currentTimeMillis();
        sendPing(z);
        if (!z) {
            this.pushService.executeJobDelayed(new Job(13) {
                public String getDesc() {
                    StringBuilder sb = new StringBuilder();
                    sb.append("check the ping-pong.");
                    sb.append(currentTimeMillis);
                    return sb.toString();
                }

                public void process() {
                    Thread.yield();
                    if (SocketConnection.this.isConnected() && !SocketConnection.this.isReadAlive(currentTimeMillis)) {
                        SocketConnection.this.pushService.disconnect(22, null);
                    }
                }
            }, 10000);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void sendPing(boolean z) throws XMPPException;

    /* access modifiers changed from: protected */
    public synchronized void shutdown(int i, Exception exc) {
        if (getConnectionStatus() != 2) {
            setConnectionStatus(2, i, exc);
            this.challenge = "";
            try {
                this.socket.close();
            } catch (Throwable unused) {
            }
            this.lastPingSent = 0;
            this.lastPingReceived = 0;
        }
    }

    /* access modifiers changed from: protected */
    public void sinkdownHost(Exception exc) {
        if (SystemClock.elapsedRealtime() - this.lastConnectedTime >= 300000) {
            this.curShortConnCount = 0;
        } else if (Network.hasNetwork(this.pushService)) {
            this.curShortConnCount++;
            if (this.curShortConnCount >= 2) {
                String host = getHost();
                StringBuilder sb = new StringBuilder();
                sb.append("max short conn time reached, sink down current host:");
                sb.append(host);
                MyLog.w(sb.toString());
                sinkdownHost(host, 0, exc);
                this.curShortConnCount = 0;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void sinkdownHost(String str, long j, Exception exc) {
        Fallback fallbacksByHost = HostManager.getInstance().getFallbacksByHost(ConnectionConfiguration.getXmppServerHost(), false);
        if (fallbacksByHost != null) {
            fallbacksByHost.failedHost(str, j, 0, exc);
            HostManager.getInstance().persist();
        }
    }

    public void updateLastReceived() {
        this.lastPingReceived = SystemClock.elapsedRealtime();
    }

    public void updateLastSent() {
        this.lastPingSent = SystemClock.elapsedRealtime();
    }
}
