package com.xiaomi.micloudsdk.request.utils;

import android.util.Base64;
import android.util.Log;
import com.xiaomi.micloudsdk.exception.CipherException;
import com.xiaomi.micloudsdk.utils.AESWithIVCoder;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.json.JSONException;
import org.json.JSONObject;
import org.keyczar.Keyczar;

public class CloudAESWithIVCoder extends AESWithIVCoder {
    public CloudAESWithIVCoder(String str) {
        super(str);
    }

    public static byte[] encryptHMACSha1(byte[] bArr, byte[] bArr2) {
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr2, "HmacSHA1");
        try {
            Mac instance = Mac.getInstance("HmacSHA1");
            instance.init(secretKeySpec);
            instance.update(bArr);
            return instance.doFinal();
        } catch (InvalidKeyException e) {
            Log.e("CloudAESWithIVCoder", "encryptHMACSha1 error", e);
            return null;
        } catch (NoSuchAlgorithmException e2) {
            Log.e("CloudAESWithIVCoder", "encryptHMACSha1 error", e2);
            return null;
        }
    }

    public String decrypt(String str) throws CipherException {
        checkThreadIdThrow();
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString("D");
            String[] split = jSONObject.getString("S").split(":");
            if (split.length == 2) {
                String str2 = split[0];
                String str3 = split[1];
                String encodeToString = Base64.encodeToString(encryptHMACSha1(String.format("%s:%s", new Object[]{str2, new String(string)}).getBytes(Keyczar.DEFAULT_ENCODING), Base64.decode(this.aesKey, 0)), 11);
                if (str3.equals(encodeToString)) {
                    return super.decrypt(string);
                }
                StringBuilder sb = new StringBuilder();
                sb.append("server hash ");
                sb.append(str3);
                sb.append(" and local hash ");
                sb.append(encodeToString);
                sb.append(" dismatch");
                throw new CipherException(sb.toString());
            }
            throw new SecurityException("not 2 columns in security info");
        } catch (JSONException e) {
            Log.e("CloudAESWithIVCoder", "decrypt error", e);
            throw new CipherException("decrypt error", e);
        } catch (UnsupportedEncodingException e2) {
            Log.e("CloudAESWithIVCoder", "decrypt error", e2);
            throw new CipherException("decrypt error", e2);
        } catch (IllegalArgumentException e3) {
            Log.e("CloudAESWithIVCoder", "decrypt error", e3);
            throw new CipherException("decrypt error", e3);
        } catch (NullPointerException e4) {
            Log.e("CloudAESWithIVCoder", "decrypt error", e4);
            throw new CipherException("decrypt error", e4);
        }
    }
}
