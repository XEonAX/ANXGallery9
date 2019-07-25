package com.miui.gallery.net.download;

import com.miui.gallery.util.Log;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public abstract class Verifier {
    private String mAlgorithm;
    private byte[] mHash;

    public static final class Sha1 extends Verifier {
        public Sha1(String str) {
            super("SHA-1", Verifier.decode(str, 40));
        }
    }

    public Verifier(String str, byte[] bArr) {
        this.mAlgorithm = str;
        this.mHash = bArr;
    }

    /* access modifiers changed from: private */
    public static byte[] decode(String str, int i) {
        if (str.length() == i) {
            byte[] bArr = new byte[(str.length() / 2)];
            int i2 = 0;
            while (i2 < str.length()) {
                int digit = Character.digit(str.charAt(i2), 16);
                if (digit != -1) {
                    int i3 = i2 / 2;
                    bArr[i3] = (byte) ((digit << (i2 % 2 == 0 ? 4 : 0)) | bArr[i3]);
                    i2++;
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append(str);
                    sb.append(" is not a hex string");
                    throw new IllegalArgumentException(sb.toString());
                }
            }
            return bArr;
        }
        throw new IllegalArgumentException();
    }

    public MessageDigest getInstance() {
        try {
            return MessageDigest.getInstance(this.mAlgorithm);
        } catch (NoSuchAlgorithmException e) {
            Log.w("Verifier", (Throwable) e);
            return null;
        }
    }

    public final boolean verify(byte[] bArr) {
        return Arrays.equals(bArr, this.mHash);
    }
}
