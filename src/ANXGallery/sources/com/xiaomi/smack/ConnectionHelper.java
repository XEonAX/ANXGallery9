package com.xiaomi.smack;

import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

public class ConnectionHelper {
    public static int asErrorCode(Throwable th) {
        boolean z = th instanceof XMPPException;
        if (z) {
            XMPPException xMPPException = (XMPPException) th;
            if (xMPPException.getWrappedThrowable() != null) {
                th = xMPPException.getWrappedThrowable();
            }
        }
        String message = th.getMessage();
        if (th.getCause() != null) {
            message = th.getCause().getMessage();
        }
        if (th instanceof SocketTimeoutException) {
            return BaiduSceneResult.TEMPLE;
        }
        if (!(th instanceof SocketException)) {
            return th instanceof UnknownHostException ? BaiduSceneResult.GARDEN : z ? 399 : 0;
        }
        if (message.indexOf("Network is unreachable") != -1) {
            return BaiduSceneResult.TAEKWONDO;
        }
        if (message.indexOf("Connection refused") != -1) {
            return BaiduSceneResult.MOUNTAINEERING;
        }
        if (message.indexOf("Connection timed out") != -1) {
            return BaiduSceneResult.TEMPLE;
        }
        if (message.endsWith("EACCES (Permission denied)")) {
            return BaiduSceneResult.SHOOTING;
        }
        if (message.indexOf("Connection reset by peer") != -1) {
            return BaiduSceneResult.CHURCH;
        }
        if (message.indexOf("Broken pipe") != -1) {
            return BaiduSceneResult.CASTLE;
        }
        if (message.indexOf("No route to host") != -1) {
            return BaiduSceneResult.SPORTS_OTHER;
        }
        if (message.endsWith("EINVAL (Invalid argument)")) {
            return BaiduSceneResult.PALACE;
        }
        return 199;
    }
}
