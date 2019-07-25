package cn.kuaipan.android.http.multipart;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

public class ByteArrayPartSource implements PartSource {
    private byte[] bytes;
    private String fileName;

    public ByteArrayPartSource(String str, byte[] bArr) {
        this.fileName = str;
        this.bytes = bArr;
    }

    public InputStream createInputStream() {
        return new ByteArrayInputStream(this.bytes);
    }

    public String getFileName() {
        return this.fileName;
    }

    public long getLength() {
        return (long) this.bytes.length;
    }
}
