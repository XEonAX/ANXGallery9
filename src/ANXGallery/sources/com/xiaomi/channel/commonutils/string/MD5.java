package com.xiaomi.channel.commonutils.string;

import com.miui.gallery.movie.utils.MovieStatUtils;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
    public static String MD5_16(String str) {
        return MD5_32(str).subSequence(8, 24).toString();
    }

    public static String MD5_32(String str) {
        try {
            MessageDigest instance = MessageDigest.getInstance("MD5");
            StringBuffer stringBuffer = new StringBuffer();
            instance.update(str.getBytes(), 0, str.length());
            byte[] digest = instance.digest();
            for (byte byte2Hex : digest) {
                stringBuffer.append(byte2Hex(byte2Hex));
            }
            return stringBuffer.toString();
        } catch (NoSuchAlgorithmException unused) {
            return null;
        }
    }

    private static String byte2Hex(byte b) {
        int i = (b & Byte.MAX_VALUE) + (b < 0 ? (byte) 128 : 0);
        StringBuilder sb = new StringBuilder();
        sb.append(i < 16 ? MovieStatUtils.DOWNLOAD_SUCCESS : "");
        sb.append(Integer.toHexString(i).toLowerCase());
        return sb.toString();
    }
}
