package cn.kuaipan.android.kss.upload;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.entity.InputStreamEntity;

public class KssInputStreamEntity extends InputStreamEntity {
    private final InputStream content;

    public KssInputStreamEntity(InputStream inputStream, long j) {
        super(inputStream, j);
        inputStream.mark((int) Math.min(2147483647L, j));
        this.content = inputStream;
    }

    public InputStream getContent() throws IOException {
        this.content.reset();
        return KssInputStreamEntity.super.getContent();
    }

    public boolean isRepeatable() {
        return KssInputStreamEntity.super.isRepeatable() || this.content.markSupported();
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        this.content.reset();
        KssInputStreamEntity.super.writeTo(outputStream);
    }
}
