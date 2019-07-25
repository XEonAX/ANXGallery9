package com.nexstreaming.app.common.util;

/* compiled from: ColorUtil */
public class c {
    public static int a(String str) {
        String trim = str.trim();
        if (trim.startsWith("#")) {
            String trim2 = trim.substring(1).trim();
            if (trim2.length() == 3) {
                long parseLong = Long.parseLong(trim2, 16);
                return ((int) (((parseLong & 3840) << 12) | ((15 & parseLong) << 4) | ((240 & parseLong) << 8))) | -16777216;
            } else if (trim2.length() == 6) {
                return ((int) Long.parseLong(trim2, 16)) | -16777216;
            } else {
                if (trim2.length() < 8) {
                    return 0;
                }
                long parseLong2 = Long.parseLong(trim2, 16);
                return (int) (((parseLong2 & 255) << 24) | (parseLong2 >> 8));
            }
        } else {
            String[] split = trim.trim().split(" ");
            int i = 0;
            int i2 = 2;
            int i3 = 0;
            while (true) {
                if (i >= split.length) {
                    break;
                }
                String trim3 = split[i].trim();
                if (trim3.length() >= 1) {
                    int parseFloat = (int) (Float.parseFloat(trim3) * 255.0f);
                    if (parseFloat > 255) {
                        parseFloat = 255;
                    }
                    if (parseFloat < 0) {
                        parseFloat = 0;
                    }
                    if (i2 < 0) {
                        i3 |= parseFloat << 24;
                        break;
                    }
                    i3 |= parseFloat << (i2 * 8);
                    i2--;
                }
                i++;
            }
            return i3;
        }
    }

    public static String a(int i) {
        return String.format("#%08X", new Object[]{Integer.valueOf((i << 8) | (i >>> 24))});
    }
}
