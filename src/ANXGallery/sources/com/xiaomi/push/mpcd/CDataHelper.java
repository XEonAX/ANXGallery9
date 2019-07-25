package com.xiaomi.push.mpcd;

import com.xiaomi.channel.commonutils.android.DataCryptUtils;
import com.xiaomi.channel.commonutils.string.Base64Coder;

public class CDataHelper {
    public static byte[] decryptData(String str, byte[] bArr) {
        byte[] decode = Base64Coder.decode(str);
        try {
            parseKey(decode);
            return DataCryptUtils.mipushDecrypt(decode, bArr);
        } catch (Exception unused) {
            return null;
        }
    }

    public static byte[] encryptData(String str, byte[] bArr) {
        byte[] decode = Base64Coder.decode(str);
        try {
            parseKey(decode);
            return DataCryptUtils.mipushEncrypt(decode, bArr);
        } catch (Exception unused) {
            return null;
        }
    }

    private static void parseKey(byte[] bArr) {
        if (bArr.length >= 2) {
            bArr[0] = 99;
            bArr[1] = 100;
        }
    }
}
