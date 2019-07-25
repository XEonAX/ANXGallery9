package com.nexstreaming.app.common.localprotocol;

import com.miui.gallery.movie.utils.MovieStatUtils;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

/* compiled from: nexCipher */
public class a {
    private String a = null;
    private String b = null;
    private final boolean c = true;

    public static String a(byte[] bArr) {
        if (bArr == null || bArr.length == 0) {
            return null;
        }
        StringBuffer stringBuffer = new StringBuffer(bArr.length * 2);
        for (byte b2 : bArr) {
            StringBuilder sb = new StringBuilder();
            sb.append(MovieStatUtils.DOWNLOAD_SUCCESS);
            sb.append(Integer.toHexString(b2 & 255));
            String sb2 = sb.toString();
            stringBuffer.append(sb2.substring(sb2.length() - 2));
        }
        return stringBuffer.toString();
    }

    public static byte[] a(String str) {
        if (str == null || str.length() == 0) {
            return null;
        }
        byte[] bArr = new byte[(str.length() / 2)];
        for (int i = 0; i < bArr.length; i++) {
            int i2 = i * 2;
            bArr[i] = (byte) Integer.parseInt(str.substring(i2, i2 + 2), 16);
        }
        return bArr;
    }

    public static byte[] a(byte[] bArr, byte[] bArr2) throws Exception {
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr2, "AES");
        Cipher instance = Cipher.getInstance("AES/ECB/PKCS5Padding");
        instance.init(2, secretKeySpec);
        return instance.doFinal(bArr);
    }

    public void a() {
        try {
            KeyPairGenerator instance = KeyPairGenerator.getInstance("RSA");
            instance.initialize(2048);
            KeyPair genKeyPair = instance.genKeyPair();
            PublicKey publicKey = genKeyPair.getPublic();
            PrivateKey privateKey = genKeyPair.getPrivate();
            this.a = a(publicKey.getEncoded());
            this.b = a(privateKey.getEncoded());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public byte[] b() {
        return a(this.a);
    }

    public byte[] b(byte[] bArr) throws NoSuchAlgorithmException, NoSuchProviderException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
        PrivateKey privateKey;
        Cipher instance = Cipher.getInstance("RSA");
        try {
            privateKey = KeyFactory.getInstance("RSA").generatePrivate(new PKCS8EncodedKeySpec(a(this.b)));
        } catch (InvalidKeySpecException e) {
            e.printStackTrace();
            privateKey = null;
        }
        instance.init(2, privateKey);
        return instance.doFinal(bArr);
    }
}
