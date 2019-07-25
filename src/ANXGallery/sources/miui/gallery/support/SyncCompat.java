package miui.gallery.support;

import android.annotation.SuppressLint;
import android.content.SyncRequest.Builder;
import android.util.Log;

public class SyncCompat {
    private static volatile Boolean sSupportRequiresCharging;

    @SuppressLint({"NewApi"})
    public static void setRequiresCharging(Builder builder, boolean z) {
        if (sSupportRequiresCharging == null) {
            try {
                builder.setRequiresCharging(z);
                setRequiresCharging(true);
            } catch (NoSuchMethodError e) {
                Log.w("SyncCompat", "setRequiresCharging is not supported", e);
                setRequiresCharging(false);
            }
        } else if (sSupportRequiresCharging.booleanValue()) {
            builder.setRequiresCharging(z);
        }
    }

    private static synchronized void setRequiresCharging(boolean z) {
        synchronized (SyncCompat.class) {
            sSupportRequiresCharging = Boolean.valueOf(z);
        }
    }
}
