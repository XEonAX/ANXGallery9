package com.xiaomi.channel.commonutils.string;

import android.net.Uri;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import java.io.UnsupportedEncodingException;
import java.security.InvalidParameterException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
import org.keyczar.Keyczar;

public class CloudCoder {
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
        try {
            return String.valueOf(Base64Coder.encode(MessageDigest.getInstance("SHA1").digest(str.getBytes(Keyczar.DEFAULT_ENCODING))));
        } catch (NoSuchAlgorithmException e) {
            MyLog.e("CloudCoder.hash4SHA1 ", e);
            throw new IllegalStateException("failed to SHA1");
        } catch (UnsupportedEncodingException e2) {
            MyLog.e("CloudCoder.hash4SHA1 ", e2);
            throw new IllegalStateException("failed to SHA1");
        } catch (Exception e3) {
            MyLog.e("CloudCoder.hash4SHA1 ", e3);
            throw new IllegalStateException("failed to SHA1");
        }
    }
}
