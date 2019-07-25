package com.miui.xspace;

import android.content.ContentResolver;
import android.content.Context;
import android.util.Log;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

class MiuiXSpace implements IXSpaceWrapper {
    MiuiXSpace() {
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

    private static Object invokeSafely(Object obj, String str, Class<?>[] clsArr, Object... objArr) {
        try {
            Method declaredMethod = getDeclaredMethod(obj, str, clsArr);
            if (declaredMethod != null) {
                if (!declaredMethod.isAccessible()) {
                    declaredMethod.setAccessible(true);
                }
                return declaredMethod.invoke(obj, objArr);
            }
        } catch (SecurityException e) {
            Log.e("MiuiXSpace", "", e);
        } catch (IllegalAccessException e2) {
            Log.e("MiuiXSpace", "", e2);
        } catch (IllegalArgumentException e3) {
            Log.e("MiuiXSpace", "", e3);
        } catch (InvocationTargetException e4) {
            Log.e("MiuiXSpace", "", e4);
        } catch (Exception e5) {
            Log.e("MiuiXSpace", "", e5);
        }
        return null;
    }

    public File getXSpacePath() {
        try {
            return (File) invokeSafely(Class.forName("android.os.Environment$UserEnvironment").getDeclaredConstructor(new Class[]{Integer.TYPE}).newInstance(new Object[]{Integer.valueOf(999)}), "getExternalStorageDirectory", null, new Object[0]);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean isXSpaceEnable(Context context) {
        try {
            return ((Boolean) invokeSafely(Class.forName("android.provider.MiuiSettings$Secure"), "getBoolean", new Class[]{ContentResolver.class, String.class, Boolean.TYPE}, context.getContentResolver(), "xspace_enabled", Boolean.valueOf(false))).booleanValue();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
