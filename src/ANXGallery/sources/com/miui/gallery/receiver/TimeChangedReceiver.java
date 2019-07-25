package com.miui.gallery.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.miui.gallery.util.GalleryDateUtils;

public class TimeChangedReceiver extends BroadcastReceiver {
    /* JADX WARNING: Removed duplicated region for block: B:17:0x003b  */
    /* JADX WARNING: Removed duplicated region for block: B:19:? A[RETURN, SYNTHETIC] */
    public void onReceive(Context context, Intent intent) {
        char c;
        String action = intent.getAction();
        int hashCode = action.hashCode();
        if (hashCode == 502473491) {
            if (action.equals("android.intent.action.TIMEZONE_CHANGED")) {
                c = 2;
                switch (c) {
                    case 0:
                    case 1:
                    case 2:
                        break;
                }
            }
        } else if (hashCode == 505380757) {
            if (action.equals("android.intent.action.TIME_SET")) {
                c = 0;
                switch (c) {
                    case 0:
                    case 1:
                    case 2:
                        break;
                }
            }
        } else if (hashCode == 1041332296 && action.equals("android.intent.action.DATE_CHANGED")) {
            c = 1;
            switch (c) {
                case 0:
                case 1:
                case 2:
                    GalleryDateUtils.invalidateCache();
                    return;
                default:
                    return;
            }
        }
        c = 65535;
        switch (c) {
            case 0:
            case 1:
            case 2:
                break;
        }
    }
}
