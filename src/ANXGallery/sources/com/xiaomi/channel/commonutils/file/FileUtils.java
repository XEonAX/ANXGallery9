package com.xiaomi.channel.commonutils.file;

import com.xiaomi.channel.commonutils.logger.MyLog;
import java.io.File;
import java.util.HashMap;

public class FileUtils {
    private static final HashMap<String, String> mFileTypes = new HashMap<>();

    static {
        mFileTypes.put("FFD8FF", "jpg");
        mFileTypes.put("89504E47", "png");
        mFileTypes.put("47494638", "gif");
        mFileTypes.put("474946", "gif");
        mFileTypes.put("424D", "bmp");
    }

    public static long getFolderSize(File file) {
        long j = 0;
        try {
            File[] listFiles = file.listFiles();
            for (int i = 0; i < listFiles.length; i++) {
                j = listFiles[i].isDirectory() ? j + getFolderSize(listFiles[i]) : j + listFiles[i].length();
            }
        } catch (Exception e) {
            MyLog.e((Throwable) e);
        }
        return j;
    }
}
