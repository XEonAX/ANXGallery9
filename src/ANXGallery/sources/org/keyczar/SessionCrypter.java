package org.keyczar;

import org.keyczar.annotations.Experimental;
import org.keyczar.exceptions.KeyczarException;
import org.keyczar.interfaces.KeyczarReader;

@Experimental
public class SessionCrypter {
    private final byte[] sessionMaterial;
    private final Crypter symmetricCrypter;

    public SessionCrypter(Crypter crypter, byte[] bArr) throws KeyczarException {
        this.symmetricCrypter = new Crypter((KeyczarReader) new ImportedKeyReader(AesKey.fromPackedKey(crypter.decrypt(bArr))));
        this.sessionMaterial = bArr;
    }

    public SessionCrypter(Encrypter encrypter) throws KeyczarException {
        AesKey generate = AesKey.generate(((Integer) DefaultKeyType.AES.getAcceptableSizes().get(0)).intValue());
        this.symmetricCrypter = new Crypter((KeyczarReader) new ImportedKeyReader(generate));
        this.sessionMaterial = encrypter.encrypt(generate.getEncoded());
    }

    public byte[] decrypt(byte[] bArr) throws KeyczarException {
        return this.symmetricCrypter.decrypt(bArr);
    }

    public byte[] encrypt(byte[] bArr) throws KeyczarException {
        return this.symmetricCrypter.encrypt(bArr);
    }

    public byte[] getSessionMaterial() {
        return this.sessionMaterial;
    }
}
