package com.nexstreaming.app.common.util;

import android.os.StatFs;
import android.util.Log;
import java.io.File;

/* compiled from: FreeSpaceChecker */
public final class e {
    public static long a(File file) {
        while (file != null && !file.exists()) {
            file = file.getParentFile();
        }
        if (file == null) {
            return Long.MAX_VALUE;
        }
        try {
            StatFs statFs = new StatFs(file.getAbsolutePath());
            return (((long) statFs.getAvailableBlocks()) - 1) * ((long) statFs.getBlockSize());
        } catch (IllegalArgumentException e) {
            Log.e("FreeSpaceChecker", "KM-1618 : ", e);
            return Long.MAX_VALUE;
        }
    }
}
