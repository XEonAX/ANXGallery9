package org.keyczar;

import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.Map.Entry;
import org.keyczar.enums.KeyPurpose;
import org.keyczar.exceptions.KeyczarException;
import org.keyczar.interfaces.KeyczarReader;
import org.keyczar.interfaces.VerifyingStream;
import org.keyczar.util.Base64Coder;

public class UnversionedVerifier extends Keyczar {
    private static final StreamCache<VerifyingStream> VERIFY_CACHE = new StreamCache<>();

    public UnversionedVerifier(String str) throws KeyczarException {
        super(str);
    }

    public UnversionedVerifier(KeyczarReader keyczarReader) throws KeyczarException {
        super(keyczarReader);
    }

    /* access modifiers changed from: 0000 */
    public boolean isAcceptablePurpose(KeyPurpose keyPurpose) {
        return keyPurpose == KeyPurpose.VERIFY || keyPurpose == KeyPurpose.SIGN_AND_VERIFY;
    }

    public boolean verify(String str, String str2) throws KeyczarException {
        try {
            return verify(str.getBytes(Keyczar.DEFAULT_ENCODING), Base64Coder.decodeWebSafe(str2));
        } catch (UnsupportedEncodingException e) {
            throw new KeyczarException((Throwable) e);
        }
    }

    public boolean verify(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) throws KeyczarException {
        for (Entry value : this.versionMap.entrySet()) {
            KeyczarKey keyczarKey = (KeyczarKey) value.getValue();
            ByteBuffer duplicate = byteBuffer.duplicate();
            ByteBuffer duplicate2 = byteBuffer2.duplicate();
            VerifyingStream verifyingStream = (VerifyingStream) VERIFY_CACHE.get(keyczarKey);
            if (verifyingStream == null) {
                verifyingStream = (VerifyingStream) keyczarKey.getStream();
            }
            verifyingStream.initVerify();
            verifyingStream.updateVerify(duplicate);
            boolean verify = verifyingStream.verify(duplicate2);
            VERIFY_CACHE.put(keyczarKey, verifyingStream);
            if (verify) {
                return true;
            }
        }
        return false;
    }

    public boolean verify(byte[] bArr, byte[] bArr2) throws KeyczarException {
        return verify(ByteBuffer.wrap(bArr), ByteBuffer.wrap(bArr2));
    }
}
