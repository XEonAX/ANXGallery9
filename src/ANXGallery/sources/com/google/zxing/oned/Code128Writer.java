package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.nexstreaming.nexeditorsdk.nexClip;
import java.util.ArrayList;
import java.util.Map;

public final class Code128Writer extends OneDimensionalCodeWriter {
    private static boolean isDigits(CharSequence charSequence, int i, int i2) {
        int i3 = i2 + i;
        int length = charSequence.length();
        while (i < i3 && i < length) {
            char charAt = charSequence.charAt(i);
            if (charAt < '0' || charAt > '9') {
                if (charAt != 241) {
                    return false;
                }
                i3++;
            }
            i++;
        }
        return i3 <= length;
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        if (barcodeFormat == BarcodeFormat.CODE_128) {
            return super.encode(str, barcodeFormat, i, i2, map);
        }
        StringBuilder sb = new StringBuilder("Can only encode CODE_128, but got ");
        sb.append(barcodeFormat);
        throw new IllegalArgumentException(sb.toString());
    }

    public boolean[] encode(String str) {
        int i;
        int length = str.length();
        if (length < 1 || length > 80) {
            StringBuilder sb = new StringBuilder("Contents length should be between 1 and 80 characters, but got ");
            sb.append(length);
            throw new IllegalArgumentException(sb.toString());
        }
        int i2 = 0;
        for (int i3 = 0; i3 < length; i3++) {
            char charAt = str.charAt(i3);
            if (charAt < ' ' || charAt > '~') {
                switch (charAt) {
                    case 241:
                    case 242:
                    case 243:
                    case nexClip.AVC_Profile_High444 /*244*/:
                        break;
                    default:
                        StringBuilder sb2 = new StringBuilder("Bad character in input: ");
                        sb2.append(charAt);
                        throw new IllegalArgumentException(sb2.toString());
                }
            }
        }
        ArrayList<int[]> arrayList = new ArrayList<>();
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        int i7 = 1;
        while (i4 < length) {
            int i8 = 99;
            int i9 = 100;
            if (!isDigits(str, i4, i6 == 99 ? 2 : 4)) {
                i8 = 100;
            }
            if (i8 == i6) {
                switch (str.charAt(i4)) {
                    case 241:
                        i9 = BaiduSceneResult.TAEKWONDO;
                        break;
                    case 242:
                        i9 = 97;
                        break;
                    case 243:
                        i9 = 96;
                        break;
                    case nexClip.AVC_Profile_High444 /*244*/:
                        break;
                    default:
                        if (i6 != 100) {
                            i9 = Integer.parseInt(str.substring(i4, i4 + 2));
                            i4++;
                            break;
                        } else {
                            i9 = str.charAt(i4) - ' ';
                            break;
                        }
                }
                i4++;
            } else {
                i = i6 == 0 ? i8 == 100 ? BaiduSceneResult.SPORTS_OTHER : BaiduSceneResult.TEMPLE : i8;
                i6 = i8;
            }
            arrayList.add(Code128Reader.CODE_PATTERNS[i]);
            i5 += i * i7;
            if (i4 != 0) {
                i7++;
            }
        }
        arrayList.add(Code128Reader.CODE_PATTERNS[i5 % BaiduSceneResult.MOUNTAINEERING]);
        arrayList.add(Code128Reader.CODE_PATTERNS[106]);
        int i10 = 0;
        for (int[] iArr : arrayList) {
            int i11 = i10;
            for (int i12 : (int[]) r9.next()) {
                i11 += i12;
            }
            i10 = i11;
        }
        boolean[] zArr = new boolean[i10];
        for (int[] appendPattern : arrayList) {
            i2 += appendPattern(zArr, i2, appendPattern, true);
        }
        return zArr;
    }
}
