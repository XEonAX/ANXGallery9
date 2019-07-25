package com.xiaomi.smack;

import com.xiaomi.channel.commonutils.misc.BuildSettings;
import com.xiaomi.channel.commonutils.misc.DebugSwitch;
import java.util.Map;

public class ConnectionConfiguration implements Cloneable {
    public static final String XMPP_SERVER_HOST_ONEBOX = DebugSwitch.sOneboxServerHost;
    public static String XMPP_SERVER_HOST_T = "wcc-ml-test10.bj";
    public static String xmppHost = null;
    private String connectionPoint;
    private boolean debuggerEnabled = Connection.DEBUG_ENABLED;
    private String host;
    private HttpRequestProxy httpProxy;
    private int port;
    private boolean reconnectionAllowed = true;
    private String serviceName;

    public ConnectionConfiguration(Map<String, Integer> map, int i, String str, HttpRequestProxy httpRequestProxy) {
        init(map, i, str, httpRequestProxy);
    }

    public static final String getXmppServerHost() {
        return xmppHost != null ? xmppHost : BuildSettings.IsSandBoxBuild() ? "sandbox.xmpush.xiaomi.com" : BuildSettings.IsOneBoxBuild() ? XMPP_SERVER_HOST_ONEBOX : "app.chat.xiaomi.net";
    }

    private void init(Map<String, Integer> map, int i, String str, HttpRequestProxy httpRequestProxy) {
        this.port = i;
        this.serviceName = str;
        this.httpProxy = httpRequestProxy;
    }

    public static final void setXmppServerHost(String str) {
        xmppHost = str;
    }

    public byte[] getConnectionBlob() {
        return null;
    }

    public String getConnectionPoint() {
        return this.connectionPoint;
    }

    public String getHost() {
        if (this.host == null) {
            this.host = getXmppServerHost();
        }
        return this.host;
    }

    public int getPort() {
        return this.port;
    }

    public boolean isDebuggerEnabled() {
        return this.debuggerEnabled;
    }

    public void setConnectionPoint(String str) {
        this.connectionPoint = str;
    }

    public void setDebuggerEnabled(boolean z) {
        this.debuggerEnabled = z;
    }

    public void setHost(String str) {
        this.host = str;
    }
}
