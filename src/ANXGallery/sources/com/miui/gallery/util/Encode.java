package com.miui.gallery.util;

import android.util.Base64;
import com.miui.gallery.movie.utils.MovieStatUtils;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import org.keyczar.Keyczar;

public class Encode {
    static final String[] HEXDIGITS = {MovieStatUtils.DOWNLOAD_SUCCESS, "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};

    public static String MD5Encode(byte[] bArr) {
        try {
            return byteArrayToHexString(MessageDigest.getInstance("MD5").digest(bArr));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String SHA1Encode(byte[] bArr) {
        try {
            return byteArrayToHexString(MessageDigest.getInstance("sha1").digest(bArr));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String byteArrayToHexString(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        StringBuffer stringBuffer = new StringBuffer(bArr.length * 2);
        for (int i = 0; i < bArr.length; i++) {
            stringBuffer.append(HEXDIGITS[(bArr[i] >>> 4) & 15]);
            stringBuffer.append(HEXDIGITS[bArr[i] & 15]);
        }
        return stringBuffer.toString();
    }

    public static String decodeBase64(String str) {
        return new String(Base64.decode(str.getBytes(Charset.forName(Keyczar.DEFAULT_ENCODING)), 2));
    }

    public static String encodeBase64(String str) {
        return Base64.encodeToString(str.getBytes(Charset.forName(Keyczar.DEFAULT_ENCODING)), 2);
    }
}
