package com.google.zxing.oned;

import java.util.Arrays;

public final class CodaBarWriter extends OneDimensionalCodeWriter {
    private static final char[] ALT_START_END_CHARS = {'T', 'N', '*', 'E'};
    private static final char[] CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED = {'/', ':', '+', '.'};
    private static final char[] START_END_CHARS = {'A', 'B', 'C', 'D'};

    /* JADX WARNING: Removed duplicated region for block: B:46:0x00cc  */
    /* JADX WARNING: Removed duplicated region for block: B:55:0x00e4  */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x00eb  */
    /* JADX WARNING: Removed duplicated region for block: B:84:0x00e8 A[SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:86:0x00ca A[SYNTHETIC] */
    public boolean[] encode(String str) {
        char c;
        int i;
        int i2;
        int i3;
        boolean z;
        if (str.length() >= 2) {
            char upperCase = Character.toUpperCase(str.charAt(0));
            char upperCase2 = Character.toUpperCase(str.charAt(str.length() - 1));
            boolean z2 = CodaBarReader.arrayContains(START_END_CHARS, upperCase) && CodaBarReader.arrayContains(START_END_CHARS, upperCase2);
            boolean z3 = CodaBarReader.arrayContains(ALT_START_END_CHARS, upperCase) && CodaBarReader.arrayContains(ALT_START_END_CHARS, upperCase2);
            if (z2 || z3) {
                int i4 = 20;
                for (int i5 = 1; i5 < str.length() - 1; i5++) {
                    if (Character.isDigit(str.charAt(i5)) || str.charAt(i5) == '-' || str.charAt(i5) == '$') {
                        i4 += 9;
                    } else if (CodaBarReader.arrayContains(CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED, str.charAt(i5))) {
                        i4 += 10;
                    } else {
                        StringBuilder sb = new StringBuilder("Cannot encode : '");
                        sb.append(str.charAt(i5));
                        sb.append('\'');
                        throw new IllegalArgumentException(sb.toString());
                    }
                }
                boolean[] zArr = new boolean[(i4 + (str.length() - 1))];
                int i6 = 0;
                for (int i7 = 0; i7 < str.length(); i7++) {
                    char upperCase3 = Character.toUpperCase(str.charAt(i7));
                    if (i7 == 0 || i7 == str.length() - 1) {
                        if (upperCase3 == '*') {
                            c = 'C';
                        } else if (upperCase3 == 'E') {
                            c = 'D';
                        } else if (upperCase3 == 'N') {
                            c = 'B';
                        } else if (upperCase3 == 'T') {
                            c = 'A';
                        }
                        i = 0;
                        while (true) {
                            if (i < CodaBarReader.ALPHABET.length) {
                                i2 = 0;
                                break;
                            } else if (c == CodaBarReader.ALPHABET[i]) {
                                i2 = CodaBarReader.CHARACTER_ENCODINGS[i];
                                break;
                            } else {
                                i++;
                            }
                        }
                        i3 = 0;
                        z = true;
                        while (true) {
                            int i8 = 0;
                            while (i3 < 7) {
                                zArr[i6] = z;
                                i6++;
                                if (((i2 >> (6 - i3)) & 1) == 0 || i8 == 1) {
                                    z = !z;
                                    i3++;
                                } else {
                                    i8++;
                                }
                            }
                            break;
                        }
                        if (i7 >= str.length() - 1) {
                            zArr[i6] = false;
                            i6++;
                        }
                    }
                    c = upperCase3;
                    i = 0;
                    while (true) {
                        if (i < CodaBarReader.ALPHABET.length) {
                        }
                        i++;
                    }
                    i3 = 0;
                    z = true;
                    while (true) {
                        int i82 = 0;
                        while (i3 < 7) {
                        }
                        break;
                        z = !z;
                        i3++;
                    }
                    if (i7 >= str.length() - 1) {
                    }
                }
                return zArr;
            }
            StringBuilder sb2 = new StringBuilder("Codabar should start/end with ");
            sb2.append(Arrays.toString(START_END_CHARS));
            sb2.append(", or start/end with ");
            sb2.append(Arrays.toString(ALT_START_END_CHARS));
            throw new IllegalArgumentException(sb2.toString());
        }
        throw new IllegalArgumentException("Codabar should start/end with start/stop symbols");
    }
}
