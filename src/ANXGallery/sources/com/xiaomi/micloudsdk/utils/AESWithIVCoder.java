package com.xiaomi.micloudsdk.utils;

import android.util.Base64;
import com.xiaomi.micloudsdk.exception.CipherException;
import java.security.SecureRandom;

public class AESWithIVCoder implements CryptCoder {
    private final int IV_LENGTH = 16;
    protected String aesKey;
    private AESCoder coder;
    /* access modifiers changed from: private */
    public byte[] ivRaw;
    private long threadId = 0;

    public AESWithIVCoder(String str) {
        this.aesKey = str;
        this.coder = new AESCoder(str) {
            /* access modifiers changed from: protected */
            public byte[] getInitalVector() {
                return AESWithIVCoder.this.ivRaw;
            }
        };
        initThreadInfo();
    }

    private void initThreadInfo() {
        this.threadId = Thread.currentThread().getId();
    }

    /* access modifiers changed from: protected */
    public void checkThreadIdThrow() {
        if (Thread.currentThread().getId() != this.threadId) {
            throw new IllegalAccessError("this method can not call concurrently");
        }
    }

    public String decrypt(String str) throws CipherException {
        checkThreadIdThrow();
        try {
            AESStringDef instance = AESStringDef.getInstance(str);
            if (instance.getVersion().equals("1")) {
                this.ivRaw = Base64.decode(instance.getIV(), 11);
                return this.coder.decrypt(instance.getData());
            }
            StringBuilder sb = new StringBuilder();
            sb.append("aes encrypt format version is wrong");
            sb.append(str);
            throw new CipherException(sb.toString());
        } catch (InvalidAESDataException e) {
            throw new CipherException((Throwable) e);
        }
    }

    public String encrypt(String str) throws CipherException {
        checkThreadIdThrow();
        try {
            this.ivRaw = new byte[16];
            new SecureRandom().nextBytes(this.ivRaw);
            return AESStringDef.getInstance("1", Base64.encodeToString(this.ivRaw, 11), this.coder.encrypt(str)).toString();
        } catch (InvalidAESDataException e) {
            throw new CipherException((Throwable) e);
        }
    }
}
