package com.android.internal;

import android.os.Build.VERSION;
import android.system.ErrnoException;
import android.system.Os;
import android.util.Log;

public class FilesCompat {
    public static int setPermissions(String str, int i, int i2, int i3) {
        if (VERSION.SDK_INT < 21) {
            return FilesUtilsV19.setPermissions(str, i, i2, i3);
        }
        try {
            Os.chmod(str, i);
            if (i2 >= 0 || i3 >= 0) {
                try {
                    Os.chown(str, i2, i3);
                } catch (ErrnoException e) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("chown failed ");
                    sb.append(str);
                    Log.w("FilesCompat", sb.toString(), e);
                    return e.errno;
                }
            }
            return 0;
        } catch (ErrnoException e2) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("chmod failed ");
            sb2.append(str);
            Log.w("FilesCompat", sb2.toString(), e2);
            return e2.errno;
        }
    }
}
