package cn.kuaipan.android.utils;

public final class StringPool {
    private final String[] pool = new String[512];

    private static boolean contentEquals(String str, char[] cArr, int i, int i2) {
        if (str.length() != i2) {
            return false;
        }
        for (int i3 = 0; i3 < i2; i3++) {
            if (cArr[i + i3] != str.charAt(i3)) {
                return false;
            }
        }
        return true;
    }

    public String get(char[] cArr, int i, int i2) {
        int i3 = 0;
        for (int i4 = i; i4 < i + i2; i4++) {
            i3 = (i3 * 31) + cArr[i4];
        }
        int i5 = ((i3 >>> 20) ^ (i3 >>> 12)) ^ i3;
        int length = (i5 ^ ((i5 >>> 7) ^ (i5 >>> 4))) & (this.pool.length - 1);
        String str = this.pool[length];
        if (str != null && contentEquals(str, cArr, i, i2)) {
            return str;
        }
        String str2 = new String(cArr, i, i2);
        this.pool[length] = str2;
        return str2;
    }
}
