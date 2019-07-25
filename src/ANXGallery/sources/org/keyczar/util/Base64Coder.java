package org.keyczar.util;

import org.keyczar.exceptions.Base64DecodingException;
import org.keyczar.i18n.Messages;

public class Base64Coder {
    private static final char[] ALPHABET = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-', '_'};
    private static final byte[] DECODE = new byte[128];
    private static final char[] WHITESPACE = {9, 10, 13, ' ', 12};

    static {
        for (int i = 0; i < DECODE.length; i++) {
            DECODE[i] = -1;
        }
        for (char c : WHITESPACE) {
            DECODE[c] = -2;
        }
        for (int i2 = 0; i2 < ALPHABET.length; i2++) {
            DECODE[ALPHABET[i2]] = (byte) i2;
        }
    }

    private Base64Coder() {
    }

    @Deprecated
    public static byte[] decode(String str) throws Base64DecodingException {
        return decodeWebSafe(str);
    }

    public static byte[] decodeMime(String str) throws Base64DecodingException {
        return decodeWebSafe(str.replace('+', '-').replace('/', '_'));
    }

    public static byte[] decodeWebSafe(String str) throws Base64DecodingException {
        char[] charArray = str.toCharArray();
        int length = charArray.length;
        if (charArray[length - 1] == '=') {
            length--;
        }
        if (charArray[length - 1] == '=') {
            length--;
        }
        int i = 0;
        for (char isWhiteSpace : charArray) {
            if (isWhiteSpace(isWhiteSpace)) {
                i++;
            }
        }
        int i2 = length - i;
        int i3 = (i2 / 4) * 3;
        switch (i2 % 4) {
            case 1:
                throw new Base64DecodingException(Messages.getString("Base64Coder.IllegalLength", Integer.valueOf(i2)));
            case 2:
                i3++;
                break;
            case 3:
                i3 += 2;
                break;
        }
        byte[] bArr = new byte[i3];
        int i4 = 0;
        byte b = 0;
        int i5 = 0;
        for (int i6 = 0; i6 < i2 + i; i6++) {
            if (!isWhiteSpace(charArray[i6])) {
                b = (b << 6) | getByte(charArray[i6]);
                i4++;
            }
            if (i4 == 4) {
                int i7 = i5 + 1;
                bArr[i5] = (byte) (b >> 16);
                int i8 = i7 + 1;
                bArr[i7] = (byte) (b >> 8);
                int i9 = i8 + 1;
                bArr[i8] = (byte) b;
                i5 = i9;
                i4 = 0;
                b = 0;
            }
        }
        switch (i4) {
            case 2:
                bArr[i5] = (byte) (b >> 4);
                break;
            case 3:
                int i10 = i5 + 1;
                bArr[i5] = (byte) (b >> 10);
                bArr[i10] = (byte) (b >> 2);
                break;
        }
        return bArr;
    }

    @Deprecated
    public static String encode(byte[] bArr) {
        return encodeWebSafe(bArr);
    }

    public static String encodeMime(byte[] bArr, boolean z) {
        String replace = encodeWebSafe(bArr).replace('-', '+').replace('_', '/');
        int length = replace.length() % 4;
        if (length == 0) {
            return replace;
        }
        switch (length) {
            case 2:
                StringBuilder sb = new StringBuilder();
                sb.append(replace);
                sb.append("==");
                return sb.toString();
            case 3:
                StringBuilder sb2 = new StringBuilder();
                sb2.append(replace);
                sb2.append("=");
                return sb2.toString();
            default:
                throw new RuntimeException("Bug in Base64 encoder");
        }
    }

    public static String encodeWebSafe(byte[] bArr) {
        int length = bArr.length / 3;
        int length2 = bArr.length % 3;
        int i = length * 4;
        switch (length2) {
            case 1:
                i += 2;
                break;
            case 2:
                i += 3;
                break;
        }
        char[] cArr = new char[i];
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        while (i2 < length) {
            int i5 = i3 + 1;
            int i6 = i5 + 1;
            byte b = ((bArr[i3] & 255) << 16) | ((bArr[i5] & 255) << 8);
            int i7 = i6 + 1;
            byte b2 = b | (bArr[i6] & 255);
            int i8 = i4 + 1;
            cArr[i4] = ALPHABET[(b2 >> 18) & 63];
            int i9 = i8 + 1;
            cArr[i8] = ALPHABET[(b2 >> 12) & 63];
            int i10 = i9 + 1;
            cArr[i9] = ALPHABET[(b2 >> 6) & 63];
            i4 = i10 + 1;
            cArr[i10] = ALPHABET[b2 & 63];
            i2++;
            i3 = i7;
        }
        if (length2 > 0) {
            int i11 = i3 + 1;
            int i12 = (bArr[i3] & 255) << 16;
            if (length2 == 2) {
                i12 |= (bArr[i11] & 255) << 8;
            }
            int i13 = i4 + 1;
            cArr[i4] = ALPHABET[(i12 >> 18) & 63];
            int i14 = i13 + 1;
            cArr[i13] = ALPHABET[(i12 >> 12) & 63];
            if (length2 == 2) {
                cArr[i14] = ALPHABET[(i12 >> 6) & 63];
            }
        }
        return new String(cArr);
    }

    private static byte getByte(int i) throws Base64DecodingException {
        if (i >= 0 && i <= 127 && DECODE[i] != -1) {
            return DECODE[i];
        }
        throw new Base64DecodingException(Messages.getString("Base64Coder.IllegalCharacter", Integer.valueOf(i)));
    }

    private static boolean isWhiteSpace(int i) {
        return DECODE[i] == -2;
    }
}
