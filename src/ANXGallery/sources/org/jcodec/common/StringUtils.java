package org.jcodec.common;

import java.util.ArrayList;

public class StringUtils {
    public static String[] splitC(String str, char c) {
        return splitWorker(str, c, false);
    }

    private static String[] splitWorker(String str, char c, boolean z) {
        boolean z2;
        if (str == null) {
            return null;
        }
        int length = str.length();
        if (length == 0) {
            return new String[0];
        }
        ArrayList arrayList = new ArrayList();
        int i = 0;
        boolean z3 = false;
        int i2 = 0;
        loop0:
        while (true) {
            z2 = false;
            while (i < length) {
                if (str.charAt(i) == c) {
                    if (z3 || z) {
                        arrayList.add(str.substring(i2, i));
                        z3 = false;
                        z2 = true;
                    }
                    i2 = i + 1;
                    i = i2;
                } else {
                    i++;
                    z3 = true;
                }
            }
            break loop0;
        }
        if (z3 || (z && z2)) {
            arrayList.add(str.substring(i2, i));
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }
}
