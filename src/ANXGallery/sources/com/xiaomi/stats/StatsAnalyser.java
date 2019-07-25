package com.xiaomi.stats;

import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.xiaomi.push.thrift.ChannelStatsType;
import com.xiaomi.smack.ConnectionHelper;
import com.xiaomi.smack.XMPPException;
import java.net.UnknownHostException;

final class StatsAnalyser {

    static class TypeWraper {
        String annotation;
        ChannelStatsType type;

        TypeWraper() {
        }
    }

    private static void checkNull(Exception exc) {
        if (exc == null) {
            throw new NullPointerException();
        }
    }

    /* JADX WARNING: type inference failed for: r4v1, types: [java.lang.Throwable, java.lang.Object] */
    /* JADX WARNING: type inference failed for: r4v6, types: [java.lang.Throwable] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 1 */
    static TypeWraper fromBind(Exception exc) {
        checkNull(exc);
        if (exc instanceof XMPPException) {
            XMPPException xMPPException = (XMPPException) exc;
            if (xMPPException.getWrappedThrowable() != null) {
                exc = xMPPException.getWrappedThrowable();
            }
        }
        TypeWraper typeWraper = new TypeWraper();
        String message = exc.getMessage();
        if (exc.getCause() != null) {
            message = exc.getCause().getMessage();
        }
        int asErrorCode = ConnectionHelper.asErrorCode(exc);
        StringBuilder sb = new StringBuilder();
        sb.append(exc.getClass().getSimpleName());
        sb.append(":");
        sb.append(message);
        String sb2 = sb.toString();
        if (asErrorCode == 105) {
            typeWraper.type = ChannelStatsType.BIND_TCP_READ_TIMEOUT;
        } else if (asErrorCode == 199) {
            typeWraper.type = ChannelStatsType.BIND_TCP_ERR;
        } else if (asErrorCode != 499) {
            switch (asErrorCode) {
                case BaiduSceneResult.CHURCH /*109*/:
                    typeWraper.type = ChannelStatsType.BIND_TCP_CONNRESET;
                    break;
                case BaiduSceneResult.CASTLE /*110*/:
                    typeWraper.type = ChannelStatsType.BIND_TCP_BROKEN_PIPE;
                    break;
                default:
                    typeWraper.type = ChannelStatsType.BIND_XMPP_ERR;
                    break;
            }
        } else {
            typeWraper.type = ChannelStatsType.BIND_BOSH_ERR;
            if (message.startsWith("Terminal binding condition encountered: item-not-found")) {
                typeWraper.type = ChannelStatsType.BIND_BOSH_ITEM_NOT_FOUND;
            }
        }
        if (typeWraper.type == ChannelStatsType.BIND_TCP_ERR || typeWraper.type == ChannelStatsType.BIND_XMPP_ERR || typeWraper.type == ChannelStatsType.BIND_BOSH_ERR) {
            typeWraper.annotation = sb2;
        }
        return typeWraper;
    }

    /* JADX WARNING: type inference failed for: r5v1, types: [java.lang.Throwable, java.lang.Object] */
    /* JADX WARNING: type inference failed for: r5v9, types: [java.lang.Throwable] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 1 */
    static TypeWraper fromConnectionException(Exception exc) {
        checkNull(exc);
        if (exc instanceof XMPPException) {
            XMPPException xMPPException = (XMPPException) exc;
            if (xMPPException.getWrappedThrowable() != null) {
                exc = xMPPException.getWrappedThrowable();
            }
        }
        TypeWraper typeWraper = new TypeWraper();
        String message = exc.getMessage();
        if (exc.getCause() != null) {
            message = exc.getCause().getMessage();
        }
        int asErrorCode = ConnectionHelper.asErrorCode(exc);
        StringBuilder sb = new StringBuilder();
        sb.append(exc.getClass().getSimpleName());
        sb.append(":");
        sb.append(message);
        String sb2 = sb.toString();
        if (asErrorCode != 0) {
            typeWraper.type = ChannelStatsType.findByValue(ChannelStatsType.CONN_SUCCESS.getValue() + asErrorCode);
            if (typeWraper.type == ChannelStatsType.CONN_BOSH_ERR) {
                Throwable cause = exc.getCause();
                if (cause != null && (cause instanceof UnknownHostException)) {
                    typeWraper.type = ChannelStatsType.CONN_BOSH_UNKNOWNHOST;
                }
            }
        } else {
            typeWraper.type = ChannelStatsType.CONN_XMPP_ERR;
        }
        if (typeWraper.type == ChannelStatsType.CONN_TCP_ERR_OTHER || typeWraper.type == ChannelStatsType.CONN_XMPP_ERR || typeWraper.type == ChannelStatsType.CONN_BOSH_ERR) {
            typeWraper.annotation = sb2;
        }
        return typeWraper;
    }

    /* JADX WARNING: type inference failed for: r4v1, types: [java.lang.Throwable, java.lang.Object] */
    /* JADX WARNING: type inference failed for: r4v6, types: [java.lang.Throwable] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 1 */
    static TypeWraper fromDisconnectEx(Exception exc) {
        checkNull(exc);
        if (exc instanceof XMPPException) {
            XMPPException xMPPException = (XMPPException) exc;
            if (xMPPException.getWrappedThrowable() != null) {
                exc = xMPPException.getWrappedThrowable();
            }
        }
        TypeWraper typeWraper = new TypeWraper();
        String message = exc.getMessage();
        int asErrorCode = ConnectionHelper.asErrorCode(exc);
        StringBuilder sb = new StringBuilder();
        sb.append(exc.getClass().getSimpleName());
        sb.append(":");
        sb.append(message);
        String sb2 = sb.toString();
        if (asErrorCode == 105) {
            typeWraper.type = ChannelStatsType.CHANNEL_TCP_READTIMEOUT;
        } else if (asErrorCode == 199) {
            typeWraper.type = ChannelStatsType.CHANNEL_TCP_ERR;
        } else if (asErrorCode != 499) {
            switch (asErrorCode) {
                case BaiduSceneResult.CHURCH /*109*/:
                    typeWraper.type = ChannelStatsType.CHANNEL_TCP_CONNRESET;
                    break;
                case BaiduSceneResult.CASTLE /*110*/:
                    typeWraper.type = ChannelStatsType.CHANNEL_TCP_BROKEN_PIPE;
                    break;
                default:
                    typeWraper.type = ChannelStatsType.CHANNEL_XMPPEXCEPTION;
                    break;
            }
        } else {
            typeWraper.type = ChannelStatsType.CHANNEL_BOSH_EXCEPTION;
            if (message.startsWith("Terminal binding condition encountered: item-not-found")) {
                typeWraper.type = ChannelStatsType.CHANNEL_BOSH_ITEMNOTFIND;
            }
        }
        if (typeWraper.type == ChannelStatsType.CHANNEL_TCP_ERR || typeWraper.type == ChannelStatsType.CHANNEL_XMPPEXCEPTION || typeWraper.type == ChannelStatsType.CHANNEL_BOSH_EXCEPTION) {
            typeWraper.annotation = sb2;
        }
        return typeWraper;
    }

    /* JADX WARNING: type inference failed for: r4v1, types: [java.lang.Throwable, java.lang.Object] */
    /* JADX WARNING: type inference failed for: r4v7, types: [java.lang.Throwable] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 1 */
    static TypeWraper fromGslbException(Exception exc) {
        checkNull(exc);
        if (exc instanceof XMPPException) {
            XMPPException xMPPException = (XMPPException) exc;
            if (xMPPException.getWrappedThrowable() != null) {
                exc = xMPPException.getWrappedThrowable();
            }
        }
        TypeWraper typeWraper = new TypeWraper();
        String message = exc.getMessage();
        if (exc.getCause() != null) {
            message = exc.getCause().getMessage();
        }
        StringBuilder sb = new StringBuilder();
        sb.append(exc.getClass().getSimpleName());
        sb.append(":");
        sb.append(message);
        String sb2 = sb.toString();
        int asErrorCode = ConnectionHelper.asErrorCode(exc);
        if (asErrorCode != 0) {
            typeWraper.type = ChannelStatsType.findByValue(ChannelStatsType.GSLB_REQUEST_SUCCESS.getValue() + asErrorCode);
        }
        if (typeWraper.type == null) {
            typeWraper.type = ChannelStatsType.GSLB_TCP_ERR_OTHER;
        }
        if (typeWraper.type == ChannelStatsType.GSLB_TCP_ERR_OTHER) {
            typeWraper.annotation = sb2;
        }
        return typeWraper;
    }
}
