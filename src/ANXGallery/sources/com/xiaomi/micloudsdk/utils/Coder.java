package com.xiaomi.micloudsdk.utils;

import android.net.Uri;
import android.text.TextUtils;
import android.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidParameterException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.TreeMap;
import org.keyczar.Keyczar;

public class Coder {
    public static String generateNonce(long j) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        DataOutputStream dataOutputStream = new DataOutputStream(byteArrayOutputStream);
        try {
            dataOutputStream.writeLong(new Random().nextLong());
            dataOutputStream.writeInt((int) (j / 60000));
            dataOutputStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Base64.encodeToString(byteArrayOutputStream.toByteArray(), 2);
    }

    public static String generateSignature(String str, String str2, Map<String, String> map, String str3) {
        if (!TextUtils.isEmpty(str3)) {
            ArrayList<String> arrayList = new ArrayList<>();
            if (str != null) {
                arrayList.add(str.toUpperCase());
            }
            if (str2 != null) {
                arrayList.add(Uri.parse(str2).getEncodedPath());
            }
            boolean z = true;
            if (map != null && !map.isEmpty()) {
                for (Entry entry : new TreeMap(map).entrySet()) {
                    arrayList.add(String.format("%s=%s", new Object[]{entry.getKey(), entry.getValue()}));
                }
            }
            arrayList.add(str3);
            StringBuilder sb = new StringBuilder();
            for (String str4 : arrayList) {
                if (!z) {
                    sb.append('&');
                }
                sb.append(str4);
                z = false;
            }
            return hash4SHA1(sb.toString());
        }
        throw new InvalidParameterException("security is not nullable");
    }

    public static String hash4SHA1(String str) {
        return hash4SHA1(str, 2);
    }

    public static String hash4SHA1(String str, int i) {
        if (str == null) {
            return null;
        }
        try {
            return Base64.encodeToString(MessageDigest.getInstance("SHA1").digest(str.getBytes(Keyczar.DEFAULT_ENCODING)), i);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            throw new IllegalStateException("failed to SHA1");
        } catch (UnsupportedEncodingException e2) {
            e2.printStackTrace();
            throw new IllegalStateException("failed to SHA1");
        }
    }
}
