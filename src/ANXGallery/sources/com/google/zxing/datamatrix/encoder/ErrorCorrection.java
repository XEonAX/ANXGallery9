package com.google.zxing.datamatrix.encoder;

import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.nexstreaming.nexeditorsdk.nexClip;

public final class ErrorCorrection {
    private static final int[] ALOG = new int[255];
    private static final int[][] FACTORS = {new int[]{228, 48, 15, BaiduSceneResult.WESTERN_ARCHITECTURE, 62}, new int[]{23, 68, BaiduSceneResult.TAG_COUNT, BaiduSceneResult.SCREEN_TEXT, 240, 92, 254}, new int[]{28, 24, 185, 166, 223, 248, BaiduSceneResult.CAR, 255, BaiduSceneResult.CASTLE, 61}, new int[]{175, BaiduSceneResult.COSMETICS, 205, 12, 194, 168, 39, 245, 60, 97, BaiduSceneResult.MOTORCYCLE}, new int[]{41, 153, 158, 91, 61, 42, BaiduSceneResult.DIGITAL_PRODUCT, 213, 97, 178, 100, 242}, new int[]{156, 97, 192, 252, 95, 9, 157, BaiduSceneResult.BICYCLE, BaiduSceneResult.COSMETICS, 45, 18, 186, 83, 185}, new int[]{83, 195, 100, 39, 188, 75, 66, 61, 241, 213, BaiduSceneResult.CHURCH, BaiduSceneResult.ACCOUNT_BOOK, 94, 254, 225, 48, 90, 188}, new int[]{15, 195, nexClip.AVC_Profile_High444, 9, 233, 71, 168, 2, 188, 160, 153, 145, 253, 79, BaiduSceneResult.ANCIENT_CHINESE_ARCHITECTURE, 82, 27, 174, 186, 172}, new int[]{52, 190, 88, 205, BaiduSceneResult.CHURCH, 39, 176, 21, 155, 197, 251, 223, 155, 21, 5, 172, 254, BaiduSceneResult.PIER, 12, 181, 184, 96, 50, 193}, new int[]{211, 231, 43, 97, 71, 96, BaiduSceneResult.MOUNTAINEERING, 174, 37, 151, 170, 53, 75, 34, 249, BaiduSceneResult.STATION, 17, BaiduSceneResult.COSMETICS, BaiduSceneResult.CASTLE, 213, BaiduSceneResult.GAME, BaiduSceneResult.APPAREL, BaiduSceneResult.MOTORCYCLE, 151, 233, 168, 93, 255}, new int[]{245, BaiduSceneResult.BANK_CARD, 242, 218, BaiduSceneResult.VISA, 250, 162, 181, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.MOTORCYCLE, 84, 179, 220, 251, 80, 182, 229, 18, 2, 4, 68, 33, BaiduSceneResult.SHOOTING, BaiduSceneResult.JEWELRY, 95, BaiduSceneResult.BICYCLE, BaiduSceneResult.BUILDING_OTHER, 44, 175, 184, 59, 25, 225, 98, 81, BaiduSceneResult.STREET_VIEW}, new int[]{77, 193, BaiduSceneResult.JEWELRY, 31, 19, 38, 22, 153, 247, BaiduSceneResult.TEMPLE, 122, 2, 245, BaiduSceneResult.EXPRESS_ORDER, 242, 8, 175, 95, 100, 9, 167, BaiduSceneResult.TEMPLE, 214, BaiduSceneResult.WESTERN_ARCHITECTURE, 57, BaiduSceneResult.STATION, 21, 1, 253, 57, 54, BaiduSceneResult.SHOOTING, 248, 202, 69, 50, 150, 177, 226, 5, 9, 5}, new int[]{245, BaiduSceneResult.VARIOUS_TICKETS, 172, 223, 96, 32, BaiduSceneResult.FERRY, 22, 238, BaiduSceneResult.EXPRESS_ORDER, 238, 231, 205, 188, 237, 87, 191, BaiduSceneResult.PALACE, 16, 147, BaiduSceneResult.SUBWAY, 23, 37, 90, 170, 205, BaiduSceneResult.INVOICE, 88, BaiduSceneResult.MOTORCYCLE, 100, 66, BaiduSceneResult.COSMETICS, 186, 240, 82, 44, 176, 87, 187, 147, 160, 175, 69, 213, 92, 253, 225, 19}, new int[]{175, 9, 223, 238, 12, 17, 220, 208, 100, 29, 175, 170, 230, 192, 215, 235, 150, 159, 36, 223, 38, 200, BaiduSceneResult.VARIOUS_TICKETS, 54, 228, 146, 218, 234, BaiduSceneResult.FERRY, 203, 29, 232, BaiduSceneResult.TAG_COUNT, 238, 22, 150, 201, BaiduSceneResult.FERRY, 62, 207, 164, 13, BaiduSceneResult.JEWELRY, 245, BaiduSceneResult.BANK_CARD, 67, 247, 28, 155, 43, 203, BaiduSceneResult.GARDEN, 233, 53, BaiduSceneResult.BLACK_WHITE, 46}, new int[]{242, 93, 169, 50, BaiduSceneResult.TAG_COUNT, 210, 39, BaiduSceneResult.SUBWAY, 202, 188, 201, 189, BaiduSceneResult.BLACK_WHITE, BaiduSceneResult.ANCIENT_CHINESE_ARCHITECTURE, 196, 37, 185, BaiduSceneResult.STREET_VIEW, BaiduSceneResult.SCREEN_TEXT, 230, 245, 63, 197, 190, 250, BaiduSceneResult.PALACE, 185, 221, 175, 64, BaiduSceneResult.BRIDGE, 71, 161, 44, 147, 6, 27, 218, 51, 63, 87, 10, 40, BaiduSceneResult.VISA, 188, 17, 163, 31, 176, 170, 4, BaiduSceneResult.GARDEN, 232, 7, 94, 166, 224, BaiduSceneResult.PIER, 86, 47, 11, 204}, new int[]{220, 228, 173, 89, 251, 149, 159, 56, 89, 33, 147, nexClip.AVC_Profile_High444, 154, 36, 73, BaiduSceneResult.BANK_CARD, 213, BaiduSceneResult.APPAREL, 248, nexClip.kClip_Rotate_180, 234, 197, 158, 177, 68, 122, 93, 213, 15, 160, 227, 236, 66, BaiduSceneResult.FASHION_OTHER, 153, 185, 202, 167, 179, 25, 220, 232, 96, 210, 231, BaiduSceneResult.APPAREL, 223, 239, 181, 241, 59, 52, 172, 25, 49, 232, 211, 189, 64, 54, BaiduSceneResult.ANCIENT_CHINESE_ARCHITECTURE, 153, BaiduSceneResult.VARIOUS_TICKETS, 63, 96, BaiduSceneResult.MOUNTAINEERING, 82, 186}};
    private static final int[] FACTOR_SETS = {5, 7, 10, 11, 12, 14, 18, 20, 24, 28, 36, 42, 48, 56, 62, 68};
    private static final int[] LOG = new int[256];

    static {
        int i = 1;
        for (int i2 = 0; i2 < 255; i2++) {
            ALOG[i2] = i;
            LOG[i] = i2;
            i *= 2;
            if (i >= 256) {
                i ^= 301;
            }
        }
    }

    private static String createECCBlock(CharSequence charSequence, int i) {
        return createECCBlock(charSequence, 0, charSequence.length(), i);
    }

    private static String createECCBlock(CharSequence charSequence, int i, int i2, int i3) {
        int i4 = 0;
        while (true) {
            if (i4 >= FACTOR_SETS.length) {
                i4 = -1;
                break;
            } else if (FACTOR_SETS[i4] == i3) {
                break;
            } else {
                i4++;
            }
        }
        if (i4 >= 0) {
            int[] iArr = FACTORS[i4];
            char[] cArr = new char[i3];
            for (int i5 = 0; i5 < i3; i5++) {
                cArr[i5] = 0;
            }
            for (int i6 = i; i6 < i + i2; i6++) {
                int i7 = i3 - 1;
                char charAt = cArr[i7] ^ charSequence.charAt(i6);
                while (i7 > 0) {
                    if (charAt == 0 || iArr[i7] == 0) {
                        cArr[i7] = cArr[i7 - 1];
                    } else {
                        cArr[i7] = (char) (cArr[i7 - 1] ^ ALOG[(LOG[charAt] + LOG[iArr[i7]]) % 255]);
                    }
                    i7--;
                }
                if (charAt == 0 || iArr[0] == 0) {
                    cArr[0] = 0;
                } else {
                    cArr[0] = (char) ALOG[(LOG[charAt] + LOG[iArr[0]]) % 255];
                }
            }
            char[] cArr2 = new char[i3];
            for (int i8 = 0; i8 < i3; i8++) {
                cArr2[i8] = cArr[(i3 - i8) - 1];
            }
            return String.valueOf(cArr2);
        }
        StringBuilder sb = new StringBuilder("Illegal number of error correction codewords specified: ");
        sb.append(i3);
        throw new IllegalArgumentException(sb.toString());
    }

    public static String encodeECC200(String str, SymbolInfo symbolInfo) {
        if (str.length() == symbolInfo.getDataCapacity()) {
            StringBuilder sb = new StringBuilder(symbolInfo.getDataCapacity() + symbolInfo.getErrorCodewords());
            sb.append(str);
            int interleavedBlockCount = symbolInfo.getInterleavedBlockCount();
            if (interleavedBlockCount == 1) {
                sb.append(createECCBlock(str, symbolInfo.getErrorCodewords()));
            } else {
                sb.setLength(sb.capacity());
                int[] iArr = new int[interleavedBlockCount];
                int[] iArr2 = new int[interleavedBlockCount];
                int[] iArr3 = new int[interleavedBlockCount];
                int i = 0;
                while (i < interleavedBlockCount) {
                    int i2 = i + 1;
                    iArr[i] = symbolInfo.getDataLengthForInterleavedBlock(i2);
                    iArr2[i] = symbolInfo.getErrorLengthForInterleavedBlock(i2);
                    iArr3[i] = 0;
                    if (i > 0) {
                        iArr3[i] = iArr3[i - 1] + iArr[i];
                    }
                    i = i2;
                }
                for (int i3 = 0; i3 < interleavedBlockCount; i3++) {
                    StringBuilder sb2 = new StringBuilder(iArr[i3]);
                    for (int i4 = i3; i4 < symbolInfo.getDataCapacity(); i4 += interleavedBlockCount) {
                        sb2.append(str.charAt(i4));
                    }
                    String createECCBlock = createECCBlock(sb2.toString(), iArr2[i3]);
                    int i5 = i3;
                    int i6 = 0;
                    while (i5 < iArr2[i3] * interleavedBlockCount) {
                        int i7 = i6 + 1;
                        sb.setCharAt(symbolInfo.getDataCapacity() + i5, createECCBlock.charAt(i6));
                        i5 += interleavedBlockCount;
                        i6 = i7;
                    }
                }
            }
            return sb.toString();
        }
        throw new IllegalArgumentException("The number of codewords does not match the selected symbol");
    }
}
