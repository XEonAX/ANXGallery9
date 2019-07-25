package org.apache.thrift;

import java.io.ByteArrayOutputStream;

public class TByteArrayOutputStream extends ByteArrayOutputStream {
    public TByteArrayOutputStream() {
    }

    public TByteArrayOutputStream(int i) {
        super(i);
    }

    public byte[] get() {
        return this.buf;
    }

    public int len() {
        return this.count;
    }
}
