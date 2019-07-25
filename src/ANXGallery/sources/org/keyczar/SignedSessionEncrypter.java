package org.keyczar;

import java.util.concurrent.atomic.AtomicReference;
import org.keyczar.annotations.Experimental;
import org.keyczar.exceptions.KeyczarException;
import org.keyczar.interfaces.KeyczarReader;
import org.keyczar.util.Base64Coder;
import org.keyczar.util.Util;

@Experimental
public class SignedSessionEncrypter {
    private static final int NONCE_SIZE = 16;
    private final Encrypter encrypter;
    private AtomicReference<SessionMaterial> session = new AtomicReference<>();
    private final Signer signer;

    public SignedSessionEncrypter(Encrypter encrypter2, Signer signer2) {
        this.encrypter = encrypter2;
        this.signer = signer2;
    }

    public byte[] encrypt(byte[] bArr) throws KeyczarException {
        if (this.session.get() != null) {
            SessionMaterial sessionMaterial = (SessionMaterial) this.session.get();
            return this.signer.attachedSign(new Crypter((KeyczarReader) new ImportedKeyReader(sessionMaterial.getKey())).encrypt(bArr), Base64Coder.decodeWebSafe(sessionMaterial.getNonce()));
        }
        throw new KeyczarException("Session not initialized.");
    }

    public String newSession() throws KeyczarException {
        return newSession(((Integer) DefaultKeyType.AES.getAcceptableSizes().get(0)).intValue());
    }

    public String newSession(int i) throws KeyczarException {
        if (DefaultKeyType.AES.isAcceptableSize(i)) {
            AesKey generate = AesKey.generate(i);
            byte[] bArr = new byte[16];
            Util.rand(bArr);
            this.session.set(new SessionMaterial(generate, Base64Coder.encodeWebSafe(bArr)));
            return this.encrypter.encrypt(((SessionMaterial) this.session.get()).toString());
        }
        throw new KeyczarException("Unsupported key size requested for session");
    }
}
