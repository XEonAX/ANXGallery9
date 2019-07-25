package com.xiaomi.mipush.sdk.stat.util;

import android.os.Build.VERSION;
import android.system.ErrnoException;
import android.system.Os;
import com.xiaomi.channel.commonutils.logger.MyLog;
import java.io.File;

public class FileUtil {
    public static long getFileSize(String str) {
        if (VERSION.SDK_INT < 21) {
            return 0;
        }
        try {
            if (new File(str).exists()) {
                return Os.stat(str).st_size;
            }
            return 0;
        } catch (ErrnoException e) {
            MyLog.e((Throwable) e);
            return 0;
        }
    }
}
