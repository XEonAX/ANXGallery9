package com.google.gson_nex.internal;

/* renamed from: com.google.gson_nex.internal.$Gson$Preconditions reason: invalid class name */
public final class C$Gson$Preconditions {
    public static void checkArgument(boolean z) {
        if (!z) {
            throw new IllegalArgumentException();
        }
    }

    public static <T> T checkNotNull(T t) {
        if (t != null) {
            return t;
        }
        throw new NullPointerException();
    }
}
