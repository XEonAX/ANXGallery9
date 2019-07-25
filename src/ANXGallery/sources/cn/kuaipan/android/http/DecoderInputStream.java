package cn.kuaipan.android.http;

import cn.kuaipan.android.utils.RandomFileInputStream;
import java.io.EOFException;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.util.zip.DataFormatException;

public class DecoderInputStream extends FilterInputStream {
    private final byte[] buf;
    private boolean closed;
    private final IKscDecoder decoder;
    private boolean eof;
    private long markPos;
    private final long startPos;

    public DecoderInputStream(InputStream inputStream, IKscDecoder iKscDecoder) {
        this(inputStream, iKscDecoder, 512);
    }

    public DecoderInputStream(InputStream inputStream, IKscDecoder iKscDecoder, int i) {
        super(inputStream);
        this.markPos = -1;
        if (inputStream == null || iKscDecoder == null) {
            throw new NullPointerException();
        } else if (i > 0) {
            iKscDecoder.init();
            this.decoder = iKscDecoder;
            this.buf = new byte[i];
            if (this.in instanceof RandomFileInputStream) {
                this.startPos = ((RandomFileInputStream) this.in).getCurrentPos();
            } else {
                this.startPos = 0;
            }
        } else {
            throw new IllegalArgumentException();
        }
    }

    private void fill() throws IOException, DataFormatException {
        if (!this.closed) {
            int i = Integer.MAX_VALUE;
            while (!this.eof) {
                int needFill = this.decoder.needFill();
                if (needFill <= 0) {
                    return;
                }
                if (needFill > i) {
                    throw new DataFormatException("Needed data is increased");
                } else if (!Thread.currentThread().isInterrupted()) {
                    int read = this.in.read(this.buf, 0, Math.min(needFill, this.buf.length));
                    if (read >= 0) {
                        this.decoder.fillData(this.buf, 0, read);
                    } else {
                        this.eof = true;
                    }
                    i = needFill;
                } else {
                    throw new InterruptedIOException();
                }
            }
            return;
        }
        throw new IOException("Stream is closed");
    }

    public int available() throws IOException {
        if (!this.closed) {
            return this.eof ? 0 : 1;
        }
        throw new IOException("Stream is closed");
    }

    public void close() throws IOException {
        if (!this.closed) {
            try {
                this.decoder.end();
            } finally {
                this.closed = true;
                this.eof = true;
                super.close();
            }
        }
    }

    public void mark(int i) {
        if (this.in instanceof RandomFileInputStream) {
            this.markPos = ((RandomFileInputStream) this.in).getCurrentPos();
        }
    }

    public boolean markSupported() {
        return (this.in instanceof RandomFileInputStream) && this.decoder.supportRepeat();
    }

    public int read() throws IOException {
        byte[] bArr = new byte[1];
        if (read(bArr, 0, 1) == -1) {
            return -1;
        }
        return bArr[0] & 255;
    }

    public int read(byte[] bArr, int i, int i2) throws IOException {
        if (this.closed) {
            throw new IOException("Stream is closed");
        } else if (bArr == null) {
            throw new NullPointerException();
        } else if (i < 0 || i2 < 0 || i + i2 > bArr.length) {
            throw new IndexOutOfBoundsException();
        } else if (i2 == 0) {
            return 0;
        } else {
            if (i > bArr.length || i2 < 0 || i < 0 || bArr.length - i < i2) {
                throw new ArrayIndexOutOfBoundsException();
            }
            try {
                fill();
                int readDecodeData = this.decoder.readDecodeData(bArr, i, i2);
                if (readDecodeData > 0) {
                    return readDecodeData;
                }
                if (this.eof && this.decoder.canEnd()) {
                    return -1;
                }
                if (this.eof) {
                    throw new EOFException();
                }
                throw ((IOException) new IOException().initCause(new DataFormatException("Failed read data from decoder.")));
            } catch (DataFormatException e) {
                if (this.eof) {
                    throw new EOFException();
                }
                throw ((IOException) new IOException().initCause(e));
            }
        }
    }

    public void reset() throws IOException {
        if (!markSupported()) {
            throw new IOException();
        } else if (this.markPos >= 0) {
            if (((RandomFileInputStream) this.in).getCurrentPos() > this.markPos) {
                this.eof = false;
            }
            ((RandomFileInputStream) this.in).moveToPos(this.markPos);
            this.decoder.init();
            this.decoder.skip(this.markPos - this.startPos);
        }
    }

    public long skip(long j) throws IOException {
        long j2 = 0;
        if (j >= 0) {
            while (j2 < j) {
                if (!Thread.currentThread().isInterrupted()) {
                    long j3 = j - j2;
                    int read = read(this.buf, 0, j3 > ((long) this.buf.length) ? this.buf.length : (int) j3);
                    if (read == -1) {
                        return j2;
                    }
                    j2 += (long) read;
                } else {
                    throw new InterruptedIOException();
                }
            }
            return j2;
        }
        throw new IllegalArgumentException();
    }
}
