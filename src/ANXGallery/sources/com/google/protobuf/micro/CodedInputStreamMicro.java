package com.google.protobuf.micro;

import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import java.io.IOException;
import java.io.InputStream;
import java.util.Vector;
import org.keyczar.Keyczar;

public final class CodedInputStreamMicro {
    private static final int BUFFER_SIZE = 4096;
    private static final int DEFAULT_RECURSION_LIMIT = 64;
    private static final int DEFAULT_SIZE_LIMIT = 67108864;
    private final byte[] buffer;
    private int bufferPos;
    private int bufferSize;
    private int bufferSizeAfterLimit;
    private int currentLimit;
    private final InputStream input;
    private int lastTag;
    private int recursionDepth;
    private int recursionLimit;
    private int sizeLimit;
    private int totalBytesRetired;

    private CodedInputStreamMicro(InputStream inputStream) {
        this.currentLimit = Integer.MAX_VALUE;
        this.recursionLimit = 64;
        this.sizeLimit = DEFAULT_SIZE_LIMIT;
        this.buffer = new byte[4096];
        this.bufferSize = 0;
        this.bufferPos = 0;
        this.input = inputStream;
    }

    private CodedInputStreamMicro(byte[] bArr, int i, int i2) {
        this.currentLimit = Integer.MAX_VALUE;
        this.recursionLimit = 64;
        this.sizeLimit = DEFAULT_SIZE_LIMIT;
        this.buffer = bArr;
        this.bufferSize = i2 + i;
        this.bufferPos = i;
        this.input = null;
    }

    public static int decodeZigZag32(int i) {
        return (-(i & 1)) ^ (i >>> 1);
    }

    public static long decodeZigZag64(long j) {
        return (-(j & 1)) ^ (j >>> 1);
    }

    public static CodedInputStreamMicro newInstance(InputStream inputStream) {
        return new CodedInputStreamMicro(inputStream);
    }

    public static CodedInputStreamMicro newInstance(byte[] bArr) {
        return newInstance(bArr, 0, bArr.length);
    }

    public static CodedInputStreamMicro newInstance(byte[] bArr, int i, int i2) {
        return new CodedInputStreamMicro(bArr, i, i2);
    }

    static int readRawVarint32(InputStream inputStream) throws IOException {
        int i = 0;
        int i2 = 0;
        while (i < 32) {
            int read = inputStream.read();
            if (read != -1) {
                i2 |= (read & BaiduSceneResult.BANK_CARD) << i;
                if ((read & 128) == 0) {
                    return i2;
                }
                i += 7;
            } else {
                throw InvalidProtocolBufferMicroException.truncatedMessage();
            }
        }
        while (i < 64) {
            int read2 = inputStream.read();
            if (read2 == -1) {
                throw InvalidProtocolBufferMicroException.truncatedMessage();
            } else if ((read2 & 128) == 0) {
                return i2;
            } else {
                i += 7;
            }
        }
        throw InvalidProtocolBufferMicroException.malformedVarint();
    }

    private void recomputeBufferSizeAfterLimit() {
        this.bufferSize += this.bufferSizeAfterLimit;
        int i = this.totalBytesRetired + this.bufferSize;
        if (i > this.currentLimit) {
            this.bufferSizeAfterLimit = i - this.currentLimit;
            this.bufferSize -= this.bufferSizeAfterLimit;
            return;
        }
        this.bufferSizeAfterLimit = 0;
    }

    private boolean refillBuffer(boolean z) throws IOException {
        if (this.bufferPos < this.bufferSize) {
            throw new IllegalStateException("refillBuffer() called when buffer wasn't empty.");
        } else if (this.totalBytesRetired + this.bufferSize != this.currentLimit) {
            this.totalBytesRetired += this.bufferSize;
            this.bufferPos = 0;
            this.bufferSize = this.input == null ? -1 : this.input.read(this.buffer);
            if (this.bufferSize == 0 || this.bufferSize < -1) {
                StringBuilder sb = new StringBuilder();
                sb.append("InputStream#read(byte[]) returned invalid result: ");
                sb.append(this.bufferSize);
                sb.append("\nThe InputStream implementation is buggy.");
                throw new IllegalStateException(sb.toString());
            } else if (this.bufferSize == -1) {
                this.bufferSize = 0;
                if (!z) {
                    return false;
                }
                throw InvalidProtocolBufferMicroException.truncatedMessage();
            } else {
                recomputeBufferSizeAfterLimit();
                int i = this.totalBytesRetired + this.bufferSize + this.bufferSizeAfterLimit;
                if (i <= this.sizeLimit && i >= 0) {
                    return true;
                }
                throw InvalidProtocolBufferMicroException.sizeLimitExceeded();
            }
        } else if (!z) {
            return false;
        } else {
            throw InvalidProtocolBufferMicroException.truncatedMessage();
        }
    }

    public void checkLastTagWas(int i) throws InvalidProtocolBufferMicroException {
        if (this.lastTag != i) {
            throw InvalidProtocolBufferMicroException.invalidEndTag();
        }
    }

    public int getBytesUntilLimit() {
        if (this.currentLimit == Integer.MAX_VALUE) {
            return -1;
        }
        return this.currentLimit - (this.totalBytesRetired + this.bufferPos);
    }

    public boolean isAtEnd() throws IOException {
        return this.bufferPos == this.bufferSize && !refillBuffer(false);
    }

    public void popLimit(int i) {
        this.currentLimit = i;
        recomputeBufferSizeAfterLimit();
    }

    public int pushLimit(int i) throws InvalidProtocolBufferMicroException {
        if (i >= 0) {
            int i2 = i + this.totalBytesRetired + this.bufferPos;
            int i3 = this.currentLimit;
            if (i2 <= i3) {
                this.currentLimit = i2;
                recomputeBufferSizeAfterLimit();
                return i3;
            }
            throw InvalidProtocolBufferMicroException.truncatedMessage();
        }
        throw InvalidProtocolBufferMicroException.negativeSize();
    }

    public boolean readBool() throws IOException {
        return readRawVarint32() != 0;
    }

    public ByteStringMicro readBytes() throws IOException {
        int readRawVarint32 = readRawVarint32();
        if (readRawVarint32 > this.bufferSize - this.bufferPos || readRawVarint32 <= 0) {
            return ByteStringMicro.copyFrom(readRawBytes(readRawVarint32));
        }
        ByteStringMicro copyFrom = ByteStringMicro.copyFrom(this.buffer, this.bufferPos, readRawVarint32);
        this.bufferPos += readRawVarint32;
        return copyFrom;
    }

    public double readDouble() throws IOException {
        return Double.longBitsToDouble(readRawLittleEndian64());
    }

    public int readEnum() throws IOException {
        return readRawVarint32();
    }

    public int readFixed32() throws IOException {
        return readRawLittleEndian32();
    }

    public long readFixed64() throws IOException {
        return readRawLittleEndian64();
    }

    public float readFloat() throws IOException {
        return Float.intBitsToFloat(readRawLittleEndian32());
    }

    public void readGroup(MessageMicro messageMicro, int i) throws IOException {
        if (this.recursionDepth < this.recursionLimit) {
            this.recursionDepth++;
            messageMicro.mergeFrom(this);
            checkLastTagWas(WireFormatMicro.makeTag(i, 4));
            this.recursionDepth--;
            return;
        }
        throw InvalidProtocolBufferMicroException.recursionLimitExceeded();
    }

    public int readInt32() throws IOException {
        return readRawVarint32();
    }

    public long readInt64() throws IOException {
        return readRawVarint64();
    }

    public void readMessage(MessageMicro messageMicro) throws IOException {
        int readRawVarint32 = readRawVarint32();
        if (this.recursionDepth < this.recursionLimit) {
            int pushLimit = pushLimit(readRawVarint32);
            this.recursionDepth++;
            messageMicro.mergeFrom(this);
            checkLastTagWas(0);
            this.recursionDepth--;
            popLimit(pushLimit);
            return;
        }
        throw InvalidProtocolBufferMicroException.recursionLimitExceeded();
    }

    public byte readRawByte() throws IOException {
        if (this.bufferPos == this.bufferSize) {
            refillBuffer(true);
        }
        byte[] bArr = this.buffer;
        int i = this.bufferPos;
        this.bufferPos = i + 1;
        return bArr[i];
    }

    public byte[] readRawBytes(int i) throws IOException {
        if (i < 0) {
            throw InvalidProtocolBufferMicroException.negativeSize();
        } else if (this.totalBytesRetired + this.bufferPos + i > this.currentLimit) {
            skipRawBytes((this.currentLimit - this.totalBytesRetired) - this.bufferPos);
            throw InvalidProtocolBufferMicroException.truncatedMessage();
        } else if (i <= this.bufferSize - this.bufferPos) {
            byte[] bArr = new byte[i];
            System.arraycopy(this.buffer, this.bufferPos, bArr, 0, i);
            this.bufferPos += i;
            return bArr;
        } else if (i < 4096) {
            byte[] bArr2 = new byte[i];
            int i2 = this.bufferSize - this.bufferPos;
            System.arraycopy(this.buffer, this.bufferPos, bArr2, 0, i2);
            this.bufferPos = this.bufferSize;
            refillBuffer(true);
            while (true) {
                int i3 = i - i2;
                if (i3 > this.bufferSize) {
                    System.arraycopy(this.buffer, 0, bArr2, i2, this.bufferSize);
                    i2 += this.bufferSize;
                    this.bufferPos = this.bufferSize;
                    refillBuffer(true);
                } else {
                    System.arraycopy(this.buffer, 0, bArr2, i2, i3);
                    this.bufferPos = i3;
                    return bArr2;
                }
            }
        } else {
            int i4 = this.bufferPos;
            int i5 = this.bufferSize;
            this.totalBytesRetired += this.bufferSize;
            this.bufferPos = 0;
            this.bufferSize = 0;
            int i6 = i5 - i4;
            int i7 = i - i6;
            Vector vector = new Vector();
            while (i7 > 0) {
                byte[] bArr3 = new byte[Math.min(i7, 4096)];
                int i8 = 0;
                while (i8 < bArr3.length) {
                    int read = this.input == null ? -1 : this.input.read(bArr3, i8, bArr3.length - i8);
                    if (read != -1) {
                        this.totalBytesRetired += read;
                        i8 += read;
                    } else {
                        throw InvalidProtocolBufferMicroException.truncatedMessage();
                    }
                }
                i7 -= bArr3.length;
                vector.addElement(bArr3);
            }
            byte[] bArr4 = new byte[i];
            System.arraycopy(this.buffer, i4, bArr4, 0, i6);
            for (int i9 = 0; i9 < vector.size(); i9++) {
                byte[] bArr5 = (byte[]) vector.elementAt(i9);
                System.arraycopy(bArr5, 0, bArr4, i6, bArr5.length);
                i6 += bArr5.length;
            }
            return bArr4;
        }
    }

    public int readRawLittleEndian32() throws IOException {
        return (readRawByte() & 255) | ((readRawByte() & 255) << 8) | ((readRawByte() & 255) << 16) | ((readRawByte() & 255) << 24);
    }

    public long readRawLittleEndian64() throws IOException {
        byte readRawByte = readRawByte();
        byte readRawByte2 = readRawByte();
        return ((((long) readRawByte2) & 255) << 8) | (((long) readRawByte) & 255) | ((((long) readRawByte()) & 255) << 16) | ((((long) readRawByte()) & 255) << 24) | ((((long) readRawByte()) & 255) << 32) | ((((long) readRawByte()) & 255) << 40) | ((((long) readRawByte()) & 255) << 48) | ((((long) readRawByte()) & 255) << 56);
    }

    public int readRawVarint32() throws IOException {
        byte b;
        byte readRawByte = readRawByte();
        if (readRawByte >= 0) {
            return readRawByte;
        }
        byte b2 = readRawByte & Byte.MAX_VALUE;
        byte readRawByte2 = readRawByte();
        if (readRawByte2 >= 0) {
            b = b2 | (readRawByte2 << 7);
        } else {
            byte b3 = b2 | ((readRawByte2 & Byte.MAX_VALUE) << 7);
            byte readRawByte3 = readRawByte();
            if (readRawByte3 >= 0) {
                b = b3 | (readRawByte3 << 14);
            } else {
                byte b4 = b3 | ((readRawByte3 & Byte.MAX_VALUE) << 14);
                byte readRawByte4 = readRawByte();
                if (readRawByte4 >= 0) {
                    b = b4 | (readRawByte4 << 21);
                } else {
                    byte b5 = b4 | ((readRawByte4 & Byte.MAX_VALUE) << 21);
                    byte readRawByte5 = readRawByte();
                    b = b5 | (readRawByte5 << 28);
                    if (readRawByte5 < 0) {
                        for (int i = 0; i < 5; i++) {
                            if (readRawByte() >= 0) {
                                return b;
                            }
                        }
                        throw InvalidProtocolBufferMicroException.malformedVarint();
                    }
                }
            }
        }
        return b;
    }

    public long readRawVarint64() throws IOException {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            byte readRawByte = readRawByte();
            j |= ((long) (readRawByte & Byte.MAX_VALUE)) << i;
            if ((readRawByte & 128) == 0) {
                return j;
            }
        }
        throw InvalidProtocolBufferMicroException.malformedVarint();
    }

    public int readSFixed32() throws IOException {
        return readRawLittleEndian32();
    }

    public long readSFixed64() throws IOException {
        return readRawLittleEndian64();
    }

    public int readSInt32() throws IOException {
        return decodeZigZag32(readRawVarint32());
    }

    public long readSInt64() throws IOException {
        return decodeZigZag64(readRawVarint64());
    }

    public String readString() throws IOException {
        int readRawVarint32 = readRawVarint32();
        if (readRawVarint32 > this.bufferSize - this.bufferPos || readRawVarint32 <= 0) {
            return new String(readRawBytes(readRawVarint32), Keyczar.DEFAULT_ENCODING);
        }
        String str = new String(this.buffer, this.bufferPos, readRawVarint32, Keyczar.DEFAULT_ENCODING);
        this.bufferPos += readRawVarint32;
        return str;
    }

    public int readTag() throws IOException {
        if (isAtEnd()) {
            this.lastTag = 0;
            return 0;
        }
        this.lastTag = readRawVarint32();
        if (this.lastTag != 0) {
            return this.lastTag;
        }
        throw InvalidProtocolBufferMicroException.invalidTag();
    }

    public int readUInt32() throws IOException {
        return readRawVarint32();
    }

    public long readUInt64() throws IOException {
        return readRawVarint64();
    }

    public void resetSizeCounter() {
        this.totalBytesRetired = 0;
    }

    public int setRecursionLimit(int i) {
        if (i >= 0) {
            int i2 = this.recursionLimit;
            this.recursionLimit = i;
            return i2;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Recursion limit cannot be negative: ");
        sb.append(i);
        throw new IllegalArgumentException(sb.toString());
    }

    public int setSizeLimit(int i) {
        if (i >= 0) {
            int i2 = this.sizeLimit;
            this.sizeLimit = i;
            return i2;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Size limit cannot be negative: ");
        sb.append(i);
        throw new IllegalArgumentException(sb.toString());
    }

    public boolean skipField(int i) throws IOException {
        switch (WireFormatMicro.getTagWireType(i)) {
            case 0:
                readInt32();
                return true;
            case 1:
                readRawLittleEndian64();
                return true;
            case 2:
                skipRawBytes(readRawVarint32());
                return true;
            case 3:
                skipMessage();
                checkLastTagWas(WireFormatMicro.makeTag(WireFormatMicro.getTagFieldNumber(i), 4));
                return true;
            case 4:
                return false;
            case 5:
                readRawLittleEndian32();
                return true;
            default:
                throw InvalidProtocolBufferMicroException.invalidWireType();
        }
    }

    public void skipMessage() throws IOException {
        int readTag;
        do {
            readTag = readTag();
            if (readTag == 0) {
                return;
            }
        } while (skipField(readTag));
    }

    public void skipRawBytes(int i) throws IOException {
        if (i < 0) {
            throw InvalidProtocolBufferMicroException.negativeSize();
        } else if (this.totalBytesRetired + this.bufferPos + i > this.currentLimit) {
            skipRawBytes((this.currentLimit - this.totalBytesRetired) - this.bufferPos);
            throw InvalidProtocolBufferMicroException.truncatedMessage();
        } else if (i <= this.bufferSize - this.bufferPos) {
            this.bufferPos += i;
        } else {
            int i2 = this.bufferSize - this.bufferPos;
            this.totalBytesRetired += this.bufferSize;
            this.bufferPos = 0;
            this.bufferSize = 0;
            while (i2 < i) {
                int skip = this.input == null ? -1 : (int) this.input.skip((long) (i - i2));
                if (skip > 0) {
                    i2 += skip;
                    this.totalBytesRetired += skip;
                } else {
                    throw InvalidProtocolBufferMicroException.truncatedMessage();
                }
            }
        }
    }
}
