package com.miui.gallery.share;

import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

public class AlbumShareOpenInvitationReceiver extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        if ("com.miui.gallery.intent.action.OPEN_INVIATAION".equals(intent.getAction())) {
            abortBroadcast();
            Intent intent2 = new Intent(context, AlbumShareInvitationPopupActivity.class);
            intent2.setFlags(268435456);
            intent2.putExtras(intent.getExtras() == null ? new Bundle() : intent.getExtras());
            try {
                context.startActivity(intent2);
            } catch (ActivityNotFoundException unused) {
            }
        }
    }
}
