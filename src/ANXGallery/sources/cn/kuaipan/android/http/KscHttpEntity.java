package cn.kuaipan.android.http;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.HttpEntity;
import org.apache.http.entity.HttpEntityWrapper;

public class KscHttpEntity extends HttpEntityWrapper {
    private final IKscDecoder mDecoder;

    public KscHttpEntity(HttpEntity httpEntity, IKscDecoder iKscDecoder) {
        super(httpEntity);
        this.mDecoder = iKscDecoder;
    }

    private static HttpEntity getRepeatable(HttpEntity httpEntity, NetCacheManager netCacheManager) {
        return (httpEntity == null || httpEntity.isRepeatable()) ? httpEntity : new KscBufferedHttpEntity(httpEntity, netCacheManager);
    }

    public static KscHttpEntity getRepeatableEntity(HttpEntity httpEntity, IKscDecoder iKscDecoder, NetCacheManager netCacheManager) {
        if (httpEntity == null) {
            return null;
        }
        return new KscHttpEntity(getRepeatable(httpEntity, netCacheManager), iKscDecoder);
    }

    public InputStream getContent() throws IOException {
        return this.mDecoder == null ? KscHttpEntity.super.getContent() : new DecoderInputStream(KscHttpEntity.super.getContent(), this.mDecoder);
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        if (outputStream != null) {
            InputStream content = getContent();
            byte[] bArr = new byte[4096];
            while (true) {
                int read = content.read(bArr);
                if (read != -1) {
                    outputStream.write(bArr, 0, read);
                } else {
                    return;
                }
            }
        } else {
            throw new IllegalArgumentException("Output stream may not be null");
        }
    }
}
