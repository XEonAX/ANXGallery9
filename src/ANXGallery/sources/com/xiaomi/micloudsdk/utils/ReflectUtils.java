package com.xiaomi.micloudsdk.utils;

import java.lang.reflect.Field;

public class ReflectUtils {
    public static Field getField(Class cls, String str) {
        try {
            return cls.getDeclaredField(str);
        } catch (NoSuchFieldException unused) {
            return null;
        }
    }
}
