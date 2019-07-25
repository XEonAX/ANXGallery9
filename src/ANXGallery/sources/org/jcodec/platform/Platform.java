package org.jcodec.platform;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

public class Platform {
    private static final Map<Class, Class> boxed2primitive = new HashMap();

    static {
        boxed2primitive.put(Void.class, Void.TYPE);
        boxed2primitive.put(Byte.class, Byte.TYPE);
        boxed2primitive.put(Short.class, Short.TYPE);
        boxed2primitive.put(Character.class, Character.TYPE);
        boxed2primitive.put(Integer.class, Integer.TYPE);
        boxed2primitive.put(Long.class, Long.TYPE);
        boxed2primitive.put(Float.class, Float.TYPE);
        boxed2primitive.put(Double.class, Double.TYPE);
    }

    private static Class[] classes(Object[] objArr) {
        Class[] clsArr = new Class[objArr.length];
        for (int i = 0; i < objArr.length; i++) {
            Class cls = objArr[i].getClass();
            if (boxed2primitive.containsKey(cls)) {
                clsArr[i] = (Class) boxed2primitive.get(cls);
            } else {
                clsArr[i] = cls;
            }
        }
        return clsArr;
    }

    public static byte[] getBytes(String str) {
        try {
            return str.getBytes("iso8859-1");
        } catch (UnsupportedEncodingException unused) {
            return null;
        }
    }

    public static boolean isAssignableFrom(Class cls, Class cls2) {
        if (cls == cls2 || cls.equals(cls2)) {
            return true;
        }
        return cls.isAssignableFrom(cls2);
    }

    public static <T> T newInstance(Class<T> cls, Object[] objArr) {
        try {
            return cls.getConstructor(classes(objArr)).newInstance(objArr);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static String stringFromBytes(byte[] bArr) {
        try {
            return new String(bArr, "iso8859-1");
        } catch (UnsupportedEncodingException unused) {
            return null;
        }
    }

    public static String stringFromCharset(byte[] bArr, String str) {
        return new String(bArr, Charset.forName(str));
    }

    public static long unsignedInt(int i) {
        return ((long) i) & 4294967295L;
    }
}
