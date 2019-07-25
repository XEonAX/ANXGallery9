package com.miui.gallery.permission.core;

import android.app.Activity;
import android.content.Context;
import android.os.Build.VERSION;
import android.support.v4.app.ActivityCompat;
import android.text.TextUtils;
import java.util.ArrayList;

public class PermissionUtils {
    public static boolean checkPermission(Activity activity, String str) {
        boolean z = true;
        if (!supportRuntimePermissionCheck()) {
            return true;
        }
        if (ActivityCompat.checkSelfPermission(activity, str) != 0) {
            z = false;
        }
        return z;
    }

    public static boolean checkPermission(Context context, String str) {
        boolean z = true;
        if (!supportRuntimePermissionCheck()) {
            return true;
        }
        if (ActivityCompat.checkSelfPermission(context, str) != 0) {
            z = false;
        }
        return z;
    }

    public static String[] getUngrantedPermissions(Activity activity, String[] strArr) {
        if (!supportRuntimePermissionCheck() || strArr == null || strArr.length <= 0) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (String str : strArr) {
            if (!TextUtils.isEmpty(str) && !checkPermission(activity, str)) {
                arrayList.add(str);
            }
        }
        if (arrayList.isEmpty()) {
            return new String[0];
        }
        String[] strArr2 = new String[arrayList.size()];
        arrayList.toArray(strArr2);
        return strArr2;
    }

    public static void requestPermissions(Activity activity, String[] strArr, int i) {
        if (supportRuntimePermissionCheck() && !activity.isFinishing() && !activity.isDestroyed()) {
            ActivityCompat.requestPermissions(activity, strArr, i);
        }
    }

    private static boolean supportRuntimePermissionCheck() {
        return VERSION.SDK_INT >= 23;
    }
}
