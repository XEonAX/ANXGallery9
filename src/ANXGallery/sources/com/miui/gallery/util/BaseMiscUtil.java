package com.miui.gallery.util;

import java.io.Closeable;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collection;

public class BaseMiscUtil {
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

    public static float clamp(float f, float f2, float f3) {
        return f > f3 ? f3 : f < f2 ? f2 : f;
    }

    public static int clamp(int i, int i2, int i3) {
        return i > i3 ? i3 : i < i2 ? i2 : i;
    }

    public static void closeSilently(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
                Log.w("BaseMiscUtil", "close fail", e);
            }
        }
    }

    public static final long crc64Long(byte[] bArr) {
        long j = -1;
        for (byte b : bArr) {
            j = (j >> 8) ^ sCrcTable[(((int) j) ^ b) & 255];
        }
        return j;
    }

    public static boolean doubleEquals(double d, double d2) {
        return doubleNear(d, d2, 1.0E-7d);
    }

    public static boolean doubleNear(double d, double d2, double d3) {
        return Math.abs(d - d2) < Math.abs(d3);
    }

    public static boolean equals(Object obj, Object obj2) {
        return obj == obj2 || (obj != null && obj.equals(obj2));
    }

    public static boolean floatEquals(float f, float f2) {
        return floatNear(f, f2, 1.0E-7f);
    }

    public static boolean floatNear(float f, float f2, float f3) {
        return Math.abs(f - f2) < Math.abs(f3);
    }

    private static Method getDeclaredMethod(Object obj, String str, Class<?>[] clsArr) {
        if (obj instanceof Class) {
            try {
                return ((Class) obj).getMethod(str, clsArr);
            } catch (Exception unused) {
            }
        } else {
            Class<Object> cls = obj.getClass();
            while (cls != Object.class) {
                try {
                    return cls.getDeclaredMethod(str, clsArr);
                } catch (Exception unused2) {
                    cls = cls.getSuperclass();
                }
            }
            return null;
        }
    }

    public static Object invokeSafely(Object obj, String str, Class<?>[] clsArr, Object... objArr) {
        try {
            Method declaredMethod = getDeclaredMethod(obj, str, clsArr);
            if (declaredMethod != null) {
                if (!declaredMethod.isAccessible()) {
                    declaredMethod.setAccessible(true);
                }
                return declaredMethod.invoke(obj, objArr);
            }
        } catch (SecurityException e) {
            Log.e("BaseMiscUtil", (Throwable) e);
        } catch (IllegalAccessException e2) {
            Log.e("BaseMiscUtil", (Throwable) e2);
        } catch (IllegalArgumentException e3) {
            Log.e("BaseMiscUtil", (Throwable) e3);
        } catch (InvocationTargetException e4) {
            Log.e("BaseMiscUtil", (Throwable) e4);
        } catch (Exception e5) {
            Log.e("BaseMiscUtil", (Throwable) e5);
        }
        return null;
    }

    public static boolean isValid(Collection collection) {
        return collection != null && collection.size() > 0;
    }
}
