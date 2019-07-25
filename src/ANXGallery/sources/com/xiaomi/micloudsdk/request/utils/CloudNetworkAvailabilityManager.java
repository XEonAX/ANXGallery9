package com.xiaomi.micloudsdk.request.utils;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.xiaomi.micloudsdk.provider.MiCloudSettings;

public class CloudNetworkAvailabilityManager {
    public static synchronized boolean getAvailability(Context context) {
        boolean z;
        synchronized (CloudNetworkAvailabilityManager.class) {
            if (context != null) {
                z = false;
                if (MiCloudSettings.getInt(context, "micloud_network_availability", 0) != 0) {
                    z = true;
                }
            } else {
                throw new IllegalArgumentException("context cannot be null");
            }
        }
        return z;
    }

    private static void sendNetworkAvailabilityChangedBroadcast(Context context, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("sendNetworkAvailabilityChangedBroadcast active: ");
        sb.append(z);
        Log.d("NetworkAvailability", sb.toString());
        Intent intent = new Intent("miui.intent.action.MICLOUD_NETWORK_AVAILABILITY_CHANGED");
        intent.putExtra("active", z);
        context.sendBroadcast(intent);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:14:0x003d, code lost:
        return;
     */
    public static synchronized void setRequestResult(Context context, boolean z) {
        synchronized (CloudNetworkAvailabilityManager.class) {
            if (context == null) {
                Log.d("NetworkAvailability", "context is null, ignore");
                return;
            }
            boolean availability = getAvailability(context);
            if (availability != z) {
                MiCloudSettings.putInt(context, "micloud_network_availability", z ? 1 : 0);
                sendNetworkAvailabilityChangedBroadcast(context, z);
                StringBuilder sb = new StringBuilder();
                sb.append("micloud network state changed from ");
                sb.append(availability);
                sb.append(" to ");
                sb.append(z);
                Log.d("NetworkAvailability", sb.toString());
            }
        }
    }
}
