package com.miui.gallery.util;

import android.database.Cursor;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import android.text.TextUtils;
import com.android.internal.FilesCompat;
import java.io.Closeable;
import java.util.regex.Pattern;

public class Utils {
    private static final boolean IS_DEBUG_BUILD = (Build.TYPE.equals("eng") || Build.TYPE.equals("userdebug"));
    private static final LazyValue<Void, Pattern> SHARE_ALBUM_ID_PATTERN = new LazyValue<Void, Pattern>() {
        /* access modifiers changed from: protected */
        public Pattern onInit(Void voidR) {
            return Pattern.compile("(\\d+)(-\\d+)");
        }
    };
    private static long[] sCrcTable = new long[256];

    static {
        for (int i = 0; i < 256; i++) {
            long j = (long) i;
            for (int i2 = 0; i2 < 8; i2++) {
                j = (j >> 1) ^ ((((int) j) & 1) != 0 ? -7661587058870466123L : 0);
            }
            sCrcTable[i] = j;
        }
    }

    public static void assertTrue(boolean z) {
        if (!z) {
            throw new AssertionError();
        }
    }

    public static void assertTrue(boolean z, String str, Object... objArr) {
        if (!z) {
            if (objArr.length != 0) {
                str = String.format(str, objArr);
            }
            throw new AssertionError(str);
        }
    }

    public static long clamp(long j, long j2, long j3) {
        return j > j3 ? j3 : j < j2 ? j2 : j;
    }

    public static void closeSilently(Cursor cursor) {
        if (cursor != null) {
            try {
                cursor.close();
            } catch (Exception e) {
                Log.w("Utils", "fail to close", e);
            }
        }
    }

    public static void closeSilently(ParcelFileDescriptor parcelFileDescriptor) {
        if (parcelFileDescriptor != null) {
            try {
                parcelFileDescriptor.close();
            } catch (Exception e) {
                Log.w("Utils", "fail to close", e);
            }
        }
    }

    public static void closeSilently(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Exception e) {
                Log.w("Utils", "close fail", e);
            }
        }
    }

    public static String desensitizeShareAlbumId(String str) {
        return (TextUtils.isEmpty(str) || BuildUtil.IS_DEBUG_BUILD) ? str : ((Pattern) SHARE_ALBUM_ID_PATTERN.get(null)).matcher(str).replaceAll("******$2");
    }

    public static boolean doubleEquals(double d, double d2) {
        return doubleNear(d, d2, 1.0E-7d);
    }

    public static boolean doubleNear(double d, double d2, double d3) {
        return Math.abs(d - d2) < Math.abs(d3);
    }

    public static String ensureNotNull(String str) {
        return str == null ? "" : str;
    }

    public static boolean equals(Object obj, Object obj2) {
        return obj == obj2 || (obj != null && obj.equals(obj2));
    }

    public static boolean floatNear(float f, float f2, float f3) {
        return Math.abs(f - f2) < Math.abs(f3);
    }

    public static boolean isNullOrEmpty(String str) {
        return TextUtils.isEmpty(str);
    }

    public static int prevPowerOf2(int i) {
        if (i > 0) {
            return Integer.highestOneBit(i);
        }
        throw new IllegalArgumentException();
    }

    public static int setPermissions(String str, int i, int i2, int i3) {
        return FilesCompat.setPermissions(str, i, i2, i3);
    }
}
