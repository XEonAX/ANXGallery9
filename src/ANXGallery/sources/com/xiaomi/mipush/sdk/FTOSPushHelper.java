package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.os.SystemClock;
import com.xiaomi.channel.commonutils.logger.MyLog;

public class FTOSPushHelper {
    private static long mLastTime;
    private static volatile boolean mNeedRegister;

    public static void doInNetworkChange(Context context) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        if (!getNeedRegister()) {
            return;
        }
        if (mLastTime <= 0 || mLastTime + 300000 <= elapsedRealtime) {
            mLastTime = elapsedRealtime;
            registerFTOSAssemblePush(context);
        }
    }

    public static boolean getNeedRegister() {
        return mNeedRegister;
    }

    private static void registerFTOSAssemblePush(Context context) {
        AbstractPushManager manager = AssemblePushCollectionsManager.getInstance(context).getManager(AssemblePush.ASSEMBLE_PUSH_FTOS);
        if (manager != null) {
            MyLog.w("ASSEMBLE_PUSH :  register fun touch os when network change!");
            manager.register();
        }
    }
}
