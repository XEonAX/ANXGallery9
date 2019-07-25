package com.nexstreaming.app.common.nexasset.assetpackage.security.provider;

import com.google.gson_nex.Gson;
import com.nexstreaming.app.common.nexasset.assetpackage.security.a;
import com.nexstreaming.app.common.nexasset.assetpackage.security.b;
import com.nexstreaming.app.common.util.m;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import org.keyczar.Crypter;
import org.keyczar.exceptions.KeyczarException;
import org.keyczar.interfaces.KeyczarReader;

public class BasicEncryptionProvider implements b {
    private final int[] a;
    private final String[] b;
    private KeyczarReader c = new KeyczarReader() {
        public String getKey() throws KeyczarException {
            return BasicEncryptionProvider.this.a(1);
        }

        public String getKey(int i) throws KeyczarException {
            return BasicEncryptionProvider.this.a(i);
        }

        public String getMetadata() throws KeyczarException {
            return BasicEncryptionProvider.this.a(0);
        }
    };

    private class ProviderSpecificDataJSON {
        List<String> f;
        int v;

        private ProviderSpecificDataJSON() {
        }
    }

    public BasicEncryptionProvider(int[] iArr, String[] strArr) {
        this.a = iArr;
        this.b = strArr;
    }

    private int a(String str, int i, int i2) {
        int length = str.length();
        int i3 = 0;
        while (i < i2 && i < length) {
            char charAt = str.charAt(i);
            i3 *= 16;
            if (charAt >= '0' && charAt <= '9') {
                i3 += charAt - '0';
            } else if (charAt >= 'a' && charAt <= 'f') {
                i3 += (charAt - 'a') + 10;
            } else if (charAt >= 'A' && charAt <= 'F') {
                i3 += (charAt - 'A') + 10;
            }
            i++;
        }
        return i3;
    }

    /* access modifiers changed from: private */
    public String a(int i) {
        String str = this.b[i];
        int a2 = a(str, 0, 2) ^ 32;
        byte[] bArr = new byte[((str.length() - 2) / 2)];
        for (int i2 = 0; i2 < bArr.length; i2++) {
            int i3 = i2 * 2;
            byte a3 = (byte) a(str, i3 + 2, i3 + 4);
            bArr[i2] = (byte) ((((a3 << 4) & 240) | ((a3 >> 4) & 15)) ^ a2);
        }
        return new String(bArr);
    }

    private String a(String str, String str2) {
        String substring = str.substring(str.indexOf(str2));
        String substring2 = substring.substring(substring.indexOf(":"));
        String substring3 = substring2.substring(substring2.indexOf("\"") + 1);
        return substring3.substring(0, substring3.indexOf("\""));
    }

    private String b(String str) {
        byte[] bytes = str.getBytes(StandardCharsets.US_ASCII);
        int nextInt = new Random().nextInt(238) + 17;
        String format = String.format("%02X", new Object[]{Integer.valueOf(nextInt ^ 32)});
        String str2 = format;
        for (byte b2 : bytes) {
            byte b3 = (byte) (b2 ^ nextInt);
            byte b4 = (byte) (((b3 << 4) & 240) | ((b3 >> 4) & 15));
            StringBuilder sb = new StringBuilder();
            sb.append(str2);
            sb.append(String.format("%02X", new Object[]{Byte.valueOf(b4)}));
            str2 = sb.toString();
        }
        return str2;
    }

    public a a(String str) {
        ProviderSpecificDataJSON providerSpecificDataJSON = (ProviderSpecificDataJSON) new Gson().fromJson(str, ProviderSpecificDataJSON.class);
        final HashSet hashSet = new HashSet();
        hashSet.addAll(providerSpecificDataJSON.f);
        int i = providerSpecificDataJSON.v;
        try {
            final Crypter crypter = new Crypter(this.c);
            return new a() {
                ByteArrayOutputStream a = new ByteArrayOutputStream();

                public InputStream a(InputStream inputStream, String str) throws IOException {
                    ByteArrayInputStream byteArrayInputStream;
                    if (!hashSet.contains(str)) {
                        return inputStream;
                    }
                    this.a.reset();
                    m.a(inputStream, this.a);
                    inputStream.close();
                    try {
                        synchronized (this) {
                            byteArrayInputStream = new ByteArrayInputStream(crypter.decrypt(this.a.toByteArray()));
                        }
                        return byteArrayInputStream;
                    } catch (KeyczarException unused) {
                        throw new IllegalStateException();
                    }
                }

                public boolean a(String str) {
                    return !hashSet.contains(str);
                }
            };
        } catch (KeyczarException unused) {
            throw new IllegalStateException();
        }
    }

    public String a() {
        char[] cArr = new char[this.a.length];
        for (int i = 0; i < this.a.length; i++) {
            cArr[i] = (char) (this.a[i] ^ 90);
        }
        return new String(cArr);
    }

    public String[] b() {
        String[] strArr = new String[12];
        int i = 0;
        int i2 = 0;
        while (i < 6) {
            try {
                i++;
                String key = this.c.getKey(i);
                String a2 = a(key, "hmacKeyString");
                if (a2.length() > 16) {
                    a2 = a2.substring(a2.length() - 16, a2.length());
                }
                int i3 = i2 + 1;
                strArr[i2] = b(a2);
                String a3 = a(key, "aesKeyString");
                if (a3.length() > 16) {
                    a3 = a3.substring(a3.length() - 16, a3.length());
                }
                int i4 = i3 + 1;
                strArr[i3] = b(a3);
                i2 = i4;
            } catch (KeyczarException unused) {
            }
        }
        return strArr;
    }
}
