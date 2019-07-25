package org.apache.thrift.protocol;

import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import org.apache.thrift.TException;
import org.apache.thrift.transport.TTransport;
import org.keyczar.Keyczar;

public class TBinaryProtocol extends TProtocol {
    private static final TStruct ANONYMOUS_STRUCT = new TStruct();
    private byte[] bin = new byte[1];
    private byte[] bout = new byte[1];
    protected boolean checkReadLength_ = false;
    private byte[] i16out = new byte[2];
    private byte[] i16rd = new byte[2];
    private byte[] i32out = new byte[4];
    private byte[] i32rd = new byte[4];
    private byte[] i64out = new byte[8];
    private byte[] i64rd = new byte[8];
    protected int readLength_;
    protected boolean strictRead_ = false;
    protected boolean strictWrite_ = true;

    public static class Factory implements TProtocolFactory {
        protected int readLength_;
        protected boolean strictRead_;
        protected boolean strictWrite_;

        public Factory() {
            this(false, true);
        }

        public Factory(boolean z, boolean z2) {
            this(z, z2, 0);
        }

        public Factory(boolean z, boolean z2, int i) {
            this.strictRead_ = false;
            this.strictWrite_ = true;
            this.strictRead_ = z;
            this.strictWrite_ = z2;
            this.readLength_ = i;
        }

        public TProtocol getProtocol(TTransport tTransport) {
            TBinaryProtocol tBinaryProtocol = new TBinaryProtocol(tTransport, this.strictRead_, this.strictWrite_);
            if (this.readLength_ != 0) {
                tBinaryProtocol.setReadLength(this.readLength_);
            }
            return tBinaryProtocol;
        }
    }

    public TBinaryProtocol(TTransport tTransport, boolean z, boolean z2) {
        super(tTransport);
        this.strictRead_ = z;
        this.strictWrite_ = z2;
    }

    private int readAll(byte[] bArr, int i, int i2) throws TException {
        checkReadLength(i2);
        return this.trans_.readAll(bArr, i, i2);
    }

    /* access modifiers changed from: protected */
    public void checkReadLength(int i) throws TException {
        if (i < 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("Negative length: ");
            sb.append(i);
            throw new TException(sb.toString());
        } else if (this.checkReadLength_) {
            this.readLength_ -= i;
            if (this.readLength_ < 0) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Message length exceeded: ");
                sb2.append(i);
                throw new TException(sb2.toString());
            }
        }
    }

    public ByteBuffer readBinary() throws TException {
        int readI32 = readI32();
        checkReadLength(readI32);
        if (this.trans_.getBytesRemainingInBuffer() >= readI32) {
            ByteBuffer wrap = ByteBuffer.wrap(this.trans_.getBuffer(), this.trans_.getBufferPosition(), readI32);
            this.trans_.consumeBuffer(readI32);
            return wrap;
        }
        byte[] bArr = new byte[readI32];
        this.trans_.readAll(bArr, 0, readI32);
        return ByteBuffer.wrap(bArr);
    }

    public boolean readBool() throws TException {
        return readByte() == 1;
    }

    public byte readByte() throws TException {
        if (this.trans_.getBytesRemainingInBuffer() >= 1) {
            byte b = this.trans_.getBuffer()[this.trans_.getBufferPosition()];
            this.trans_.consumeBuffer(1);
            return b;
        }
        readAll(this.bin, 0, 1);
        return this.bin[0];
    }

    public double readDouble() throws TException {
        return Double.longBitsToDouble(readI64());
    }

    public TField readFieldBegin() throws TException {
        byte readByte = readByte();
        return new TField("", readByte, readByte == 0 ? 0 : readI16());
    }

    public void readFieldEnd() {
    }

    public short readI16() throws TException {
        byte[] bArr = this.i16rd;
        int i = 0;
        if (this.trans_.getBytesRemainingInBuffer() >= 2) {
            bArr = this.trans_.getBuffer();
            i = this.trans_.getBufferPosition();
            this.trans_.consumeBuffer(2);
        } else {
            readAll(this.i16rd, 0, 2);
        }
        return (short) ((bArr[i + 1] & 255) | ((bArr[i] & 255) << 8));
    }

    public int readI32() throws TException {
        byte[] bArr = this.i32rd;
        int i = 0;
        if (this.trans_.getBytesRemainingInBuffer() >= 4) {
            bArr = this.trans_.getBuffer();
            i = this.trans_.getBufferPosition();
            this.trans_.consumeBuffer(4);
        } else {
            readAll(this.i32rd, 0, 4);
        }
        return (bArr[i + 3] & 255) | ((bArr[i] & 255) << 24) | ((bArr[i + 1] & 255) << 16) | ((bArr[i + 2] & 255) << 8);
    }

    public long readI64() throws TException {
        byte[] bArr = this.i64rd;
        int i = 0;
        if (this.trans_.getBytesRemainingInBuffer() >= 8) {
            bArr = this.trans_.getBuffer();
            i = this.trans_.getBufferPosition();
            this.trans_.consumeBuffer(8);
        } else {
            readAll(this.i64rd, 0, 8);
        }
        return ((long) (bArr[i + 7] & 255)) | (((long) (bArr[i] & 255)) << 56) | (((long) (bArr[i + 1] & 255)) << 48) | (((long) (bArr[i + 2] & 255)) << 40) | (((long) (bArr[i + 3] & 255)) << 32) | (((long) (bArr[i + 4] & 255)) << 24) | (((long) (bArr[i + 5] & 255)) << 16) | (((long) (bArr[i + 6] & 255)) << 8);
    }

    public TList readListBegin() throws TException {
        return new TList(readByte(), readI32());
    }

    public void readListEnd() {
    }

    public TMap readMapBegin() throws TException {
        return new TMap(readByte(), readByte(), readI32());
    }

    public void readMapEnd() {
    }

    public TSet readSetBegin() throws TException {
        return new TSet(readByte(), readI32());
    }

    public void readSetEnd() {
    }

    public String readString() throws TException {
        int readI32 = readI32();
        if (this.trans_.getBytesRemainingInBuffer() < readI32) {
            return readStringBody(readI32);
        }
        try {
            String str = new String(this.trans_.getBuffer(), this.trans_.getBufferPosition(), readI32, Keyczar.DEFAULT_ENCODING);
            this.trans_.consumeBuffer(readI32);
            return str;
        } catch (UnsupportedEncodingException unused) {
            throw new TException("JVM DOES NOT SUPPORT UTF-8");
        }
    }

    public String readStringBody(int i) throws TException {
        try {
            checkReadLength(i);
            byte[] bArr = new byte[i];
            this.trans_.readAll(bArr, 0, i);
            return new String(bArr, Keyczar.DEFAULT_ENCODING);
        } catch (UnsupportedEncodingException unused) {
            throw new TException("JVM DOES NOT SUPPORT UTF-8");
        }
    }

    public TStruct readStructBegin() {
        return ANONYMOUS_STRUCT;
    }

    public void readStructEnd() {
    }

    public void setReadLength(int i) {
        this.readLength_ = i;
        this.checkReadLength_ = true;
    }

    public void writeBinary(ByteBuffer byteBuffer) throws TException {
        int limit = (byteBuffer.limit() - byteBuffer.position()) - byteBuffer.arrayOffset();
        writeI32(limit);
        this.trans_.write(byteBuffer.array(), byteBuffer.position() + byteBuffer.arrayOffset(), limit);
    }

    public void writeBool(boolean z) throws TException {
        writeByte(z ? (byte) 1 : 0);
    }

    public void writeByte(byte b) throws TException {
        this.bout[0] = b;
        this.trans_.write(this.bout, 0, 1);
    }

    public void writeFieldBegin(TField tField) throws TException {
        writeByte(tField.type);
        writeI16(tField.id);
    }

    public void writeFieldEnd() {
    }

    public void writeFieldStop() throws TException {
        writeByte(0);
    }

    public void writeI16(short s) throws TException {
        this.i16out[0] = (byte) ((s >> 8) & 255);
        this.i16out[1] = (byte) (s & 255);
        this.trans_.write(this.i16out, 0, 2);
    }

    public void writeI32(int i) throws TException {
        this.i32out[0] = (byte) ((i >> 24) & 255);
        this.i32out[1] = (byte) ((i >> 16) & 255);
        this.i32out[2] = (byte) ((i >> 8) & 255);
        this.i32out[3] = (byte) (i & 255);
        this.trans_.write(this.i32out, 0, 4);
    }

    public void writeI64(long j) throws TException {
        this.i64out[0] = (byte) ((int) ((j >> 56) & 255));
        this.i64out[1] = (byte) ((int) ((j >> 48) & 255));
        this.i64out[2] = (byte) ((int) ((j >> 40) & 255));
        this.i64out[3] = (byte) ((int) ((j >> 32) & 255));
        this.i64out[4] = (byte) ((int) ((j >> 24) & 255));
        this.i64out[5] = (byte) ((int) ((j >> 16) & 255));
        this.i64out[6] = (byte) ((int) ((j >> 8) & 255));
        this.i64out[7] = (byte) ((int) (j & 255));
        this.trans_.write(this.i64out, 0, 8);
    }

    public void writeListBegin(TList tList) throws TException {
        writeByte(tList.elemType);
        writeI32(tList.size);
    }

    public void writeListEnd() {
    }

    public void writeMapBegin(TMap tMap) throws TException {
        writeByte(tMap.keyType);
        writeByte(tMap.valueType);
        writeI32(tMap.size);
    }

    public void writeMapEnd() {
    }

    public void writeString(String str) throws TException {
        try {
            byte[] bytes = str.getBytes(Keyczar.DEFAULT_ENCODING);
            writeI32(bytes.length);
            this.trans_.write(bytes, 0, bytes.length);
        } catch (UnsupportedEncodingException unused) {
            throw new TException("JVM DOES NOT SUPPORT UTF-8");
        }
    }

    public void writeStructBegin(TStruct tStruct) {
    }

    public void writeStructEnd() {
    }
}
