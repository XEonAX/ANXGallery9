package cn.kuaipan.android.http;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.RandomAccessFile;

public class RandomInputBuffer {
    private byte[] buf;
    private File bufFile;
    private final NetCacheManager cache;
    private boolean eof;
    private RandomAccessFile file;
    private boolean fileAssigned;
    private InputStream in;
    private int pos;

    public RandomInputBuffer(InputStream inputStream, NetCacheManager netCacheManager) {
        if (netCacheManager == null || inputStream == null) {
            throw new IllegalArgumentException("InputStream & NetCacheManager can not be null.");
        }
        this.in = inputStream;
        this.cache = netCacheManager;
        this.buf = new byte[8192];
        this.pos = 0;
        this.eof = false;
    }

    /* JADX WARNING: Missing exception handler attribute for start block: B:16:0x0043 */
    private void fillBuf(int i) throws IOException {
        if (!this.eof && i > this.pos) {
            if (i % 8192 != 0) {
                i = ((i / 8192) * 8192) + 8192;
            }
            if (!this.fileAssigned && i > this.buf.length) {
                this.fileAssigned = true;
                try {
                    this.bufFile = this.cache.assignCache();
                    if (this.bufFile != null) {
                        this.file = new RandomAccessFile(this.bufFile, "rw");
                        this.file.write(this.buf, 0, this.pos);
                    }
                } catch (InterruptedIOException e) {
                    throw e;
                } catch (Exception ) {
                    try {
                        if (this.file != null) {
                            this.file.close();
                        }
                    } catch (InterruptedIOException e2) {
                        throw e2;
                    } catch (Exception unused) {
                    }
                    this.file = null;
                }
            }
            if (this.file == null) {
                if (i > this.buf.length) {
                    int length = this.buf.length * 2;
                    while (length < i) {
                        length *= 2;
                    }
                    byte[] bArr = new byte[length];
                    System.arraycopy(this.buf, 0, bArr, 0, this.buf.length);
                    this.buf = bArr;
                }
                int read = this.in.read(this.buf, this.pos, Math.min(this.buf.length - this.pos, i - this.pos));
                if (read >= 0) {
                    this.pos += read;
                } else {
                    this.eof = true;
                }
            } else {
                int read2 = this.in.read(this.buf, 0, Math.min(this.buf.length, i - this.pos));
                if (read2 >= 0) {
                    this.file.seek((long) this.pos);
                    this.file.write(this.buf, 0, read2);
                    this.pos += read2;
                } else {
                    this.eof = true;
                }
            }
        }
    }

    private int readFromBuf(int i, byte[] bArr, int i2, int i3) throws IOException {
        if (i3 == 0) {
            return 0;
        }
        if (this.eof && i >= this.pos) {
            return -1;
        }
        if (i > this.pos) {
            throw new IndexOutOfBoundsException("from > pos");
        } else if (i == this.pos) {
            return 0;
        } else {
            int min = Math.min(this.pos - i, i3);
            if (this.file == null) {
                System.arraycopy(this.buf, i, bArr, i2, min);
            } else {
                this.file.seek((long) i);
                min = this.file.read(bArr, i2, min);
            }
            return min;
        }
    }

    public synchronized int available(int i) throws IOException {
        if (this.in == null) {
            throw new IOException("RandomInputBuffer has been closed.");
        }
        return !this.eof ? (this.in.available() + this.pos) - i : this.pos - i;
    }

    public synchronized void close() throws IOException {
        if (this.in != null) {
            this.in.close();
            this.in = null;
        }
        if (this.file != null) {
            this.file.close();
            this.file = null;
        }
        if (this.bufFile != null) {
            this.cache.releaseCache(this.bufFile);
            this.bufFile = null;
        }
        this.buf = null;
        this.pos = 0;
        this.eof = false;
    }

    public int read(int i) throws IOException {
        byte[] bArr = new byte[1];
        if (read(i, bArr) > 0) {
            return bArr[0];
        }
        return -1;
    }

    public int read(int i, byte[] bArr) throws IOException {
        return read(i, bArr, 0, bArr.length);
    }

    public synchronized int read(int i, byte[] bArr, int i2, int i3) throws IOException {
        if (this.in == null) {
            throw new IOException("RandomInputBuffer has been closed.");
        } else if (bArr == null) {
            throw new NullPointerException("buffer == null");
        } else if ((i2 | i3) < 0 || i2 > bArr.length - i3) {
            throw new IndexOutOfBoundsException();
        } else if (i3 == 0) {
            return 0;
        } else {
            int i4 = i + i3;
            if (i4 > this.pos) {
                fillBuf(i4);
            }
            return readFromBuf(i, bArr, i2, i3);
        }
    }
}
