package com.xiaomi.push.service;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;

public class AppRegionStorage {
    private static volatile AppRegionStorage sInstance;
    private final String COUNTRY_CODE_CACHE_FILE_LOCK = "mipush_country_code.lock";
    private final String COUNTRY_CODE_CACHE_FILE_NAME = "mipush_country_code";
    private final String REGION_CACHE_FILE_LOCK = "mipush_region.lock";
    private final String REGION_CACHE_FILE_NAME = "mipush_region";
    private Context mContext;
    private volatile String mCountryCode;
    private final Object mCountryCodeLock = new Object();
    private volatile String mRegion;
    private final Object mRegionLock = new Object();

    public AppRegionStorage(Context context) {
        this.mContext = context;
    }

    public static AppRegionStorage getInstance(Context context) {
        if (sInstance == null) {
            synchronized (AppRegionStorage.class) {
                if (sInstance == null) {
                    sInstance = new AppRegionStorage(context);
                }
            }
        }
        return sInstance;
    }

    /* JADX WARNING: Removed duplicated region for block: B:34:0x006c A[SYNTHETIC, Splitter:B:34:0x006c] */
    private String readFromFileWithLock(Context context, String str, String str2, Object obj) {
        RandomAccessFile randomAccessFile;
        FileLock fileLock;
        File file = new File(context.getFilesDir(), str);
        FileLock fileLock2 = null;
        if (!file.exists()) {
            StringBuilder sb = new StringBuilder();
            sb.append("No ready file to get data from ");
            sb.append(str);
            MyLog.w(sb.toString());
            return null;
        }
        synchronized (obj) {
            try {
                File file2 = new File(context.getFilesDir(), str2);
                IOUtils.createFileQuietly(file2);
                randomAccessFile = new RandomAccessFile(file2, "rw");
                try {
                    fileLock = randomAccessFile.getChannel().lock();
                } catch (Exception e) {
                    e = e;
                    fileLock = null;
                    try {
                        MyLog.e((Throwable) e);
                        if (fileLock != null) {
                        }
                        IOUtils.closeQuietly(randomAccessFile);
                        return null;
                    } catch (Throwable th) {
                        th = th;
                        fileLock2 = fileLock;
                        try {
                            fileLock2.release();
                        } catch (IOException e2) {
                            MyLog.e((Throwable) e2);
                        }
                        IOUtils.closeQuietly(randomAccessFile);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    fileLock2.release();
                    IOUtils.closeQuietly(randomAccessFile);
                    throw th;
                }
                try {
                    String fileToStr = IOUtils.fileToStr(file);
                    if (fileLock != null) {
                        try {
                            if (fileLock.isValid()) {
                                fileLock.release();
                            }
                        } catch (IOException e3) {
                            MyLog.e((Throwable) e3);
                        } catch (Throwable th3) {
                            throw th3;
                        }
                    }
                    IOUtils.closeQuietly(randomAccessFile);
                    return fileToStr;
                } catch (Exception e4) {
                    e = e4;
                    MyLog.e((Throwable) e);
                    if (fileLock != null) {
                    }
                    IOUtils.closeQuietly(randomAccessFile);
                    return null;
                }
            } catch (Exception e5) {
                e = e5;
                randomAccessFile = null;
                fileLock = null;
                MyLog.e((Throwable) e);
                if (fileLock != null) {
                    if (fileLock.isValid()) {
                        try {
                            fileLock.release();
                        } catch (IOException e6) {
                            MyLog.e((Throwable) e6);
                        }
                    }
                }
                IOUtils.closeQuietly(randomAccessFile);
                return null;
            } catch (Throwable th4) {
                th = th4;
                randomAccessFile = null;
                if (fileLock2 != null && fileLock2.isValid()) {
                    fileLock2.release();
                }
                IOUtils.closeQuietly(randomAccessFile);
                throw th;
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:30:0x004f A[SYNTHETIC, Splitter:B:30:0x004f] */
    private void write2FileWithLock(Context context, String str, String str2, String str3, Object obj) {
        RandomAccessFile randomAccessFile;
        synchronized (obj) {
            FileLock fileLock = null;
            try {
                File file = new File(context.getFilesDir(), str3);
                IOUtils.createFileQuietly(file);
                randomAccessFile = new RandomAccessFile(file, "rw");
                try {
                    FileLock lock = randomAccessFile.getChannel().lock();
                    try {
                        IOUtils.strToFile(new File(context.getFilesDir(), str2), str);
                        if (lock != null) {
                            try {
                                if (lock.isValid()) {
                                    lock.release();
                                }
                            } catch (IOException e) {
                                MyLog.e((Throwable) e);
                            } catch (Throwable th) {
                                throw th;
                            }
                        }
                    } catch (Exception e2) {
                        e = e2;
                        fileLock = lock;
                        try {
                            MyLog.e((Throwable) e);
                            if (fileLock != null) {
                            }
                            IOUtils.closeQuietly(randomAccessFile);
                        } catch (Throwable th2) {
                            th = th2;
                            if (fileLock != null && fileLock.isValid()) {
                                try {
                                    fileLock.release();
                                } catch (IOException e3) {
                                    MyLog.e((Throwable) e3);
                                }
                            }
                            IOUtils.closeQuietly(randomAccessFile);
                            throw th;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        fileLock = lock;
                        fileLock.release();
                        IOUtils.closeQuietly(randomAccessFile);
                        throw th;
                    }
                } catch (Exception e4) {
                    e = e4;
                    MyLog.e((Throwable) e);
                    if (fileLock != null) {
                    }
                    IOUtils.closeQuietly(randomAccessFile);
                }
            } catch (Exception e5) {
                e = e5;
                randomAccessFile = null;
                MyLog.e((Throwable) e);
                if (fileLock != null) {
                    if (fileLock.isValid()) {
                        try {
                            fileLock.release();
                        } catch (IOException e6) {
                            MyLog.e((Throwable) e6);
                        }
                    }
                }
                IOUtils.closeQuietly(randomAccessFile);
            } catch (Throwable th4) {
                th = th4;
                randomAccessFile = null;
                fileLock.release();
                IOUtils.closeQuietly(randomAccessFile);
                throw th;
            }
            IOUtils.closeQuietly(randomAccessFile);
        }
    }

    public String getCountryCode() {
        if (TextUtils.isEmpty(this.mCountryCode)) {
            this.mCountryCode = readFromFileWithLock(this.mContext, "mipush_country_code", "mipush_country_code.lock", this.mCountryCodeLock);
        }
        return this.mCountryCode;
    }

    public String getRegion() {
        if (TextUtils.isEmpty(this.mRegion)) {
            this.mRegion = readFromFileWithLock(this.mContext, "mipush_region", "mipush_region.lock", this.mRegionLock);
        }
        return this.mRegion;
    }

    public void setCountryCode(String str) {
        if (!TextUtils.equals(str, this.mCountryCode)) {
            this.mCountryCode = str;
            write2FileWithLock(this.mContext, this.mCountryCode, "mipush_country_code", "mipush_country_code.lock", this.mCountryCodeLock);
        }
    }

    public void setRegion(String str) {
        if (!TextUtils.equals(str, this.mRegion)) {
            this.mRegion = str;
            write2FileWithLock(this.mContext, this.mRegion, "mipush_region", "mipush_region.lock", this.mRegionLock);
        }
    }
}
