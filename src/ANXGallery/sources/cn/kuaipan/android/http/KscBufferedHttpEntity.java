package cn.kuaipan.android.http;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.HttpEntity;
import org.apache.http.entity.HttpEntityWrapper;

public class KscBufferedHttpEntity extends HttpEntityWrapper {
    private final RandomInputBuffer buffer;
    private final IOException err;

    public KscBufferedHttpEntity(HttpEntity httpEntity, NetCacheManager netCacheManager) {
        RandomInputBuffer randomInputBuffer;
        super(httpEntity);
        IOException iOException = null;
        if (!httpEntity.isRepeatable() || httpEntity.getContentLength() < 0) {
            try {
                randomInputBuffer = new RandomInputBuffer(httpEntity.getContent(), netCacheManager);
            } catch (IOException e) {
                randomInputBuffer = null;
                iOException = e;
            }
            this.buffer = randomInputBuffer;
        } else {
            this.buffer = null;
        }
        this.err = iOException;
    }

    public void consumeContent() throws IOException {
        if (this.buffer != null) {
            this.buffer.close();
        }
        KscBufferedHttpEntity.super.consumeContent();
    }

    public InputStream getContent() throws IOException {
        if (this.buffer != null) {
            return new BufferInputStream(this.buffer);
        }
        if (this.err == null) {
            return this.wrappedEntity.getContent();
        }
        throw this.err;
    }

    public long getContentLength() {
        return this.wrappedEntity.getContentLength();
    }

    public boolean isChunked() {
        return this.buffer == null && this.wrappedEntity.isChunked();
    }

    public boolean isRepeatable() {
        return true;
    }

    public boolean isStreaming() {
        return this.buffer == null && this.wrappedEntity.isStreaming();
    }

    /* JADX WARNING: Removed duplicated region for block: B:18:0x0027  */
    public void writeTo(OutputStream outputStream) throws IOException {
        InputStream inputStream;
        if (outputStream == null) {
            throw new IllegalArgumentException("Output stream may not be null");
        } else if (this.buffer != null) {
            try {
                inputStream = getContent();
                try {
                    byte[] bArr = new byte[4096];
                    while (true) {
                        int read = inputStream.read(bArr);
                        if (read == -1) {
                            break;
                        }
                        outputStream.write(bArr, 0, read);
                    }
                    if (inputStream != null) {
                        inputStream.close();
                    }
                } catch (Throwable th) {
                    th = th;
                    if (inputStream != null) {
                        inputStream.close();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                inputStream = null;
                if (inputStream != null) {
                }
                throw th;
            }
        } else {
            this.wrappedEntity.writeTo(outputStream);
        }
    }
}
