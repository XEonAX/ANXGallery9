package com.google.protobuf;

import com.google.protobuf.MessageLite.Builder;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public abstract class CodedInputStream {
    private static final int DEFAULT_BUFFER_SIZE = 4096;
    private static final int DEFAULT_RECURSION_LIMIT = 100;
    private static final int DEFAULT_SIZE_LIMIT = Integer.MAX_VALUE;
    int recursionDepth;
    int recursionLimit;
    private boolean shouldDiscardUnknownFields;
    int sizeLimit;

    private static final class ArrayDecoder extends CodedInputStream {
        private final byte[] buffer;
        private int bufferSizeAfterLimit;
        private int currentLimit;
        private boolean enableAliasing;
        private final boolean immutable;
        private int lastTag;
        private int limit;
        private int pos;
        private int startPos;

        private ArrayDecoder(byte[] bArr, int i, int i2, boolean z) {
            super();
            this.currentLimit = CodedInputStream.DEFAULT_SIZE_LIMIT;
            this.buffer = bArr;
            this.limit = i2 + i;
            this.pos = i;
            this.startPos = this.pos;
            this.immutable = z;
        }

        private void recomputeBufferSizeAfterLimit() {
            this.limit += this.bufferSizeAfterLimit;
            int i = this.limit - this.startPos;
            if (i > this.currentLimit) {
                this.bufferSizeAfterLimit = i - this.currentLimit;
                this.limit -= this.bufferSizeAfterLimit;
                return;
            }
            this.bufferSizeAfterLimit = 0;
        }

        private void skipRawVarint() throws IOException {
            if (this.limit - this.pos >= 10) {
                skipRawVarintFastPath();
            } else {
                skipRawVarintSlowPath();
            }
        }

        private void skipRawVarintFastPath() throws IOException {
            int i = 0;
            while (i < 10) {
                byte[] bArr = this.buffer;
                int i2 = this.pos;
                this.pos = i2 + 1;
                if (bArr[i2] < 0) {
                    i++;
                } else {
                    return;
                }
            }
            throw InvalidProtocolBufferException.malformedVarint();
        }

        private void skipRawVarintSlowPath() throws IOException {
            int i = 0;
            while (i < 10) {
                if (readRawByte() < 0) {
                    i++;
                } else {
                    return;
                }
            }
            throw InvalidProtocolBufferException.malformedVarint();
        }

        public void checkLastTagWas(int i) throws InvalidProtocolBufferException {
            if (this.lastTag != i) {
                throw InvalidProtocolBufferException.invalidEndTag();
            }
        }

        public void enableAliasing(boolean z) {
            this.enableAliasing = z;
        }

        public int getBytesUntilLimit() {
            if (this.currentLimit == CodedInputStream.DEFAULT_SIZE_LIMIT) {
                return -1;
            }
            return this.currentLimit - getTotalBytesRead();
        }

        public int getLastTag() {
            return this.lastTag;
        }

        public int getTotalBytesRead() {
            return this.pos - this.startPos;
        }

        public boolean isAtEnd() throws IOException {
            return this.pos == this.limit;
        }

        public void popLimit(int i) {
            this.currentLimit = i;
            recomputeBufferSizeAfterLimit();
        }

        public int pushLimit(int i) throws InvalidProtocolBufferException {
            if (i >= 0) {
                int totalBytesRead = i + getTotalBytesRead();
                int i2 = this.currentLimit;
                if (totalBytesRead <= i2) {
                    this.currentLimit = totalBytesRead;
                    recomputeBufferSizeAfterLimit();
                    return i2;
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
            throw InvalidProtocolBufferException.negativeSize();
        }

        public boolean readBool() throws IOException {
            return readRawVarint64() != 0;
        }

        public byte[] readByteArray() throws IOException {
            return readRawBytes(readRawVarint32());
        }

        public ByteBuffer readByteBuffer() throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (readRawVarint32 > 0 && readRawVarint32 <= this.limit - this.pos) {
                ByteBuffer wrap = (this.immutable || !this.enableAliasing) ? ByteBuffer.wrap(Arrays.copyOfRange(this.buffer, this.pos, this.pos + readRawVarint32)) : ByteBuffer.wrap(this.buffer, this.pos, readRawVarint32).slice();
                this.pos += readRawVarint32;
                return wrap;
            } else if (readRawVarint32 == 0) {
                return Internal.EMPTY_BYTE_BUFFER;
            } else {
                if (readRawVarint32 < 0) {
                    throw InvalidProtocolBufferException.negativeSize();
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
        }

        public ByteString readBytes() throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (readRawVarint32 <= 0 || readRawVarint32 > this.limit - this.pos) {
                return readRawVarint32 == 0 ? ByteString.EMPTY : ByteString.wrap(readRawBytes(readRawVarint32));
            }
            ByteString copyFrom = (!this.immutable || !this.enableAliasing) ? ByteString.copyFrom(this.buffer, this.pos, readRawVarint32) : ByteString.wrap(this.buffer, this.pos, readRawVarint32);
            this.pos += readRawVarint32;
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

        public <T extends MessageLite> T readGroup(int i, Parser<T> parser, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            if (this.recursionDepth < this.recursionLimit) {
                this.recursionDepth++;
                T t = (MessageLite) parser.parsePartialFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(WireFormat.makeTag(i, 4));
                this.recursionDepth--;
                return t;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public void readGroup(int i, Builder builder, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            if (this.recursionDepth < this.recursionLimit) {
                this.recursionDepth++;
                builder.mergeFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(WireFormat.makeTag(i, 4));
                this.recursionDepth--;
                return;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public int readInt32() throws IOException {
            return readRawVarint32();
        }

        public long readInt64() throws IOException {
            return readRawVarint64();
        }

        public <T extends MessageLite> T readMessage(Parser<T> parser, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (this.recursionDepth < this.recursionLimit) {
                int pushLimit = pushLimit(readRawVarint32);
                this.recursionDepth++;
                T t = (MessageLite) parser.parsePartialFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(0);
                this.recursionDepth--;
                popLimit(pushLimit);
                return t;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public void readMessage(Builder builder, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (this.recursionDepth < this.recursionLimit) {
                int pushLimit = pushLimit(readRawVarint32);
                this.recursionDepth++;
                builder.mergeFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(0);
                this.recursionDepth--;
                popLimit(pushLimit);
                return;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public byte readRawByte() throws IOException {
            if (this.pos != this.limit) {
                byte[] bArr = this.buffer;
                int i = this.pos;
                this.pos = i + 1;
                return bArr[i];
            }
            throw InvalidProtocolBufferException.truncatedMessage();
        }

        public byte[] readRawBytes(int i) throws IOException {
            if (i > 0 && i <= this.limit - this.pos) {
                int i2 = this.pos;
                this.pos += i;
                return Arrays.copyOfRange(this.buffer, i2, this.pos);
            } else if (i > 0) {
                throw InvalidProtocolBufferException.truncatedMessage();
            } else if (i == 0) {
                return Internal.EMPTY_BYTE_ARRAY;
            } else {
                throw InvalidProtocolBufferException.negativeSize();
            }
        }

        public int readRawLittleEndian32() throws IOException {
            int i = this.pos;
            if (this.limit - i >= 4) {
                byte[] bArr = this.buffer;
                this.pos = i + 4;
                return ((bArr[i + 3] & 255) << 24) | (bArr[i] & 255) | ((bArr[i + 1] & 255) << 8) | ((bArr[i + 2] & 255) << 16);
            }
            throw InvalidProtocolBufferException.truncatedMessage();
        }

        public long readRawLittleEndian64() throws IOException {
            int i = this.pos;
            if (this.limit - i >= 8) {
                byte[] bArr = this.buffer;
                this.pos = i + 8;
                return ((((long) bArr[i + 7]) & 255) << 56) | (((long) bArr[i]) & 255) | ((((long) bArr[i + 1]) & 255) << 8) | ((((long) bArr[i + 2]) & 255) << 16) | ((((long) bArr[i + 3]) & 255) << 24) | ((((long) bArr[i + 4]) & 255) << 32) | ((((long) bArr[i + 5]) & 255) << 40) | ((((long) bArr[i + 6]) & 255) << 48);
            }
            throw InvalidProtocolBufferException.truncatedMessage();
        }

        /* JADX WARNING: Code restructure failed: missing block: B:29:0x006a, code lost:
            if (r1[r2] < 0) goto L_0x006c;
         */
        public int readRawVarint32() throws IOException {
            byte b;
            int i = this.pos;
            if (this.limit != i) {
                byte[] bArr = this.buffer;
                int i2 = i + 1;
                byte b2 = bArr[i];
                if (b2 >= 0) {
                    this.pos = i2;
                    return b2;
                } else if (this.limit - i2 >= 9) {
                    int i3 = i2 + 1;
                    byte b3 = b2 ^ (bArr[i2] << 7);
                    if (b3 < 0) {
                        b = b3 ^ Byte.MIN_VALUE;
                    } else {
                        int i4 = i3 + 1;
                        byte b4 = b3 ^ (bArr[i3] << 14);
                        if (b4 >= 0) {
                            b = b4 ^ 16256;
                        } else {
                            i3 = i4 + 1;
                            byte b5 = b4 ^ (bArr[i4] << 21);
                            if (b5 < 0) {
                                b = b5 ^ -2080896;
                            } else {
                                i4 = i3 + 1;
                                byte b6 = bArr[i3];
                                b = (b5 ^ (b6 << 28)) ^ 266354560;
                                if (b6 < 0) {
                                    i3 = i4 + 1;
                                    if (bArr[i4] < 0) {
                                        i4 = i3 + 1;
                                        if (bArr[i3] < 0) {
                                            i3 = i4 + 1;
                                            if (bArr[i4] < 0) {
                                                i4 = i3 + 1;
                                                if (bArr[i3] < 0) {
                                                    i3 = i4 + 1;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        i3 = i4;
                    }
                    this.pos = i3;
                    return b;
                }
            }
            return (int) readRawVarint64SlowPath();
        }

        /* JADX WARNING: Code restructure failed: missing block: B:36:0x00b9, code lost:
            if (((long) r1[r0]) < 0) goto L_0x00bb;
         */
        public long readRawVarint64() throws IOException {
            long j;
            int i;
            long j2;
            long j3;
            long j4;
            int i2 = this.pos;
            if (this.limit != i2) {
                byte[] bArr = this.buffer;
                int i3 = i2 + 1;
                byte b = bArr[i2];
                if (b >= 0) {
                    this.pos = i3;
                    return (long) b;
                } else if (this.limit - i3 >= 9) {
                    int i4 = i3 + 1;
                    byte b2 = b ^ (bArr[i3] << 7);
                    if (b2 < 0) {
                        j3 = (long) (b2 ^ Byte.MIN_VALUE);
                    } else {
                        int i5 = i4 + 1;
                        byte b3 = b2 ^ (bArr[i4] << 14);
                        if (b3 >= 0) {
                            j4 = (long) (b3 ^ 16256);
                            i = i5;
                            j = j4;
                            this.pos = i;
                            return j;
                        }
                        i4 = i5 + 1;
                        byte b4 = b3 ^ (bArr[i5] << 21);
                        if (b4 < 0) {
                            j3 = (long) (b4 ^ -2080896);
                        } else {
                            long j5 = (long) b4;
                            i = i4 + 1;
                            long j6 = (((long) bArr[i4]) << 28) ^ j5;
                            if (j6 >= 0) {
                                j = j6 ^ 266354560;
                            } else {
                                int i6 = i + 1;
                                long j7 = j6 ^ (((long) bArr[i]) << 35);
                                if (j7 < 0) {
                                    j2 = -34093383808L ^ j7;
                                } else {
                                    i = i6 + 1;
                                    long j8 = j7 ^ (((long) bArr[i6]) << 42);
                                    if (j8 >= 0) {
                                        j = j8 ^ 4363953127296L;
                                    } else {
                                        i6 = i + 1;
                                        long j9 = j8 ^ (((long) bArr[i]) << 49);
                                        if (j9 < 0) {
                                            j2 = -558586000294016L ^ j9;
                                        } else {
                                            i = i6 + 1;
                                            j = (j9 ^ (((long) bArr[i6]) << 56)) ^ 71499008037633920L;
                                            if (j < 0) {
                                                i6 = i + 1;
                                            }
                                        }
                                    }
                                }
                                j = j2;
                                i = i6;
                            }
                            this.pos = i;
                            return j;
                        }
                    }
                    j4 = j3;
                    i = i4;
                    j = j4;
                    this.pos = i;
                    return j;
                }
            }
            return readRawVarint64SlowPath();
        }

        /* access modifiers changed from: 0000 */
        public long readRawVarint64SlowPath() throws IOException {
            long j = 0;
            for (int i = 0; i < 64; i += 7) {
                byte readRawByte = readRawByte();
                j |= ((long) (readRawByte & Byte.MAX_VALUE)) << i;
                if ((readRawByte & 128) == 0) {
                    return j;
                }
            }
            throw InvalidProtocolBufferException.malformedVarint();
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
            if (readRawVarint32 > 0 && readRawVarint32 <= this.limit - this.pos) {
                String str = new String(this.buffer, this.pos, readRawVarint32, Internal.UTF_8);
                this.pos += readRawVarint32;
                return str;
            } else if (readRawVarint32 == 0) {
                return "";
            } else {
                if (readRawVarint32 < 0) {
                    throw InvalidProtocolBufferException.negativeSize();
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
        }

        public String readStringRequireUtf8() throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (readRawVarint32 > 0 && readRawVarint32 <= this.limit - this.pos) {
                String decodeUtf8 = Utf8.decodeUtf8(this.buffer, this.pos, readRawVarint32);
                this.pos += readRawVarint32;
                return decodeUtf8;
            } else if (readRawVarint32 == 0) {
                return "";
            } else {
                if (readRawVarint32 <= 0) {
                    throw InvalidProtocolBufferException.negativeSize();
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
        }

        public int readTag() throws IOException {
            if (isAtEnd()) {
                this.lastTag = 0;
                return 0;
            }
            this.lastTag = readRawVarint32();
            if (WireFormat.getTagFieldNumber(this.lastTag) != 0) {
                return this.lastTag;
            }
            throw InvalidProtocolBufferException.invalidTag();
        }

        public int readUInt32() throws IOException {
            return readRawVarint32();
        }

        public long readUInt64() throws IOException {
            return readRawVarint64();
        }

        @Deprecated
        public void readUnknownGroup(int i, Builder builder) throws IOException {
            readGroup(i, builder, ExtensionRegistryLite.getEmptyRegistry());
        }

        public void resetSizeCounter() {
            this.startPos = this.pos;
        }

        public boolean skipField(int i) throws IOException {
            switch (WireFormat.getTagWireType(i)) {
                case 0:
                    skipRawVarint();
                    return true;
                case 1:
                    skipRawBytes(8);
                    return true;
                case 2:
                    skipRawBytes(readRawVarint32());
                    return true;
                case 3:
                    skipMessage();
                    checkLastTagWas(WireFormat.makeTag(WireFormat.getTagFieldNumber(i), 4));
                    return true;
                case 4:
                    return false;
                case 5:
                    skipRawBytes(4);
                    return true;
                default:
                    throw InvalidProtocolBufferException.invalidWireType();
            }
        }

        public boolean skipField(int i, CodedOutputStream codedOutputStream) throws IOException {
            switch (WireFormat.getTagWireType(i)) {
                case 0:
                    long readInt64 = readInt64();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeUInt64NoTag(readInt64);
                    return true;
                case 1:
                    long readRawLittleEndian64 = readRawLittleEndian64();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeFixed64NoTag(readRawLittleEndian64);
                    return true;
                case 2:
                    ByteString readBytes = readBytes();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeBytesNoTag(readBytes);
                    return true;
                case 3:
                    codedOutputStream.writeRawVarint32(i);
                    skipMessage(codedOutputStream);
                    int makeTag = WireFormat.makeTag(WireFormat.getTagFieldNumber(i), 4);
                    checkLastTagWas(makeTag);
                    codedOutputStream.writeRawVarint32(makeTag);
                    return true;
                case 4:
                    return false;
                case 5:
                    int readRawLittleEndian32 = readRawLittleEndian32();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeFixed32NoTag(readRawLittleEndian32);
                    return true;
                default:
                    throw InvalidProtocolBufferException.invalidWireType();
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

        public void skipMessage(CodedOutputStream codedOutputStream) throws IOException {
            int readTag;
            do {
                readTag = readTag();
                if (readTag == 0) {
                    return;
                }
            } while (skipField(readTag, codedOutputStream));
        }

        public void skipRawBytes(int i) throws IOException {
            if (i >= 0 && i <= this.limit - this.pos) {
                this.pos += i;
            } else if (i < 0) {
                throw InvalidProtocolBufferException.negativeSize();
            } else {
                throw InvalidProtocolBufferException.truncatedMessage();
            }
        }
    }

    private static final class IterableDirectByteBufferDecoder extends CodedInputStream {
        private int bufferSizeAfterCurrentLimit;
        private long currentAddress;
        private ByteBuffer currentByteBuffer;
        private long currentByteBufferLimit;
        private long currentByteBufferPos;
        private long currentByteBufferStartPos;
        private int currentLimit;
        private boolean enableAliasing;
        private boolean immutable;
        private Iterable<ByteBuffer> input;
        private Iterator<ByteBuffer> iterator;
        private int lastTag;
        private int startOffset;
        private int totalBufferSize;
        private int totalBytesRead;

        private IterableDirectByteBufferDecoder(Iterable<ByteBuffer> iterable, int i, boolean z) {
            super();
            this.currentLimit = CodedInputStream.DEFAULT_SIZE_LIMIT;
            this.totalBufferSize = i;
            this.input = iterable;
            this.iterator = this.input.iterator();
            this.immutable = z;
            this.totalBytesRead = 0;
            this.startOffset = 0;
            if (i == 0) {
                this.currentByteBuffer = Internal.EMPTY_BYTE_BUFFER;
                this.currentByteBufferPos = 0;
                this.currentByteBufferStartPos = 0;
                this.currentByteBufferLimit = 0;
                this.currentAddress = 0;
                return;
            }
            tryGetNextByteBuffer();
        }

        private long currentRemaining() {
            return this.currentByteBufferLimit - this.currentByteBufferPos;
        }

        private void getNextByteBuffer() throws InvalidProtocolBufferException {
            if (this.iterator.hasNext()) {
                tryGetNextByteBuffer();
                return;
            }
            throw InvalidProtocolBufferException.truncatedMessage();
        }

        private void readRawBytesTo(byte[] bArr, int i, int i2) throws IOException {
            if (i2 >= 0 && i2 <= remaining()) {
                int i3 = i2;
                while (i3 > 0) {
                    if (currentRemaining() == 0) {
                        getNextByteBuffer();
                    }
                    int min = Math.min(i3, (int) currentRemaining());
                    long j = (long) min;
                    UnsafeUtil.copyMemory(this.currentByteBufferPos, bArr, (long) ((i2 - i3) + i), j);
                    i3 -= min;
                    this.currentByteBufferPos += j;
                }
            } else if (i2 > 0) {
                throw InvalidProtocolBufferException.truncatedMessage();
            } else if (i2 != 0) {
                throw InvalidProtocolBufferException.negativeSize();
            }
        }

        private void recomputeBufferSizeAfterLimit() {
            this.totalBufferSize += this.bufferSizeAfterCurrentLimit;
            int i = this.totalBufferSize - this.startOffset;
            if (i > this.currentLimit) {
                this.bufferSizeAfterCurrentLimit = i - this.currentLimit;
                this.totalBufferSize -= this.bufferSizeAfterCurrentLimit;
                return;
            }
            this.bufferSizeAfterCurrentLimit = 0;
        }

        private int remaining() {
            return (int) ((((long) (this.totalBufferSize - this.totalBytesRead)) - this.currentByteBufferPos) + this.currentByteBufferStartPos);
        }

        private void skipRawVarint() throws IOException {
            int i = 0;
            while (i < 10) {
                if (readRawByte() < 0) {
                    i++;
                } else {
                    return;
                }
            }
            throw InvalidProtocolBufferException.malformedVarint();
        }

        /* JADX WARNING: Can't wrap try/catch for region: R(3:6|7|8) */
        /* JADX WARNING: Code restructure failed: missing block: B:10:0x0038, code lost:
            throw r4;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:5:0x0027, code lost:
            r4 = move-exception;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:8:0x002d, code lost:
            throw com.google.protobuf.InvalidProtocolBufferException.truncatedMessage();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:9:0x002e, code lost:
            r3.currentByteBuffer.position(r0);
            r3.currentByteBuffer.limit(r1);
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:6:0x0029 */
        private ByteBuffer slice(int i, int i2) throws IOException {
            int position = this.currentByteBuffer.position();
            int limit = this.currentByteBuffer.limit();
            this.currentByteBuffer.position(i);
            this.currentByteBuffer.limit(i2);
            ByteBuffer slice = this.currentByteBuffer.slice();
            this.currentByteBuffer.position(position);
            this.currentByteBuffer.limit(limit);
            return slice;
        }

        private void tryGetNextByteBuffer() {
            this.currentByteBuffer = (ByteBuffer) this.iterator.next();
            this.totalBytesRead += (int) (this.currentByteBufferPos - this.currentByteBufferStartPos);
            this.currentByteBufferPos = (long) this.currentByteBuffer.position();
            this.currentByteBufferStartPos = this.currentByteBufferPos;
            this.currentByteBufferLimit = (long) this.currentByteBuffer.limit();
            this.currentAddress = UnsafeUtil.addressOffset(this.currentByteBuffer);
            this.currentByteBufferPos += this.currentAddress;
            this.currentByteBufferStartPos += this.currentAddress;
            this.currentByteBufferLimit += this.currentAddress;
        }

        public void checkLastTagWas(int i) throws InvalidProtocolBufferException {
            if (this.lastTag != i) {
                throw InvalidProtocolBufferException.invalidEndTag();
            }
        }

        public void enableAliasing(boolean z) {
            this.enableAliasing = z;
        }

        public int getBytesUntilLimit() {
            if (this.currentLimit == CodedInputStream.DEFAULT_SIZE_LIMIT) {
                return -1;
            }
            return this.currentLimit - getTotalBytesRead();
        }

        public int getLastTag() {
            return this.lastTag;
        }

        public int getTotalBytesRead() {
            return (int) ((((long) (this.totalBytesRead - this.startOffset)) + this.currentByteBufferPos) - this.currentByteBufferStartPos);
        }

        public boolean isAtEnd() throws IOException {
            return (((long) this.totalBytesRead) + this.currentByteBufferPos) - this.currentByteBufferStartPos == ((long) this.totalBufferSize);
        }

        public void popLimit(int i) {
            this.currentLimit = i;
            recomputeBufferSizeAfterLimit();
        }

        public int pushLimit(int i) throws InvalidProtocolBufferException {
            if (i >= 0) {
                int totalBytesRead2 = i + getTotalBytesRead();
                int i2 = this.currentLimit;
                if (totalBytesRead2 <= i2) {
                    this.currentLimit = totalBytesRead2;
                    recomputeBufferSizeAfterLimit();
                    return i2;
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
            throw InvalidProtocolBufferException.negativeSize();
        }

        public boolean readBool() throws IOException {
            return readRawVarint64() != 0;
        }

        public byte[] readByteArray() throws IOException {
            return readRawBytes(readRawVarint32());
        }

        public ByteBuffer readByteBuffer() throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (readRawVarint32 > 0) {
                long j = (long) readRawVarint32;
                if (j <= currentRemaining()) {
                    if (this.immutable || !this.enableAliasing) {
                        byte[] bArr = new byte[readRawVarint32];
                        UnsafeUtil.copyMemory(this.currentByteBufferPos, bArr, 0, j);
                        this.currentByteBufferPos += j;
                        return ByteBuffer.wrap(bArr);
                    }
                    this.currentByteBufferPos += j;
                    return slice((int) ((this.currentByteBufferPos - this.currentAddress) - j), (int) (this.currentByteBufferPos - this.currentAddress));
                }
            }
            if (readRawVarint32 > 0 && readRawVarint32 <= remaining()) {
                byte[] bArr2 = new byte[readRawVarint32];
                readRawBytesTo(bArr2, 0, readRawVarint32);
                return ByteBuffer.wrap(bArr2);
            } else if (readRawVarint32 == 0) {
                return Internal.EMPTY_BYTE_BUFFER;
            } else {
                if (readRawVarint32 < 0) {
                    throw InvalidProtocolBufferException.negativeSize();
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
        }

        public ByteString readBytes() throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (readRawVarint32 > 0) {
                long j = (long) readRawVarint32;
                if (j <= this.currentByteBufferLimit - this.currentByteBufferPos) {
                    if (!this.immutable || !this.enableAliasing) {
                        byte[] bArr = new byte[readRawVarint32];
                        UnsafeUtil.copyMemory(this.currentByteBufferPos, bArr, 0, j);
                        this.currentByteBufferPos += j;
                        return ByteString.wrap(bArr);
                    }
                    int i = (int) (this.currentByteBufferPos - this.currentAddress);
                    ByteString wrap = ByteString.wrap(slice(i, readRawVarint32 + i));
                    this.currentByteBufferPos += j;
                    return wrap;
                }
            }
            if (readRawVarint32 > 0 && readRawVarint32 <= remaining()) {
                byte[] bArr2 = new byte[readRawVarint32];
                readRawBytesTo(bArr2, 0, readRawVarint32);
                return ByteString.wrap(bArr2);
            } else if (readRawVarint32 == 0) {
                return ByteString.EMPTY;
            } else {
                if (readRawVarint32 < 0) {
                    throw InvalidProtocolBufferException.negativeSize();
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
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

        public <T extends MessageLite> T readGroup(int i, Parser<T> parser, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            if (this.recursionDepth < this.recursionLimit) {
                this.recursionDepth++;
                T t = (MessageLite) parser.parsePartialFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(WireFormat.makeTag(i, 4));
                this.recursionDepth--;
                return t;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public void readGroup(int i, Builder builder, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            if (this.recursionDepth < this.recursionLimit) {
                this.recursionDepth++;
                builder.mergeFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(WireFormat.makeTag(i, 4));
                this.recursionDepth--;
                return;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public int readInt32() throws IOException {
            return readRawVarint32();
        }

        public long readInt64() throws IOException {
            return readRawVarint64();
        }

        public <T extends MessageLite> T readMessage(Parser<T> parser, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (this.recursionDepth < this.recursionLimit) {
                int pushLimit = pushLimit(readRawVarint32);
                this.recursionDepth++;
                T t = (MessageLite) parser.parsePartialFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(0);
                this.recursionDepth--;
                popLimit(pushLimit);
                return t;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public void readMessage(Builder builder, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (this.recursionDepth < this.recursionLimit) {
                int pushLimit = pushLimit(readRawVarint32);
                this.recursionDepth++;
                builder.mergeFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(0);
                this.recursionDepth--;
                popLimit(pushLimit);
                return;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public byte readRawByte() throws IOException {
            if (currentRemaining() == 0) {
                getNextByteBuffer();
            }
            long j = this.currentByteBufferPos;
            this.currentByteBufferPos = 1 + j;
            return UnsafeUtil.getByte(j);
        }

        public byte[] readRawBytes(int i) throws IOException {
            if (i >= 0) {
                long j = (long) i;
                if (j <= currentRemaining()) {
                    byte[] bArr = new byte[i];
                    UnsafeUtil.copyMemory(this.currentByteBufferPos, bArr, 0, j);
                    this.currentByteBufferPos += j;
                    return bArr;
                }
            }
            if (i >= 0 && i <= remaining()) {
                byte[] bArr2 = new byte[i];
                readRawBytesTo(bArr2, 0, i);
                return bArr2;
            } else if (i > 0) {
                throw InvalidProtocolBufferException.truncatedMessage();
            } else if (i == 0) {
                return Internal.EMPTY_BYTE_ARRAY;
            } else {
                throw InvalidProtocolBufferException.negativeSize();
            }
        }

        public int readRawLittleEndian32() throws IOException {
            if (currentRemaining() < 4) {
                return (readRawByte() & 255) | ((readRawByte() & 255) << 8) | ((readRawByte() & 255) << 16) | ((readRawByte() & 255) << 24);
            }
            long j = this.currentByteBufferPos;
            this.currentByteBufferPos += 4;
            return ((UnsafeUtil.getByte(j + 3) & 255) << 24) | (UnsafeUtil.getByte(j) & 255) | ((UnsafeUtil.getByte(1 + j) & 255) << 8) | ((UnsafeUtil.getByte(2 + j) & 255) << 16);
        }

        public long readRawLittleEndian64() throws IOException {
            if (currentRemaining() < 8) {
                return (((long) readRawByte()) & 255) | ((((long) readRawByte()) & 255) << 8) | ((((long) readRawByte()) & 255) << 16) | ((((long) readRawByte()) & 255) << 24) | ((((long) readRawByte()) & 255) << 32) | ((((long) readRawByte()) & 255) << 40) | ((((long) readRawByte()) & 255) << 48) | ((((long) readRawByte()) & 255) << 56);
            }
            long j = this.currentByteBufferPos;
            this.currentByteBufferPos += 8;
            return (((long) UnsafeUtil.getByte(j)) & 255) | ((((long) UnsafeUtil.getByte(1 + j)) & 255) << 8) | ((((long) UnsafeUtil.getByte(2 + j)) & 255) << 16) | ((((long) UnsafeUtil.getByte(3 + j)) & 255) << 24) | ((((long) UnsafeUtil.getByte(4 + j)) & 255) << 32) | ((((long) UnsafeUtil.getByte(5 + j)) & 255) << 40) | ((((long) UnsafeUtil.getByte(6 + j)) & 255) << 48) | ((((long) UnsafeUtil.getByte(j + 7)) & 255) << 56);
        }

        /* JADX WARNING: Code restructure failed: missing block: B:29:0x008e, code lost:
            if (com.google.protobuf.UnsafeUtil.getByte(r4) < 0) goto L_0x0090;
         */
        public int readRawVarint32() throws IOException {
            byte b;
            long j = this.currentByteBufferPos;
            if (this.currentByteBufferLimit != this.currentByteBufferPos) {
                long j2 = j + 1;
                byte b2 = UnsafeUtil.getByte(j);
                if (b2 >= 0) {
                    this.currentByteBufferPos++;
                    return b2;
                } else if (this.currentByteBufferLimit - this.currentByteBufferPos >= 10) {
                    long j3 = j2 + 1;
                    byte b3 = b2 ^ (UnsafeUtil.getByte(j2) << 7);
                    if (b3 < 0) {
                        b = b3 ^ Byte.MIN_VALUE;
                    } else {
                        long j4 = j3 + 1;
                        byte b4 = b3 ^ (UnsafeUtil.getByte(j3) << 14);
                        if (b4 >= 0) {
                            b = b4 ^ 16256;
                        } else {
                            j3 = j4 + 1;
                            byte b5 = b4 ^ (UnsafeUtil.getByte(j4) << 21);
                            if (b5 < 0) {
                                b = b5 ^ -2080896;
                            } else {
                                j4 = j3 + 1;
                                byte b6 = UnsafeUtil.getByte(j3);
                                b = (b5 ^ (b6 << 28)) ^ 266354560;
                                if (b6 < 0) {
                                    j3 = j4 + 1;
                                    if (UnsafeUtil.getByte(j4) < 0) {
                                        j4 = j3 + 1;
                                        if (UnsafeUtil.getByte(j3) < 0) {
                                            j3 = j4 + 1;
                                            if (UnsafeUtil.getByte(j4) < 0) {
                                                j4 = j3 + 1;
                                                if (UnsafeUtil.getByte(j3) < 0) {
                                                    j3 = j4 + 1;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        j3 = j4;
                    }
                    this.currentByteBufferPos = j3;
                    return b;
                }
            }
            return (int) readRawVarint64SlowPath();
        }

        public long readRawVarint64() throws IOException {
            long j;
            long j2;
            long j3;
            long j4 = this.currentByteBufferPos;
            if (this.currentByteBufferLimit != this.currentByteBufferPos) {
                long j5 = j4 + 1;
                byte b = UnsafeUtil.getByte(j4);
                if (b >= 0) {
                    this.currentByteBufferPos++;
                    return (long) b;
                } else if (this.currentByteBufferLimit - this.currentByteBufferPos >= 10) {
                    long j6 = j5 + 1;
                    byte b2 = b ^ (UnsafeUtil.getByte(j5) << 7);
                    if (b2 < 0) {
                        j2 = (long) (b2 ^ Byte.MIN_VALUE);
                    } else {
                        j = j6 + 1;
                        byte b3 = b2 ^ (UnsafeUtil.getByte(j6) << 14);
                        if (b3 >= 0) {
                            j2 = (long) (b3 ^ 16256);
                        } else {
                            j6 = j + 1;
                            byte b4 = b3 ^ (UnsafeUtil.getByte(j) << 21);
                            if (b4 < 0) {
                                j2 = (long) (b4 ^ -2080896);
                            } else {
                                j = j6 + 1;
                                long j7 = ((long) b4) ^ (((long) UnsafeUtil.getByte(j6)) << 28);
                                if (j7 >= 0) {
                                    j2 = j7 ^ 266354560;
                                } else {
                                    long j8 = j + 1;
                                    long j9 = j7 ^ (((long) UnsafeUtil.getByte(j)) << 35);
                                    if (j9 < 0) {
                                        j3 = j9 ^ -34093383808L;
                                    } else {
                                        j = j8 + 1;
                                        long j10 = j9 ^ (((long) UnsafeUtil.getByte(j8)) << 42);
                                        if (j10 >= 0) {
                                            j2 = j10 ^ 4363953127296L;
                                        } else {
                                            j8 = j + 1;
                                            long j11 = j10 ^ (((long) UnsafeUtil.getByte(j)) << 49);
                                            if (j11 < 0) {
                                                j3 = j11 ^ -558586000294016L;
                                            } else {
                                                j = j8 + 1;
                                                j2 = (j11 ^ (((long) UnsafeUtil.getByte(j8)) << 56)) ^ 71499008037633920L;
                                                if (j2 < 0) {
                                                    long j12 = 1 + j;
                                                    if (((long) UnsafeUtil.getByte(j)) >= 0) {
                                                        j = j12;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    j = j8;
                                }
                            }
                        }
                        this.currentByteBufferPos = j;
                        return j2;
                    }
                    j = j6;
                    this.currentByteBufferPos = j;
                    return j2;
                }
            }
            return readRawVarint64SlowPath();
        }

        /* access modifiers changed from: 0000 */
        public long readRawVarint64SlowPath() throws IOException {
            long j = 0;
            for (int i = 0; i < 64; i += 7) {
                byte readRawByte = readRawByte();
                j |= ((long) (readRawByte & Byte.MAX_VALUE)) << i;
                if ((readRawByte & 128) == 0) {
                    return j;
                }
            }
            throw InvalidProtocolBufferException.malformedVarint();
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
            if (readRawVarint32 > 0) {
                long j = (long) readRawVarint32;
                if (j <= this.currentByteBufferLimit - this.currentByteBufferPos) {
                    byte[] bArr = new byte[readRawVarint32];
                    UnsafeUtil.copyMemory(this.currentByteBufferPos, bArr, 0, j);
                    String str = new String(bArr, Internal.UTF_8);
                    this.currentByteBufferPos += j;
                    return str;
                }
            }
            if (readRawVarint32 > 0 && readRawVarint32 <= remaining()) {
                byte[] bArr2 = new byte[readRawVarint32];
                readRawBytesTo(bArr2, 0, readRawVarint32);
                return new String(bArr2, Internal.UTF_8);
            } else if (readRawVarint32 == 0) {
                return "";
            } else {
                if (readRawVarint32 < 0) {
                    throw InvalidProtocolBufferException.negativeSize();
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
        }

        public String readStringRequireUtf8() throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (readRawVarint32 > 0) {
                long j = (long) readRawVarint32;
                if (j <= this.currentByteBufferLimit - this.currentByteBufferPos) {
                    String decodeUtf8 = Utf8.decodeUtf8(this.currentByteBuffer, (int) (this.currentByteBufferPos - this.currentByteBufferStartPos), readRawVarint32);
                    this.currentByteBufferPos += j;
                    return decodeUtf8;
                }
            }
            if (readRawVarint32 >= 0 && readRawVarint32 <= remaining()) {
                byte[] bArr = new byte[readRawVarint32];
                readRawBytesTo(bArr, 0, readRawVarint32);
                return Utf8.decodeUtf8(bArr, 0, readRawVarint32);
            } else if (readRawVarint32 == 0) {
                return "";
            } else {
                if (readRawVarint32 <= 0) {
                    throw InvalidProtocolBufferException.negativeSize();
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
        }

        public int readTag() throws IOException {
            if (isAtEnd()) {
                this.lastTag = 0;
                return 0;
            }
            this.lastTag = readRawVarint32();
            if (WireFormat.getTagFieldNumber(this.lastTag) != 0) {
                return this.lastTag;
            }
            throw InvalidProtocolBufferException.invalidTag();
        }

        public int readUInt32() throws IOException {
            return readRawVarint32();
        }

        public long readUInt64() throws IOException {
            return readRawVarint64();
        }

        @Deprecated
        public void readUnknownGroup(int i, Builder builder) throws IOException {
            readGroup(i, builder, ExtensionRegistryLite.getEmptyRegistry());
        }

        public void resetSizeCounter() {
            this.startOffset = (int) ((((long) this.totalBytesRead) + this.currentByteBufferPos) - this.currentByteBufferStartPos);
        }

        public boolean skipField(int i) throws IOException {
            switch (WireFormat.getTagWireType(i)) {
                case 0:
                    skipRawVarint();
                    return true;
                case 1:
                    skipRawBytes(8);
                    return true;
                case 2:
                    skipRawBytes(readRawVarint32());
                    return true;
                case 3:
                    skipMessage();
                    checkLastTagWas(WireFormat.makeTag(WireFormat.getTagFieldNumber(i), 4));
                    return true;
                case 4:
                    return false;
                case 5:
                    skipRawBytes(4);
                    return true;
                default:
                    throw InvalidProtocolBufferException.invalidWireType();
            }
        }

        public boolean skipField(int i, CodedOutputStream codedOutputStream) throws IOException {
            switch (WireFormat.getTagWireType(i)) {
                case 0:
                    long readInt64 = readInt64();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeUInt64NoTag(readInt64);
                    return true;
                case 1:
                    long readRawLittleEndian64 = readRawLittleEndian64();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeFixed64NoTag(readRawLittleEndian64);
                    return true;
                case 2:
                    ByteString readBytes = readBytes();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeBytesNoTag(readBytes);
                    return true;
                case 3:
                    codedOutputStream.writeRawVarint32(i);
                    skipMessage(codedOutputStream);
                    int makeTag = WireFormat.makeTag(WireFormat.getTagFieldNumber(i), 4);
                    checkLastTagWas(makeTag);
                    codedOutputStream.writeRawVarint32(makeTag);
                    return true;
                case 4:
                    return false;
                case 5:
                    int readRawLittleEndian32 = readRawLittleEndian32();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeFixed32NoTag(readRawLittleEndian32);
                    return true;
                default:
                    throw InvalidProtocolBufferException.invalidWireType();
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

        public void skipMessage(CodedOutputStream codedOutputStream) throws IOException {
            int readTag;
            do {
                readTag = readTag();
                if (readTag == 0) {
                    return;
                }
            } while (skipField(readTag, codedOutputStream));
        }

        public void skipRawBytes(int i) throws IOException {
            if (i >= 0 && ((long) i) <= (((long) (this.totalBufferSize - this.totalBytesRead)) - this.currentByteBufferPos) + this.currentByteBufferStartPos) {
                while (i > 0) {
                    if (currentRemaining() == 0) {
                        getNextByteBuffer();
                    }
                    int min = Math.min(i, (int) currentRemaining());
                    i -= min;
                    this.currentByteBufferPos += (long) min;
                }
            } else if (i < 0) {
                throw InvalidProtocolBufferException.negativeSize();
            } else {
                throw InvalidProtocolBufferException.truncatedMessage();
            }
        }
    }

    private static final class StreamDecoder extends CodedInputStream {
        /* access modifiers changed from: private */
        public final byte[] buffer;
        private int bufferSize;
        private int bufferSizeAfterLimit;
        private int currentLimit;
        private final InputStream input;
        private int lastTag;
        /* access modifiers changed from: private */
        public int pos;
        private RefillCallback refillCallback;
        private int totalBytesRetired;

        private interface RefillCallback {
            void onRefill();
        }

        private class SkippedDataSink implements RefillCallback {
            private ByteArrayOutputStream byteArrayStream;
            private int lastPos = StreamDecoder.this.pos;

            private SkippedDataSink() {
            }

            /* access modifiers changed from: 0000 */
            public ByteBuffer getSkippedData() {
                if (this.byteArrayStream == null) {
                    return ByteBuffer.wrap(StreamDecoder.this.buffer, this.lastPos, StreamDecoder.this.pos - this.lastPos);
                }
                this.byteArrayStream.write(StreamDecoder.this.buffer, this.lastPos, StreamDecoder.this.pos);
                return ByteBuffer.wrap(this.byteArrayStream.toByteArray());
            }

            public void onRefill() {
                if (this.byteArrayStream == null) {
                    this.byteArrayStream = new ByteArrayOutputStream();
                }
                this.byteArrayStream.write(StreamDecoder.this.buffer, this.lastPos, StreamDecoder.this.pos - this.lastPos);
                this.lastPos = 0;
            }
        }

        private StreamDecoder(InputStream inputStream, int i) {
            super();
            this.currentLimit = CodedInputStream.DEFAULT_SIZE_LIMIT;
            this.refillCallback = null;
            Internal.checkNotNull(inputStream, "input");
            this.input = inputStream;
            this.buffer = new byte[i];
            this.bufferSize = 0;
            this.pos = 0;
            this.totalBytesRetired = 0;
        }

        private ByteString readBytesSlowPath(int i) throws IOException {
            byte[] readRawBytesSlowPathOneChunk = readRawBytesSlowPathOneChunk(i);
            if (readRawBytesSlowPathOneChunk != null) {
                return ByteString.wrap(readRawBytesSlowPathOneChunk);
            }
            int i2 = this.pos;
            int i3 = this.bufferSize - this.pos;
            this.totalBytesRetired += this.bufferSize;
            this.pos = 0;
            this.bufferSize = 0;
            List<byte[]> readRawBytesSlowPathRemainingChunks = readRawBytesSlowPathRemainingChunks(i - i3);
            ArrayList arrayList = new ArrayList(readRawBytesSlowPathRemainingChunks.size() + 1);
            arrayList.add(ByteString.copyFrom(this.buffer, i2, i3));
            for (byte[] wrap : readRawBytesSlowPathRemainingChunks) {
                arrayList.add(ByteString.wrap(wrap));
            }
            return ByteString.copyFrom((Iterable<ByteString>) arrayList);
        }

        private byte[] readRawBytesSlowPath(int i) throws IOException {
            byte[] readRawBytesSlowPathOneChunk = readRawBytesSlowPathOneChunk(i);
            if (readRawBytesSlowPathOneChunk != null) {
                return readRawBytesSlowPathOneChunk;
            }
            int i2 = this.pos;
            int i3 = this.bufferSize - this.pos;
            this.totalBytesRetired += this.bufferSize;
            this.pos = 0;
            this.bufferSize = 0;
            List<byte[]> readRawBytesSlowPathRemainingChunks = readRawBytesSlowPathRemainingChunks(i - i3);
            byte[] bArr = new byte[i];
            System.arraycopy(this.buffer, i2, bArr, 0, i3);
            for (byte[] bArr2 : readRawBytesSlowPathRemainingChunks) {
                System.arraycopy(bArr2, 0, bArr, i3, bArr2.length);
                i3 += bArr2.length;
            }
            return bArr;
        }

        private byte[] readRawBytesSlowPathOneChunk(int i) throws IOException {
            if (i == 0) {
                return Internal.EMPTY_BYTE_ARRAY;
            }
            if (i >= 0) {
                int i2 = this.totalBytesRetired + this.pos + i;
                if (i2 - this.sizeLimit > 0) {
                    throw InvalidProtocolBufferException.sizeLimitExceeded();
                } else if (i2 <= this.currentLimit) {
                    int i3 = this.bufferSize - this.pos;
                    int i4 = i - i3;
                    if (i4 >= 4096 && i4 > this.input.available()) {
                        return null;
                    }
                    byte[] bArr = new byte[i];
                    System.arraycopy(this.buffer, this.pos, bArr, 0, i3);
                    this.totalBytesRetired += this.bufferSize;
                    this.pos = 0;
                    this.bufferSize = 0;
                    while (i3 < bArr.length) {
                        int read = this.input.read(bArr, i3, i - i3);
                        if (read != -1) {
                            this.totalBytesRetired += read;
                            i3 += read;
                        } else {
                            throw InvalidProtocolBufferException.truncatedMessage();
                        }
                    }
                    return bArr;
                } else {
                    skipRawBytes((this.currentLimit - this.totalBytesRetired) - this.pos);
                    throw InvalidProtocolBufferException.truncatedMessage();
                }
            } else {
                throw InvalidProtocolBufferException.negativeSize();
            }
        }

        private List<byte[]> readRawBytesSlowPathRemainingChunks(int i) throws IOException {
            ArrayList arrayList = new ArrayList();
            while (i > 0) {
                byte[] bArr = new byte[Math.min(i, 4096)];
                int i2 = 0;
                while (i2 < bArr.length) {
                    int read = this.input.read(bArr, i2, bArr.length - i2);
                    if (read != -1) {
                        this.totalBytesRetired += read;
                        i2 += read;
                    } else {
                        throw InvalidProtocolBufferException.truncatedMessage();
                    }
                }
                i -= bArr.length;
                arrayList.add(bArr);
            }
            return arrayList;
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

        private void refillBuffer(int i) throws IOException {
            if (tryRefillBuffer(i)) {
                return;
            }
            if (i > (this.sizeLimit - this.totalBytesRetired) - this.pos) {
                throw InvalidProtocolBufferException.sizeLimitExceeded();
            }
            throw InvalidProtocolBufferException.truncatedMessage();
        }

        private void skipRawBytesSlowPath(int i) throws IOException {
            if (i < 0) {
                throw InvalidProtocolBufferException.negativeSize();
            } else if (this.totalBytesRetired + this.pos + i > this.currentLimit) {
                skipRawBytes((this.currentLimit - this.totalBytesRetired) - this.pos);
                throw InvalidProtocolBufferException.truncatedMessage();
            } else if (this.refillCallback != null) {
                int i2 = this.bufferSize - this.pos;
                this.pos = this.bufferSize;
                refillBuffer(1);
                while (true) {
                    int i3 = i - i2;
                    if (i3 > this.bufferSize) {
                        i2 += this.bufferSize;
                        this.pos = this.bufferSize;
                        refillBuffer(1);
                    } else {
                        this.pos = i3;
                        return;
                    }
                }
            } else {
                this.totalBytesRetired += this.pos;
                int i4 = this.bufferSize - this.pos;
                this.bufferSize = 0;
                this.pos = 0;
                while (i4 < i) {
                    try {
                        long j = (long) (i - i4);
                        long skip = this.input.skip(j);
                        if (skip < 0 || skip > j) {
                            StringBuilder sb = new StringBuilder();
                            sb.append(this.input.getClass());
                            sb.append("#skip returned invalid result: ");
                            sb.append(skip);
                            sb.append("\nThe InputStream implementation is buggy.");
                            throw new IllegalStateException(sb.toString());
                        }
                        i4 += (int) skip;
                    } catch (Throwable th) {
                        this.totalBytesRetired += i4;
                        recomputeBufferSizeAfterLimit();
                        throw th;
                    }
                }
                this.totalBytesRetired += i4;
                recomputeBufferSizeAfterLimit();
            }
        }

        private void skipRawVarint() throws IOException {
            if (this.bufferSize - this.pos >= 10) {
                skipRawVarintFastPath();
            } else {
                skipRawVarintSlowPath();
            }
        }

        private void skipRawVarintFastPath() throws IOException {
            int i = 0;
            while (i < 10) {
                byte[] bArr = this.buffer;
                int i2 = this.pos;
                this.pos = i2 + 1;
                if (bArr[i2] < 0) {
                    i++;
                } else {
                    return;
                }
            }
            throw InvalidProtocolBufferException.malformedVarint();
        }

        private void skipRawVarintSlowPath() throws IOException {
            int i = 0;
            while (i < 10) {
                if (readRawByte() < 0) {
                    i++;
                } else {
                    return;
                }
            }
            throw InvalidProtocolBufferException.malformedVarint();
        }

        private boolean tryRefillBuffer(int i) throws IOException {
            if (this.pos + i <= this.bufferSize) {
                StringBuilder sb = new StringBuilder();
                sb.append("refillBuffer() called when ");
                sb.append(i);
                sb.append(" bytes were already available in buffer");
                throw new IllegalStateException(sb.toString());
            } else if (i > (this.sizeLimit - this.totalBytesRetired) - this.pos || this.totalBytesRetired + this.pos + i > this.currentLimit) {
                return false;
            } else {
                if (this.refillCallback != null) {
                    this.refillCallback.onRefill();
                }
                int i2 = this.pos;
                if (i2 > 0) {
                    if (this.bufferSize > i2) {
                        System.arraycopy(this.buffer, i2, this.buffer, 0, this.bufferSize - i2);
                    }
                    this.totalBytesRetired += i2;
                    this.bufferSize -= i2;
                    this.pos = 0;
                }
                int read = this.input.read(this.buffer, this.bufferSize, Math.min(this.buffer.length - this.bufferSize, (this.sizeLimit - this.totalBytesRetired) - this.bufferSize));
                if (read == 0 || read < -1 || read > this.buffer.length) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(this.input.getClass());
                    sb2.append("#read(byte[]) returned invalid result: ");
                    sb2.append(read);
                    sb2.append("\nThe InputStream implementation is buggy.");
                    throw new IllegalStateException(sb2.toString());
                } else if (read <= 0) {
                    return false;
                } else {
                    this.bufferSize += read;
                    recomputeBufferSizeAfterLimit();
                    return this.bufferSize >= i ? true : tryRefillBuffer(i);
                }
            }
        }

        public void checkLastTagWas(int i) throws InvalidProtocolBufferException {
            if (this.lastTag != i) {
                throw InvalidProtocolBufferException.invalidEndTag();
            }
        }

        public void enableAliasing(boolean z) {
        }

        public int getBytesUntilLimit() {
            if (this.currentLimit == CodedInputStream.DEFAULT_SIZE_LIMIT) {
                return -1;
            }
            return this.currentLimit - (this.totalBytesRetired + this.pos);
        }

        public int getLastTag() {
            return this.lastTag;
        }

        public int getTotalBytesRead() {
            return this.totalBytesRetired + this.pos;
        }

        public boolean isAtEnd() throws IOException {
            return this.pos == this.bufferSize && !tryRefillBuffer(1);
        }

        public void popLimit(int i) {
            this.currentLimit = i;
            recomputeBufferSizeAfterLimit();
        }

        public int pushLimit(int i) throws InvalidProtocolBufferException {
            if (i >= 0) {
                int i2 = i + this.totalBytesRetired + this.pos;
                int i3 = this.currentLimit;
                if (i2 <= i3) {
                    this.currentLimit = i2;
                    recomputeBufferSizeAfterLimit();
                    return i3;
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
            throw InvalidProtocolBufferException.negativeSize();
        }

        public boolean readBool() throws IOException {
            return readRawVarint64() != 0;
        }

        public byte[] readByteArray() throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (readRawVarint32 > this.bufferSize - this.pos || readRawVarint32 <= 0) {
                return readRawBytesSlowPath(readRawVarint32);
            }
            byte[] copyOfRange = Arrays.copyOfRange(this.buffer, this.pos, this.pos + readRawVarint32);
            this.pos += readRawVarint32;
            return copyOfRange;
        }

        public ByteBuffer readByteBuffer() throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (readRawVarint32 > this.bufferSize - this.pos || readRawVarint32 <= 0) {
                return readRawVarint32 == 0 ? Internal.EMPTY_BYTE_BUFFER : ByteBuffer.wrap(readRawBytesSlowPath(readRawVarint32));
            }
            ByteBuffer wrap = ByteBuffer.wrap(Arrays.copyOfRange(this.buffer, this.pos, this.pos + readRawVarint32));
            this.pos += readRawVarint32;
            return wrap;
        }

        public ByteString readBytes() throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (readRawVarint32 > this.bufferSize - this.pos || readRawVarint32 <= 0) {
                return readRawVarint32 == 0 ? ByteString.EMPTY : readBytesSlowPath(readRawVarint32);
            }
            ByteString copyFrom = ByteString.copyFrom(this.buffer, this.pos, readRawVarint32);
            this.pos += readRawVarint32;
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

        public <T extends MessageLite> T readGroup(int i, Parser<T> parser, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            if (this.recursionDepth < this.recursionLimit) {
                this.recursionDepth++;
                T t = (MessageLite) parser.parsePartialFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(WireFormat.makeTag(i, 4));
                this.recursionDepth--;
                return t;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public void readGroup(int i, Builder builder, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            if (this.recursionDepth < this.recursionLimit) {
                this.recursionDepth++;
                builder.mergeFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(WireFormat.makeTag(i, 4));
                this.recursionDepth--;
                return;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public int readInt32() throws IOException {
            return readRawVarint32();
        }

        public long readInt64() throws IOException {
            return readRawVarint64();
        }

        public <T extends MessageLite> T readMessage(Parser<T> parser, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (this.recursionDepth < this.recursionLimit) {
                int pushLimit = pushLimit(readRawVarint32);
                this.recursionDepth++;
                T t = (MessageLite) parser.parsePartialFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(0);
                this.recursionDepth--;
                popLimit(pushLimit);
                return t;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public void readMessage(Builder builder, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (this.recursionDepth < this.recursionLimit) {
                int pushLimit = pushLimit(readRawVarint32);
                this.recursionDepth++;
                builder.mergeFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(0);
                this.recursionDepth--;
                popLimit(pushLimit);
                return;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public byte readRawByte() throws IOException {
            if (this.pos == this.bufferSize) {
                refillBuffer(1);
            }
            byte[] bArr = this.buffer;
            int i = this.pos;
            this.pos = i + 1;
            return bArr[i];
        }

        public byte[] readRawBytes(int i) throws IOException {
            int i2 = this.pos;
            if (i > this.bufferSize - i2 || i <= 0) {
                return readRawBytesSlowPath(i);
            }
            int i3 = i + i2;
            this.pos = i3;
            return Arrays.copyOfRange(this.buffer, i2, i3);
        }

        public int readRawLittleEndian32() throws IOException {
            int i = this.pos;
            if (this.bufferSize - i < 4) {
                refillBuffer(4);
                i = this.pos;
            }
            byte[] bArr = this.buffer;
            this.pos = i + 4;
            return ((bArr[i + 3] & 255) << 24) | (bArr[i] & 255) | ((bArr[i + 1] & 255) << 8) | ((bArr[i + 2] & 255) << 16);
        }

        public long readRawLittleEndian64() throws IOException {
            int i = this.pos;
            if (this.bufferSize - i < 8) {
                refillBuffer(8);
                i = this.pos;
            }
            byte[] bArr = this.buffer;
            this.pos = i + 8;
            return ((((long) bArr[i + 7]) & 255) << 56) | (((long) bArr[i]) & 255) | ((((long) bArr[i + 1]) & 255) << 8) | ((((long) bArr[i + 2]) & 255) << 16) | ((((long) bArr[i + 3]) & 255) << 24) | ((((long) bArr[i + 4]) & 255) << 32) | ((((long) bArr[i + 5]) & 255) << 40) | ((((long) bArr[i + 6]) & 255) << 48);
        }

        /* JADX WARNING: Code restructure failed: missing block: B:29:0x006a, code lost:
            if (r1[r2] < 0) goto L_0x006c;
         */
        public int readRawVarint32() throws IOException {
            byte b;
            int i = this.pos;
            if (this.bufferSize != i) {
                byte[] bArr = this.buffer;
                int i2 = i + 1;
                byte b2 = bArr[i];
                if (b2 >= 0) {
                    this.pos = i2;
                    return b2;
                } else if (this.bufferSize - i2 >= 9) {
                    int i3 = i2 + 1;
                    byte b3 = b2 ^ (bArr[i2] << 7);
                    if (b3 < 0) {
                        b = b3 ^ Byte.MIN_VALUE;
                    } else {
                        int i4 = i3 + 1;
                        byte b4 = b3 ^ (bArr[i3] << 14);
                        if (b4 >= 0) {
                            b = b4 ^ 16256;
                        } else {
                            i3 = i4 + 1;
                            byte b5 = b4 ^ (bArr[i4] << 21);
                            if (b5 < 0) {
                                b = b5 ^ -2080896;
                            } else {
                                i4 = i3 + 1;
                                byte b6 = bArr[i3];
                                b = (b5 ^ (b6 << 28)) ^ 266354560;
                                if (b6 < 0) {
                                    i3 = i4 + 1;
                                    if (bArr[i4] < 0) {
                                        i4 = i3 + 1;
                                        if (bArr[i3] < 0) {
                                            i3 = i4 + 1;
                                            if (bArr[i4] < 0) {
                                                i4 = i3 + 1;
                                                if (bArr[i3] < 0) {
                                                    i3 = i4 + 1;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        i3 = i4;
                    }
                    this.pos = i3;
                    return b;
                }
            }
            return (int) readRawVarint64SlowPath();
        }

        /* JADX WARNING: Code restructure failed: missing block: B:36:0x00b9, code lost:
            if (((long) r1[r0]) < 0) goto L_0x00bb;
         */
        public long readRawVarint64() throws IOException {
            long j;
            int i;
            long j2;
            long j3;
            long j4;
            int i2 = this.pos;
            if (this.bufferSize != i2) {
                byte[] bArr = this.buffer;
                int i3 = i2 + 1;
                byte b = bArr[i2];
                if (b >= 0) {
                    this.pos = i3;
                    return (long) b;
                } else if (this.bufferSize - i3 >= 9) {
                    int i4 = i3 + 1;
                    byte b2 = b ^ (bArr[i3] << 7);
                    if (b2 < 0) {
                        j3 = (long) (b2 ^ Byte.MIN_VALUE);
                    } else {
                        int i5 = i4 + 1;
                        byte b3 = b2 ^ (bArr[i4] << 14);
                        if (b3 >= 0) {
                            j4 = (long) (b3 ^ 16256);
                            i = i5;
                            j = j4;
                            this.pos = i;
                            return j;
                        }
                        i4 = i5 + 1;
                        byte b4 = b3 ^ (bArr[i5] << 21);
                        if (b4 < 0) {
                            j3 = (long) (b4 ^ -2080896);
                        } else {
                            long j5 = (long) b4;
                            i = i4 + 1;
                            long j6 = (((long) bArr[i4]) << 28) ^ j5;
                            if (j6 >= 0) {
                                j = j6 ^ 266354560;
                            } else {
                                int i6 = i + 1;
                                long j7 = j6 ^ (((long) bArr[i]) << 35);
                                if (j7 < 0) {
                                    j2 = -34093383808L ^ j7;
                                } else {
                                    i = i6 + 1;
                                    long j8 = j7 ^ (((long) bArr[i6]) << 42);
                                    if (j8 >= 0) {
                                        j = j8 ^ 4363953127296L;
                                    } else {
                                        i6 = i + 1;
                                        long j9 = j8 ^ (((long) bArr[i]) << 49);
                                        if (j9 < 0) {
                                            j2 = -558586000294016L ^ j9;
                                        } else {
                                            i = i6 + 1;
                                            j = (j9 ^ (((long) bArr[i6]) << 56)) ^ 71499008037633920L;
                                            if (j < 0) {
                                                i6 = i + 1;
                                            }
                                        }
                                    }
                                }
                                j = j2;
                                i = i6;
                            }
                            this.pos = i;
                            return j;
                        }
                    }
                    j4 = j3;
                    i = i4;
                    j = j4;
                    this.pos = i;
                    return j;
                }
            }
            return readRawVarint64SlowPath();
        }

        /* access modifiers changed from: 0000 */
        public long readRawVarint64SlowPath() throws IOException {
            long j = 0;
            for (int i = 0; i < 64; i += 7) {
                byte readRawByte = readRawByte();
                j |= ((long) (readRawByte & Byte.MAX_VALUE)) << i;
                if ((readRawByte & 128) == 0) {
                    return j;
                }
            }
            throw InvalidProtocolBufferException.malformedVarint();
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
            if (readRawVarint32 > 0 && readRawVarint32 <= this.bufferSize - this.pos) {
                String str = new String(this.buffer, this.pos, readRawVarint32, Internal.UTF_8);
                this.pos += readRawVarint32;
                return str;
            } else if (readRawVarint32 == 0) {
                return "";
            } else {
                if (readRawVarint32 > this.bufferSize) {
                    return new String(readRawBytesSlowPath(readRawVarint32), Internal.UTF_8);
                }
                refillBuffer(readRawVarint32);
                String str2 = new String(this.buffer, this.pos, readRawVarint32, Internal.UTF_8);
                this.pos += readRawVarint32;
                return str2;
            }
        }

        public String readStringRequireUtf8() throws IOException {
            byte[] bArr;
            int readRawVarint32 = readRawVarint32();
            int i = this.pos;
            int i2 = 0;
            if (readRawVarint32 <= this.bufferSize - i && readRawVarint32 > 0) {
                bArr = this.buffer;
                this.pos = i + readRawVarint32;
                i2 = i;
            } else if (readRawVarint32 == 0) {
                return "";
            } else {
                if (readRawVarint32 <= this.bufferSize) {
                    refillBuffer(readRawVarint32);
                    bArr = this.buffer;
                    this.pos = readRawVarint32 + 0;
                } else {
                    bArr = readRawBytesSlowPath(readRawVarint32);
                }
            }
            return Utf8.decodeUtf8(bArr, i2, readRawVarint32);
        }

        public int readTag() throws IOException {
            if (isAtEnd()) {
                this.lastTag = 0;
                return 0;
            }
            this.lastTag = readRawVarint32();
            if (WireFormat.getTagFieldNumber(this.lastTag) != 0) {
                return this.lastTag;
            }
            throw InvalidProtocolBufferException.invalidTag();
        }

        public int readUInt32() throws IOException {
            return readRawVarint32();
        }

        public long readUInt64() throws IOException {
            return readRawVarint64();
        }

        @Deprecated
        public void readUnknownGroup(int i, Builder builder) throws IOException {
            readGroup(i, builder, ExtensionRegistryLite.getEmptyRegistry());
        }

        public void resetSizeCounter() {
            this.totalBytesRetired = -this.pos;
        }

        public boolean skipField(int i) throws IOException {
            switch (WireFormat.getTagWireType(i)) {
                case 0:
                    skipRawVarint();
                    return true;
                case 1:
                    skipRawBytes(8);
                    return true;
                case 2:
                    skipRawBytes(readRawVarint32());
                    return true;
                case 3:
                    skipMessage();
                    checkLastTagWas(WireFormat.makeTag(WireFormat.getTagFieldNumber(i), 4));
                    return true;
                case 4:
                    return false;
                case 5:
                    skipRawBytes(4);
                    return true;
                default:
                    throw InvalidProtocolBufferException.invalidWireType();
            }
        }

        public boolean skipField(int i, CodedOutputStream codedOutputStream) throws IOException {
            switch (WireFormat.getTagWireType(i)) {
                case 0:
                    long readInt64 = readInt64();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeUInt64NoTag(readInt64);
                    return true;
                case 1:
                    long readRawLittleEndian64 = readRawLittleEndian64();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeFixed64NoTag(readRawLittleEndian64);
                    return true;
                case 2:
                    ByteString readBytes = readBytes();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeBytesNoTag(readBytes);
                    return true;
                case 3:
                    codedOutputStream.writeRawVarint32(i);
                    skipMessage(codedOutputStream);
                    int makeTag = WireFormat.makeTag(WireFormat.getTagFieldNumber(i), 4);
                    checkLastTagWas(makeTag);
                    codedOutputStream.writeRawVarint32(makeTag);
                    return true;
                case 4:
                    return false;
                case 5:
                    int readRawLittleEndian32 = readRawLittleEndian32();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeFixed32NoTag(readRawLittleEndian32);
                    return true;
                default:
                    throw InvalidProtocolBufferException.invalidWireType();
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

        public void skipMessage(CodedOutputStream codedOutputStream) throws IOException {
            int readTag;
            do {
                readTag = readTag();
                if (readTag == 0) {
                    return;
                }
            } while (skipField(readTag, codedOutputStream));
        }

        public void skipRawBytes(int i) throws IOException {
            if (i > this.bufferSize - this.pos || i < 0) {
                skipRawBytesSlowPath(i);
            } else {
                this.pos += i;
            }
        }
    }

    private static final class UnsafeDirectNioDecoder extends CodedInputStream {
        private final long address;
        private final ByteBuffer buffer;
        private int bufferSizeAfterLimit;
        private int currentLimit;
        private boolean enableAliasing;
        private final boolean immutable;
        private int lastTag;
        private long limit;
        private long pos;
        private long startPos;

        private UnsafeDirectNioDecoder(ByteBuffer byteBuffer, boolean z) {
            super();
            this.currentLimit = CodedInputStream.DEFAULT_SIZE_LIMIT;
            this.buffer = byteBuffer;
            this.address = UnsafeUtil.addressOffset(byteBuffer);
            this.limit = this.address + ((long) byteBuffer.limit());
            this.pos = this.address + ((long) byteBuffer.position());
            this.startPos = this.pos;
            this.immutable = z;
        }

        private int bufferPos(long j) {
            return (int) (j - this.address);
        }

        static boolean isSupported() {
            return UnsafeUtil.hasUnsafeByteBufferOperations();
        }

        private void recomputeBufferSizeAfterLimit() {
            this.limit += (long) this.bufferSizeAfterLimit;
            int i = (int) (this.limit - this.startPos);
            if (i > this.currentLimit) {
                this.bufferSizeAfterLimit = i - this.currentLimit;
                this.limit -= (long) this.bufferSizeAfterLimit;
                return;
            }
            this.bufferSizeAfterLimit = 0;
        }

        private int remaining() {
            return (int) (this.limit - this.pos);
        }

        private void skipRawVarint() throws IOException {
            if (remaining() >= 10) {
                skipRawVarintFastPath();
            } else {
                skipRawVarintSlowPath();
            }
        }

        private void skipRawVarintFastPath() throws IOException {
            int i = 0;
            while (i < 10) {
                long j = this.pos;
                this.pos = 1 + j;
                if (UnsafeUtil.getByte(j) < 0) {
                    i++;
                } else {
                    return;
                }
            }
            throw InvalidProtocolBufferException.malformedVarint();
        }

        private void skipRawVarintSlowPath() throws IOException {
            int i = 0;
            while (i < 10) {
                if (readRawByte() < 0) {
                    i++;
                } else {
                    return;
                }
            }
            throw InvalidProtocolBufferException.malformedVarint();
        }

        /* JADX WARNING: Code restructure failed: missing block: B:10:0x0040, code lost:
            throw r4;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:5:0x002f, code lost:
            r4 = move-exception;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:8:0x0035, code lost:
            throw com.google.protobuf.InvalidProtocolBufferException.truncatedMessage();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:9:0x0036, code lost:
            r3.buffer.position(r0);
            r3.buffer.limit(r1);
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:6:0x0031 */
        private ByteBuffer slice(long j, long j2) throws IOException {
            int position = this.buffer.position();
            int limit2 = this.buffer.limit();
            this.buffer.position(bufferPos(j));
            this.buffer.limit(bufferPos(j2));
            ByteBuffer slice = this.buffer.slice();
            this.buffer.position(position);
            this.buffer.limit(limit2);
            return slice;
        }

        public void checkLastTagWas(int i) throws InvalidProtocolBufferException {
            if (this.lastTag != i) {
                throw InvalidProtocolBufferException.invalidEndTag();
            }
        }

        public void enableAliasing(boolean z) {
            this.enableAliasing = z;
        }

        public int getBytesUntilLimit() {
            if (this.currentLimit == CodedInputStream.DEFAULT_SIZE_LIMIT) {
                return -1;
            }
            return this.currentLimit - getTotalBytesRead();
        }

        public int getLastTag() {
            return this.lastTag;
        }

        public int getTotalBytesRead() {
            return (int) (this.pos - this.startPos);
        }

        public boolean isAtEnd() throws IOException {
            return this.pos == this.limit;
        }

        public void popLimit(int i) {
            this.currentLimit = i;
            recomputeBufferSizeAfterLimit();
        }

        public int pushLimit(int i) throws InvalidProtocolBufferException {
            if (i >= 0) {
                int totalBytesRead = i + getTotalBytesRead();
                int i2 = this.currentLimit;
                if (totalBytesRead <= i2) {
                    this.currentLimit = totalBytesRead;
                    recomputeBufferSizeAfterLimit();
                    return i2;
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
            throw InvalidProtocolBufferException.negativeSize();
        }

        public boolean readBool() throws IOException {
            return readRawVarint64() != 0;
        }

        public byte[] readByteArray() throws IOException {
            return readRawBytes(readRawVarint32());
        }

        public ByteBuffer readByteBuffer() throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (readRawVarint32 <= 0 || readRawVarint32 > remaining()) {
                if (readRawVarint32 == 0) {
                    return Internal.EMPTY_BYTE_BUFFER;
                }
                if (readRawVarint32 < 0) {
                    throw InvalidProtocolBufferException.negativeSize();
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            } else if (this.immutable || !this.enableAliasing) {
                byte[] bArr = new byte[readRawVarint32];
                long j = (long) readRawVarint32;
                UnsafeUtil.copyMemory(this.pos, bArr, 0, j);
                this.pos += j;
                return ByteBuffer.wrap(bArr);
            } else {
                long j2 = (long) readRawVarint32;
                ByteBuffer slice = slice(this.pos, this.pos + j2);
                this.pos += j2;
                return slice;
            }
        }

        public ByteString readBytes() throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (readRawVarint32 <= 0 || readRawVarint32 > remaining()) {
                if (readRawVarint32 == 0) {
                    return ByteString.EMPTY;
                }
                if (readRawVarint32 < 0) {
                    throw InvalidProtocolBufferException.negativeSize();
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            } else if (!this.immutable || !this.enableAliasing) {
                byte[] bArr = new byte[readRawVarint32];
                long j = (long) readRawVarint32;
                UnsafeUtil.copyMemory(this.pos, bArr, 0, j);
                this.pos += j;
                return ByteString.wrap(bArr);
            } else {
                long j2 = (long) readRawVarint32;
                ByteBuffer slice = slice(this.pos, this.pos + j2);
                this.pos += j2;
                return ByteString.wrap(slice);
            }
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

        public <T extends MessageLite> T readGroup(int i, Parser<T> parser, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            if (this.recursionDepth < this.recursionLimit) {
                this.recursionDepth++;
                T t = (MessageLite) parser.parsePartialFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(WireFormat.makeTag(i, 4));
                this.recursionDepth--;
                return t;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public void readGroup(int i, Builder builder, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            if (this.recursionDepth < this.recursionLimit) {
                this.recursionDepth++;
                builder.mergeFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(WireFormat.makeTag(i, 4));
                this.recursionDepth--;
                return;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public int readInt32() throws IOException {
            return readRawVarint32();
        }

        public long readInt64() throws IOException {
            return readRawVarint64();
        }

        public <T extends MessageLite> T readMessage(Parser<T> parser, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (this.recursionDepth < this.recursionLimit) {
                int pushLimit = pushLimit(readRawVarint32);
                this.recursionDepth++;
                T t = (MessageLite) parser.parsePartialFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(0);
                this.recursionDepth--;
                popLimit(pushLimit);
                return t;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public void readMessage(Builder builder, ExtensionRegistryLite extensionRegistryLite) throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (this.recursionDepth < this.recursionLimit) {
                int pushLimit = pushLimit(readRawVarint32);
                this.recursionDepth++;
                builder.mergeFrom((CodedInputStream) this, extensionRegistryLite);
                checkLastTagWas(0);
                this.recursionDepth--;
                popLimit(pushLimit);
                return;
            }
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }

        public byte readRawByte() throws IOException {
            if (this.pos != this.limit) {
                long j = this.pos;
                this.pos = 1 + j;
                return UnsafeUtil.getByte(j);
            }
            throw InvalidProtocolBufferException.truncatedMessage();
        }

        public byte[] readRawBytes(int i) throws IOException {
            if (i >= 0 && i <= remaining()) {
                byte[] bArr = new byte[i];
                long j = (long) i;
                slice(this.pos, this.pos + j).get(bArr);
                this.pos += j;
                return bArr;
            } else if (i > 0) {
                throw InvalidProtocolBufferException.truncatedMessage();
            } else if (i == 0) {
                return Internal.EMPTY_BYTE_ARRAY;
            } else {
                throw InvalidProtocolBufferException.negativeSize();
            }
        }

        public int readRawLittleEndian32() throws IOException {
            long j = this.pos;
            if (this.limit - j >= 4) {
                this.pos = 4 + j;
                return ((UnsafeUtil.getByte(j + 3) & 255) << 24) | (UnsafeUtil.getByte(j) & 255) | ((UnsafeUtil.getByte(1 + j) & 255) << 8) | ((UnsafeUtil.getByte(2 + j) & 255) << 16);
            }
            throw InvalidProtocolBufferException.truncatedMessage();
        }

        public long readRawLittleEndian64() throws IOException {
            long j = this.pos;
            if (this.limit - j >= 8) {
                this.pos = 8 + j;
                return ((((long) UnsafeUtil.getByte(j + 7)) & 255) << 56) | (((long) UnsafeUtil.getByte(j)) & 255) | ((((long) UnsafeUtil.getByte(1 + j)) & 255) << 8) | ((((long) UnsafeUtil.getByte(2 + j)) & 255) << 16) | ((((long) UnsafeUtil.getByte(3 + j)) & 255) << 24) | ((((long) UnsafeUtil.getByte(4 + j)) & 255) << 32) | ((((long) UnsafeUtil.getByte(5 + j)) & 255) << 40) | ((((long) UnsafeUtil.getByte(6 + j)) & 255) << 48);
            }
            throw InvalidProtocolBufferException.truncatedMessage();
        }

        /* JADX WARNING: Code restructure failed: missing block: B:29:0x0087, code lost:
            if (com.google.protobuf.UnsafeUtil.getByte(r4) < 0) goto L_0x0089;
         */
        public int readRawVarint32() throws IOException {
            byte b;
            long j = this.pos;
            if (this.limit != j) {
                long j2 = j + 1;
                byte b2 = UnsafeUtil.getByte(j);
                if (b2 >= 0) {
                    this.pos = j2;
                    return b2;
                } else if (this.limit - j2 >= 9) {
                    long j3 = j2 + 1;
                    byte b3 = b2 ^ (UnsafeUtil.getByte(j2) << 7);
                    if (b3 < 0) {
                        b = b3 ^ Byte.MIN_VALUE;
                    } else {
                        long j4 = j3 + 1;
                        byte b4 = b3 ^ (UnsafeUtil.getByte(j3) << 14);
                        if (b4 >= 0) {
                            b = b4 ^ 16256;
                        } else {
                            j3 = j4 + 1;
                            byte b5 = b4 ^ (UnsafeUtil.getByte(j4) << 21);
                            if (b5 < 0) {
                                b = b5 ^ -2080896;
                            } else {
                                j4 = j3 + 1;
                                byte b6 = UnsafeUtil.getByte(j3);
                                b = (b5 ^ (b6 << 28)) ^ 266354560;
                                if (b6 < 0) {
                                    j3 = j4 + 1;
                                    if (UnsafeUtil.getByte(j4) < 0) {
                                        j4 = j3 + 1;
                                        if (UnsafeUtil.getByte(j3) < 0) {
                                            j3 = j4 + 1;
                                            if (UnsafeUtil.getByte(j4) < 0) {
                                                j4 = j3 + 1;
                                                if (UnsafeUtil.getByte(j3) < 0) {
                                                    j3 = j4 + 1;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        j3 = j4;
                    }
                    this.pos = j3;
                    return b;
                }
            }
            return (int) readRawVarint64SlowPath();
        }

        public long readRawVarint64() throws IOException {
            long j;
            long j2;
            long j3;
            long j4 = this.pos;
            if (this.limit != j4) {
                long j5 = j4 + 1;
                byte b = UnsafeUtil.getByte(j4);
                if (b >= 0) {
                    this.pos = j5;
                    return (long) b;
                } else if (this.limit - j5 >= 9) {
                    long j6 = j5 + 1;
                    byte b2 = b ^ (UnsafeUtil.getByte(j5) << 7);
                    if (b2 < 0) {
                        j2 = (long) (b2 ^ Byte.MIN_VALUE);
                    } else {
                        j = j6 + 1;
                        byte b3 = b2 ^ (UnsafeUtil.getByte(j6) << 14);
                        if (b3 >= 0) {
                            j2 = (long) (b3 ^ 16256);
                        } else {
                            j6 = j + 1;
                            byte b4 = b3 ^ (UnsafeUtil.getByte(j) << 21);
                            if (b4 < 0) {
                                j2 = (long) (b4 ^ -2080896);
                            } else {
                                j = j6 + 1;
                                long j7 = ((long) b4) ^ (((long) UnsafeUtil.getByte(j6)) << 28);
                                if (j7 >= 0) {
                                    j2 = j7 ^ 266354560;
                                } else {
                                    long j8 = j + 1;
                                    long j9 = j7 ^ (((long) UnsafeUtil.getByte(j)) << 35);
                                    if (j9 < 0) {
                                        j3 = j9 ^ -34093383808L;
                                    } else {
                                        j = j8 + 1;
                                        long j10 = j9 ^ (((long) UnsafeUtil.getByte(j8)) << 42);
                                        if (j10 >= 0) {
                                            j2 = j10 ^ 4363953127296L;
                                        } else {
                                            j8 = j + 1;
                                            long j11 = j10 ^ (((long) UnsafeUtil.getByte(j)) << 49);
                                            if (j11 < 0) {
                                                j3 = j11 ^ -558586000294016L;
                                            } else {
                                                j = j8 + 1;
                                                j2 = (j11 ^ (((long) UnsafeUtil.getByte(j8)) << 56)) ^ 71499008037633920L;
                                                if (j2 < 0) {
                                                    long j12 = 1 + j;
                                                    if (((long) UnsafeUtil.getByte(j)) >= 0) {
                                                        j = j12;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    j = j8;
                                }
                            }
                        }
                        this.pos = j;
                        return j2;
                    }
                    j = j6;
                    this.pos = j;
                    return j2;
                }
            }
            return readRawVarint64SlowPath();
        }

        /* access modifiers changed from: 0000 */
        public long readRawVarint64SlowPath() throws IOException {
            long j = 0;
            for (int i = 0; i < 64; i += 7) {
                byte readRawByte = readRawByte();
                j |= ((long) (readRawByte & Byte.MAX_VALUE)) << i;
                if ((readRawByte & 128) == 0) {
                    return j;
                }
            }
            throw InvalidProtocolBufferException.malformedVarint();
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
            if (readRawVarint32 > 0 && readRawVarint32 <= remaining()) {
                byte[] bArr = new byte[readRawVarint32];
                long j = (long) readRawVarint32;
                UnsafeUtil.copyMemory(this.pos, bArr, 0, j);
                String str = new String(bArr, Internal.UTF_8);
                this.pos += j;
                return str;
            } else if (readRawVarint32 == 0) {
                return "";
            } else {
                if (readRawVarint32 < 0) {
                    throw InvalidProtocolBufferException.negativeSize();
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
        }

        public String readStringRequireUtf8() throws IOException {
            int readRawVarint32 = readRawVarint32();
            if (readRawVarint32 > 0 && readRawVarint32 <= remaining()) {
                String decodeUtf8 = Utf8.decodeUtf8(this.buffer, bufferPos(this.pos), readRawVarint32);
                this.pos += (long) readRawVarint32;
                return decodeUtf8;
            } else if (readRawVarint32 == 0) {
                return "";
            } else {
                if (readRawVarint32 <= 0) {
                    throw InvalidProtocolBufferException.negativeSize();
                }
                throw InvalidProtocolBufferException.truncatedMessage();
            }
        }

        public int readTag() throws IOException {
            if (isAtEnd()) {
                this.lastTag = 0;
                return 0;
            }
            this.lastTag = readRawVarint32();
            if (WireFormat.getTagFieldNumber(this.lastTag) != 0) {
                return this.lastTag;
            }
            throw InvalidProtocolBufferException.invalidTag();
        }

        public int readUInt32() throws IOException {
            return readRawVarint32();
        }

        public long readUInt64() throws IOException {
            return readRawVarint64();
        }

        @Deprecated
        public void readUnknownGroup(int i, Builder builder) throws IOException {
            readGroup(i, builder, ExtensionRegistryLite.getEmptyRegistry());
        }

        public void resetSizeCounter() {
            this.startPos = this.pos;
        }

        public boolean skipField(int i) throws IOException {
            switch (WireFormat.getTagWireType(i)) {
                case 0:
                    skipRawVarint();
                    return true;
                case 1:
                    skipRawBytes(8);
                    return true;
                case 2:
                    skipRawBytes(readRawVarint32());
                    return true;
                case 3:
                    skipMessage();
                    checkLastTagWas(WireFormat.makeTag(WireFormat.getTagFieldNumber(i), 4));
                    return true;
                case 4:
                    return false;
                case 5:
                    skipRawBytes(4);
                    return true;
                default:
                    throw InvalidProtocolBufferException.invalidWireType();
            }
        }

        public boolean skipField(int i, CodedOutputStream codedOutputStream) throws IOException {
            switch (WireFormat.getTagWireType(i)) {
                case 0:
                    long readInt64 = readInt64();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeUInt64NoTag(readInt64);
                    return true;
                case 1:
                    long readRawLittleEndian64 = readRawLittleEndian64();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeFixed64NoTag(readRawLittleEndian64);
                    return true;
                case 2:
                    ByteString readBytes = readBytes();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeBytesNoTag(readBytes);
                    return true;
                case 3:
                    codedOutputStream.writeRawVarint32(i);
                    skipMessage(codedOutputStream);
                    int makeTag = WireFormat.makeTag(WireFormat.getTagFieldNumber(i), 4);
                    checkLastTagWas(makeTag);
                    codedOutputStream.writeRawVarint32(makeTag);
                    return true;
                case 4:
                    return false;
                case 5:
                    int readRawLittleEndian32 = readRawLittleEndian32();
                    codedOutputStream.writeRawVarint32(i);
                    codedOutputStream.writeFixed32NoTag(readRawLittleEndian32);
                    return true;
                default:
                    throw InvalidProtocolBufferException.invalidWireType();
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

        public void skipMessage(CodedOutputStream codedOutputStream) throws IOException {
            int readTag;
            do {
                readTag = readTag();
                if (readTag == 0) {
                    return;
                }
            } while (skipField(readTag, codedOutputStream));
        }

        public void skipRawBytes(int i) throws IOException {
            if (i >= 0 && i <= remaining()) {
                this.pos += (long) i;
            } else if (i < 0) {
                throw InvalidProtocolBufferException.negativeSize();
            } else {
                throw InvalidProtocolBufferException.truncatedMessage();
            }
        }
    }

    private CodedInputStream() {
        this.recursionLimit = 100;
        this.sizeLimit = DEFAULT_SIZE_LIMIT;
        this.shouldDiscardUnknownFields = false;
    }

    public static int decodeZigZag32(int i) {
        return (-(i & 1)) ^ (i >>> 1);
    }

    public static long decodeZigZag64(long j) {
        return (-(j & 1)) ^ (j >>> 1);
    }

    public static CodedInputStream newInstance(InputStream inputStream) {
        return newInstance(inputStream, 4096);
    }

    public static CodedInputStream newInstance(InputStream inputStream, int i) {
        if (i > 0) {
            return inputStream == null ? newInstance(Internal.EMPTY_BYTE_ARRAY) : new StreamDecoder(inputStream, i);
        }
        throw new IllegalArgumentException("bufferSize must be > 0");
    }

    public static CodedInputStream newInstance(Iterable<ByteBuffer> iterable) {
        return !UnsafeDirectNioDecoder.isSupported() ? newInstance((InputStream) new IterableByteBufferInputStream(iterable)) : newInstance(iterable, false);
    }

    static CodedInputStream newInstance(Iterable<ByteBuffer> iterable, boolean z) {
        int i = 0;
        boolean z2 = false;
        for (ByteBuffer byteBuffer : iterable) {
            i += byteBuffer.remaining();
            z2 = byteBuffer.hasArray() ? z2 | true : byteBuffer.isDirect() ? z2 | true : z2 | true;
        }
        return z2 ? new IterableDirectByteBufferDecoder(iterable, i, z) : newInstance((InputStream) new IterableByteBufferInputStream(iterable));
    }

    public static CodedInputStream newInstance(ByteBuffer byteBuffer) {
        return newInstance(byteBuffer, false);
    }

    static CodedInputStream newInstance(ByteBuffer byteBuffer, boolean z) {
        if (byteBuffer.hasArray()) {
            return newInstance(byteBuffer.array(), byteBuffer.arrayOffset() + byteBuffer.position(), byteBuffer.remaining(), z);
        }
        if (byteBuffer.isDirect() && UnsafeDirectNioDecoder.isSupported()) {
            return new UnsafeDirectNioDecoder(byteBuffer, z);
        }
        byte[] bArr = new byte[byteBuffer.remaining()];
        byteBuffer.duplicate().get(bArr);
        return newInstance(bArr, 0, bArr.length, true);
    }

    public static CodedInputStream newInstance(byte[] bArr) {
        return newInstance(bArr, 0, bArr.length);
    }

    public static CodedInputStream newInstance(byte[] bArr, int i, int i2) {
        return newInstance(bArr, i, i2, false);
    }

    static CodedInputStream newInstance(byte[] bArr, int i, int i2, boolean z) {
        ArrayDecoder arrayDecoder = new ArrayDecoder(bArr, i, i2, z);
        try {
            arrayDecoder.pushLimit(i2);
            return arrayDecoder;
        } catch (InvalidProtocolBufferException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public static int readRawVarint32(int i, InputStream inputStream) throws IOException {
        if ((i & 128) == 0) {
            return i;
        }
        int i2 = i & BaiduSceneResult.BANK_CARD;
        int i3 = 7;
        while (i3 < 32) {
            int read = inputStream.read();
            if (read != -1) {
                i2 |= (read & BaiduSceneResult.BANK_CARD) << i3;
                if ((read & 128) == 0) {
                    return i2;
                }
                i3 += 7;
            } else {
                throw InvalidProtocolBufferException.truncatedMessage();
            }
        }
        while (i3 < 64) {
            int read2 = inputStream.read();
            if (read2 == -1) {
                throw InvalidProtocolBufferException.truncatedMessage();
            } else if ((read2 & 128) == 0) {
                return i2;
            } else {
                i3 += 7;
            }
        }
        throw InvalidProtocolBufferException.malformedVarint();
    }

    static int readRawVarint32(InputStream inputStream) throws IOException {
        int read = inputStream.read();
        if (read != -1) {
            return readRawVarint32(read, inputStream);
        }
        throw InvalidProtocolBufferException.truncatedMessage();
    }

    public abstract void checkLastTagWas(int i) throws InvalidProtocolBufferException;

    /* access modifiers changed from: 0000 */
    public final void discardUnknownFields() {
        this.shouldDiscardUnknownFields = true;
    }

    public abstract void enableAliasing(boolean z);

    public abstract int getBytesUntilLimit();

    public abstract int getLastTag();

    public abstract int getTotalBytesRead();

    public abstract boolean isAtEnd() throws IOException;

    public abstract void popLimit(int i);

    public abstract int pushLimit(int i) throws InvalidProtocolBufferException;

    public abstract boolean readBool() throws IOException;

    public abstract byte[] readByteArray() throws IOException;

    public abstract ByteBuffer readByteBuffer() throws IOException;

    public abstract ByteString readBytes() throws IOException;

    public abstract double readDouble() throws IOException;

    public abstract int readEnum() throws IOException;

    public abstract int readFixed32() throws IOException;

    public abstract long readFixed64() throws IOException;

    public abstract float readFloat() throws IOException;

    public abstract <T extends MessageLite> T readGroup(int i, Parser<T> parser, ExtensionRegistryLite extensionRegistryLite) throws IOException;

    public abstract void readGroup(int i, Builder builder, ExtensionRegistryLite extensionRegistryLite) throws IOException;

    public abstract int readInt32() throws IOException;

    public abstract long readInt64() throws IOException;

    public abstract <T extends MessageLite> T readMessage(Parser<T> parser, ExtensionRegistryLite extensionRegistryLite) throws IOException;

    public abstract void readMessage(Builder builder, ExtensionRegistryLite extensionRegistryLite) throws IOException;

    public abstract byte readRawByte() throws IOException;

    public abstract byte[] readRawBytes(int i) throws IOException;

    public abstract int readRawLittleEndian32() throws IOException;

    public abstract long readRawLittleEndian64() throws IOException;

    public abstract int readRawVarint32() throws IOException;

    public abstract long readRawVarint64() throws IOException;

    /* access modifiers changed from: 0000 */
    public abstract long readRawVarint64SlowPath() throws IOException;

    public abstract int readSFixed32() throws IOException;

    public abstract long readSFixed64() throws IOException;

    public abstract int readSInt32() throws IOException;

    public abstract long readSInt64() throws IOException;

    public abstract String readString() throws IOException;

    public abstract String readStringRequireUtf8() throws IOException;

    public abstract int readTag() throws IOException;

    public abstract int readUInt32() throws IOException;

    public abstract long readUInt64() throws IOException;

    @Deprecated
    public abstract void readUnknownGroup(int i, Builder builder) throws IOException;

    public abstract void resetSizeCounter();

    public final int setRecursionLimit(int i) {
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

    public final int setSizeLimit(int i) {
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

    /* access modifiers changed from: 0000 */
    public final boolean shouldDiscardUnknownFields() {
        return this.shouldDiscardUnknownFields;
    }

    public abstract boolean skipField(int i) throws IOException;

    @Deprecated
    public abstract boolean skipField(int i, CodedOutputStream codedOutputStream) throws IOException;

    public abstract void skipMessage() throws IOException;

    public abstract void skipMessage(CodedOutputStream codedOutputStream) throws IOException;

    public abstract void skipRawBytes(int i) throws IOException;

    /* access modifiers changed from: 0000 */
    public final void unsetDiscardUnknownFields() {
        this.shouldDiscardUnknownFields = false;
    }
}
