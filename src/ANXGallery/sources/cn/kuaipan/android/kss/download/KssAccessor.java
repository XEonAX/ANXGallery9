package cn.kuaipan.android.kss.download;

import cn.kuaipan.android.utils.Encode;
import java.io.File;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.util.concurrent.locks.ReentrantLock;

public class KssAccessor {
    private boolean mClosed = false;
    private RandomAccessFile mFileAccessor;
    private FileLock mFilelocker;
    private final ReentrantLock mLocker = new ReentrantLock();

    public KssAccessor(File file) throws IOException {
        this.mFileAccessor = new RandomAccessFile(file, "rws");
        this.mFilelocker = this.mFileAccessor.getChannel().tryLock();
        if (this.mFilelocker == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Failed Lock the target file: ");
            sb.append(file);
            throw new IOException(sb.toString());
        }
    }

    public void close() throws IOException {
        if (!this.mClosed) {
            this.mClosed = true;
            try {
                if (this.mFilelocker != null) {
                    this.mFilelocker.release();
                    this.mFilelocker = null;
                }
            } finally {
                if (this.mFileAccessor != null) {
                    this.mFileAccessor.close();
                    this.mFileAccessor = null;
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        try {
            close();
        } finally {
            super.finalize();
        }
    }

    public void inflate(long j) throws IOException {
        if (!this.mClosed) {
            lock();
            try {
                this.mFileAccessor.seek(j - 1);
                this.mFileAccessor.write(0);
            } finally {
                unlock();
            }
        } else {
            throw new IOException();
        }
    }

    public void lock() {
        this.mLocker.lock();
    }

    public String sha1(long j, long j2) throws IOException {
        if (!this.mClosed) {
            lock();
            try {
                return Encode.SHA1Encode(this.mFileAccessor, j, j2);
            } finally {
                unlock();
            }
        } else {
            throw new IOException();
        }
    }

    public void unlock() {
        this.mLocker.unlock();
    }

    public int write(byte[] bArr, int i, int i2, LoadRecorder loadRecorder) throws IOException {
        if (this.mClosed) {
            throw new IOException();
        } else if (!Thread.currentThread().isInterrupted()) {
            lock();
            if (loadRecorder != null) {
                try {
                    this.mFileAccessor.seek(loadRecorder.getStart());
                    i2 = (int) Math.min((long) i2, loadRecorder.size());
                } catch (Throwable th) {
                    unlock();
                    throw th;
                }
            }
            this.mFileAccessor.write(bArr, i, i2);
            if (loadRecorder != null) {
                loadRecorder.add(i2);
            }
            unlock();
            return i2;
        } else {
            throw new InterruptedIOException();
        }
    }
}
