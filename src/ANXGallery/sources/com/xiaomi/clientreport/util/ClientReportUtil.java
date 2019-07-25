package com.xiaomi.clientreport.util;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.string.Base64Coder;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import com.xiaomi.clientreport.manager.ClientReportLogicManager;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.util.Arrays;
import java.util.List;

public class ClientReportUtil {
    public static String getEventKeyWithDefault(Context context) {
        String stringValue = SPManager.getInstance(context).getStringValue("sp_client_report_status", "sp_client_report_key", "");
        if (!TextUtils.isEmpty(stringValue)) {
            return stringValue;
        }
        String generateRandomString = XMStringUtils.generateRandomString(20);
        SPManager.getInstance(context).setStringnValue("sp_client_report_status", "sp_client_report_key", generateRandomString);
        return generateRandomString;
    }

    public static String getOs() {
        StringBuilder sb = new StringBuilder();
        sb.append(VERSION.RELEASE);
        sb.append("-");
        sb.append(VERSION.INCREMENTAL);
        return sb.toString();
    }

    public static File[] getReadFileName(Context context, String str) {
        File externalFilesDir = context.getExternalFilesDir(str);
        if (externalFilesDir != null) {
            return externalFilesDir.listFiles(new FilenameFilter() {
                public boolean accept(File file, String str) {
                    return !TextUtils.isEmpty(str) && !str.toLowerCase().endsWith(".lock");
                }
            });
        }
        return null;
    }

    public static boolean isFileCanBeUse(Context context, String str) {
        File file = new File(str);
        long maxFileLength = ClientReportLogicManager.getInstance(context).getConfig().getMaxFileLength();
        if (file.exists()) {
            try {
                if (file.length() > maxFileLength) {
                    return false;
                }
            } catch (Exception e) {
                MyLog.e((Throwable) e);
                return false;
            }
        } else {
            IOUtils.createFileQuietly(file);
        }
        return true;
    }

    public static boolean isSupportXMSFUpload(Context context) {
        boolean z = false;
        try {
            if (context.getApplicationContext().getPackageManager().getPackageInfo("com.xiaomi.xmsf", 0).versionCode >= 108) {
                z = true;
            }
            return z;
        } catch (NameNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:67:0x00f0, code lost:
        if (r7 != null) goto L_0x00f2;
     */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x010f  */
    public static void moveFiles(Context context, String str, String str2) {
        File file;
        RandomAccessFile randomAccessFile;
        FileLock fileLock;
        Throwable e;
        File externalFilesDir = context.getExternalFilesDir(str2);
        if (externalFilesDir != null) {
            if (!externalFilesDir.exists()) {
                externalFilesDir.mkdirs();
            }
            File externalFilesDir2 = context.getExternalFilesDir(str);
            if (externalFilesDir2 != null) {
                if (!externalFilesDir2.exists()) {
                    externalFilesDir2.mkdirs();
                    return;
                }
                File[] listFiles = externalFilesDir2.listFiles(new FilenameFilter() {
                    public boolean accept(File file, String str) {
                        return !TextUtils.isEmpty(str) && !str.toLowerCase().endsWith(".lock");
                    }
                });
                if (listFiles != null && listFiles.length > 0) {
                    long currentTimeMillis = System.currentTimeMillis();
                    FileLock fileLock2 = null;
                    RandomAccessFile randomAccessFile2 = null;
                    File file2 = null;
                    for (File file3 : listFiles) {
                        if (file3 != null) {
                            try {
                                if (!TextUtils.isEmpty(file3.getAbsolutePath())) {
                                    StringBuilder sb = new StringBuilder();
                                    sb.append(file3.getAbsolutePath());
                                    sb.append(".lock");
                                    file = new File(sb.toString());
                                    try {
                                        IOUtils.createFileQuietly(file);
                                        randomAccessFile = new RandomAccessFile(file, "rw");
                                        try {
                                            fileLock = randomAccessFile.getChannel().lock();
                                        } catch (Exception e2) {
                                            Throwable th = e2;
                                            fileLock = fileLock2;
                                            e = th;
                                            try {
                                                MyLog.e(e);
                                                try {
                                                    fileLock.release();
                                                } catch (IOException e3) {
                                                    MyLog.e((Throwable) e3);
                                                }
                                                IOUtils.closeQuietly(randomAccessFile);
                                            } catch (Throwable th2) {
                                                th = th2;
                                                try {
                                                    fileLock.release();
                                                } catch (IOException e4) {
                                                    MyLog.e((Throwable) e4);
                                                }
                                                IOUtils.closeQuietly(randomAccessFile);
                                                if (file != null) {
                                                }
                                                throw th;
                                            }
                                        } catch (Throwable th3) {
                                            th = th3;
                                            fileLock = fileLock2;
                                            fileLock.release();
                                            IOUtils.closeQuietly(randomAccessFile);
                                            if (file != null) {
                                            }
                                            throw th;
                                        }
                                        try {
                                            String absolutePath = externalFilesDir.getAbsolutePath();
                                            StringBuilder sb2 = new StringBuilder();
                                            sb2.append(absolutePath);
                                            sb2.append(File.separator);
                                            sb2.append(file3.getName());
                                            sb2.append(currentTimeMillis);
                                            File file4 = new File(sb2.toString());
                                            try {
                                                IOUtils.copyFile(file3, file4);
                                            } catch (IOException e5) {
                                                e5.printStackTrace();
                                                file3.delete();
                                                file4.delete();
                                            }
                                            file3.delete();
                                            if (fileLock != null && fileLock.isValid()) {
                                                try {
                                                    fileLock.release();
                                                } catch (IOException e6) {
                                                    MyLog.e((Throwable) e6);
                                                }
                                            }
                                            IOUtils.closeQuietly(randomAccessFile);
                                        } catch (Exception e7) {
                                            e = e7;
                                            MyLog.e(e);
                                            if (fileLock != null && fileLock.isValid()) {
                                                fileLock.release();
                                            }
                                            IOUtils.closeQuietly(randomAccessFile);
                                        }
                                    } catch (Exception e8) {
                                        RandomAccessFile randomAccessFile3 = randomAccessFile2;
                                        fileLock = fileLock2;
                                        e = e8;
                                        randomAccessFile = randomAccessFile3;
                                        MyLog.e(e);
                                        fileLock.release();
                                        IOUtils.closeQuietly(randomAccessFile);
                                    } catch (Throwable th4) {
                                        th = th4;
                                        randomAccessFile = randomAccessFile2;
                                        fileLock = fileLock2;
                                        fileLock.release();
                                        IOUtils.closeQuietly(randomAccessFile);
                                        if (file != null) {
                                        }
                                        throw th;
                                    }
                                    file.delete();
                                    fileLock2 = fileLock;
                                    randomAccessFile2 = randomAccessFile;
                                    file2 = file;
                                }
                            } catch (Exception e9) {
                                file = file2;
                                randomAccessFile = randomAccessFile2;
                                fileLock = fileLock2;
                                e = e9;
                                MyLog.e(e);
                                fileLock.release();
                                IOUtils.closeQuietly(randomAccessFile);
                            } catch (Throwable th5) {
                                th = th5;
                                file = file2;
                                randomAccessFile = randomAccessFile2;
                                fileLock = fileLock2;
                                if (fileLock != null && fileLock.isValid()) {
                                    fileLock.release();
                                }
                                IOUtils.closeQuietly(randomAccessFile);
                                if (file != null) {
                                    file.delete();
                                }
                                throw th;
                            }
                        }
                        if (fileLock2 != null && fileLock2.isValid()) {
                            try {
                                fileLock2.release();
                            } catch (IOException e10) {
                                MyLog.e((Throwable) e10);
                            }
                        }
                        IOUtils.closeQuietly(randomAccessFile2);
                        if (file2 != null) {
                            file2.delete();
                        }
                    }
                }
            }
        }
    }

    @TargetApi(9)
    public static byte[] parseKey(String str) {
        byte[] copyOf = Arrays.copyOf(Base64Coder.decode(str), 16);
        copyOf[0] = 68;
        copyOf[15] = 84;
        return copyOf;
    }

    public static void sendData(Context context, String str) {
        Intent intent = new Intent("com.xiaomi.xmsf.push.XMSF_UPLOAD_ACTIVE");
        intent.putExtra("pkgname", context.getPackageName());
        intent.putExtra("category", "category_client_report_data");
        intent.putExtra("name", "quality_support");
        intent.putExtra("data", str);
        context.sendBroadcast(intent, "com.xiaomi.xmsf.permission.USE_XMSF_UPLOAD");
    }

    public static void sendFile(Context context, List<String> list) {
        if (list != null && list.size() > 0 && isSupportXMSFUpload(context)) {
            for (String str : list) {
                if (!TextUtils.isEmpty(str)) {
                    sendData(context, str);
                }
            }
        }
    }
}
