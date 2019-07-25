package com.xiaomi.push.service;

import android.content.Context;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Build;
import android.os.Build.VERSION;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.xiaomi.channel.commonutils.android.SystemUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.network.Network;
import com.xiaomi.network.Fallback;
import com.xiaomi.network.HostFilter;
import com.xiaomi.network.HostManager;
import com.xiaomi.network.HostManager.HostManagerFactory;
import com.xiaomi.network.HostManager.HttpGet;
import com.xiaomi.push.protobuf.ChannelConfig.PushServiceConfig;
import com.xiaomi.push.protobuf.ChannelMessage.PushServiceConfigMsg;
import com.xiaomi.push.service.ServiceConfig.Listener;
import com.xiaomi.push.thrift.ChannelStatsType;
import com.xiaomi.smack.Connection;
import com.xiaomi.smack.util.StringUtils;
import com.xiaomi.stats.StatsHandler;
import com.xiaomi.stats.StatsHelper;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;

public class PushHostManagerFactory extends Listener implements HostManagerFactory {
    private long lastFetchTime;
    private XMPushService pushService;

    static class GslbHttpGet implements HttpGet {
        GslbHttpGet() {
        }

        public String doGet(String str) throws IOException {
            Builder buildUpon = Uri.parse(str).buildUpon();
            buildUpon.appendQueryParameter("sdkver", String.valueOf(38));
            buildUpon.appendQueryParameter("osver", String.valueOf(VERSION.SDK_INT));
            StringBuilder sb = new StringBuilder();
            sb.append(Build.MODEL);
            sb.append(":");
            sb.append(VERSION.INCREMENTAL);
            buildUpon.appendQueryParameter("os", StringUtils.escapeForXML(sb.toString()));
            buildUpon.appendQueryParameter("mi", String.valueOf(SystemUtils.getMIUIType()));
            String builder = buildUpon.toString();
            StringBuilder sb2 = new StringBuilder();
            sb2.append("fetch bucket from : ");
            sb2.append(builder);
            MyLog.v(sb2.toString());
            URL url = new URL(builder);
            int port = url.getPort() == -1 ? 80 : url.getPort();
            try {
                long currentTimeMillis = System.currentTimeMillis();
                String downloadXml = Network.downloadXml(SystemUtils.getContext(), url);
                long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
                StringBuilder sb3 = new StringBuilder();
                sb3.append(url.getHost());
                sb3.append(":");
                sb3.append(port);
                StatsHelper.statsGslb(sb3.toString(), (int) currentTimeMillis2, null);
                return downloadXml;
            } catch (IOException e) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append(url.getHost());
                sb4.append(":");
                sb4.append(port);
                StatsHelper.statsGslb(sb4.toString(), -1, e);
                throw e;
            }
        }
    }

    static class PushHostManager extends HostManager {
        protected PushHostManager(Context context, HostFilter hostFilter, HttpGet httpGet, String str) {
            super(context, hostFilter, httpGet, str);
        }

        /* access modifiers changed from: protected */
        public String getRemoteFallbackJSON(ArrayList<String> arrayList, String str, String str2, boolean z) throws IOException {
            try {
                if (StatsHandler.getInstance().isAllowStats()) {
                    str2 = ServiceConfig.getDeviceUUID();
                }
                return super.getRemoteFallbackJSON(arrayList, str, str2, z);
            } catch (IOException e) {
                StatsHelper.stats(0, ChannelStatsType.GSLB_ERR.getValue(), 1, null, Network.hasNetwork(sAppContext) ? 1 : 0);
                throw e;
            }
        }
    }

    PushHostManagerFactory(XMPushService xMPushService) {
        this.pushService = xMPushService;
    }

    public static void init(XMPushService xMPushService) {
        PushHostManagerFactory pushHostManagerFactory = new PushHostManagerFactory(xMPushService);
        ServiceConfig.getInstance().addListener(pushHostManagerFactory);
        synchronized (HostManager.class) {
            HostManager.setHostManagerFactory(pushHostManagerFactory);
            HostManager.init(xMPushService, null, new GslbHttpGet(), MovieStatUtils.DOWNLOAD_SUCCESS, "push", "2.2");
        }
    }

    public HostManager createHostManager(Context context, HostFilter hostFilter, HttpGet httpGet, String str) {
        return new PushHostManager(context, hostFilter, httpGet, str);
    }

    public void onConfigChange(PushServiceConfig pushServiceConfig) {
    }

    public void onConfigMsgReceive(PushServiceConfigMsg pushServiceConfigMsg) {
        if (pushServiceConfigMsg.hasFetchBucket() && pushServiceConfigMsg.getFetchBucket() && System.currentTimeMillis() - this.lastFetchTime > 3600000) {
            StringBuilder sb = new StringBuilder();
            sb.append("fetch bucket :");
            sb.append(pushServiceConfigMsg.getFetchBucket());
            MyLog.w(sb.toString());
            this.lastFetchTime = System.currentTimeMillis();
            HostManager instance = HostManager.getInstance();
            instance.clear();
            instance.refreshFallbacks();
            Connection currentConnection = this.pushService.getCurrentConnection();
            if (currentConnection != null) {
                Fallback fallbacksByHost = instance.getFallbacksByHost(currentConnection.getConfiguration().getHost());
                if (fallbacksByHost != null) {
                    ArrayList hosts = fallbacksByHost.getHosts();
                    boolean z = true;
                    Iterator it = hosts.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            if (((String) it.next()).equals(currentConnection.getHost())) {
                                z = false;
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                    if (z && !hosts.isEmpty()) {
                        MyLog.w("bucket changed, force reconnect");
                        this.pushService.disconnect(0, null);
                        this.pushService.scheduleConnect(false);
                    }
                }
            }
        }
    }
}
