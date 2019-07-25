package org.keyczar;

import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import org.keyczar.exceptions.KeyczarException;
import org.keyczar.exceptions.ShortSignatureException;
import org.keyczar.interfaces.KeyczarReader;
import org.keyczar.util.Base64Coder;
import org.keyczar.util.Clock;
import org.keyczar.util.SystemClock;
import org.keyczar.util.Util;

public class TimeoutVerifier {
    private Clock clock = new SystemClock();
    private Verifier verifier;

    TimeoutVerifier() {
    }

    public TimeoutVerifier(String str) throws KeyczarException {
        setVerifier(new Verifier(str));
    }

    public TimeoutVerifier(Verifier verifier2) {
        setVerifier(verifier2);
    }

    public TimeoutVerifier(KeyczarReader keyczarReader) throws KeyczarException {
        setVerifier(new Verifier(keyczarReader));
    }

    /* access modifiers changed from: 0000 */
    public void setClock(Clock clock2) {
        this.clock = clock2;
    }

    /* access modifiers changed from: 0000 */
    public void setVerifier(Verifier verifier2) {
        this.verifier = verifier2;
    }

    public boolean verify(String str, String str2) throws KeyczarException {
        try {
            return verify(str.getBytes(Keyczar.DEFAULT_ENCODING), Base64Coder.decodeWebSafe(str2));
        } catch (UnsupportedEncodingException e) {
            throw new KeyczarException((Throwable) e);
        }
    }

    public boolean verify(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) throws KeyczarException {
        if (byteBuffer2.remaining() >= 13) {
            byte[] bArr = new byte[5];
            byteBuffer2.get(bArr);
            byte[] bArr2 = new byte[8];
            byteBuffer2.get(bArr2);
            if (this.clock.now() > Util.toLong(bArr2)) {
                return false;
            }
            ByteBuffer allocate = ByteBuffer.allocate(byteBuffer2.remaining() + 5);
            allocate.put(bArr);
            allocate.put(byteBuffer2);
            allocate.rewind();
            ByteBuffer allocate2 = ByteBuffer.allocate(byteBuffer.remaining() + 8);
            allocate2.put(bArr2);
            allocate2.put(byteBuffer);
            allocate2.rewind();
            return this.verifier.verify(allocate2, allocate);
        }
        throw new ShortSignatureException(byteBuffer2.remaining());
    }

    public boolean verify(byte[] bArr, byte[] bArr2) throws KeyczarException {
        return verify(ByteBuffer.wrap(bArr), ByteBuffer.wrap(bArr2));
    }
}
