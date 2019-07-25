package com.xiaomi.channel.commonutils.misc;

import android.content.Context;
import android.os.Build.VERSION;
import android.os.Environment;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.android.AppInfoUtils;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.util.ArrayList;

public class JobMutualExclusor {
    private static final String COMMON_PATH;
    private static final String LAST_COLLECT_FILE_PATH;
    private static final String LAST_COLLECT_FILE_PATH_LOCK;

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(Environment.getExternalStorageDirectory().getPath());
        sb.append("/mipush/");
        COMMON_PATH = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(COMMON_PATH);
        sb2.append("lcfp");
        LAST_COLLECT_FILE_PATH = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(COMMON_PATH);
        sb3.append("lcfp.lock");
        LAST_COLLECT_FILE_PATH_LOCK = sb3.toString();
    }

    public static boolean checkPeriodAndRecordWithFileLock(Context context, String str, long j) {
        RandomAccessFile randomAccessFile;
        FileLock fileLock = null;
        try {
            File file = new File(LAST_COLLECT_FILE_PATH_LOCK);
            IOUtils.createFileQuietly(file);
            randomAccessFile = new RandomAccessFile(file, "rw");
            try {
                FileLock lock = randomAccessFile.getChannel().lock();
                try {
                    boolean checkPeriodAndRecordWorking = checkPeriodAndRecordWorking(context, str, j);
                    if (lock != null && lock.isValid()) {
                        try {
                            lock.release();
                        } catch (IOException unused) {
                        }
                    }
                    IOUtils.closeQuietly(randomAccessFile);
                    return checkPeriodAndRecordWorking;
                } catch (IOException e) {
                    e = e;
                    fileLock = lock;
                    try {
                        e.printStackTrace();
                        try {
                            fileLock.release();
                        } catch (IOException unused2) {
                        }
                        IOUtils.closeQuietly(randomAccessFile);
                        return true;
                    } catch (Throwable th) {
                        th = th;
                        if (fileLock != null && fileLock.isValid()) {
                            try {
                                fileLock.release();
                            } catch (IOException unused3) {
                            }
                        }
                        IOUtils.closeQuietly(randomAccessFile);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    fileLock = lock;
                    fileLock.release();
                    IOUtils.closeQuietly(randomAccessFile);
                    throw th;
                }
            } catch (IOException e2) {
                e = e2;
                e.printStackTrace();
                if (fileLock != null && fileLock.isValid()) {
                    fileLock.release();
                }
                IOUtils.closeQuietly(randomAccessFile);
                return true;
            }
        } catch (IOException e3) {
            e = e3;
            randomAccessFile = null;
            e.printStackTrace();
            fileLock.release();
            IOUtils.closeQuietly(randomAccessFile);
            return true;
        } catch (Throwable th3) {
            th = th3;
            randomAccessFile = null;
            fileLock.release();
            IOUtils.closeQuietly(randomAccessFile);
            throw th;
        }
    }

    /* JADX WARNING: Can't wrap try/catch for region: R(3:28|29|34) */
    /* JADX WARNING: Code restructure failed: missing block: B:35:?, code lost:
        r3.clear();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x00bb, code lost:
        r0 = th;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing exception handler attribute for start block: B:34:0x00b4 */
    private static boolean checkPeriodAndRecordWorking(Context context, String str, long j) {
        BufferedReader bufferedReader;
        if (VERSION.SDK_INT >= 23) {
            if (!AppInfoUtils.checkSelfPermission(context, "android.permission.WRITE_EXTERNAL_STORAGE")) {
                return true;
            }
        } else {
            Context context2 = context;
        }
        File file = new File(LAST_COLLECT_FILE_PATH);
        ArrayList<String> arrayList = new ArrayList<>();
        long currentTimeMillis = System.currentTimeMillis();
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(":");
        sb.append(context.getPackageName());
        sb.append(",");
        sb.append(currentTimeMillis);
        String sb2 = sb.toString();
        BufferedWriter bufferedWriter = null;
        if (file.exists()) {
            try {
                bufferedReader = new BufferedReader(new FileReader(file));
                while (true) {
                    String readLine = bufferedReader.readLine();
                    if (readLine == null) {
                        break;
                    }
                    String[] split = readLine.split(":");
                    if (split.length == 2) {
                        if (!TextUtils.equals(split[0], String.valueOf(str))) {
                            arrayList.add(readLine);
                            break;
                        }
                        String[] split2 = split[1].split(",");
                        if (split2.length == 2) {
                            long parseLong = Long.parseLong(split2[1]);
                            if (!TextUtils.equals(split2[0], context.getPackageName()) && ((float) Math.abs(currentTimeMillis - parseLong)) < ((float) (1000 * j)) * 0.9f) {
                                IOUtils.closeQuietly(bufferedReader);
                                return false;
                            }
                        }
                    }
                }
            } catch (Exception unused) {
                bufferedReader = null;
            } catch (Throwable th) {
                th = th;
                bufferedReader = null;
                IOUtils.closeQuietly(bufferedReader);
                throw th;
            }
            IOUtils.closeQuietly(bufferedReader);
        } else if (!IOUtils.createFileQuietly(file)) {
            return true;
        }
        arrayList.add(sb2);
        try {
            BufferedWriter bufferedWriter2 = new BufferedWriter(new FileWriter(file));
            try {
                for (String write : arrayList) {
                    bufferedWriter2.write(write);
                    bufferedWriter2.newLine();
                    bufferedWriter2.flush();
                }
                IOUtils.closeQuietly(bufferedWriter2);
            } catch (IOException e) {
                e = e;
                bufferedWriter = bufferedWriter2;
                try {
                    MyLog.e(e.toString());
                    IOUtils.closeQuietly(bufferedWriter);
                    return true;
                } catch (Throwable th2) {
                    th = th2;
                    bufferedWriter2 = bufferedWriter;
                    IOUtils.closeQuietly(bufferedWriter2);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                IOUtils.closeQuietly(bufferedWriter2);
                throw th;
            }
        } catch (IOException e2) {
            e = e2;
            MyLog.e(e.toString());
            IOUtils.closeQuietly(bufferedWriter);
            return true;
        }
        return true;
    }
}
