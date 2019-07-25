package com.google.zxing.pdf417.encoder;

import com.google.zxing.WriterException;
import com.google.zxing.common.CharacterSetECI;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.util.Arrays;

final class PDF417HighLevelEncoder {
    private static final Charset DEFAULT_ENCODING = Charset.forName("ISO-8859-1");
    private static final byte[] MIXED = new byte[128];
    private static final byte[] PUNCTUATION = new byte[128];
    private static final byte[] TEXT_MIXED_RAW;
    private static final byte[] TEXT_PUNCTUATION_RAW;

    static {
        byte[] bArr = new byte[30];
        bArr[0] = 48;
        bArr[1] = 49;
        bArr[2] = 50;
        bArr[3] = 51;
        bArr[4] = 52;
        bArr[5] = 53;
        bArr[6] = 54;
        bArr[7] = 55;
        bArr[8] = 56;
        bArr[9] = 57;
        bArr[10] = 38;
        bArr[11] = 13;
        bArr[12] = 9;
        bArr[13] = 44;
        bArr[14] = 58;
        bArr[15] = 35;
        bArr[16] = 45;
        bArr[17] = 46;
        bArr[18] = 36;
        bArr[19] = 47;
        bArr[20] = 43;
        bArr[21] = 37;
        bArr[22] = 42;
        bArr[23] = 61;
        bArr[24] = 94;
        bArr[26] = 32;
        TEXT_MIXED_RAW = bArr;
        byte[] bArr2 = new byte[30];
        bArr2[0] = 59;
        bArr2[1] = 60;
        bArr2[2] = 62;
        bArr2[3] = 64;
        bArr2[4] = 91;
        bArr2[5] = 92;
        bArr2[6] = 93;
        bArr2[7] = 95;
        bArr2[8] = 96;
        bArr2[9] = 126;
        bArr2[10] = 33;
        bArr2[11] = 13;
        bArr2[12] = 9;
        bArr2[13] = 44;
        bArr2[14] = 58;
        bArr2[15] = 10;
        bArr2[16] = 45;
        bArr2[17] = 46;
        bArr2[18] = 36;
        bArr2[19] = 47;
        bArr2[20] = 34;
        bArr2[21] = 124;
        bArr2[22] = 42;
        bArr2[23] = 40;
        bArr2[24] = 41;
        bArr2[25] = 63;
        bArr2[26] = 123;
        bArr2[27] = 125;
        bArr2[28] = 39;
        TEXT_PUNCTUATION_RAW = bArr2;
        Arrays.fill(MIXED, -1);
        for (byte b = 0; b < TEXT_MIXED_RAW.length; b = (byte) (b + 1)) {
            byte b2 = TEXT_MIXED_RAW[b];
            if (b2 > 0) {
                MIXED[b2] = b;
            }
        }
        Arrays.fill(PUNCTUATION, -1);
        for (byte b3 = 0; b3 < TEXT_PUNCTUATION_RAW.length; b3 = (byte) (b3 + 1)) {
            byte b4 = TEXT_PUNCTUATION_RAW[b3];
            if (b4 > 0) {
                PUNCTUATION[b4] = b3;
            }
        }
    }

    private static int determineConsecutiveBinaryCount(CharSequence charSequence, byte[] bArr, int i) throws WriterException {
        int length = charSequence.length();
        int i2 = i;
        while (i2 < length) {
            char charAt = charSequence.charAt(i2);
            int i3 = 0;
            while (i3 < 13 && isDigit(charAt)) {
                i3++;
                int i4 = i2 + i3;
                if (i4 >= length) {
                    break;
                }
                charAt = charSequence.charAt(i4);
            }
            if (i3 >= 13) {
                return i2 - i;
            }
            char charAt2 = charSequence.charAt(i2);
            if (bArr[i2] != 63 || charAt2 == '?') {
                i2++;
            } else {
                StringBuilder sb = new StringBuilder("Non-encodable character detected: ");
                sb.append(charAt2);
                sb.append(" (Unicode: ");
                sb.append(charAt2);
                sb.append(')');
                throw new WriterException(sb.toString());
            }
        }
        return i2 - i;
    }

    private static int determineConsecutiveDigitCount(CharSequence charSequence, int i) {
        int length = charSequence.length();
        int i2 = 0;
        if (i < length) {
            char charAt = charSequence.charAt(i);
            while (isDigit(charAt) && i < length) {
                i2++;
                i++;
                if (i < length) {
                    charAt = charSequence.charAt(i);
                }
            }
        }
        return i2;
    }

    private static int determineConsecutiveTextCount(CharSequence charSequence, int i) {
        int length = charSequence.length();
        int i2 = i;
        while (i2 < length) {
            char charAt = charSequence.charAt(i2);
            int i3 = 0;
            while (i3 < 13 && isDigit(charAt) && i2 < length) {
                i3++;
                i2++;
                if (i2 < length) {
                    charAt = charSequence.charAt(i2);
                }
            }
            if (i3 >= 13) {
                return (i2 - i) - i3;
            }
            if (i3 <= 0) {
                if (!isText(charSequence.charAt(i2))) {
                    break;
                }
                i2++;
            }
        }
        return i2 - i;
    }

    private static void encodeBinary(byte[] bArr, int i, int i2, int i3, StringBuilder sb) {
        int i4;
        int i5 = i2;
        StringBuilder sb2 = sb;
        int i6 = 1;
        if (i5 == 1 && i3 == 0) {
            sb2.append(913);
        } else {
            if (i5 % 6 == 0) {
                sb2.append(924);
            } else {
                sb2.append(901);
            }
        }
        if (i5 >= 6) {
            char[] cArr = new char[5];
            i4 = i;
            while ((i + i5) - i4 >= 6) {
                long j = 0;
                int i7 = 0;
                while (i7 < 6) {
                    j = ((long) (bArr[i4 + i7] & 255)) + (j << 8);
                    i7++;
                    i6 = 1;
                }
                int i8 = 0;
                while (i8 < 5) {
                    cArr[i8] = (char) ((int) (j % 900));
                    j /= 900;
                    i8++;
                    i6 = 1;
                }
                for (int length = cArr.length - i6; length >= 0; length--) {
                    sb2.append(cArr[length]);
                }
                i4 += 6;
            }
        } else {
            i4 = i;
        }
        while (i4 < i + i5) {
            sb2.append((char) (bArr[i4] & 255));
            i4++;
        }
    }

    static String encodeHighLevel(String str, Compaction compaction, Charset charset) throws WriterException {
        int i;
        StringBuilder sb = new StringBuilder(str.length());
        if (charset == null) {
            charset = DEFAULT_ENCODING;
        } else if (!DEFAULT_ENCODING.equals(charset)) {
            CharacterSetECI characterSetECIByName = CharacterSetECI.getCharacterSetECIByName(charset.name());
            if (characterSetECIByName != null) {
                encodingECI(characterSetECIByName.getValue(), sb);
            }
        }
        int length = str.length();
        if (compaction != Compaction.TEXT) {
            if (compaction != Compaction.BYTE) {
                if (compaction != Compaction.NUMERIC) {
                    byte[] bArr = null;
                    int i2 = 0;
                    int i3 = 0;
                    loop0:
                    while (true) {
                        int i4 = 0;
                        while (i < length) {
                            int determineConsecutiveDigitCount = determineConsecutiveDigitCount(str, i);
                            if (determineConsecutiveDigitCount >= 13) {
                                sb.append(902);
                                i3 = 2;
                                encodeNumeric(str, i, determineConsecutiveDigitCount, sb);
                                i2 = i + determineConsecutiveDigitCount;
                            } else {
                                int determineConsecutiveTextCount = determineConsecutiveTextCount(str, i);
                                if (determineConsecutiveTextCount >= 5 || determineConsecutiveDigitCount == length) {
                                    if (i3 != 0) {
                                        sb.append(900);
                                        i3 = 0;
                                        i4 = 0;
                                    }
                                    i4 = encodeText(str, i, determineConsecutiveTextCount, sb, i4);
                                    i += determineConsecutiveTextCount;
                                } else {
                                    if (bArr == null) {
                                        bArr = str.getBytes(charset);
                                    }
                                    int determineConsecutiveBinaryCount = determineConsecutiveBinaryCount(str, bArr, i);
                                    if (determineConsecutiveBinaryCount == 0) {
                                        determineConsecutiveBinaryCount = 1;
                                    }
                                    if (determineConsecutiveBinaryCount == 1 && i3 == 0) {
                                        encodeBinary(bArr, i, 1, 0, sb);
                                    } else {
                                        encodeBinary(bArr, i, determineConsecutiveBinaryCount, i3, sb);
                                        i3 = 1;
                                        i4 = 0;
                                    }
                                    i += determineConsecutiveBinaryCount;
                                }
                            }
                        }
                        break loop0;
                    }
                } else {
                    sb.append(902);
                    encodeNumeric(str, 0, length, sb);
                }
            } else {
                byte[] bytes = str.getBytes(charset);
                encodeBinary(bytes, 0, bytes.length, 1, sb);
            }
        } else {
            encodeText(str, 0, length, sb, 0);
        }
        return sb.toString();
    }

    private static void encodeNumeric(String str, int i, int i2, StringBuilder sb) {
        StringBuilder sb2 = new StringBuilder((i2 / 3) + 1);
        BigInteger valueOf = BigInteger.valueOf(900);
        BigInteger valueOf2 = BigInteger.valueOf(0);
        int i3 = 0;
        while (i3 < i2 - 1) {
            sb2.setLength(0);
            int min = Math.min(44, i2 - i3);
            StringBuilder sb3 = new StringBuilder(String.valueOf('1'));
            int i4 = i + i3;
            sb3.append(str.substring(i4, i4 + min));
            BigInteger bigInteger = new BigInteger(sb3.toString());
            do {
                sb2.append((char) bigInteger.mod(valueOf).intValue());
                bigInteger = bigInteger.divide(valueOf);
            } while (!bigInteger.equals(valueOf2));
            for (int length = sb2.length() - 1; length >= 0; length--) {
                sb.append(sb2.charAt(length));
            }
            i3 += min;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:41:0x00d0, code lost:
        r9 = 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x00dc, code lost:
        r9 = 2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x00ea, code lost:
        r8 = r8 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x00ec, code lost:
        if (r8 < r1) goto L_0x0010;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:0x00ee, code lost:
        r10 = r3.length();
        r0 = 0;
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x00f4, code lost:
        if (r0 < r10) goto L_0x0101;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x00f7, code lost:
        if ((r10 % 2) == 0) goto L_0x0100;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00f9, code lost:
        r2.append((char) ((r1 * 30) + 29));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x0100, code lost:
        return r9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x0103, code lost:
        if ((r0 % 2) == 0) goto L_0x0107;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x0105, code lost:
        r7 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:58:0x0107, code lost:
        r7 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:0x0108, code lost:
        if (r7 == false) goto L_0x0116;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x010a, code lost:
        r1 = (char) ((r1 * 30) + r3.charAt(r0));
        r2.append(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x0116, code lost:
        r1 = r3.charAt(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:62:0x011a, code lost:
        r0 = r0 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x0120, code lost:
        r9 = 0;
     */
    private static int encodeText(CharSequence charSequence, int i, int i2, StringBuilder sb, int i3) {
        CharSequence charSequence2 = charSequence;
        int i4 = i2;
        StringBuilder sb2 = sb;
        StringBuilder sb3 = new StringBuilder(i4);
        int i5 = i3;
        int i6 = 0;
        while (true) {
            int i7 = i + i6;
            char charAt = charSequence2.charAt(i7);
            switch (i5) {
                case 0:
                    if (!isAlphaUpper(charAt)) {
                        if (!isAlphaLower(charAt)) {
                            if (!isMixed(charAt)) {
                                sb3.append(29);
                                sb3.append((char) PUNCTUATION[charAt]);
                                break;
                            } else {
                                sb3.append(28);
                                break;
                            }
                        } else {
                            sb3.append(27);
                            break;
                        }
                    } else if (charAt != ' ') {
                        sb3.append((char) (charAt - 'A'));
                        break;
                    } else {
                        sb3.append(26);
                        break;
                    }
                case 1:
                    if (!isAlphaLower(charAt)) {
                        if (!isAlphaUpper(charAt)) {
                            if (!isMixed(charAt)) {
                                sb3.append(29);
                                sb3.append((char) PUNCTUATION[charAt]);
                                break;
                            } else {
                                sb3.append(28);
                                break;
                            }
                        } else {
                            sb3.append(27);
                            sb3.append((char) (charAt - 'A'));
                            break;
                        }
                    } else if (charAt != ' ') {
                        sb3.append((char) (charAt - 'a'));
                        break;
                    } else {
                        sb3.append(26);
                        break;
                    }
                case 2:
                    if (!isMixed(charAt)) {
                        if (!isAlphaUpper(charAt)) {
                            if (!isAlphaLower(charAt)) {
                                int i8 = i7 + 1;
                                if (i8 < i4 && isPunctuation(charSequence2.charAt(i8))) {
                                    i5 = 3;
                                    sb3.append(25);
                                    break;
                                } else {
                                    sb3.append(29);
                                    sb3.append((char) PUNCTUATION[charAt]);
                                    break;
                                }
                            } else {
                                sb3.append(27);
                                break;
                            }
                        } else {
                            sb3.append(28);
                            break;
                        }
                    } else {
                        sb3.append((char) MIXED[charAt]);
                        break;
                    }
                default:
                    if (!isPunctuation(charAt)) {
                        sb3.append(29);
                        break;
                    } else {
                        sb3.append((char) PUNCTUATION[charAt]);
                        break;
                    }
            }
        }
    }

    private static void encodingECI(int i, StringBuilder sb) throws WriterException {
        if (i >= 0 && i < 900) {
            sb.append(927);
            sb.append((char) i);
        } else if (i < 810900) {
            sb.append(926);
            sb.append((char) ((i / 900) - 1));
            sb.append((char) (i % 900));
        } else if (i < 811800) {
            sb.append(925);
            sb.append((char) (810900 - i));
        } else {
            StringBuilder sb2 = new StringBuilder("ECI number not in valid range from 0..811799, but was ");
            sb2.append(i);
            throw new WriterException(sb2.toString());
        }
    }

    private static boolean isAlphaLower(char c) {
        return c == ' ' || (c >= 'a' && c <= 'z');
    }

    private static boolean isAlphaUpper(char c) {
        return c == ' ' || (c >= 'A' && c <= 'Z');
    }

    private static boolean isDigit(char c) {
        return c >= '0' && c <= '9';
    }

    private static boolean isMixed(char c) {
        return MIXED[c] != -1;
    }

    private static boolean isPunctuation(char c) {
        return PUNCTUATION[c] != -1;
    }

    private static boolean isText(char c) {
        return c == 9 || c == 10 || c == 13 || (c >= ' ' && c <= '~');
    }
}
