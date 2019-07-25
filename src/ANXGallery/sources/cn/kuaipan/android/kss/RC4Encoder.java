package cn.kuaipan.android.kss;

import cn.kuaipan.android.http.IKscDecoder;
import cn.kuaipan.android.utils.RC4;
import java.security.InvalidKeyException;

public class RC4Encoder implements IKscDecoder {
    private byte[] buf;
    private int bufUsed = 0;
    private final byte[] key;
    private final RC4 rc4;

    public RC4Encoder(byte[] bArr) throws InvalidKeyException {
        this.key = bArr;
        this.rc4 = new RC4();
        this.rc4.makeKey(bArr);
        this.buf = new byte[8192];
    }

    public boolean canEnd() {
        return true;
    }

    public RC4Encoder clone() {
        try {
            return new RC4Encoder(this.key);
        } catch (InvalidKeyException unused) {
            return null;
        }
    }

    public void end() {
        this.bufUsed = 0;
    }

    public synchronized void fillData(byte[] bArr, int i, int i2) {
        int i3 = this.bufUsed + i2;
        if (i3 > this.buf.length) {
            byte[] bArr2 = this.buf;
            int length = bArr2.length << 1;
            while (i3 > length) {
                length <<= 1;
            }
            this.buf = new byte[length];
            System.arraycopy(bArr2, 0, this.buf, 0, this.bufUsed);
        }
        this.rc4.genRC4(bArr, i, i2, bArr, i);
        System.arraycopy(bArr, i, this.buf, this.bufUsed, i2);
        this.bufUsed = i3;
    }

    public void init() {
        try {
            this.rc4.makeKey(this.key);
            this.bufUsed = 0;
        } catch (InvalidKeyException unused) {
        }
    }

    public int needFill() {
        return Math.max(8192 - this.bufUsed, 0);
    }

    public synchronized int readDecodeData(byte[] bArr, int i, int i2) {
        if (this.bufUsed <= 0) {
            return 0;
        }
        int min = Math.min(Math.min(this.bufUsed, i2), bArr.length - i);
        System.arraycopy(this.buf, 0, bArr, i, min);
        int i3 = this.bufUsed - min;
        if (i3 > 0) {
            System.arraycopy(this.buf, min, this.buf, 0, i3);
        }
        this.bufUsed = i3;
        return min;
    }

    public void skip(long j) {
        try {
            this.rc4.makeKey(this.key);
            this.bufUsed = 0;
            this.rc4.skip(j);
        } catch (InvalidKeyException unused) {
        }
    }

    public boolean supportRepeat() {
        return true;
    }
}
