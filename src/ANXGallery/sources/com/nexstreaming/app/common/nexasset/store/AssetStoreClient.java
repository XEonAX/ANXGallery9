package com.nexstreaming.app.common.nexasset.store;

import android.util.Log;
import com.nexstreaming.app.common.localprotocol.a;
import com.nexstreaming.app.common.localprotocol.c;
import com.nexstreaming.app.common.localprotocol.nexProtoErrorCode;
import java.io.File;
import java.nio.ByteBuffer;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

public class AssetStoreClient {
    private static final String TAG = "AssetStoreClient";
    private static a cipher = null;
    private static Object m_configLock = new Object();
    public static final String none = "nonedata";

    static int getDataSync2(String[] strArr, String[] strArr2, String str) {
        if (cipher == null) {
            return -1;
        }
        byte[] bArr = null;
        int nextInt = new SecureRandom().nextInt();
        c.a Start = AssetStoreSock.Start(cipher.b(), nextInt);
        if (Start == null) {
            Log.d(TAG, "start is null");
            return -1;
        } else if (Start.f != nexProtoErrorCode.OK.getValue()) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("start is error=");
            sb.append(Start.f);
            Log.d(str2, sb.toString());
            return -1;
        } else {
            ByteBuffer wrap = ByteBuffer.wrap(Start.a);
            int i = nextInt ^ wrap.getInt();
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("newSSID=");
            sb2.append(i);
            Log.d(str3, sb2.toString());
            byte[] bArr2 = new byte[(Start.a.length - 4)];
            wrap.get(bArr2);
            String str4 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("encCommkey=");
            sb3.append(bArr2.length);
            Log.d(str4, sb3.toString());
            try {
                bArr = cipher.b(bArr2);
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            } catch (NoSuchProviderException e2) {
                e2.printStackTrace();
            } catch (NoSuchPaddingException e3) {
                e3.printStackTrace();
            } catch (InvalidKeyException e4) {
                e4.printStackTrace();
            } catch (IllegalBlockSizeException e5) {
                e5.printStackTrace();
            } catch (BadPaddingException e6) {
                e6.printStackTrace();
            }
            for (int i2 = 0; i2 < strArr.length; i2++) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append(str);
                sb4.append(File.separator);
                sb4.append(strArr[i2]);
                c.a requestSECUseCommKey = AssetStoreSock.requestSECUseCommKey(i, sb4.toString());
                if (requestSECUseCommKey == null) {
                    strArr2[i2] = none;
                } else if (requestSECUseCommKey.f != nexProtoErrorCode.OK.getValue()) {
                    Log.d(TAG, "enckey is fail!");
                    return -1;
                } else {
                    try {
                        strArr2[i2] = new String(a.a(requestSECUseCommKey.a, bArr));
                    } catch (Exception e7) {
                        e7.printStackTrace();
                    }
                }
            }
            return 0;
        }
    }

    public static void makeConfig() {
        Log.d(TAG, "makeConfig in");
        synchronized (m_configLock) {
            if (cipher == null) {
                cipher = new a();
                cipher.a();
            }
        }
        Log.d(TAG, "makeConfig out");
    }
}
