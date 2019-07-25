package com.xiaomi.micloudsdk.utils;

import java.util.Map;

public class CloudCoder {
    private static long sServerDateOffset;

    public static String generateNonce() {
        return generateNonce(System.currentTimeMillis() + sServerDateOffset);
    }

    public static String generateNonce(long j) {
        return Coder.generateNonce(j);
    }

    public static String generateSignature(String str, String str2, Map<String, String> map, String str3) {
        return Coder.generateSignature(str, str2, map, str3);
    }

    public static void setServerDateOffset(long j) {
        sServerDateOffset = j;
    }
}
