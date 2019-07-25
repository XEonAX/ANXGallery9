package cn.kuaipan.android.utils;

import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;

public class JavaCalls {
    private static final HashMap<Class<?>, Class<?>> PRIMITIVE_MAP = new HashMap<>();

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
        boolean z = false;
        if (clsArr == null) {
            if (clsArr2 == null || clsArr2.length == 0) {
                z = true;
            }
            return z;
        }
        int length = clsArr.length;
        if (clsArr2 == null) {
            if (length == 0) {
                z = true;
            }
            return z;
        } else if (length != clsArr2.length) {
            return false;
        } else {
            for (int i = length - 1; i >= 0; i--) {
                if (clsArr[i].isAssignableFrom(clsArr2[i]) || (PRIMITIVE_MAP.containsKey(clsArr[i]) && ((Class) PRIMITIVE_MAP.get(clsArr[i])).equals(PRIMITIVE_MAP.get(clsArr2[i])))) {
                    return true;
                }
            }
            return false;
        }
    }

    private static Method findMethodByName(Method[] methodArr, String str, Class<?>[] clsArr) throws NoSuchMethodException {
        if (str != null) {
            for (Method method : methodArr) {
                if (method.getName().equals(str) && compareClassLists(method.getParameterTypes(), clsArr)) {
                    return method;
                }
            }
            throw new NoSuchMethodException(str);
        }
        throw new NullPointerException("Method name must not be null.");
    }

    private static Method getDeclaredMethod(Class<?> cls, String str, Class<?>... clsArr) throws NoSuchMethodException, SecurityException {
        return findMethodByName(cls.getDeclaredMethods(), str, clsArr);
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
}
