package org.keyczar;

import org.keyczar.exceptions.KeyczarException;
import org.keyczar.interfaces.KeyczarReader;

@Deprecated
public class SessionDecrypter {
    private final Crypter symmetricCrypter;

    public SessionDecrypter(Crypter crypter, byte[] bArr) throws KeyczarException {
        this.symmetricCrypter = new Crypter((KeyczarReader) new ImportedKeyReader(AesKey.fromPackedKey(crypter.decrypt(bArr))));
    }

    public byte[] decrypt(byte[] bArr) throws KeyczarException {
        return this.symmetricCrypter.decrypt(bArr);
    }
}
