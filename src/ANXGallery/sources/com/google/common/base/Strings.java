package com.google.common.base;

public final class Strings {
    public static String nullToEmpty(String str) {
        return str == null ? "" : str;
    }
}
