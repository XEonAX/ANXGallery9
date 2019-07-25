package com.miui.internal;

import android.content.ContentResolver;
import android.content.Context;
import android.os.Build.VERSION;
import android.os.UserHandle;
import miui.securityspace.CrossUserUtils;

public class CrossUserHelper {
    public static boolean checkUidPermission(Context context, String str) {
        return CrossUserUtils.checkUidPermission(context, str);
    }

    public static ContentResolver getContentResolver(Context context, int i) {
        if (support()) {
            return context.getContentResolverForUser(new UserHandle(i));
        }
        throw new UnsupportedOperationException("not support multi users");
    }

    public static boolean support() {
        return VERSION.SDK_INT > 19;
    }
}
