package com.miui.gallery.push;

import android.content.Context;
import com.miui.gallery.util.Log;
import com.xiaomi.mipush.sdk.MiPushCommandMessage;
import com.xiaomi.mipush.sdk.MiPushMessage;
import com.xiaomi.mipush.sdk.PushMessageReceiver;

public class GalleryPushReceiver extends PushMessageReceiver {
    private static final String TAG = "GalleryPushReceiver";

    public void onCommandResult(Context context, MiPushCommandMessage miPushCommandMessage) {
        Log.d(TAG, "onCommandResult: %s", (Object) String.valueOf(miPushCommandMessage));
    }

    public void onNotificationMessageArrived(Context context, MiPushMessage miPushMessage) {
        Log.d(TAG, "onNotificationMessageArrived: %s", (Object) String.valueOf(miPushMessage));
    }

    public void onNotificationMessageClicked(Context context, MiPushMessage miPushMessage) {
        Log.d(TAG, "onNotificationMessageClicked: %s", (Object) String.valueOf(miPushMessage));
    }

    public void onReceivePassThroughMessage(Context context, MiPushMessage miPushMessage) {
        Log.d(TAG, "onReceivePassThroughMessage: %s", (Object) String.valueOf(miPushMessage));
        PushMessageDispatcher.dispatch(context, miPushMessage);
    }

    public void onReceiveRegisterResult(Context context, MiPushCommandMessage miPushCommandMessage) {
        Log.d(TAG, "onReceiveRegisterResult: %s", (Object) String.valueOf(miPushCommandMessage));
        if ("register".equals(miPushCommandMessage.getCommand()) && miPushCommandMessage.getResultCode() == 0) {
            GalleryPushManager.getInstance().setUserAccountAndTopics(context);
        }
    }
}
