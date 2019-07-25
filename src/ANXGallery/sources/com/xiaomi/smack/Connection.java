package com.xiaomi.smack;

import android.util.Pair;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.channel.commonutils.string.MD5;
import com.xiaomi.measite.smack.AndroidDebugger;
import com.xiaomi.push.service.PushClientsManager.ClientLoginInfo;
import com.xiaomi.push.service.PushConstants;
import com.xiaomi.push.service.XMPushService;
import com.xiaomi.slim.Blob;
import com.xiaomi.smack.debugger.SmackDebugger;
import com.xiaomi.smack.filter.PacketFilter;
import com.xiaomi.smack.packet.Packet;
import java.io.Reader;
import java.io.Writer;
import java.util.Collection;
import java.util.LinkedList;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;

public abstract class Connection {
    public static boolean DEBUG_ENABLED;
    private static final AtomicInteger connectionCounter = new AtomicInteger(0);
    protected String challenge = "";
    protected ConnectionConfiguration config;
    protected int connTimes = 0;
    private int connectStatus = 2;
    protected long connectTime = -1;
    protected final int connectionCounterValue = connectionCounter.getAndIncrement();
    private final Collection<ConnectionListener> connectionListeners = new CopyOnWriteArrayList();
    protected String connectionPoint = "";
    protected SmackDebugger debugger = null;
    protected volatile long lastPingReceived = 0;
    protected volatile long lastPingSent = 0;
    private LinkedList<Pair<Integer, Long>> mCachedStatus = new LinkedList<>();
    protected XMPushService mPushService;
    private long readAlive = 0;
    protected final Map<PacketListener, ListenerWrapper> recvListeners = new ConcurrentHashMap();
    protected final Map<PacketListener, ListenerWrapper> sendListeners = new ConcurrentHashMap();
    protected long writeAlive = 0;

    public static class ListenerWrapper {
        private PacketFilter packetFilter;
        private PacketListener packetListener;

        public ListenerWrapper(PacketListener packetListener2, PacketFilter packetFilter2) {
            this.packetListener = packetListener2;
            this.packetFilter = packetFilter2;
        }

        public void notifyListener(Blob blob) {
            this.packetListener.process(blob);
        }

        public void notifyListener(Packet packet) {
            if (this.packetFilter == null || this.packetFilter.accept(packet)) {
                this.packetListener.processPacket(packet);
            }
        }
    }

    static {
        DEBUG_ENABLED = false;
        try {
            DEBUG_ENABLED = Boolean.getBoolean("smack.debugEnabled");
        } catch (Exception unused) {
        }
        SmackConfiguration.getVersion();
    }

    protected Connection(XMPushService xMPushService, ConnectionConfiguration connectionConfiguration) {
        this.config = connectionConfiguration;
        this.mPushService = xMPushService;
        initDebugger();
    }

    private void addStatus(int i) {
        synchronized (this.mCachedStatus) {
            if (i == 1) {
                try {
                    this.mCachedStatus.clear();
                } catch (Throwable th) {
                    throw th;
                }
            } else {
                this.mCachedStatus.add(new Pair(Integer.valueOf(i), Long.valueOf(System.currentTimeMillis())));
                if (this.mCachedStatus.size() > 6) {
                    this.mCachedStatus.remove(0);
                }
            }
        }
    }

    private String getDesc(int i) {
        return i == 1 ? "connected" : i == 0 ? "connecting" : i == 2 ? "disconnected" : "unknown";
    }

    public void addConnectionListener(ConnectionListener connectionListener) {
        if (connectionListener != null && !this.connectionListeners.contains(connectionListener)) {
            this.connectionListeners.add(connectionListener);
        }
    }

    public void addPacketListener(PacketListener packetListener, PacketFilter packetFilter) {
        if (packetListener != null) {
            this.recvListeners.put(packetListener, new ListenerWrapper(packetListener, packetFilter));
            return;
        }
        throw new NullPointerException("Packet listener is null.");
    }

    public void addPacketSendingListener(PacketListener packetListener, PacketFilter packetFilter) {
        if (packetListener != null) {
            this.sendListeners.put(packetListener, new ListenerWrapper(packetListener, packetFilter));
            return;
        }
        throw new NullPointerException("Packet listener is null.");
    }

    public abstract void batchSend(Blob[] blobArr) throws XMPPException;

    public abstract void bind(ClientLoginInfo clientLoginInfo) throws XMPPException;

    public void clearCachedStatus() {
        synchronized (this.mCachedStatus) {
            this.mCachedStatus.clear();
        }
    }

    public abstract void disconnect(int i, Exception exc);

    public ConnectionConfiguration getConfiguration() {
        return this.config;
    }

    public int getConnTryTimes() {
        return this.connTimes;
    }

    public String getConnectionPoint() {
        return this.config.getConnectionPoint();
    }

    public int getConnectionStatus() {
        return this.connectStatus;
    }

    public String getHost() {
        return this.config.getHost();
    }

    public long getLastPingRecv() {
        return this.lastPingReceived;
    }

    /* access modifiers changed from: protected */
    public void initDebugger() {
        String str;
        if (this.config.isDebuggerEnabled() && this.debugger == null) {
            Class cls = null;
            try {
                str = System.getProperty("smack.debuggerClass");
            } catch (Throwable unused) {
                str = null;
            }
            if (str != null) {
                try {
                    cls = Class.forName(str);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (cls == null) {
                this.debugger = new AndroidDebugger(this);
                return;
            }
            try {
                this.debugger = (SmackDebugger) cls.getConstructor(new Class[]{Connection.class, Writer.class, Reader.class}).newInstance(new Object[]{this});
            } catch (Exception e2) {
                throw new IllegalArgumentException("Can't initialize the configured debugger!", e2);
            }
        }
    }

    public boolean isBinaryConnection() {
        return false;
    }

    public boolean isConnected() {
        return this.connectStatus == 1;
    }

    public boolean isConnecting() {
        return this.connectStatus == 0;
    }

    public synchronized boolean isReadAlive() {
        return System.currentTimeMillis() - this.readAlive < ((long) SmackConfiguration.getCheckAliveInterval());
    }

    public synchronized boolean isReadAlive(long j) {
        return this.readAlive >= j;
    }

    public synchronized boolean isWriteAlive() {
        boolean z;
        z = true;
        if (System.currentTimeMillis() - this.writeAlive >= ((long) (SmackConfiguration.getCheckAliveInterval() << 1))) {
            z = false;
        }
        return z;
    }

    public abstract void ping(boolean z) throws XMPPException;

    public void removeConnectionListener(ConnectionListener connectionListener) {
        this.connectionListeners.remove(connectionListener);
    }

    public abstract void send(Blob blob) throws XMPPException;

    public abstract void sendPacket(Packet packet) throws XMPPException;

    public synchronized void setChallenge(String str) {
        if (this.connectStatus == 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("setChallenge hash = ");
            sb.append(MD5.MD5_32(str).substring(0, 8));
            MyLog.w(sb.toString());
            this.challenge = str;
            setConnectionStatus(1, 0, null);
        } else {
            MyLog.w("ignore setChallenge because connection was disconnected");
        }
    }

    public void setConnectionStatus(int i, int i2, Exception exc) {
        if (i != this.connectStatus) {
            MyLog.w(String.format("update the connection status. %1$s -> %2$s : %3$s ", new Object[]{getDesc(this.connectStatus), getDesc(i), PushConstants.getErrorDesc(i2)}));
        }
        if (Network.hasNetwork(this.mPushService)) {
            addStatus(i);
        }
        if (i == 1) {
            this.mPushService.removeJobs(10);
            if (this.connectStatus != 0) {
                MyLog.w("try set connected while not connecting.");
            }
            this.connectStatus = i;
            for (ConnectionListener reconnectionSuccessful : this.connectionListeners) {
                reconnectionSuccessful.reconnectionSuccessful(this);
            }
        } else if (i == 0) {
            if (this.connectStatus != 2) {
                MyLog.w("try set connecting while not disconnected.");
            }
            this.connectStatus = i;
            for (ConnectionListener connectionStarted : this.connectionListeners) {
                connectionStarted.connectionStarted(this);
            }
        } else if (i == 2) {
            this.mPushService.removeJobs(10);
            if (this.connectStatus == 0) {
                for (ConnectionListener reconnectionFailed : this.connectionListeners) {
                    reconnectionFailed.reconnectionFailed(this, exc == null ? new CancellationException("disconnect while connecting") : exc);
                }
            } else if (this.connectStatus == 1) {
                for (ConnectionListener connectionClosed : this.connectionListeners) {
                    connectionClosed.connectionClosed(this, i2, exc);
                }
            }
            this.connectStatus = i;
        }
    }

    public synchronized void setReadAlive() {
        this.readAlive = System.currentTimeMillis();
    }

    public abstract void unbind(String str, String str2) throws XMPPException;
}
