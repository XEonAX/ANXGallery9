package com.miui.gallery.compat.app;

import android.app.Activity;
import android.os.Build.VERSION;
import android.view.View;
import com.miui.gallery.util.MiscUtil;
import java.util.List;

public abstract class ActivityCompat {

    public interface SharedElementCallback {
        void onSharedElementStart();
    }

    public static void finishAfterTransition(Activity activity) {
        if (VERSION.SDK_INT >= 21) {
            activity.finishAfterTransition();
        } else {
            activity.finish();
        }
    }

    public static boolean isInMultiWindowMode(Activity activity) {
        if (VERSION.SDK_INT >= 24) {
            return activity.isInMultiWindowMode();
        }
        if (VERSION.SDK_INT >= 21) {
            Object invokeSafely = MiscUtil.invokeSafely(activity, "isInMultiWindowMode", null, new Object[0]);
            if (invokeSafely != null && (invokeSafely instanceof Boolean)) {
                return ((Boolean) invokeSafely).booleanValue();
            }
        }
        return false;
    }

    public static void postponeEnterTransition(Activity activity) {
        if (VERSION.SDK_INT >= 21) {
            activity.postponeEnterTransition();
        }
    }

    public static void setEnterSharedElementCallback(Activity activity, final SharedElementCallback sharedElementCallback) {
        if (VERSION.SDK_INT >= 21) {
            activity.setEnterSharedElementCallback(new android.app.SharedElementCallback() {
                public void onSharedElementStart(List<String> list, List<View> list2, List<View> list3) {
                    if (sharedElementCallback != null) {
                        sharedElementCallback.onSharedElementStart();
                    }
                }
            });
        }
    }

    public static void startPostponedEnterTransition(Activity activity) {
        if (VERSION.SDK_INT >= 21) {
            activity.startPostponedEnterTransition();
        }
    }
}
