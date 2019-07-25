package com.xiaomi.measite.smack;

import com.xiaomi.channel.commonutils.android.SystemUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.slim.Blob;
import com.xiaomi.smack.Connection;
import com.xiaomi.smack.ConnectionListener;
import com.xiaomi.smack.PacketListener;
import com.xiaomi.smack.debugger.SmackDebugger;
import com.xiaomi.smack.filter.PacketFilter;
import com.xiaomi.smack.packet.Packet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AndroidDebugger implements SmackDebugger {
    public static boolean printInterpreted;
    private final String TAG = "[Slim] ";
    private ConnectionListener connListener = null;
    /* access modifiers changed from: private */
    public Connection connection = null;
    /* access modifiers changed from: private */
    public SimpleDateFormat dateFormatter = new SimpleDateFormat("hh:mm:ss aaa");
    private Listener readListener = null;
    private Listener writeListener = null;

    class Listener implements PacketListener, PacketFilter {
        String rcvOrSent;

        Listener(boolean z) {
            this.rcvOrSent = z ? " RCV " : " Sent ";
        }

        public boolean accept(Packet packet) {
            return true;
        }

        public void process(Blob blob) {
            if (AndroidDebugger.printInterpreted) {
                StringBuilder sb = new StringBuilder();
                sb.append("[Slim] ");
                sb.append(AndroidDebugger.this.dateFormatter.format(new Date()));
                sb.append(this.rcvOrSent);
                sb.append(blob.toString());
                MyLog.v(sb.toString());
                return;
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append("[Slim] ");
            sb2.append(AndroidDebugger.this.dateFormatter.format(new Date()));
            sb2.append(this.rcvOrSent);
            sb2.append(" Blob [");
            sb2.append(blob.getCmd());
            sb2.append(",");
            sb2.append(blob.getChannelId());
            sb2.append(",");
            sb2.append(blob.getPacketID());
            sb2.append("]");
            MyLog.v(sb2.toString());
        }

        public void processPacket(Packet packet) {
            if (AndroidDebugger.printInterpreted) {
                StringBuilder sb = new StringBuilder();
                sb.append("[Slim] ");
                sb.append(AndroidDebugger.this.dateFormatter.format(new Date()));
                sb.append(this.rcvOrSent);
                sb.append(" PKT ");
                sb.append(packet.toXML());
                MyLog.v(sb.toString());
                return;
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append("[Slim] ");
            sb2.append(AndroidDebugger.this.dateFormatter.format(new Date()));
            sb2.append(this.rcvOrSent);
            sb2.append(" PKT [");
            sb2.append(packet.getChannelId());
            sb2.append(",");
            sb2.append(packet.getPacketID());
            sb2.append("]");
            MyLog.v(sb2.toString());
        }
    }

    static {
        boolean z = true;
        if (SystemUtils.getMIUIType() != 1) {
            z = false;
        }
        printInterpreted = z;
    }

    public AndroidDebugger(Connection connection2) {
        this.connection = connection2;
        createDebug();
    }

    private void createDebug() {
        this.readListener = new Listener(true);
        this.writeListener = new Listener(false);
        this.connection.addPacketListener(this.readListener, this.readListener);
        this.connection.addPacketSendingListener(this.writeListener, this.writeListener);
        this.connListener = new ConnectionListener() {
            public void connectionClosed(Connection connection, int i, Exception exc) {
                StringBuilder sb = new StringBuilder();
                sb.append("[Slim] ");
                sb.append(AndroidDebugger.this.dateFormatter.format(new Date()));
                sb.append(" Connection closed (");
                sb.append(AndroidDebugger.this.connection.hashCode());
                sb.append(")");
                MyLog.v(sb.toString());
            }

            public void connectionStarted(Connection connection) {
                StringBuilder sb = new StringBuilder();
                sb.append("[Slim] ");
                sb.append(AndroidDebugger.this.dateFormatter.format(new Date()));
                sb.append(" Connection started (");
                sb.append(AndroidDebugger.this.connection.hashCode());
                sb.append(")");
                MyLog.v(sb.toString());
            }

            public void reconnectionFailed(Connection connection, Exception exc) {
                StringBuilder sb = new StringBuilder();
                sb.append("[Slim] ");
                sb.append(AndroidDebugger.this.dateFormatter.format(new Date()));
                sb.append(" Reconnection failed due to an exception (");
                sb.append(AndroidDebugger.this.connection.hashCode());
                sb.append(")");
                MyLog.v(sb.toString());
                exc.printStackTrace();
            }

            public void reconnectionSuccessful(Connection connection) {
                StringBuilder sb = new StringBuilder();
                sb.append("[Slim] ");
                sb.append(AndroidDebugger.this.dateFormatter.format(new Date()));
                sb.append(" Connection reconnected (");
                sb.append(AndroidDebugger.this.connection.hashCode());
                sb.append(")");
                MyLog.v(sb.toString());
            }
        };
    }
}
