package com.miui.gallery.util;

import android.database.Cursor;
import java.util.List;

public class Numbers {
    public static <T extends Number & Comparable<T>> int compare(T t, T t2) {
        if (t != null && t2 != null) {
            return ((Comparable) t).compareTo(t2);
        }
        if (t != null) {
            return 1;
        }
        return t2 != null ? -1 : 0;
    }

    public static void ensurePositive(long... jArr) {
        if (jArr == null) {
            throw new NullPointerException("nums can not be null");
        } else if (jArr.length != 0) {
            int length = jArr.length;
            int i = 0;
            while (i < length) {
                if (Long.valueOf(jArr[i]).longValue() > 0) {
                    i++;
                } else {
                    throw new IllegalArgumentException("negative or zero received");
                }
            }
        } else {
            throw new IllegalArgumentException("nums can not be empty");
        }
    }

    public static <T extends Number & Comparable<T>> boolean equals(T t, int i) {
        boolean z = false;
        if (t == null) {
            return false;
        }
        if (t.intValue() == i) {
            z = true;
        }
        return z;
    }

    public static <T extends Number & Comparable<T>> boolean equals(T t, long j) {
        boolean z = false;
        if (t == null) {
            return false;
        }
        if (t.longValue() == j) {
            z = true;
        }
        return z;
    }

    public static <T extends Number & Comparable<T>> boolean equals(T t, T t2) {
        if (t != null && t2 != null) {
            return t.equals(t2);
        }
        return t == null && t2 == null;
    }

    public static Long getLong(Cursor cursor, int i) {
        if (cursor.isNull(i)) {
            return null;
        }
        return Long.valueOf(cursor.getLong(i));
    }

    public static Long parse(String str, Long l) {
        try {
            return Long.valueOf(Long.parseLong(str));
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return l;
        }
    }

    public static long[] toArray(List<Long> list) {
        if (list == null || list.size() <= 0) {
            return null;
        }
        long[] jArr = new long[list.size()];
        for (int i = 0; i < list.size(); i++) {
            jArr[i] = ((Long) list.get(i)).longValue();
        }
        return jArr;
    }

    public static int unbox(Integer num, int i) {
        return num == null ? i : num.intValue();
    }

    public static long unbox(Long l, long j) {
        return l == null ? j : l.longValue();
    }
}
