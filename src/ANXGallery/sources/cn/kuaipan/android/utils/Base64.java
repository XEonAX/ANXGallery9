package cn.kuaipan.android.utils;

import java.io.UnsupportedEncodingException;

public class Base64 {
    static final /* synthetic */ boolean $assertionsDisabled = false;

    static abstract class Coder {
        public int op;
        public byte[] output;

        Coder() {
        }
    }

    static class Decoder extends Coder {
        private static final int[] DECODE = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -2, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
        private static final int[] DECODE_WEBSAFE = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -2, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, 63, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
        private final int[] alphabet;
        private int state;
        private int value;

        public Decoder(int i, byte[] bArr) {
            this.output = bArr;
            this.alphabet = (i & 8) == 0 ? DECODE : DECODE_WEBSAFE;
            this.state = 0;
            this.value = 0;
        }

        /* JADX WARNING: Code restructure failed: missing block: B:44:0x00d9, code lost:
            r6 = r13;
         */
        /* JADX WARNING: Removed duplicated region for block: B:51:0x00e6  */
        /* JADX WARNING: Removed duplicated region for block: B:53:0x00ed  */
        public boolean process(byte[] bArr, int i, int i2, boolean z) {
            if (this.state == 6) {
                return false;
            }
            int i3 = i2 + i;
            int i4 = this.state;
            int i5 = this.value;
            byte[] bArr2 = this.output;
            int[] iArr = this.alphabet;
            int i6 = i5;
            int i7 = 0;
            while (i < i3) {
                if (i4 == 0) {
                    while (true) {
                        int i8 = i + 4;
                        if (i8 <= i3) {
                            i6 = (iArr[bArr[i] & 255] << 18) | (iArr[bArr[i + 1] & 255] << 12) | (iArr[bArr[i + 2] & 255] << 6) | iArr[bArr[i + 3] & 255];
                            if (i6 >= 0) {
                                bArr2[i7 + 2] = (byte) i6;
                                bArr2[i7 + 1] = (byte) (i6 >> 8);
                                bArr2[i7] = (byte) (i6 >> 16);
                                i7 += 3;
                                i = i8;
                            }
                        }
                    }
                    if (i >= i3) {
                        if (z) {
                            this.state = i4;
                            this.value = i6;
                            this.op = i7;
                            return true;
                        }
                        switch (i4) {
                            case 1:
                                this.state = 6;
                                return false;
                            case 2:
                                int i9 = i7 + 1;
                                bArr2[i7] = (byte) (i6 >> 4);
                                i7 = i9;
                                break;
                            case 3:
                                int i10 = i7 + 1;
                                bArr2[i7] = (byte) (i6 >> 10);
                                i7 = i10 + 1;
                                bArr2[i10] = (byte) (i6 >> 2);
                                break;
                            case 4:
                                this.state = 6;
                                return false;
                        }
                        this.state = i4;
                        this.op = i7;
                        return true;
                    }
                }
                int i11 = i + 1;
                int i12 = iArr[bArr[i] & 255];
                switch (i4) {
                    case 0:
                        if (i12 < 0) {
                            if (i12 == -1) {
                                break;
                            } else {
                                this.state = 6;
                                return false;
                            }
                        } else {
                            i4++;
                        }
                    case 1:
                        if (i12 < 0) {
                            if (i12 == -1) {
                                break;
                            } else {
                                this.state = 6;
                                return false;
                            }
                        } else {
                            i12 |= i6 << 6;
                            i4++;
                        }
                    case 2:
                        if (i12 < 0) {
                            if (i12 != -2) {
                                if (i12 == -1) {
                                    break;
                                } else {
                                    this.state = 6;
                                    return false;
                                }
                            } else {
                                int i13 = i7 + 1;
                                bArr2[i7] = (byte) (i6 >> 4);
                                i7 = i13;
                                i4 = 4;
                                break;
                            }
                        } else {
                            i12 |= i6 << 6;
                            i4++;
                        }
                    case 3:
                        if (i12 < 0) {
                            if (i12 != -2) {
                                if (i12 == -1) {
                                    break;
                                } else {
                                    this.state = 6;
                                    return false;
                                }
                            } else {
                                bArr2[i7 + 1] = (byte) (i6 >> 2);
                                bArr2[i7] = (byte) (i6 >> 10);
                                i7 += 2;
                                i4 = 5;
                                break;
                            }
                        } else {
                            int i14 = i12 | (i6 << 6);
                            bArr2[i7 + 2] = (byte) i14;
                            bArr2[i7 + 1] = (byte) (i14 >> 8);
                            bArr2[i7] = (byte) (i14 >> 16);
                            i7 += 3;
                            i6 = i14;
                            i4 = 0;
                            break;
                        }
                    case 4:
                        if (i12 != -2) {
                            if (i12 == -1) {
                                break;
                            } else {
                                this.state = 6;
                                return false;
                            }
                        } else {
                            i4++;
                            break;
                        }
                    case 5:
                        if (i12 == -1) {
                            break;
                        } else {
                            this.state = 6;
                            return false;
                        }
                }
                i = i11;
            }
            if (z) {
            }
        }
    }

    static class Encoder extends Coder {
        static final /* synthetic */ boolean $assertionsDisabled = false;
        private static final byte[] ENCODE = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};
        private static final byte[] ENCODE_WEBSAFE = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 45, 95};
        private final byte[] alphabet;
        private int count;
        public final boolean do_cr;
        public final boolean do_newline;
        public final boolean do_padding;
        private final byte[] tail;
        int tailLen;

        static {
            Class<Base64> cls = Base64.class;
        }

        public Encoder(int i, byte[] bArr) {
            this.output = bArr;
            boolean z = true;
            this.do_padding = (i & 1) == 0;
            this.do_newline = (i & 2) == 0;
            if ((i & 4) == 0) {
                z = false;
            }
            this.do_cr = z;
            this.alphabet = (i & 8) == 0 ? ENCODE : ENCODE_WEBSAFE;
            this.tail = new byte[2];
            this.tailLen = 0;
            this.count = this.do_newline ? 19 : -1;
        }

        public boolean process(byte[] bArr, int i, int i2, boolean z) {
            int i3;
            byte b;
            int i4;
            int i5;
            boolean z2;
            int i6;
            byte b2;
            int i7;
            byte b3;
            int i8;
            byte b4;
            int i9;
            int i10;
            int i11;
            int i12;
            byte[] bArr2 = this.alphabet;
            byte[] bArr3 = this.output;
            int i13 = this.count;
            int i14 = i2 + i;
            int i15 = 0;
            switch (this.tailLen) {
                case 1:
                    if (i + 2 <= i14) {
                        int i16 = i + 1;
                        byte b5 = ((bArr[i] & 255) << 8) | ((this.tail[0] & 255) << 16);
                        i3 = i16 + 1;
                        b = b5 | (bArr[i16] & 255);
                        this.tailLen = 0;
                        break;
                    }
                case 2:
                    i3 = i + 1;
                    if (i3 <= i14) {
                        b = (bArr[i] & 255) | ((this.tail[0] & 255) << 16) | ((this.tail[1] & 255) << 8);
                        this.tailLen = 0;
                        break;
                    }
                default:
                    i3 = i;
                    b = -1;
                    break;
            }
            if (b != -1) {
                bArr3[0] = bArr2[(b >> 18) & 63];
                bArr3[1] = bArr2[(b >> 12) & 63];
                bArr3[2] = bArr2[(b >> 6) & 63];
                bArr3[3] = bArr2[b & 63];
                int i17 = i13 - 1;
                if (i17 == 0) {
                    if (this.do_cr) {
                        i12 = 5;
                        bArr3[4] = 13;
                    } else {
                        i12 = 4;
                    }
                    i4 = i12 + 1;
                    bArr3[i12] = 10;
                    i5 = 19;
                } else {
                    i5 = i17;
                    i4 = 4;
                }
            } else {
                i5 = i13;
                i4 = 0;
            }
            while (true) {
                int i18 = i3 + 3;
                if (i18 <= i14) {
                    byte b6 = (bArr[i3 + 2] & 255) | ((bArr[i3 + 1] & 255) << 8) | ((bArr[i3] & 255) << 16);
                    bArr3[i4] = bArr2[(b6 >> 18) & 63];
                    bArr3[i4 + 1] = bArr2[(b6 >> 12) & 63];
                    bArr3[i4 + 2] = bArr2[(b6 >> 6) & 63];
                    bArr3[i4 + 3] = bArr2[b6 & 63];
                    int i19 = i4 + 4;
                    int i20 = i5 - 1;
                    if (i20 == 0) {
                        if (this.do_cr) {
                            i11 = i19 + 1;
                            bArr3[i19] = 13;
                        } else {
                            i11 = i19;
                        }
                        i19 = i11 + 1;
                        bArr3[i11] = 10;
                        i10 = i18;
                        i20 = 19;
                    } else {
                        i10 = i18;
                    }
                } else {
                    if (z) {
                        if (i3 - this.tailLen == i14 - 1) {
                            if (this.tailLen > 0) {
                                b4 = this.tail[0];
                                i15 = 1;
                            } else {
                                b4 = bArr[i3];
                            }
                            int i21 = (b4 & 255) << 4;
                            this.tailLen -= i15;
                            int i22 = i4 + 1;
                            bArr3[i4] = bArr2[(i21 >> 6) & 63];
                            int i23 = i22 + 1;
                            bArr3[i22] = bArr2[i21 & 63];
                            if (this.do_padding) {
                                int i24 = i23 + 1;
                                bArr3[i23] = 61;
                                i23 = i24 + 1;
                                bArr3[i24] = 61;
                            }
                            if (this.do_newline) {
                                if (this.do_cr) {
                                    i9 = i4 + 1;
                                    bArr3[i4] = 13;
                                } else {
                                    i9 = i4;
                                }
                                i4 = i9 + 1;
                                bArr3[i9] = 10;
                            }
                        } else if (i3 - this.tailLen == i14 - 2) {
                            if (this.tailLen > 1) {
                                b2 = this.tail[0];
                                i15 = 1;
                            } else {
                                int i25 = i3 + 1;
                                byte b7 = bArr[i3];
                                i3 = i25;
                                b2 = b7;
                            }
                            int i26 = (b2 & 255) << 10;
                            if (this.tailLen > 0) {
                                i7 = i15 + 1;
                                b3 = this.tail[i15];
                            } else {
                                b3 = bArr[i3];
                                i7 = i15;
                            }
                            int i27 = ((b3 & 255) << 2) | i26;
                            this.tailLen -= i7;
                            int i28 = i4 + 1;
                            bArr3[i4] = bArr2[(i27 >> 12) & 63];
                            int i29 = i28 + 1;
                            bArr3[i28] = bArr2[(i27 >> 6) & 63];
                            int i30 = i29 + 1;
                            bArr3[i29] = bArr2[i27 & 63];
                            if (this.do_padding) {
                                i8 = i30 + 1;
                                bArr3[i30] = 61;
                            } else {
                                i8 = i30;
                            }
                            if (this.do_newline) {
                                if (this.do_cr) {
                                    int i31 = i8 + 1;
                                    bArr3[i8] = 13;
                                    i8 = i31;
                                }
                                int i32 = i8 + 1;
                                bArr3[i8] = 10;
                                i8 = i32;
                            }
                            i4 = i8;
                        } else if (this.do_newline && i4 > 0 && i5 != 19) {
                            if (this.do_cr) {
                                i6 = i4 + 1;
                                bArr3[i4] = 13;
                            } else {
                                i6 = i4;
                            }
                            int i33 = i6 + 1;
                            bArr3[i6] = 10;
                            i4 = i33;
                        }
                    } else if (i3 == i14 - 1) {
                        byte[] bArr4 = this.tail;
                        int i34 = this.tailLen;
                        this.tailLen = i34 + 1;
                        bArr4[i34] = bArr[i3];
                    } else if (i3 == i14 - 2) {
                        byte[] bArr5 = this.tail;
                        int i35 = this.tailLen;
                        this.tailLen = i35 + 1;
                        bArr5[i35] = bArr[i3];
                        byte[] bArr6 = this.tail;
                        int i36 = this.tailLen;
                        this.tailLen = i36 + 1;
                        z2 = true;
                        bArr6[i36] = bArr[i3 + 1];
                        this.op = i4;
                        this.count = i5;
                        return z2;
                    }
                    z2 = true;
                    this.op = i4;
                    this.count = i5;
                    return z2;
                }
            }
        }
    }

    private Base64() {
    }

    public static byte[] decode(String str, int i) {
        return decode(str.getBytes(), i);
    }

    public static byte[] decode(byte[] bArr, int i) {
        return decode(bArr, 0, bArr.length, i);
    }

    public static byte[] decode(byte[] bArr, int i, int i2, int i3) {
        Decoder decoder = new Decoder(i3, new byte[((i2 * 3) / 4)]);
        if (!decoder.process(bArr, i, i2, true)) {
            throw new IllegalArgumentException("bad base-64");
        } else if (decoder.op == decoder.output.length) {
            return decoder.output;
        } else {
            byte[] bArr2 = new byte[decoder.op];
            System.arraycopy(decoder.output, 0, bArr2, 0, decoder.op);
            return bArr2;
        }
    }

    public static byte[] encode(byte[] bArr, int i) {
        return encode(bArr, 0, bArr.length, i);
    }

    public static byte[] encode(byte[] bArr, int i, int i2, int i3) {
        Encoder encoder = new Encoder(i3, null);
        int i4 = (i2 / 3) * 4;
        if (!encoder.do_padding) {
            switch (i2 % 3) {
                case 1:
                    i4 += 2;
                    break;
                case 2:
                    i4 += 3;
                    break;
            }
        } else if (i2 % 3 > 0) {
            i4 += 4;
        }
        if (encoder.do_newline && i2 > 0) {
            i4 += (((i2 - 1) / 57) + 1) * (encoder.do_cr ? 2 : 1);
        }
        encoder.output = new byte[i4];
        encoder.process(bArr, i, i2, true);
        return encoder.output;
    }

    public static String encodeToString(byte[] bArr, int i) {
        try {
            return new String(encode(bArr, i), "US-ASCII");
        } catch (UnsupportedEncodingException e) {
            throw new AssertionError(e);
        }
    }
}
