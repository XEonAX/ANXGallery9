package org.apache.thrift.transport;

public final class TMemoryInputTransport extends TTransport {
    private byte[] buf_;
    private int endPos_;
    private int pos_;

    public void consumeBuffer(int i) {
        this.pos_ += i;
    }

    public byte[] getBuffer() {
        return this.buf_;
    }

    public int getBufferPosition() {
        return this.pos_;
    }

    public int getBytesRemainingInBuffer() {
        return this.endPos_ - this.pos_;
    }

    public int read(byte[] bArr, int i, int i2) throws TTransportException {
        int bytesRemainingInBuffer = getBytesRemainingInBuffer();
        if (i2 > bytesRemainingInBuffer) {
            i2 = bytesRemainingInBuffer;
        }
        if (i2 > 0) {
            System.arraycopy(this.buf_, this.pos_, bArr, i, i2);
            consumeBuffer(i2);
        }
        return i2;
    }

    public void reset(byte[] bArr) {
        reset(bArr, 0, bArr.length);
    }

    public void reset(byte[] bArr, int i, int i2) {
        this.buf_ = bArr;
        this.pos_ = i;
        this.endPos_ = i + i2;
    }

    public void write(byte[] bArr, int i, int i2) throws TTransportException {
        throw new UnsupportedOperationException("No writing allowed!");
    }
}
