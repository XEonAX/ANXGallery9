package com.adobe.xmp.impl;

public class Base64 {
    private static byte[] ascii = new byte[255];
    private static byte[] base64 = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};

    static {
        for (int i = 0; i < 255; i++) {
            ascii[i] = -1;
        }
        for (int i2 = 0; i2 < base64.length; i2++) {
            ascii[base64[i2]] = (byte) i2;
        }
        ascii[9] = -2;
        ascii[10] = -2;
        ascii[13] = -2;
        ascii[32] = -2;
        ascii[61] = -3;
    }

    public static final byte[] decode(byte[] bArr) throws IllegalArgumentException {
        int i = 0;
        int i2 = 0;
        for (byte b : bArr) {
            byte b2 = ascii[b];
            if (b2 >= 0) {
                int i3 = i2 + 1;
                bArr[i2] = b2;
                i2 = i3;
            } else if (b2 == -1) {
                throw new IllegalArgumentException("Invalid base 64 string");
            }
        }
        while (i2 > 0 && bArr[i2 - 1] == -3) {
            i2--;
        }
        byte[] bArr2 = new byte[((i2 * 3) / 4)];
        int i4 = 0;
        while (i < bArr2.length - 2) {
            int i5 = i4 + 1;
            bArr2[i] = (byte) (((bArr[i4] << 2) & 255) | ((bArr[i5] >>> 4) & 3));
            int i6 = i4 + 2;
            bArr2[i + 1] = (byte) (((bArr[i5] << 4) & 255) | ((bArr[i6] >>> 2) & 15));
            bArr2[i + 2] = (byte) (((bArr[i6] << 6) & 255) | (bArr[i4 + 3] & 63));
            i4 += 4;
            i += 3;
        }
        if (i < bArr2.length) {
            bArr2[i] = (byte) (((bArr[i4] << 2) & 255) | ((bArr[i4 + 1] >>> 4) & 3));
        }
        int i7 = i + 1;
        if (i7 < bArr2.length) {
            bArr2[i7] = (byte) (((bArr[i4 + 2] >>> 2) & 15) | ((bArr[i4 + 1] << 4) & 255));
        }
        return bArr2;
    }
}
