package org.keyczar;

import java.nio.ByteBuffer;
import org.keyczar.enums.KeyPurpose;
import org.keyczar.exceptions.BadVersionException;
import org.keyczar.exceptions.InvalidSignatureException;
import org.keyczar.exceptions.KeyNotFoundException;
import org.keyczar.exceptions.KeyczarException;
import org.keyczar.exceptions.ShortCiphertextException;
import org.keyczar.interfaces.DecryptingStream;
import org.keyczar.interfaces.KeyczarReader;
import org.keyczar.interfaces.VerifyingStream;
import org.keyczar.util.Base64Coder;

public class Crypter extends Encrypter {
    private static final int DECRYPT_CHUNK_SIZE = 1024;
    private final StreamCache<DecryptingStream> CRYPT_CACHE = new StreamCache<>();

    public Crypter(String str) throws KeyczarException {
        super(str);
    }

    public Crypter(KeyczarReader keyczarReader) throws KeyczarException {
        super(keyczarReader);
    }

    public String decrypt(String str) throws KeyczarException {
        return new String(decrypt(Base64Coder.decodeWebSafe(str)));
    }

    public void decrypt(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) throws KeyczarException {
        ByteBuffer asReadOnlyBuffer = byteBuffer.asReadOnlyBuffer();
        if (asReadOnlyBuffer.remaining() >= 5) {
            byte b = asReadOnlyBuffer.get();
            if (b == 0) {
                byte[] bArr = new byte[4];
                asReadOnlyBuffer.get(bArr);
                KeyczarKey key = getKey(bArr);
                if (key != null) {
                    asReadOnlyBuffer.mark();
                    DecryptingStream decryptingStream = (DecryptingStream) this.CRYPT_CACHE.get(key);
                    if (decryptingStream == null) {
                        decryptingStream = (DecryptingStream) key.getStream();
                    }
                    VerifyingStream verifyingStream = decryptingStream.getVerifyingStream();
                    if (asReadOnlyBuffer.remaining() >= verifyingStream.digestSize()) {
                        asReadOnlyBuffer.position(asReadOnlyBuffer.limit() - verifyingStream.digestSize());
                        ByteBuffer slice = asReadOnlyBuffer.slice();
                        asReadOnlyBuffer.reset();
                        asReadOnlyBuffer.limit(asReadOnlyBuffer.limit() - verifyingStream.digestSize());
                        decryptingStream.initDecrypt(asReadOnlyBuffer);
                        ByteBuffer asReadOnlyBuffer2 = byteBuffer.asReadOnlyBuffer();
                        asReadOnlyBuffer2.limit(asReadOnlyBuffer.position());
                        verifyingStream.initVerify();
                        verifyingStream.updateVerify(asReadOnlyBuffer2);
                        byteBuffer2.mark();
                        while (asReadOnlyBuffer.remaining() > 1024) {
                            ByteBuffer slice2 = asReadOnlyBuffer.slice();
                            slice2.limit(1024);
                            decryptingStream.updateDecrypt(slice2, byteBuffer2);
                            slice2.rewind();
                            verifyingStream.updateVerify(slice2);
                            asReadOnlyBuffer.position(asReadOnlyBuffer.position() + 1024);
                        }
                        asReadOnlyBuffer.mark();
                        verifyingStream.updateVerify(asReadOnlyBuffer);
                        if (verifyingStream.verify(slice)) {
                            asReadOnlyBuffer.reset();
                            decryptingStream.doFinalDecrypt(asReadOnlyBuffer, byteBuffer2);
                            byteBuffer2.limit(byteBuffer2.position());
                            this.CRYPT_CACHE.put(key, decryptingStream);
                            return;
                        }
                        throw new InvalidSignatureException();
                    }
                    throw new ShortCiphertextException(asReadOnlyBuffer.remaining());
                }
                throw new KeyNotFoundException(bArr);
            }
            throw new BadVersionException(b);
        }
        throw new ShortCiphertextException(asReadOnlyBuffer.remaining());
    }

    public byte[] decrypt(byte[] bArr) throws KeyczarException {
        ByteBuffer allocate = ByteBuffer.allocate(bArr.length);
        decrypt(ByteBuffer.wrap(bArr), allocate);
        allocate.reset();
        byte[] bArr2 = new byte[allocate.remaining()];
        allocate.get(bArr2);
        return bArr2;
    }

    /* access modifiers changed from: 0000 */
    public boolean isAcceptablePurpose(KeyPurpose keyPurpose) {
        return keyPurpose == KeyPurpose.DECRYPT_AND_ENCRYPT;
    }
}
