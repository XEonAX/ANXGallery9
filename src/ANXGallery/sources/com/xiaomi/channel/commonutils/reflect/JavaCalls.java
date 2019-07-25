package com.xiaomi.channel.commonutils.reflect;

import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class JavaCalls {
    private static final Map<Class<?>, Class<?>> PRIMITIVE_MAP = new HashMap();

    public static class JavaParam<T> {
        public final Class<? extends T> clazz;
        public final T obj;
    }

    static {
        PRIMITIVE_MAP.put(Boolean.class, Boolean.TYPE);
        PRIMITIVE_MAP.put(Byte.class, Byte.TYPE);
        PRIMITIVE_MAP.put(Character.class, Character.TYPE);
        PRIMITIVE_MAP.put(Short.class, Short.TYPE);
        PRIMITIVE_MAP.put(Integer.class, Integer.TYPE);
        PRIMITIVE_MAP.put(Float.class, Float.TYPE);
        PRIMITIVE_MAP.put(Long.class, Long.TYPE);
        PRIMITIVE_MAP.put(Double.class, Double.TYPE);
        PRIMITIVE_MAP.put(Boolean.TYPE, Boolean.TYPE);
        PRIMITIVE_MAP.put(Byte.TYPE, Byte.TYPE);
        PRIMITIVE_MAP.put(Character.TYPE, Character.TYPE);
        PRIMITIVE_MAP.put(Short.TYPE, Short.TYPE);
        PRIMITIVE_MAP.put(Integer.TYPE, Integer.TYPE);
        PRIMITIVE_MAP.put(Float.TYPE, Float.TYPE);
        PRIMITIVE_MAP.put(Long.TYPE, Long.TYPE);
        PRIMITIVE_MAP.put(Double.TYPE, Double.TYPE);
    }

    public static <T> T callMethod(Object obj, String str, Object... objArr) {
        try {
            return callMethodOrThrow(obj, str, objArr);
        } catch (Exception e) {
            StringBuilder sb = new StringBuilder();
            sb.append("Meet exception when call Method '");
            sb.append(str);
            sb.append("' in ");
            sb.append(obj);
            Log.w("JavaCalls", sb.toString(), e);
            return null;
        }
    }

    public static <T> T callMethodOrThrow(Object obj, String str, Object... objArr) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException {
        return getDeclaredMethod(obj.getClass(), str, getParameterTypes(objArr)).invoke(obj, getParameters(objArr));
    }

    public static <T> T callStaticMethod(String str, String str2, Object... objArr) {
        try {
            return callStaticMethodOrThrow(Class.forName(str), str2, objArr);
        } catch (Exception e) {
            StringBuilder sb = new StringBuilder();
            sb.append("Meet exception when call Method '");
            sb.append(str2);
            sb.append("' in ");
            sb.append(str);
            Log.w("JavaCalls", sb.toString(), e);
            return null;
        }
    }

    public static <T> T callStaticMethodOrThrow(Class<?> cls, String str, Object... objArr) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException {
        return getDeclaredMethod(cls, str, getParameterTypes(objArr)).invoke(null, getParameters(objArr));
    }

    private static boolean compareClassLists(Class<?>[] clsArr, Class<?>[] clsArr2) {
        boolean z = true;
        if (clsArr == null) {
            if (!(clsArr2 == null || clsArr2.length == 0)) {
                z = false;
            }
            return z;
        } else if (clsArr2 == null) {
            if (clsArr.length != 0) {
                z = false;
            }
            return z;
        } else if (clsArr.length != clsArr2.length) {
            return false;
        } else {
            for (int i = 0; i < clsArr.length; i++) {
                if (clsArr2[i] != null && !clsArr[i].isAssignableFrom(clsArr2[i]) && (!PRIMITIVE_MAP.containsKey(clsArr[i]) || !((Class) PRIMITIVE_MAP.get(clsArr[i])).equals(PRIMITIVE_MAP.get(clsArr2[i])))) {
                    return false;
                }
            }
            return true;
        }
    }

    private static Method findMethodByName(Method[] methodArr, String str, Class<?>[] clsArr) {
        if (str != null) {
            for (Method method : methodArr) {
                if (method.getName().equals(str) && compareClassLists(method.getParameterTypes(), clsArr)) {
                    return method;
                }
            }
            return null;
        }
        throw new NullPointerException("Method name must not be null.");
    }

    private static Method getDeclaredMethod(Class<?> cls, String str, Class<?>... clsArr) throws NoSuchMethodException, SecurityException {
        Method findMethodByName = findMethodByName(cls.getDeclaredMethods(), str, clsArr);
        if (findMethodByName != null) {
            findMethodByName.setAccessible(true);
            return findMethodByName;
        } else if (cls.getSuperclass() != null) {
            return getDeclaredMethod(cls.getSuperclass(), str, clsArr);
        } else {
            throw new NoSuchMethodException();
        }
    }

    public static <T> T getField(Object obj, String str) {
        try {
            return getFieldOrThrow(obj.getClass(), obj, str);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
            return null;
        } catch (IllegalAccessException e2) {
            e2.printStackTrace();
            return null;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:17:0x0015 A[SYNTHETIC] */
    public static <T> T getFieldOrThrow(Class<? extends Object> cls, Object obj, String str) throws NoSuchFieldException, IllegalAccessException {
        Field field = null;
        while (field == null) {
            try {
                Field declaredField = cls.getDeclaredField(str);
                try {
                    declaredField.setAccessible(true);
                    field = declaredField;
                    continue;
                } catch (NoSuchFieldException unused) {
                    field = declaredField;
                    cls = cls.getSuperclass();
                    continue;
                    if (cls == null) {
                    }
                }
            } catch (NoSuchFieldException unused2) {
                cls = cls.getSuperclass();
                continue;
                if (cls == null) {
                }
            }
            if (cls == null) {
                throw new NoSuchFieldException();
            }
        }
        field.setAccessible(true);
        return field.get(obj);
    }

    private static Class<?>[] getParameterTypes(Object... objArr) {
        if (objArr == null || objArr.length <= 0) {
            return null;
        }
        Class[] clsArr = new Class[objArr.length];
        for (int i = 0; i < objArr.length; i++) {
            JavaParam javaParam = objArr[i];
            if (javaParam == null || !(javaParam instanceof JavaParam)) {
                clsArr[i] = javaParam == null ? null : javaParam.getClass();
            } else {
                clsArr[i] = javaParam.clazz;
            }
        }
        return clsArr;
    }

    private static Object[] getParameters(Object... objArr) {
        if (objArr == null || objArr.length <= 0) {
            return null;
        }
        Object[] objArr2 = new Object[objArr.length];
        for (int i = 0; i < objArr.length; i++) {
            JavaParam javaParam = objArr[i];
            if (javaParam == null || !(javaParam instanceof JavaParam)) {
                objArr2[i] = javaParam;
            } else {
                objArr2[i] = javaParam.obj;
            }
        }
        return objArr2;
    }

    public static <T> T getStaticField(Class<? extends Object> cls, String str) {
        try {
            return getFieldOrThrow(cls, null, str);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
            return null;
        } catch (IllegalAccessException e2) {
            e2.printStackTrace();
            return null;
        }
    }

    public static <T> T getStaticField(String str, String str2) {
        try {
            return getFieldOrThrow(Class.forName(str), null, str2);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
            return null;
        } catch (IllegalAccessException e2) {
            e2.printStackTrace();
            return null;
        } catch (ClassNotFoundException e3) {
            e3.printStackTrace();
            return null;
        }
    }
}
