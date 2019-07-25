package cn.kuaipan.android.http;

import java.io.IOException;
import java.io.InputStream;

public class BufferInputStream extends InputStream {
    private static final byte[] tempBuf = new byte[8192];
    private RandomInputBuffer buf;
    private int markpos = -1;
    private int pos;

    public BufferInputStream(RandomInputBuffer randomInputBuffer) {
        this.buf = randomInputBuffer;
    }

    private IOException streamClosed() throws IOException {
        throw new IOException("BufferedInputStream is closed");
    }

    public int available() throws IOException {
        if (this.buf != null) {
            return this.buf.available(this.pos);
        }
        throw streamClosed();
    }

    public void close() throws IOException {
        this.buf = null;
    }

    public synchronized void mark(int i) {
        this.markpos = this.pos;
    }

    public boolean markSupported() {
        return true;
    }

    public synchronized int read() throws IOException {
        int read;
        RandomInputBuffer randomInputBuffer = this.buf;
        if (randomInputBuffer != null) {
            read = randomInputBuffer.read(this.pos);
            if (read >= 0) {
                this.pos++;
            }
        } else {
            throw streamClosed();
        }
        return read;
    }

    public synchronized int read(byte[] bArr, int i, int i2) throws IOException {
        int read;
        RandomInputBuffer randomInputBuffer = this.buf;
        if (randomInputBuffer != null) {
            read = randomInputBuffer.read(this.pos, bArr, i, i2);
            if (read > 0) {
                this.pos += read;
            }
        } else {
            throw streamClosed();
        }
        return read;
    }

    public synchronized void reset() throws IOException {
        if (this.buf == null) {
            throw new IOException("Stream is closed");
        } else if (-1 != this.markpos) {
            this.pos = this.markpos;
        } else {
            throw new IOException("Mark has been invalidated.");
        }
    }

    public synchronized long skip(long j) throws IOException {
        if (j < 1) {
            return 0;
        }
        RandomInputBuffer randomInputBuffer = this.buf;
        if (randomInputBuffer != null) {
            long j2 = ((long) this.pos) + j;
            int i = 0;
            while (j2 > ((long) this.pos)) {
                int read = randomInputBuffer.read(this.pos, tempBuf, 0, (int) Math.min((long) tempBuf.length, j2 - ((long) this.pos)));
                if (read < 0) {
                    break;
                }
                this.pos += read;
                i += read;
            }
            return (long) i;
        }
        throw streamClosed();
    }
}
