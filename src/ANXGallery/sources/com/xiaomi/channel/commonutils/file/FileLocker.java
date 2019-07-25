package com.xiaomi.channel.commonutils.file;

import android.content.Context;
import com.xiaomi.channel.commonutils.logger.MyLog;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public final class FileLocker {
    private static final Set<String> LOCK_HELD = Collections.synchronizedSet(new HashSet());
    private Context mContext;
    private FileLock mLock;
    private RandomAccessFile mLockFile;
    private String mLockFileName;

    private FileLocker(Context context) {
        this.mContext = context;
    }

    public static FileLocker lock(Context context, File file) throws IOException {
        StringBuilder sb = new StringBuilder();
        sb.append("Locking: ");
        sb.append(file.getAbsolutePath());
        MyLog.v(sb.toString());
        StringBuilder sb2 = new StringBuilder();
        sb2.append(file.getAbsolutePath());
        sb2.append(".LOCK");
        String sb3 = sb2.toString();
        File file2 = new File(sb3);
        if (!file2.exists()) {
            file2.getParentFile().mkdirs();
            file2.createNewFile();
        }
        if (LOCK_HELD.add(sb3)) {
            FileLocker fileLocker = new FileLocker(context);
            fileLocker.mLockFileName = sb3;
            try {
                fileLocker.mLockFile = new RandomAccessFile(file2, "rw");
                fileLocker.mLock = fileLocker.mLockFile.getChannel().lock();
                StringBuilder sb4 = new StringBuilder();
                sb4.append("Locked: ");
                sb4.append(sb3);
                sb4.append(" :");
                sb4.append(fileLocker.mLock);
                MyLog.v(sb4.toString());
                return fileLocker;
            } finally {
                if (fileLocker.mLock == null) {
                    if (fileLocker.mLockFile != null) {
                        IOUtils.closeQuietly(fileLocker.mLockFile);
                    }
                    LOCK_HELD.remove(fileLocker.mLockFileName);
                }
            }
        } else {
            throw new IOException("abtain lock failure");
        }
    }

    public void unlock() {
        StringBuilder sb = new StringBuilder();
        sb.append("unLock: ");
        sb.append(this.mLock);
        MyLog.v(sb.toString());
        if (this.mLock != null && this.mLock.isValid()) {
            try {
                this.mLock.release();
            } catch (IOException unused) {
            }
            this.mLock = null;
        }
        if (this.mLockFile != null) {
            IOUtils.closeQuietly(this.mLockFile);
        }
        LOCK_HELD.remove(this.mLockFileName);
    }
}
