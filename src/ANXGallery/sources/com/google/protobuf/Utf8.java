package com.google.protobuf;

import java.nio.ByteBuffer;

final class Utf8 {
    private static final long ASCII_MASK_LONG = -9187201950435737472L;
    public static final int COMPLETE = 0;
    public static final int MALFORMED = -1;
    static final int MAX_BYTES_PER_CHAR = 3;
    private static final int UNSAFE_COUNT_ASCII_THRESHOLD = 16;
    private static final Processor processor = ((!UnsafeProcessor.isAvailable() || Android.isOnAndroidDevice()) ? new SafeProcessor() : new UnsafeProcessor());

    private static class DecodeUtil {
        private DecodeUtil() {
        }

        /* access modifiers changed from: private */
        public static void handleFourBytes(byte b, byte b2, byte b3, byte b4, char[] cArr, int i) throws InvalidProtocolBufferException {
            if (isNotTrailingByte(b2) || (((b << 28) + (b2 + 112)) >> 30) != 0 || isNotTrailingByte(b3) || isNotTrailingByte(b4)) {
                throw InvalidProtocolBufferException.invalidUtf8();
            }
            int trailingByteValue = ((b & 7) << 18) | (trailingByteValue(b2) << 12) | (trailingByteValue(b3) << 6) | trailingByteValue(b4);
            cArr[i] = highSurrogate(trailingByteValue);
            cArr[i + 1] = lowSurrogate(trailingByteValue);
        }

        /* access modifiers changed from: private */
        public static void handleOneByte(byte b, char[] cArr, int i) {
            cArr[i] = (char) b;
        }

        /* access modifiers changed from: private */
        public static void handleThreeBytes(byte b, byte b2, byte b3, char[] cArr, int i) throws InvalidProtocolBufferException {
            if (isNotTrailingByte(b2) || ((b == -32 && b2 < -96) || ((b == -19 && b2 >= -96) || isNotTrailingByte(b3)))) {
                throw InvalidProtocolBufferException.invalidUtf8();
            }
            cArr[i] = (char) (((b & 15) << 12) | (trailingByteValue(b2) << 6) | trailingByteValue(b3));
        }

        /* access modifiers changed from: private */
        public static void handleTwoBytes(byte b, byte b2, char[] cArr, int i) throws InvalidProtocolBufferException {
            if (b < -62 || isNotTrailingByte(b2)) {
                throw InvalidProtocolBufferException.invalidUtf8();
            }
            cArr[i] = (char) (((b & 31) << 6) | trailingByteValue(b2));
        }

        private static char highSurrogate(int i) {
            return (char) ((i >>> 10) + 55232);
        }

        private static boolean isNotTrailingByte(byte b) {
            return b > -65;
        }

        /* access modifiers changed from: private */
        public static boolean isOneByte(byte b) {
            return b >= 0;
        }

        /* access modifiers changed from: private */
        public static boolean isThreeBytes(byte b) {
            return b < -16;
        }

        /* access modifiers changed from: private */
        public static boolean isTwoBytes(byte b) {
            return b < -32;
        }

        private static char lowSurrogate(int i) {
            return (char) ((i & 1023) + 56320);
        }

        private static int trailingByteValue(byte b) {
            return b & 63;
        }
    }

    static abstract class Processor {
        Processor() {
        }

        private static int partialIsValidUtf8(ByteBuffer byteBuffer, int i, int i2) {
            int access$200 = i + Utf8.estimateConsecutiveAscii(byteBuffer, i, i2);
            while (access$200 < i2) {
                int i3 = access$200 + 1;
                byte b = byteBuffer.get(access$200);
                if (b < 0) {
                    if (b < -32) {
                        if (i3 >= i2) {
                            return b;
                        }
                        if (b < -62 || byteBuffer.get(i3) > -65) {
                            return -1;
                        }
                        i3++;
                    } else if (b < -16) {
                        if (i3 >= i2 - 1) {
                            return Utf8.incompleteStateFor(byteBuffer, b, i3, i2 - i3);
                        }
                        int i4 = i3 + 1;
                        byte b2 = byteBuffer.get(i3);
                        if (b2 > -65 || ((b == -32 && b2 < -96) || ((b == -19 && b2 >= -96) || byteBuffer.get(i4) > -65))) {
                            return -1;
                        }
                        access$200 = i4 + 1;
                    } else if (i3 >= i2 - 2) {
                        return Utf8.incompleteStateFor(byteBuffer, b, i3, i2 - i3);
                    } else {
                        int i5 = i3 + 1;
                        byte b3 = byteBuffer.get(i3);
                        if (b3 <= -65 && (((b << 28) + (b3 + 112)) >> 30) == 0) {
                            int i6 = i5 + 1;
                            if (byteBuffer.get(i5) <= -65) {
                                i3 = i6 + 1;
                                if (byteBuffer.get(i6) > -65) {
                                }
                            }
                        }
                        return -1;
                    }
                }
                access$200 = i3;
            }
            return 0;
        }

        /* access modifiers changed from: 0000 */
        public final String decodeUtf8(ByteBuffer byteBuffer, int i, int i2) throws InvalidProtocolBufferException {
            if (!byteBuffer.hasArray()) {
                return byteBuffer.isDirect() ? decodeUtf8Direct(byteBuffer, i, i2) : decodeUtf8Default(byteBuffer, i, i2);
            }
            return decodeUtf8(byteBuffer.array(), byteBuffer.arrayOffset() + i, i2);
        }

        /* access modifiers changed from: 0000 */
        public abstract String decodeUtf8(byte[] bArr, int i, int i2) throws InvalidProtocolBufferException;

        /* access modifiers changed from: 0000 */
        public final String decodeUtf8Default(ByteBuffer byteBuffer, int i, int i2) throws InvalidProtocolBufferException {
            if ((i | i2 | ((byteBuffer.limit() - i) - i2)) >= 0) {
                int i3 = i + i2;
                char[] cArr = new char[i2];
                int i4 = 0;
                while (r13 < i3) {
                    byte b = byteBuffer.get(r13);
                    if (!DecodeUtil.isOneByte(b)) {
                        break;
                    }
                    i = r13 + 1;
                    int i5 = i4 + 1;
                    DecodeUtil.handleOneByte(b, cArr, i4);
                    i4 = i5;
                }
                int i6 = i4;
                while (r13 < i3) {
                    int i7 = r13 + 1;
                    byte b2 = byteBuffer.get(r13);
                    if (DecodeUtil.isOneByte(b2)) {
                        int i8 = i6 + 1;
                        DecodeUtil.handleOneByte(b2, cArr, i6);
                        while (i7 < i3) {
                            byte b3 = byteBuffer.get(i7);
                            if (!DecodeUtil.isOneByte(b3)) {
                                break;
                            }
                            i7++;
                            int i9 = i8 + 1;
                            DecodeUtil.handleOneByte(b3, cArr, i8);
                            i8 = i9;
                        }
                        r13 = i7;
                        i6 = i8;
                    } else if (DecodeUtil.isTwoBytes(b2)) {
                        if (i7 < i3) {
                            int i10 = i7 + 1;
                            int i11 = i6 + 1;
                            DecodeUtil.handleTwoBytes(b2, byteBuffer.get(i7), cArr, i6);
                            r13 = i10;
                            i6 = i11;
                        } else {
                            throw InvalidProtocolBufferException.invalidUtf8();
                        }
                    } else if (DecodeUtil.isThreeBytes(b2)) {
                        if (i7 < i3 - 1) {
                            int i12 = i7 + 1;
                            int i13 = i12 + 1;
                            int i14 = i6 + 1;
                            DecodeUtil.handleThreeBytes(b2, byteBuffer.get(i7), byteBuffer.get(i12), cArr, i6);
                            r13 = i13;
                            i6 = i14;
                        } else {
                            throw InvalidProtocolBufferException.invalidUtf8();
                        }
                    } else if (i7 < i3 - 2) {
                        int i15 = i7 + 1;
                        byte b4 = byteBuffer.get(i7);
                        int i16 = i15 + 1;
                        int i17 = i16 + 1;
                        int i18 = i6 + 1;
                        DecodeUtil.handleFourBytes(b2, b4, byteBuffer.get(i15), byteBuffer.get(i16), cArr, i6);
                        r13 = i17;
                        i6 = i18 + 1;
                    } else {
                        throw InvalidProtocolBufferException.invalidUtf8();
                    }
                }
                return new String(cArr, 0, i6);
            }
            throw new ArrayIndexOutOfBoundsException(String.format("buffer limit=%d, index=%d, limit=%d", new Object[]{Integer.valueOf(byteBuffer.limit()), Integer.valueOf(i), Integer.valueOf(i2)}));
        }

        /* access modifiers changed from: 0000 */
        public abstract String decodeUtf8Direct(ByteBuffer byteBuffer, int i, int i2) throws InvalidProtocolBufferException;

        /* access modifiers changed from: 0000 */
        public abstract int encodeUtf8(CharSequence charSequence, byte[] bArr, int i, int i2);

        /* access modifiers changed from: 0000 */
        public final void encodeUtf8(CharSequence charSequence, ByteBuffer byteBuffer) {
            if (byteBuffer.hasArray()) {
                int arrayOffset = byteBuffer.arrayOffset();
                byteBuffer.position(Utf8.encode(charSequence, byteBuffer.array(), byteBuffer.position() + arrayOffset, byteBuffer.remaining()) - arrayOffset);
            } else if (byteBuffer.isDirect()) {
                encodeUtf8Direct(charSequence, byteBuffer);
            } else {
                encodeUtf8Default(charSequence, byteBuffer);
            }
        }

        /* access modifiers changed from: 0000 */
        public final void encodeUtf8Default(CharSequence charSequence, ByteBuffer byteBuffer) {
            int i;
            int length = charSequence.length();
            int position = byteBuffer.position();
            int i2 = 0;
            while (i2 < length) {
                try {
                    char charAt = charSequence.charAt(i2);
                    if (charAt >= 128) {
                        break;
                    }
                    byteBuffer.put(position + i2, (byte) charAt);
                    i2++;
                } catch (IndexOutOfBoundsException unused) {
                    int position2 = byteBuffer.position() + Math.max(i2, (position - byteBuffer.position()) + 1);
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed writing ");
                    sb.append(charSequence.charAt(i2));
                    sb.append(" at index ");
                    sb.append(position2);
                    throw new ArrayIndexOutOfBoundsException(sb.toString());
                }
            }
            if (i2 == length) {
                byteBuffer.position(position + i2);
                return;
            }
            position += i2;
            while (i2 < length) {
                char charAt2 = charSequence.charAt(i2);
                if (charAt2 < 128) {
                    byteBuffer.put(position, (byte) charAt2);
                } else if (charAt2 < 2048) {
                    i = position + 1;
                    try {
                        byteBuffer.put(position, (byte) ((charAt2 >>> 6) | 192));
                        byteBuffer.put(i, (byte) ((charAt2 & '?') | 128));
                        position = i;
                    } catch (IndexOutOfBoundsException unused2) {
                        position = i;
                        int position22 = byteBuffer.position() + Math.max(i2, (position - byteBuffer.position()) + 1);
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Failed writing ");
                        sb2.append(charSequence.charAt(i2));
                        sb2.append(" at index ");
                        sb2.append(position22);
                        throw new ArrayIndexOutOfBoundsException(sb2.toString());
                    }
                } else if (charAt2 < 55296 || 57343 < charAt2) {
                    i = position + 1;
                    byteBuffer.put(position, (byte) ((charAt2 >>> 12) | 224));
                    position = i + 1;
                    byteBuffer.put(i, (byte) (((charAt2 >>> 6) & 63) | 128));
                    byteBuffer.put(position, (byte) ((charAt2 & '?') | 128));
                } else {
                    int i3 = i2 + 1;
                    if (i3 != length) {
                        try {
                            char charAt3 = charSequence.charAt(i3);
                            if (Character.isSurrogatePair(charAt2, charAt3)) {
                                int codePoint = Character.toCodePoint(charAt2, charAt3);
                                int i4 = position + 1;
                                try {
                                    byteBuffer.put(position, (byte) ((codePoint >>> 18) | 240));
                                    position = i4 + 1;
                                    byteBuffer.put(i4, (byte) (((codePoint >>> 12) & 63) | 128));
                                    i4 = position + 1;
                                    byteBuffer.put(position, (byte) (((codePoint >>> 6) & 63) | 128));
                                    byteBuffer.put(i4, (byte) ((codePoint & 63) | 128));
                                    position = i4;
                                    i2 = i3;
                                } catch (IndexOutOfBoundsException unused3) {
                                    position = i4;
                                    i2 = i3;
                                    int position222 = byteBuffer.position() + Math.max(i2, (position - byteBuffer.position()) + 1);
                                    StringBuilder sb22 = new StringBuilder();
                                    sb22.append("Failed writing ");
                                    sb22.append(charSequence.charAt(i2));
                                    sb22.append(" at index ");
                                    sb22.append(position222);
                                    throw new ArrayIndexOutOfBoundsException(sb22.toString());
                                }
                            } else {
                                i2 = i3;
                            }
                        } catch (IndexOutOfBoundsException unused4) {
                            i2 = i3;
                            int position2222 = byteBuffer.position() + Math.max(i2, (position - byteBuffer.position()) + 1);
                            StringBuilder sb222 = new StringBuilder();
                            sb222.append("Failed writing ");
                            sb222.append(charSequence.charAt(i2));
                            sb222.append(" at index ");
                            sb222.append(position2222);
                            throw new ArrayIndexOutOfBoundsException(sb222.toString());
                        }
                    }
                    throw new UnpairedSurrogateException(i2, length);
                }
                i2++;
                position++;
            }
            byteBuffer.position(position);
        }

        /* access modifiers changed from: 0000 */
        public abstract void encodeUtf8Direct(CharSequence charSequence, ByteBuffer byteBuffer);

        /* access modifiers changed from: 0000 */
        public final boolean isValidUtf8(ByteBuffer byteBuffer, int i, int i2) {
            return partialIsValidUtf8(0, byteBuffer, i, i2) == 0;
        }

        /* access modifiers changed from: 0000 */
        public final boolean isValidUtf8(byte[] bArr, int i, int i2) {
            return partialIsValidUtf8(0, bArr, i, i2) == 0;
        }

        /* access modifiers changed from: 0000 */
        public final int partialIsValidUtf8(int i, ByteBuffer byteBuffer, int i2, int i3) {
            if (!byteBuffer.hasArray()) {
                return byteBuffer.isDirect() ? partialIsValidUtf8Direct(i, byteBuffer, i2, i3) : partialIsValidUtf8Default(i, byteBuffer, i2, i3);
            }
            int arrayOffset = byteBuffer.arrayOffset();
            return partialIsValidUtf8(i, byteBuffer.array(), i2 + arrayOffset, arrayOffset + i3);
        }

        /* access modifiers changed from: 0000 */
        public abstract int partialIsValidUtf8(int i, byte[] bArr, int i2, int i3);

        /* access modifiers changed from: 0000 */
        /* JADX WARNING: Code restructure failed: missing block: B:27:0x0048, code lost:
            if (r8.get(r9) > -65) goto L_0x004a;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:47:0x0086, code lost:
            if (r8.get(r7) > -65) goto L_0x0088;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:8:0x0017, code lost:
            if (r8.get(r9) > -65) goto L_0x0019;
         */
        public final int partialIsValidUtf8Default(int i, ByteBuffer byteBuffer, int i2, int i3) {
            int i4;
            int i5;
            if (i != 0) {
                if (i2 >= i3) {
                    return i;
                }
                byte b = (byte) i;
                if (b < -32) {
                    if (b >= -62) {
                        i4 = i2 + 1;
                    }
                    return -1;
                } else if (b < -16) {
                    byte b2 = (byte) ((i >> 8) ^ -1);
                    if (b2 == 0) {
                        int i6 = i2 + 1;
                        byte b3 = byteBuffer.get(i2);
                        if (i6 >= i3) {
                            return Utf8.incompleteStateFor(b, b3);
                        }
                        byte b4 = b3;
                        i2 = i6;
                        b2 = b4;
                    }
                    if (b2 <= -65 && ((b != -32 || b2 >= -96) && (b != -19 || b2 < -96))) {
                        i4 = i2 + 1;
                    }
                    return -1;
                } else {
                    byte b5 = (byte) ((i >> 8) ^ -1);
                    byte b6 = 0;
                    if (b5 == 0) {
                        i5 = i2 + 1;
                        b5 = byteBuffer.get(i2);
                        if (i5 >= i3) {
                            return Utf8.incompleteStateFor(b, b5);
                        }
                    } else {
                        b6 = (byte) (i >> 16);
                        i5 = i2;
                    }
                    if (b6 == 0) {
                        int i7 = i5 + 1;
                        b6 = byteBuffer.get(i5);
                        if (i7 >= i3) {
                            return Utf8.incompleteStateFor((int) b, (int) b5, (int) b6);
                        }
                        i5 = i7;
                    }
                    if (b5 <= -65 && (((b << 28) + (b5 + 112)) >> 30) == 0 && b6 <= -65) {
                        i2 = i5 + 1;
                    }
                    return -1;
                }
                return partialIsValidUtf8(byteBuffer, i4, i3);
            }
            i4 = i2;
            return partialIsValidUtf8(byteBuffer, i4, i3);
        }

        /* access modifiers changed from: 0000 */
        public abstract int partialIsValidUtf8Direct(int i, ByteBuffer byteBuffer, int i2, int i3);
    }

    static final class SafeProcessor extends Processor {
        SafeProcessor() {
        }

        private static int partialIsValidUtf8(byte[] bArr, int i, int i2) {
            while (i < i2 && bArr[i] >= 0) {
                i++;
            }
            if (i >= i2) {
                return 0;
            }
            return partialIsValidUtf8NonAscii(bArr, i, i2);
        }

        private static int partialIsValidUtf8NonAscii(byte[] bArr, int i, int i2) {
            while (i < i2) {
                int i3 = i + 1;
                byte b = bArr[i];
                if (b < 0) {
                    if (b < -32) {
                        if (i3 >= i2) {
                            return b;
                        }
                        if (b >= -62) {
                            i = i3 + 1;
                            if (bArr[i3] > -65) {
                            }
                        }
                        return -1;
                    } else if (b < -16) {
                        if (i3 >= i2 - 1) {
                            return Utf8.incompleteStateFor(bArr, i3, i2);
                        }
                        int i4 = i3 + 1;
                        byte b2 = bArr[i3];
                        if (b2 <= -65 && ((b != -32 || b2 >= -96) && (b != -19 || b2 < -96))) {
                            i = i4 + 1;
                            if (bArr[i4] > -65) {
                            }
                        }
                        return -1;
                    } else if (i3 >= i2 - 2) {
                        return Utf8.incompleteStateFor(bArr, i3, i2);
                    } else {
                        int i5 = i3 + 1;
                        byte b3 = bArr[i3];
                        if (b3 <= -65 && (((b << 28) + (b3 + 112)) >> 30) == 0) {
                            int i6 = i5 + 1;
                            if (bArr[i5] <= -65) {
                                i3 = i6 + 1;
                                if (bArr[i6] > -65) {
                                }
                            }
                        }
                        return -1;
                    }
                }
                i = i3;
            }
            return 0;
        }

        /* access modifiers changed from: 0000 */
        public String decodeUtf8(byte[] bArr, int i, int i2) throws InvalidProtocolBufferException {
            if ((i | i2 | ((bArr.length - i) - i2)) >= 0) {
                int i3 = i + i2;
                char[] cArr = new char[i2];
                int i4 = 0;
                while (r13 < i3) {
                    byte b = bArr[r13];
                    if (!DecodeUtil.isOneByte(b)) {
                        break;
                    }
                    i = r13 + 1;
                    int i5 = i4 + 1;
                    DecodeUtil.handleOneByte(b, cArr, i4);
                    i4 = i5;
                }
                int i6 = i4;
                while (r13 < i3) {
                    int i7 = r13 + 1;
                    byte b2 = bArr[r13];
                    if (DecodeUtil.isOneByte(b2)) {
                        int i8 = i6 + 1;
                        DecodeUtil.handleOneByte(b2, cArr, i6);
                        while (i7 < i3) {
                            byte b3 = bArr[i7];
                            if (!DecodeUtil.isOneByte(b3)) {
                                break;
                            }
                            i7++;
                            int i9 = i8 + 1;
                            DecodeUtil.handleOneByte(b3, cArr, i8);
                            i8 = i9;
                        }
                        r13 = i7;
                        i6 = i8;
                    } else if (DecodeUtil.isTwoBytes(b2)) {
                        if (i7 < i3) {
                            int i10 = i7 + 1;
                            int i11 = i6 + 1;
                            DecodeUtil.handleTwoBytes(b2, bArr[i7], cArr, i6);
                            r13 = i10;
                            i6 = i11;
                        } else {
                            throw InvalidProtocolBufferException.invalidUtf8();
                        }
                    } else if (DecodeUtil.isThreeBytes(b2)) {
                        if (i7 < i3 - 1) {
                            int i12 = i7 + 1;
                            int i13 = i12 + 1;
                            int i14 = i6 + 1;
                            DecodeUtil.handleThreeBytes(b2, bArr[i7], bArr[i12], cArr, i6);
                            r13 = i13;
                            i6 = i14;
                        } else {
                            throw InvalidProtocolBufferException.invalidUtf8();
                        }
                    } else if (i7 < i3 - 2) {
                        int i15 = i7 + 1;
                        byte b4 = bArr[i7];
                        int i16 = i15 + 1;
                        int i17 = i16 + 1;
                        int i18 = i6 + 1;
                        DecodeUtil.handleFourBytes(b2, b4, bArr[i15], bArr[i16], cArr, i6);
                        r13 = i17;
                        i6 = i18 + 1;
                    } else {
                        throw InvalidProtocolBufferException.invalidUtf8();
                    }
                }
                return new String(cArr, 0, i6);
            }
            throw new ArrayIndexOutOfBoundsException(String.format("buffer length=%d, index=%d, size=%d", new Object[]{Integer.valueOf(bArr.length), Integer.valueOf(i), Integer.valueOf(i2)}));
        }

        /* access modifiers changed from: 0000 */
        public String decodeUtf8Direct(ByteBuffer byteBuffer, int i, int i2) throws InvalidProtocolBufferException {
            return decodeUtf8Default(byteBuffer, i, i2);
        }

        /* access modifiers changed from: 0000 */
        public int encodeUtf8(CharSequence charSequence, byte[] bArr, int i, int i2) {
            int i3;
            int length = charSequence.length();
            int i4 = i2 + i;
            int i5 = 0;
            while (i5 < length) {
                int i6 = i5 + i;
                if (i6 >= i4) {
                    break;
                }
                char charAt = charSequence.charAt(i5);
                if (charAt >= 128) {
                    break;
                }
                bArr[i6] = (byte) charAt;
                i5++;
            }
            if (i5 == length) {
                return i + length;
            }
            int i7 = i + i5;
            while (i5 < length) {
                char charAt2 = charSequence.charAt(i5);
                if (charAt2 < 128 && i7 < i4) {
                    i3 = i7 + 1;
                    bArr[i7] = (byte) charAt2;
                } else if (charAt2 < 2048 && i7 <= i4 - 2) {
                    int i8 = i7 + 1;
                    bArr[i7] = (byte) ((charAt2 >>> 6) | 960);
                    i7 = i8 + 1;
                    bArr[i8] = (byte) ((charAt2 & '?') | 128);
                    i5++;
                } else if ((charAt2 < 55296 || 57343 < charAt2) && i7 <= i4 - 3) {
                    int i9 = i7 + 1;
                    bArr[i7] = (byte) ((charAt2 >>> 12) | 480);
                    int i10 = i9 + 1;
                    bArr[i9] = (byte) (((charAt2 >>> 6) & 63) | 128);
                    i3 = i10 + 1;
                    bArr[i10] = (byte) ((charAt2 & '?') | 128);
                } else if (i7 <= i4 - 4) {
                    int i11 = i5 + 1;
                    if (i11 != charSequence.length()) {
                        char charAt3 = charSequence.charAt(i11);
                        if (Character.isSurrogatePair(charAt2, charAt3)) {
                            int codePoint = Character.toCodePoint(charAt2, charAt3);
                            int i12 = i7 + 1;
                            bArr[i7] = (byte) ((codePoint >>> 18) | 240);
                            int i13 = i12 + 1;
                            bArr[i12] = (byte) (((codePoint >>> 12) & 63) | 128);
                            int i14 = i13 + 1;
                            bArr[i13] = (byte) (((codePoint >>> 6) & 63) | 128);
                            i7 = i14 + 1;
                            bArr[i14] = (byte) ((codePoint & 63) | 128);
                            i5 = i11;
                            i5++;
                        } else {
                            i5 = i11;
                        }
                    }
                    throw new UnpairedSurrogateException(i5 - 1, length);
                } else {
                    if (55296 <= charAt2 && charAt2 <= 57343) {
                        int i15 = i5 + 1;
                        if (i15 == charSequence.length() || !Character.isSurrogatePair(charAt2, charSequence.charAt(i15))) {
                            throw new UnpairedSurrogateException(i5, length);
                        }
                    }
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed writing ");
                    sb.append(charAt2);
                    sb.append(" at index ");
                    sb.append(i7);
                    throw new ArrayIndexOutOfBoundsException(sb.toString());
                }
                i7 = i3;
                i5++;
            }
            return i7;
        }

        /* access modifiers changed from: 0000 */
        public void encodeUtf8Direct(CharSequence charSequence, ByteBuffer byteBuffer) {
            encodeUtf8Default(charSequence, byteBuffer);
        }

        /* access modifiers changed from: 0000 */
        /* JADX WARNING: Code restructure failed: missing block: B:27:0x0042, code lost:
            if (r8[r9] > -65) goto L_0x0044;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:47:0x007a, code lost:
            if (r8[r7] > -65) goto L_0x007c;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:8:0x0015, code lost:
            if (r8[r9] > -65) goto L_0x0017;
         */
        public int partialIsValidUtf8(int i, byte[] bArr, int i2, int i3) {
            int i4;
            int i5;
            if (i != 0) {
                if (i2 >= i3) {
                    return i;
                }
                byte b = (byte) i;
                if (b < -32) {
                    if (b >= -62) {
                        i4 = i2 + 1;
                    }
                    return -1;
                } else if (b < -16) {
                    byte b2 = (byte) ((i >> 8) ^ -1);
                    if (b2 == 0) {
                        int i6 = i2 + 1;
                        byte b3 = bArr[i2];
                        if (i6 >= i3) {
                            return Utf8.incompleteStateFor(b, b3);
                        }
                        byte b4 = b3;
                        i2 = i6;
                        b2 = b4;
                    }
                    if (b2 <= -65 && ((b != -32 || b2 >= -96) && (b != -19 || b2 < -96))) {
                        i4 = i2 + 1;
                    }
                    return -1;
                } else {
                    byte b5 = (byte) ((i >> 8) ^ -1);
                    byte b6 = 0;
                    if (b5 == 0) {
                        i5 = i2 + 1;
                        b5 = bArr[i2];
                        if (i5 >= i3) {
                            return Utf8.incompleteStateFor(b, b5);
                        }
                    } else {
                        b6 = (byte) (i >> 16);
                        i5 = i2;
                    }
                    if (b6 == 0) {
                        int i7 = i5 + 1;
                        b6 = bArr[i5];
                        if (i7 >= i3) {
                            return Utf8.incompleteStateFor((int) b, (int) b5, (int) b6);
                        }
                        i5 = i7;
                    }
                    if (b5 <= -65 && (((b << 28) + (b5 + 112)) >> 30) == 0 && b6 <= -65) {
                        i2 = i5 + 1;
                    }
                    return -1;
                }
                return partialIsValidUtf8(bArr, i4, i3);
            }
            i4 = i2;
            return partialIsValidUtf8(bArr, i4, i3);
        }

        /* access modifiers changed from: 0000 */
        public int partialIsValidUtf8Direct(int i, ByteBuffer byteBuffer, int i2, int i3) {
            return partialIsValidUtf8Default(i, byteBuffer, i2, i3);
        }
    }

    static class UnpairedSurrogateException extends IllegalArgumentException {
        UnpairedSurrogateException(int i, int i2) {
            StringBuilder sb = new StringBuilder();
            sb.append("Unpaired surrogate at index ");
            sb.append(i);
            sb.append(" of ");
            sb.append(i2);
            super(sb.toString());
        }
    }

    static final class UnsafeProcessor extends Processor {
        UnsafeProcessor() {
        }

        static boolean isAvailable() {
            return UnsafeUtil.hasUnsafeArrayOperations() && UnsafeUtil.hasUnsafeByteBufferOperations();
        }

        /* JADX WARNING: Code restructure failed: missing block: B:19:0x0039, code lost:
            return -1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:36:0x0064, code lost:
            return -1;
         */
        private static int partialIsValidUtf8(long j, int i) {
            long j2;
            int unsafeEstimateConsecutiveAscii = unsafeEstimateConsecutiveAscii(j, i);
            long j3 = j + ((long) unsafeEstimateConsecutiveAscii);
            int i2 = i - unsafeEstimateConsecutiveAscii;
            while (true) {
                byte b = 0;
                while (true) {
                    if (i2 <= 0) {
                        break;
                    }
                    long j4 = j3 + 1;
                    b = UnsafeUtil.getByte(j3);
                    if (b < 0) {
                        j3 = j4;
                        break;
                    }
                    i2--;
                    j3 = j4;
                }
                if (i2 == 0) {
                    return 0;
                }
                int i3 = i2 - 1;
                if (b >= -32) {
                    if (b >= -16) {
                        if (i3 >= 3) {
                            i2 = i3 - 3;
                            long j5 = j3 + 1;
                            byte b2 = UnsafeUtil.getByte(j3);
                            if (b2 > -65 || (((b << 28) + (b2 + 112)) >> 30) != 0) {
                                break;
                            }
                            long j6 = j5 + 1;
                            if (UnsafeUtil.getByte(j5) > -65) {
                                break;
                            }
                            j2 = 1 + j6;
                            if (UnsafeUtil.getByte(j6) > -65) {
                                break;
                            }
                        } else {
                            return unsafeIncompleteStateFor(j3, b, i3);
                        }
                    } else if (i3 >= 2) {
                        i2 = i3 - 2;
                        long j7 = j3 + 1;
                        byte b3 = UnsafeUtil.getByte(j3);
                        if (b3 > -65 || ((b == -32 && b3 < -96) || (b == -19 && b3 >= -96))) {
                            break;
                        }
                        j2 = 1 + j7;
                        if (UnsafeUtil.getByte(j7) > -65) {
                            break;
                        }
                    } else {
                        return unsafeIncompleteStateFor(j3, b, i3);
                    }
                } else if (i3 != 0) {
                    i2 = i3 - 1;
                    if (b < -62) {
                        break;
                    }
                    j2 = 1 + j3;
                    if (UnsafeUtil.getByte(j3) > -65) {
                        break;
                    }
                } else {
                    return b;
                }
                j3 = j2;
            }
            return -1;
        }

        /* JADX WARNING: Code restructure failed: missing block: B:19:0x0039, code lost:
            return -1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:36:0x0064, code lost:
            return -1;
         */
        private static int partialIsValidUtf8(byte[] bArr, long j, int i) {
            long j2;
            int unsafeEstimateConsecutiveAscii = unsafeEstimateConsecutiveAscii(bArr, j, i);
            int i2 = i - unsafeEstimateConsecutiveAscii;
            long j3 = j + ((long) unsafeEstimateConsecutiveAscii);
            while (true) {
                byte b = 0;
                while (true) {
                    if (i2 <= 0) {
                        break;
                    }
                    long j4 = j3 + 1;
                    b = UnsafeUtil.getByte(bArr, j3);
                    if (b < 0) {
                        j3 = j4;
                        break;
                    }
                    i2--;
                    j3 = j4;
                }
                if (i2 == 0) {
                    return 0;
                }
                int i3 = i2 - 1;
                if (b >= -32) {
                    if (b >= -16) {
                        if (i3 >= 3) {
                            i2 = i3 - 3;
                            long j5 = j3 + 1;
                            byte b2 = UnsafeUtil.getByte(bArr, j3);
                            if (b2 > -65 || (((b << 28) + (b2 + 112)) >> 30) != 0) {
                                break;
                            }
                            long j6 = j5 + 1;
                            if (UnsafeUtil.getByte(bArr, j5) > -65) {
                                break;
                            }
                            j2 = 1 + j6;
                            if (UnsafeUtil.getByte(bArr, j6) > -65) {
                                break;
                            }
                        } else {
                            return unsafeIncompleteStateFor(bArr, b, j3, i3);
                        }
                    } else if (i3 >= 2) {
                        i2 = i3 - 2;
                        long j7 = j3 + 1;
                        byte b3 = UnsafeUtil.getByte(bArr, j3);
                        if (b3 > -65 || ((b == -32 && b3 < -96) || (b == -19 && b3 >= -96))) {
                            break;
                        }
                        j2 = 1 + j7;
                        if (UnsafeUtil.getByte(bArr, j7) > -65) {
                            break;
                        }
                    } else {
                        return unsafeIncompleteStateFor(bArr, b, j3, i3);
                    }
                } else if (i3 != 0) {
                    i2 = i3 - 1;
                    if (b < -62) {
                        break;
                    }
                    j2 = 1 + j3;
                    if (UnsafeUtil.getByte(bArr, j3) > -65) {
                        break;
                    }
                } else {
                    return b;
                }
                j3 = j2;
            }
            return -1;
        }

        private static int unsafeEstimateConsecutiveAscii(long j, int i) {
            if (i < 16) {
                return 0;
            }
            int i2 = 8 - (((int) j) & 7);
            long j2 = j;
            int i3 = i2;
            while (i3 > 0) {
                long j3 = 1 + j2;
                if (UnsafeUtil.getByte(j2) < 0) {
                    return i2 - i3;
                }
                i3--;
                j2 = j3;
            }
            int i4 = i - i2;
            while (i4 >= 8 && (UnsafeUtil.getLong(j2) & Utf8.ASCII_MASK_LONG) == 0) {
                j2 += 8;
                i4 -= 8;
            }
            return i - i4;
        }

        private static int unsafeEstimateConsecutiveAscii(byte[] bArr, long j, int i) {
            int i2 = 0;
            if (i < 16) {
                return 0;
            }
            while (i2 < i) {
                long j2 = 1 + j;
                if (UnsafeUtil.getByte(bArr, j) < 0) {
                    return i2;
                }
                i2++;
                j = j2;
            }
            return i;
        }

        private static int unsafeIncompleteStateFor(long j, int i, int i2) {
            switch (i2) {
                case 0:
                    return Utf8.incompleteStateFor(i);
                case 1:
                    return Utf8.incompleteStateFor(i, UnsafeUtil.getByte(j));
                case 2:
                    return Utf8.incompleteStateFor(i, (int) UnsafeUtil.getByte(j), (int) UnsafeUtil.getByte(j + 1));
                default:
                    throw new AssertionError();
            }
        }

        private static int unsafeIncompleteStateFor(byte[] bArr, int i, long j, int i2) {
            switch (i2) {
                case 0:
                    return Utf8.incompleteStateFor(i);
                case 1:
                    return Utf8.incompleteStateFor(i, UnsafeUtil.getByte(bArr, j));
                case 2:
                    return Utf8.incompleteStateFor(i, (int) UnsafeUtil.getByte(bArr, j), (int) UnsafeUtil.getByte(bArr, j + 1));
                default:
                    throw new AssertionError();
            }
        }

        /* access modifiers changed from: 0000 */
        public String decodeUtf8(byte[] bArr, int i, int i2) throws InvalidProtocolBufferException {
            if ((i | i2 | ((bArr.length - i) - i2)) >= 0) {
                int i3 = i + i2;
                char[] cArr = new char[i2];
                int i4 = 0;
                while (r13 < i3) {
                    byte b = UnsafeUtil.getByte(bArr, (long) r13);
                    if (!DecodeUtil.isOneByte(b)) {
                        break;
                    }
                    i = r13 + 1;
                    int i5 = i4 + 1;
                    DecodeUtil.handleOneByte(b, cArr, i4);
                    i4 = i5;
                }
                int i6 = i4;
                while (r13 < i3) {
                    int i7 = r13 + 1;
                    byte b2 = UnsafeUtil.getByte(bArr, (long) r13);
                    if (DecodeUtil.isOneByte(b2)) {
                        int i8 = i6 + 1;
                        DecodeUtil.handleOneByte(b2, cArr, i6);
                        while (i7 < i3) {
                            byte b3 = UnsafeUtil.getByte(bArr, (long) i7);
                            if (!DecodeUtil.isOneByte(b3)) {
                                break;
                            }
                            i7++;
                            int i9 = i8 + 1;
                            DecodeUtil.handleOneByte(b3, cArr, i8);
                            i8 = i9;
                        }
                        r13 = i7;
                        i6 = i8;
                    } else if (DecodeUtil.isTwoBytes(b2)) {
                        if (i7 < i3) {
                            int i10 = i7 + 1;
                            int i11 = i6 + 1;
                            DecodeUtil.handleTwoBytes(b2, UnsafeUtil.getByte(bArr, (long) i7), cArr, i6);
                            r13 = i10;
                            i6 = i11;
                        } else {
                            throw InvalidProtocolBufferException.invalidUtf8();
                        }
                    } else if (DecodeUtil.isThreeBytes(b2)) {
                        if (i7 < i3 - 1) {
                            int i12 = i7 + 1;
                            int i13 = i12 + 1;
                            int i14 = i6 + 1;
                            DecodeUtil.handleThreeBytes(b2, UnsafeUtil.getByte(bArr, (long) i7), UnsafeUtil.getByte(bArr, (long) i12), cArr, i6);
                            r13 = i13;
                            i6 = i14;
                        } else {
                            throw InvalidProtocolBufferException.invalidUtf8();
                        }
                    } else if (i7 < i3 - 2) {
                        int i15 = i7 + 1;
                        byte b4 = UnsafeUtil.getByte(bArr, (long) i7);
                        int i16 = i15 + 1;
                        int i17 = i16 + 1;
                        int i18 = i6 + 1;
                        DecodeUtil.handleFourBytes(b2, b4, UnsafeUtil.getByte(bArr, (long) i15), UnsafeUtil.getByte(bArr, (long) i16), cArr, i6);
                        r13 = i17;
                        i6 = i18 + 1;
                    } else {
                        throw InvalidProtocolBufferException.invalidUtf8();
                    }
                }
                return new String(cArr, 0, i6);
            }
            throw new ArrayIndexOutOfBoundsException(String.format("buffer length=%d, index=%d, size=%d", new Object[]{Integer.valueOf(bArr.length), Integer.valueOf(i), Integer.valueOf(i2)}));
        }

        /* access modifiers changed from: 0000 */
        public String decodeUtf8Direct(ByteBuffer byteBuffer, int i, int i2) throws InvalidProtocolBufferException {
            long j;
            int i3 = i;
            int i4 = i2;
            if ((i3 | i4 | ((byteBuffer.limit() - i3) - i4)) >= 0) {
                long addressOffset = UnsafeUtil.addressOffset(byteBuffer) + ((long) i3);
                long j2 = ((long) i4) + addressOffset;
                char[] cArr = new char[i4];
                int i5 = 0;
                while (addressOffset < j2) {
                    byte b = UnsafeUtil.getByte(addressOffset);
                    if (!DecodeUtil.isOneByte(b)) {
                        break;
                    }
                    addressOffset++;
                    int i6 = i5 + 1;
                    DecodeUtil.handleOneByte(b, cArr, i5);
                    i5 = i6;
                }
                while (true) {
                    int i7 = i5;
                    while (j < j2) {
                        long j3 = j + 1;
                        byte b2 = UnsafeUtil.getByte(j);
                        if (DecodeUtil.isOneByte(b2)) {
                            int i8 = i7 + 1;
                            DecodeUtil.handleOneByte(b2, cArr, i7);
                            while (j3 < j2) {
                                byte b3 = UnsafeUtil.getByte(j3);
                                if (!DecodeUtil.isOneByte(b3)) {
                                    break;
                                }
                                j3++;
                                int i9 = i8 + 1;
                                DecodeUtil.handleOneByte(b3, cArr, i8);
                                i8 = i9;
                            }
                            i7 = i8;
                            j = j3;
                        } else if (DecodeUtil.isTwoBytes(b2)) {
                            if (j3 < j2) {
                                j = j3 + 1;
                                int i10 = i7 + 1;
                                DecodeUtil.handleTwoBytes(b2, UnsafeUtil.getByte(j3), cArr, i7);
                                i7 = i10;
                            } else {
                                throw InvalidProtocolBufferException.invalidUtf8();
                            }
                        } else if (DecodeUtil.isThreeBytes(b2)) {
                            if (j3 < j2 - 1) {
                                long j4 = j3 + 1;
                                byte b4 = UnsafeUtil.getByte(j3);
                                long j5 = j4 + 1;
                                byte b5 = UnsafeUtil.getByte(j4);
                                int i11 = i7 + 1;
                                DecodeUtil.handleThreeBytes(b2, b4, b5, cArr, i7);
                                i7 = i11;
                                j = j5;
                            } else {
                                throw InvalidProtocolBufferException.invalidUtf8();
                            }
                        } else if (j3 < j2 - 2) {
                            long j6 = j3 + 1;
                            byte b6 = UnsafeUtil.getByte(j3);
                            long j7 = j6 + 1;
                            byte b7 = UnsafeUtil.getByte(j6);
                            addressOffset = j7 + 1;
                            byte b8 = UnsafeUtil.getByte(j7);
                            int i12 = i7 + 1;
                            DecodeUtil.handleFourBytes(b2, b6, b7, b8, cArr, i7);
                            i5 = i12 + 1;
                        } else {
                            throw InvalidProtocolBufferException.invalidUtf8();
                        }
                    }
                    return new String(cArr, 0, i7);
                }
            }
            throw new ArrayIndexOutOfBoundsException(String.format("buffer limit=%d, index=%d, limit=%d", new Object[]{Integer.valueOf(byteBuffer.limit()), Integer.valueOf(i), Integer.valueOf(i2)}));
        }

        /* access modifiers changed from: 0000 */
        public int encodeUtf8(CharSequence charSequence, byte[] bArr, int i, int i2) {
            long j;
            long j2;
            CharSequence charSequence2 = charSequence;
            byte[] bArr2 = bArr;
            int i3 = i;
            int i4 = i2;
            long j3 = (long) i3;
            long j4 = ((long) i4) + j3;
            int length = charSequence.length();
            if (length > i4 || bArr2.length - i4 < i3) {
                StringBuilder sb = new StringBuilder();
                sb.append("Failed writing ");
                sb.append(charSequence2.charAt(length - 1));
                sb.append(" at index ");
                sb.append(i3 + i4);
                throw new ArrayIndexOutOfBoundsException(sb.toString());
            }
            int i5 = 0;
            while (i5 < length) {
                char charAt = charSequence2.charAt(i5);
                if (charAt >= 128) {
                    break;
                }
                long j5 = 1 + j;
                UnsafeUtil.putByte(bArr2, j, (byte) charAt);
                i5++;
                j3 = j5;
            }
            if (i5 == length) {
                return (int) j;
            }
            while (i5 < length) {
                char charAt2 = charSequence2.charAt(i5);
                if (charAt2 < 128 && j < j4) {
                    j2 = j + 1;
                    UnsafeUtil.putByte(bArr2, j, (byte) charAt2);
                } else if (charAt2 < 2048 && j <= j4 - 2) {
                    long j6 = j + 1;
                    UnsafeUtil.putByte(bArr2, j, (byte) ((charAt2 >>> 6) | 960));
                    j = j6 + 1;
                    UnsafeUtil.putByte(bArr2, j6, (byte) ((charAt2 & '?') | 128));
                    i5++;
                } else if ((charAt2 < 55296 || 57343 < charAt2) && j <= j4 - 3) {
                    long j7 = j + 1;
                    UnsafeUtil.putByte(bArr2, j, (byte) ((charAt2 >>> 12) | 480));
                    long j8 = j7 + 1;
                    UnsafeUtil.putByte(bArr2, j7, (byte) (((charAt2 >>> 6) & 63) | 128));
                    j2 = j8 + 1;
                    UnsafeUtil.putByte(bArr2, j8, (byte) ((charAt2 & '?') | 128));
                } else if (j <= j4 - 4) {
                    int i6 = i5 + 1;
                    if (i6 != length) {
                        char charAt3 = charSequence2.charAt(i6);
                        if (Character.isSurrogatePair(charAt2, charAt3)) {
                            int codePoint = Character.toCodePoint(charAt2, charAt3);
                            long j9 = j + 1;
                            UnsafeUtil.putByte(bArr2, j, (byte) ((codePoint >>> 18) | 240));
                            long j10 = j9 + 1;
                            UnsafeUtil.putByte(bArr2, j9, (byte) (((codePoint >>> 12) & 63) | 128));
                            long j11 = j10 + 1;
                            UnsafeUtil.putByte(bArr2, j10, (byte) (((codePoint >>> 6) & 63) | 128));
                            j = j11 + 1;
                            UnsafeUtil.putByte(bArr2, j11, (byte) ((codePoint & 63) | 128));
                            i5 = i6;
                            i5++;
                        }
                    } else {
                        i6 = i5;
                    }
                    throw new UnpairedSurrogateException(i6 - 1, length);
                } else {
                    if (55296 <= charAt2 && charAt2 <= 57343) {
                        int i7 = i5 + 1;
                        if (i7 == length || !Character.isSurrogatePair(charAt2, charSequence2.charAt(i7))) {
                            throw new UnpairedSurrogateException(i5, length);
                        }
                    }
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Failed writing ");
                    sb2.append(charAt2);
                    sb2.append(" at index ");
                    sb2.append(j);
                    throw new ArrayIndexOutOfBoundsException(sb2.toString());
                }
                j = j2;
                i5++;
            }
            return (int) j;
        }

        /* access modifiers changed from: 0000 */
        public void encodeUtf8Direct(CharSequence charSequence, ByteBuffer byteBuffer) {
            char c;
            long j;
            long j2;
            long j3;
            CharSequence charSequence2 = charSequence;
            ByteBuffer byteBuffer2 = byteBuffer;
            long addressOffset = UnsafeUtil.addressOffset(byteBuffer);
            long position = ((long) byteBuffer.position()) + addressOffset;
            long limit = ((long) byteBuffer.limit()) + addressOffset;
            int length = charSequence.length();
            if (((long) length) <= limit - position) {
                int i = 0;
                while (true) {
                    c = 128;
                    j = 1;
                    if (i >= length) {
                        break;
                    }
                    char charAt = charSequence2.charAt(i);
                    if (charAt >= 128) {
                        break;
                    }
                    long j4 = 1 + position;
                    UnsafeUtil.putByte(position, (byte) charAt);
                    i++;
                    position = j4;
                }
                if (i == length) {
                    byteBuffer2.position((int) (position - addressOffset));
                    return;
                }
                while (i < length) {
                    char charAt2 = charSequence2.charAt(i);
                    if (charAt2 < c && position < limit) {
                        j2 = position + j;
                        UnsafeUtil.putByte(position, (byte) charAt2);
                    } else if (charAt2 < 2048 && position <= limit - 2) {
                        long j5 = position + j;
                        UnsafeUtil.putByte(position, (byte) ((charAt2 >>> 6) | 960));
                        long j6 = j5 + j;
                        UnsafeUtil.putByte(j5, (byte) ((charAt2 & '?') | 128));
                        j2 = j6;
                    } else if ((charAt2 < 55296 || 57343 < charAt2) && position <= limit - 3) {
                        long j7 = position + j;
                        UnsafeUtil.putByte(position, (byte) ((charAt2 >>> 12) | 480));
                        long j8 = j7 + j;
                        UnsafeUtil.putByte(j7, (byte) (((charAt2 >>> 6) & 63) | 128));
                        long j9 = j8 + 1;
                        UnsafeUtil.putByte(j8, (byte) ((charAt2 & '?') | 128));
                        j2 = j9;
                        j3 = 1;
                        i++;
                        j = j3;
                        position = j2;
                        c = 128;
                    } else if (position <= limit - 4) {
                        int i2 = i + 1;
                        if (i2 != length) {
                            char charAt3 = charSequence2.charAt(i2);
                            if (Character.isSurrogatePair(charAt2, charAt3)) {
                                int codePoint = Character.toCodePoint(charAt2, charAt3);
                                long j10 = position + 1;
                                UnsafeUtil.putByte(position, (byte) ((codePoint >>> 18) | 240));
                                long j11 = j10 + 1;
                                UnsafeUtil.putByte(j10, (byte) (((codePoint >>> 12) & 63) | 128));
                                long j12 = j11 + 1;
                                UnsafeUtil.putByte(j11, (byte) (((codePoint >>> 6) & 63) | 128));
                                j3 = 1;
                                long j13 = j12 + 1;
                                UnsafeUtil.putByte(j12, (byte) ((codePoint & 63) | 128));
                                i = i2;
                                j2 = j13;
                                i++;
                                j = j3;
                                position = j2;
                                c = 128;
                            } else {
                                i = i2;
                            }
                        }
                        throw new UnpairedSurrogateException(i - 1, length);
                    } else {
                        if (55296 <= charAt2 && charAt2 <= 57343) {
                            int i3 = i + 1;
                            if (i3 == length || !Character.isSurrogatePair(charAt2, charSequence2.charAt(i3))) {
                                throw new UnpairedSurrogateException(i, length);
                            }
                        }
                        StringBuilder sb = new StringBuilder();
                        sb.append("Failed writing ");
                        sb.append(charAt2);
                        sb.append(" at index ");
                        sb.append(position);
                        throw new ArrayIndexOutOfBoundsException(sb.toString());
                    }
                    j3 = j;
                    i++;
                    j = j3;
                    position = j2;
                    c = 128;
                }
                byteBuffer2.position((int) (position - addressOffset));
                return;
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Failed writing ");
            sb2.append(charSequence2.charAt(length - 1));
            sb2.append(" at index ");
            sb2.append(byteBuffer.limit());
            throw new ArrayIndexOutOfBoundsException(sb2.toString());
        }

        /* access modifiers changed from: 0000 */
        /* JADX WARNING: Code restructure failed: missing block: B:12:0x0025, code lost:
            if (com.google.protobuf.UnsafeUtil.getByte(r13, r2) > -65) goto L_0x0027;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:31:0x0057, code lost:
            if (com.google.protobuf.UnsafeUtil.getByte(r13, r2) > -65) goto L_0x0059;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:52:0x0099, code lost:
            if (com.google.protobuf.UnsafeUtil.getByte(r13, r2) > -65) goto L_0x009b;
         */
        public int partialIsValidUtf8(int i, byte[] bArr, int i2, int i3) {
            long j;
            byte b = 0;
            if ((i2 | i3 | (bArr.length - i3)) >= 0) {
                long j2 = (long) i2;
                long j3 = (long) i3;
                if (i == 0) {
                    j = j2;
                } else if (j2 >= j3) {
                    return i;
                } else {
                    byte b2 = (byte) i;
                    if (b2 < -32) {
                        if (b2 >= -62) {
                            j = j2 + 1;
                        }
                        return -1;
                    } else if (b2 < -16) {
                        byte b3 = (byte) ((i >> 8) ^ -1);
                        if (b3 == 0) {
                            long j4 = j2 + 1;
                            b3 = UnsafeUtil.getByte(bArr, j2);
                            if (j4 >= j3) {
                                return Utf8.incompleteStateFor(b2, b3);
                            }
                            j2 = j4;
                        }
                        if (b3 <= -65 && ((b2 != -32 || b3 >= -96) && (b2 != -19 || b3 < -96))) {
                            j = j2 + 1;
                        }
                        return -1;
                    } else {
                        byte b4 = (byte) ((i >> 8) ^ -1);
                        if (b4 == 0) {
                            long j5 = j2 + 1;
                            b4 = UnsafeUtil.getByte(bArr, j2);
                            if (j5 >= j3) {
                                return Utf8.incompleteStateFor(b2, b4);
                            }
                            j2 = j5;
                        } else {
                            b = (byte) (i >> 16);
                        }
                        if (b == 0) {
                            long j6 = j2 + 1;
                            b = UnsafeUtil.getByte(bArr, j2);
                            if (j6 >= j3) {
                                return Utf8.incompleteStateFor((int) b2, (int) b4, (int) b);
                            }
                            j2 = j6;
                        }
                        if (b4 <= -65 && (((b2 << 28) + (b4 + 112)) >> 30) == 0 && b <= -65) {
                            j = j2 + 1;
                        }
                        return -1;
                    }
                }
                return partialIsValidUtf8(bArr, j, (int) (j3 - j));
            }
            throw new ArrayIndexOutOfBoundsException(String.format("Array length=%d, index=%d, limit=%d", new Object[]{Integer.valueOf(bArr.length), Integer.valueOf(i2), Integer.valueOf(i3)}));
        }

        /* access modifiers changed from: 0000 */
        /* JADX WARNING: Code restructure failed: missing block: B:12:0x002f, code lost:
            if (com.google.protobuf.UnsafeUtil.getByte(r2) > -65) goto L_0x0031;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:31:0x0061, code lost:
            if (com.google.protobuf.UnsafeUtil.getByte(r2) > -65) goto L_0x0063;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:52:0x00a3, code lost:
            if (com.google.protobuf.UnsafeUtil.getByte(r2) > -65) goto L_0x00a5;
         */
        public int partialIsValidUtf8Direct(int i, ByteBuffer byteBuffer, int i2, int i3) {
            long j;
            byte b = 0;
            if ((i2 | i3 | (byteBuffer.limit() - i3)) >= 0) {
                long addressOffset = UnsafeUtil.addressOffset(byteBuffer) + ((long) i2);
                long j2 = ((long) (i3 - i2)) + addressOffset;
                if (i == 0) {
                    j = addressOffset;
                } else if (addressOffset >= j2) {
                    return i;
                } else {
                    byte b2 = (byte) i;
                    if (b2 < -32) {
                        if (b2 >= -62) {
                            j = addressOffset + 1;
                        }
                        return -1;
                    } else if (b2 < -16) {
                        byte b3 = (byte) ((i >> 8) ^ -1);
                        if (b3 == 0) {
                            long j3 = addressOffset + 1;
                            b3 = UnsafeUtil.getByte(addressOffset);
                            if (j3 >= j2) {
                                return Utf8.incompleteStateFor(b2, b3);
                            }
                            addressOffset = j3;
                        }
                        if (b3 <= -65 && ((b2 != -32 || b3 >= -96) && (b2 != -19 || b3 < -96))) {
                            j = addressOffset + 1;
                        }
                        return -1;
                    } else {
                        byte b4 = (byte) ((i >> 8) ^ -1);
                        if (b4 == 0) {
                            long j4 = addressOffset + 1;
                            b4 = UnsafeUtil.getByte(addressOffset);
                            if (j4 >= j2) {
                                return Utf8.incompleteStateFor(b2, b4);
                            }
                            addressOffset = j4;
                        } else {
                            b = (byte) (i >> 16);
                        }
                        if (b == 0) {
                            long j5 = addressOffset + 1;
                            b = UnsafeUtil.getByte(addressOffset);
                            if (j5 >= j2) {
                                return Utf8.incompleteStateFor((int) b2, (int) b4, (int) b);
                            }
                            addressOffset = j5;
                        }
                        if (b4 <= -65 && (((b2 << 28) + (b4 + 112)) >> 30) == 0 && b <= -65) {
                            j = addressOffset + 1;
                        }
                        return -1;
                    }
                }
                return partialIsValidUtf8(j, (int) (j2 - j));
            }
            throw new ArrayIndexOutOfBoundsException(String.format("buffer limit=%d, index=%d, limit=%d", new Object[]{Integer.valueOf(byteBuffer.limit()), Integer.valueOf(i2), Integer.valueOf(i3)}));
        }
    }

    private Utf8() {
    }

    static String decodeUtf8(ByteBuffer byteBuffer, int i, int i2) throws InvalidProtocolBufferException {
        return processor.decodeUtf8(byteBuffer, i, i2);
    }

    static String decodeUtf8(byte[] bArr, int i, int i2) throws InvalidProtocolBufferException {
        return processor.decodeUtf8(bArr, i, i2);
    }

    static int encode(CharSequence charSequence, byte[] bArr, int i, int i2) {
        return processor.encodeUtf8(charSequence, bArr, i, i2);
    }

    static void encodeUtf8(CharSequence charSequence, ByteBuffer byteBuffer) {
        processor.encodeUtf8(charSequence, byteBuffer);
    }

    static int encodedLength(CharSequence charSequence) {
        int length = charSequence.length();
        int i = 0;
        while (i < length && charSequence.charAt(i) < 128) {
            i++;
        }
        int i2 = length;
        while (true) {
            if (i >= length) {
                break;
            }
            char charAt = charSequence.charAt(i);
            if (charAt >= 2048) {
                i2 += encodedLengthGeneral(charSequence, i);
                break;
            }
            i2 += (127 - charAt) >>> 31;
            i++;
        }
        if (i2 >= length) {
            return i2;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("UTF-8 length does not fit in int: ");
        sb.append(((long) i2) + 4294967296L);
        throw new IllegalArgumentException(sb.toString());
    }

    private static int encodedLengthGeneral(CharSequence charSequence, int i) {
        int length = charSequence.length();
        int i2 = 0;
        while (i < length) {
            char charAt = charSequence.charAt(i);
            if (charAt < 2048) {
                i2 += (127 - charAt) >>> 31;
            } else {
                i2 += 2;
                if (55296 <= charAt && charAt <= 57343) {
                    if (Character.codePointAt(charSequence, i) >= 65536) {
                        i++;
                    } else {
                        throw new UnpairedSurrogateException(i, length);
                    }
                }
            }
            i++;
        }
        return i2;
    }

    /* access modifiers changed from: private */
    public static int estimateConsecutiveAscii(ByteBuffer byteBuffer, int i, int i2) {
        int i3 = i2 - 7;
        int i4 = i;
        while (i4 < i3 && (byteBuffer.getLong(i4) & ASCII_MASK_LONG) == 0) {
            i4 += 8;
        }
        return i4 - i;
    }

    /* access modifiers changed from: private */
    public static int incompleteStateFor(int i) {
        if (i > -12) {
            return -1;
        }
        return i;
    }

    /* access modifiers changed from: private */
    public static int incompleteStateFor(int i, int i2) {
        if (i > -12 || i2 > -65) {
            return -1;
        }
        return i ^ (i2 << 8);
    }

    /* access modifiers changed from: private */
    public static int incompleteStateFor(int i, int i2, int i3) {
        if (i > -12 || i2 > -65 || i3 > -65) {
            return -1;
        }
        return (i ^ (i2 << 8)) ^ (i3 << 16);
    }

    /* access modifiers changed from: private */
    public static int incompleteStateFor(ByteBuffer byteBuffer, int i, int i2, int i3) {
        switch (i3) {
            case 0:
                return incompleteStateFor(i);
            case 1:
                return incompleteStateFor(i, byteBuffer.get(i2));
            case 2:
                return incompleteStateFor(i, (int) byteBuffer.get(i2), (int) byteBuffer.get(i2 + 1));
            default:
                throw new AssertionError();
        }
    }

    /* access modifiers changed from: private */
    public static int incompleteStateFor(byte[] bArr, int i, int i2) {
        byte b = bArr[i - 1];
        switch (i2 - i) {
            case 0:
                return incompleteStateFor(b);
            case 1:
                return incompleteStateFor(b, bArr[i]);
            case 2:
                return incompleteStateFor((int) b, (int) bArr[i], (int) bArr[i + 1]);
            default:
                throw new AssertionError();
        }
    }

    static boolean isValidUtf8(ByteBuffer byteBuffer) {
        return processor.isValidUtf8(byteBuffer, byteBuffer.position(), byteBuffer.remaining());
    }

    public static boolean isValidUtf8(byte[] bArr) {
        return processor.isValidUtf8(bArr, 0, bArr.length);
    }

    public static boolean isValidUtf8(byte[] bArr, int i, int i2) {
        return processor.isValidUtf8(bArr, i, i2);
    }

    static int partialIsValidUtf8(int i, ByteBuffer byteBuffer, int i2, int i3) {
        return processor.partialIsValidUtf8(i, byteBuffer, i2, i3);
    }

    public static int partialIsValidUtf8(int i, byte[] bArr, int i2, int i3) {
        return processor.partialIsValidUtf8(i, bArr, i2, i3);
    }
}
