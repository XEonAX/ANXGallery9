package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;

public class CrashStorage {
    private static final Object mCrashFileLock = new Object();
    private static volatile CrashStorage sInstance;
    private Context mContext;

    private CrashStorage(Context context) {
        this.mContext = context;
    }

    private File getCrashFileBySummary(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(this.mContext.getFilesDir());
        sb.append("/crash");
        File file = new File(sb.toString());
        if (!file.exists()) {
            file.mkdirs();
            return null;
        }
        File[] listFiles = file.listFiles();
        for (int i = 0; i < listFiles.length; i++) {
            if (listFiles[i].isFile() && listFiles[i].getName().startsWith(str)) {
                return listFiles[i];
            }
        }
        return null;
    }

    public static CrashStorage getInstance(Context context) {
        if (sInstance == null) {
            synchronized (CrashStorage.class) {
                if (sInstance == null) {
                    sInstance = new CrashStorage(context);
                }
            }
        }
        return sInstance;
    }

    public ArrayList<File> getAllCrashFile() {
        ArrayList<File> arrayList = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append(this.mContext.getFilesDir());
        sb.append("/crash");
        File file = new File(sb.toString());
        if (!file.exists()) {
            file.mkdirs();
            return arrayList;
        }
        File[] listFiles = file.listFiles();
        for (int i = 0; i < listFiles.length; i++) {
            String[] split = listFiles[i].getName().split(":");
            if (split.length >= 2 && Integer.parseInt(split[1]) >= 1 && listFiles[i].isFile()) {
                arrayList.add(listFiles[i]);
            }
        }
        return arrayList;
    }

    public String getCrashSummary(File file) {
        if (file == null) {
            return "";
        }
        String[] split = file.getName().split(":");
        return split.length != 2 ? "" : split[0];
    }

    public void writeCrash2File(String str, String str2) {
        if (!TextUtils.isEmpty(str2) && !TextUtils.isEmpty(str)) {
            synchronized (mCrashFileLock) {
                File crashFileBySummary = getCrashFileBySummary(str2);
                if (crashFileBySummary != null) {
                    String[] split = crashFileBySummary.getName().split(":");
                    if (split.length >= 2) {
                        int parseInt = Integer.parseInt(split[1]) + 1;
                        StringBuilder sb = new StringBuilder();
                        sb.append(this.mContext.getFilesDir());
                        sb.append("/crash");
                        sb.append("/");
                        sb.append(str2);
                        sb.append(":");
                        sb.append(String.valueOf(parseInt));
                        crashFileBySummary.renameTo(new File(sb.toString()));
                    }
                } else {
                    FileOutputStream fileOutputStream = null;
                    try {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(this.mContext.getFilesDir());
                        sb2.append("/crash");
                        sb2.append("/");
                        sb2.append(str2);
                        sb2.append(":");
                        sb2.append("1");
                        FileOutputStream fileOutputStream2 = new FileOutputStream(new File(sb2.toString()));
                        try {
                            fileOutputStream2.write(str.getBytes());
                            fileOutputStream2.flush();
                            IOUtils.closeQuietly(fileOutputStream2);
                        } catch (Exception e) {
                            e = e;
                            fileOutputStream = fileOutputStream2;
                            try {
                                MyLog.e((Throwable) e);
                                IOUtils.closeQuietly(fileOutputStream);
                            } catch (Throwable th) {
                                th = th;
                                IOUtils.closeQuietly(fileOutputStream);
                                throw th;
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            fileOutputStream = fileOutputStream2;
                            IOUtils.closeQuietly(fileOutputStream);
                            throw th;
                        }
                    } catch (Exception e2) {
                        e = e2;
                        MyLog.e((Throwable) e);
                        IOUtils.closeQuietly(fileOutputStream);
                    }
                }
            }
        }
    }
}
