package cn.kuaipan.android.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.RandomAccessFile;

public class RandomFileInputStream extends InputStream {
    private boolean closed = false;
    private final File file;
    private long markedPos = 0;
    private long pos = 0;
    private RandomAccessFile rFile;

    public RandomFileInputStream(File file2) throws FileNotFoundException {
        this.file = file2;
        this.rFile = new RandomAccessFile(file2, "r");
    }

    public synchronized int available() throws IOException {
        return (int) (this.rFile.length() - this.pos);
    }

    public synchronized void close() throws IOException {
        this.rFile.close();
        this.closed = true;
    }

    public synchronized long getCurrentPos() {
        return this.pos;
    }

    public void mark(int i) {
        if (!this.closed) {
            this.markedPos = this.pos;
        }
    }

    public boolean markSupported() {
        return true;
    }

    public synchronized void moveToPos(long j) throws IOException {
        if (j < this.rFile.length()) {
            this.rFile.seek(j);
            this.pos = j;
        } else {
            throw new IOException("Seek possion is not availabel");
        }
    }

    public synchronized int read() throws IOException {
        int read;
        if (!Thread.currentThread().isInterrupted()) {
            read = this.rFile.read();
            if (read >= 0) {
                this.pos++;
            }
        } else {
            throw new InterruptedIOException();
        }
        return read;
    }

    public synchronized int read(byte[] bArr) throws IOException {
        int read;
        if (!Thread.currentThread().isInterrupted()) {
            read = this.rFile.read(bArr);
            if (read > 0) {
                this.pos += (long) read;
            }
        } else {
            throw new InterruptedIOException();
        }
        return read;
    }

    public synchronized int read(byte[] bArr, int i, int i2) throws IOException {
        int read;
        if (!Thread.currentThread().isInterrupted()) {
            read = this.rFile.read(bArr, i, i2);
            if (read > 0) {
                this.pos += (long) read;
            }
        } else {
            throw new InterruptedIOException();
        }
        return read;
    }

    public synchronized void reset() throws IOException {
        if (this.closed) {
            this.closed = false;
            this.rFile = new RandomAccessFile(this.file, "r");
        }
        this.rFile.seek(this.markedPos);
        this.pos = this.markedPos;
    }

    public long skip(long j) throws IOException {
        if (j == 0) {
            return 0;
        }
        if (j >= 0) {
            int i = j < 8192 ? (int) j : 8192;
            synchronized (this) {
                long j2 = (long) i;
                long j3 = j / j2;
                long j4 = 0;
                while (j3 >= 0) {
                    if (!Thread.currentThread().isInterrupted()) {
                        long skipBytes = (long) this.rFile.skipBytes(i);
                        j4 += skipBytes;
                        this.pos += skipBytes;
                        if (skipBytes < j2) {
                            return j4;
                        }
                        j3--;
                    } else {
                        throw new InterruptedIOException();
                    }
                }
                return j4;
            }
        }
        throw new IOException("Number of bytes to skip cannot be negative");
    }
}
