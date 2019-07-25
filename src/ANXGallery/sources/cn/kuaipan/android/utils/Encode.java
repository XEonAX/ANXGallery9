package cn.kuaipan.android.utils;

import android.util.Log;
import com.miui.gallery.movie.utils.MovieStatUtils;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.security.MessageDigest;

public class Encode {
    static final String[] HEXDIGITS = {MovieStatUtils.DOWNLOAD_SUCCESS, "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};

    public static String MD5Encode(byte[] bArr) {
        try {
            return byteArrayToHexString(MessageDigest.getInstance("MD5").digest(bArr));
        } catch (Exception e) {
            Log.e("Encode", "MD5Encode failed.", e);
            return null;
        }
    }

    public static String SHA1Encode(InputStream inputStream, int i) {
        try {
            MessageDigest instance = MessageDigest.getInstance("sha1");
            byte[] bArr = new byte[16384];
            int i2 = 0;
            do {
                int read = inputStream.read(bArr, 0, Math.min(bArr.length, i - i2));
                if (read < 0) {
                    break;
                }
                instance.update(bArr, 0, read);
                i2 += read;
            } while (i - i2 > 0);
            return byteArrayToHexString(instance.digest());
        } catch (Exception e) {
            Log.e("Encode", "SHA1Encode failed.", e);
            return null;
        }
    }

    public static String SHA1Encode(RandomAccessFile randomAccessFile, long j, long j2) {
        try {
            MessageDigest instance = MessageDigest.getInstance("sha1");
            byte[] bArr = new byte[8192];
            long j3 = j2 + j;
            randomAccessFile.seek(j);
            do {
                int read = randomAccessFile.read(bArr, 0, (int) Math.min((long) bArr.length, j3 - j));
                if (read < 0) {
                    break;
                }
                instance.update(bArr, 0, read);
                j += (long) read;
            } while (j < j3);
            if (j >= j3) {
                return byteArrayToHexString(instance.digest());
            }
            Log.w("Encode", "File size may not enough for sha1.");
            return null;
        } catch (Exception e) {
            Log.e("Encode", "SHA1Encode failed.", e);
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

    public static byte[] hexStringToByteArray(String str) {
        byte[] bArr = new byte[(str.length() / 2)];
        for (int i = 0; i < bArr.length; i++) {
            int i2 = i * 2;
            bArr[i] = (byte) ((Character.digit(str.charAt(i2), 16) * 16) + Character.digit(str.charAt(i2 + 1), 16));
        }
        return bArr;
    }
}
