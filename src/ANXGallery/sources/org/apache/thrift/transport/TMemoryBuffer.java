package org.apache.thrift.transport;

import org.apache.thrift.TByteArrayOutputStream;

public class TMemoryBuffer extends TTransport {
    private TByteArrayOutputStream arr_;
    private int pos_;

    public TMemoryBuffer(int i) {
        this.arr_ = new TByteArrayOutputStream(i);
    }

    public int length() {
        return this.arr_.size();
    }

    public int read(byte[] bArr, int i, int i2) {
        byte[] bArr2 = this.arr_.get();
        if (i2 > this.arr_.len() - this.pos_) {
            i2 = this.arr_.len() - this.pos_;
        }
        if (i2 > 0) {
            System.arraycopy(bArr2, this.pos_, bArr, i, i2);
            this.pos_ += i2;
        }
        return i2;
    }

    public void write(byte[] bArr, int i, int i2) {
        this.arr_.write(bArr, i, i2);
    }
}
