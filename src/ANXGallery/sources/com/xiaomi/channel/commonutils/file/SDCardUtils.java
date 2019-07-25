package com.xiaomi.channel.commonutils.file;

import android.os.Environment;
import android.os.StatFs;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import java.io.File;

public class SDCardUtils {
    public static long getSDCardAvailableBytes() {
        if (isSDCardBusy()) {
            return 0;
        }
        File externalStorageDirectory = Environment.getExternalStorageDirectory();
        if (externalStorageDirectory == null || TextUtils.isEmpty(externalStorageDirectory.getPath())) {
            return 0;
        }
        try {
            StatFs statFs = new StatFs(externalStorageDirectory.getPath());
            return ((long) statFs.getBlockSize()) * (((long) statFs.getAvailableBlocks()) - 4);
        } catch (Throwable unused) {
            return 0;
        }
    }

    public static boolean isSDCardBusy() {
        try {
            return true ^ Environment.getExternalStorageState().equals("mounted");
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            return true;
        }
    }

    public static boolean isSDCardFull() {
        return getSDCardAvailableBytes() <= 102400;
    }

    public static boolean isSDCardUnavailable() {
        try {
            return Environment.getExternalStorageState().equals("removed");
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            return true;
        }
    }

    public static boolean isSDCardUseful() {
        return !isSDCardBusy() && !isSDCardFull() && !isSDCardUnavailable();
    }
}
