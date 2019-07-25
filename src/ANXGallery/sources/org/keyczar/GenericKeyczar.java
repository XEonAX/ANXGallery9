package org.keyczar;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Collections;
import java.util.Set;
import org.keyczar.enums.KeyPurpose;
import org.keyczar.enums.KeyStatus;
import org.keyczar.enums.RsaPadding;
import org.keyczar.exceptions.KeyczarException;
import org.keyczar.i18n.Messages;
import org.keyczar.interfaces.KeyczarReader;

public class GenericKeyczar extends Keyczar {
    public GenericKeyczar(String str) throws KeyczarException {
        super(str);
    }

    public GenericKeyczar(KeyczarReader keyczarReader) throws KeyczarException {
        super(keyczarReader);
    }

    private int numVersions() {
        return this.versionMap.size();
    }

    public void addVersion(KeyStatus keyStatus) throws KeyczarException {
        addVersion(keyStatus, null, this.kmd.getType().defaultSize());
    }

    public void addVersion(KeyStatus keyStatus, int i) throws KeyczarException {
        addVersion(keyStatus, null, i);
    }

    public void addVersion(KeyStatus keyStatus, KeyczarKey keyczarKey) {
        KeyVersion keyVersion = new KeyVersion(numVersions() + 1, keyStatus, false);
        if (keyStatus == KeyStatus.PRIMARY) {
            if (this.primaryVersion != null) {
                this.primaryVersion.setStatus(KeyStatus.ACTIVE);
            }
            this.primaryVersion = keyVersion;
        }
        addKey(keyVersion, keyczarKey);
    }

    public void addVersion(KeyStatus keyStatus, RsaPadding rsaPadding) throws KeyczarException {
        addVersion(keyStatus, rsaPadding, this.kmd.getType().defaultSize());
    }

    public void addVersion(KeyStatus keyStatus, RsaPadding rsaPadding, int i) throws KeyczarException {
        KeyczarKey genKey;
        do {
            genKey = KeyczarKey.genKey(this.kmd.getType(), rsaPadding, i);
        } while (getKey(genKey.hash()) != null);
        addVersion(keyStatus, genKey);
    }

    public void demote(int i) throws KeyczarException {
        KeyVersion version = getVersion(i);
        switch (version.getStatus()) {
            case PRIMARY:
                version.setStatus(KeyStatus.ACTIVE);
                this.primaryVersion = null;
                return;
            case ACTIVE:
                version.setStatus(KeyStatus.INACTIVE);
                return;
            case INACTIVE:
                throw new KeyczarException(Messages.getString("Keyczar.CantDemoteScheduled", new Object[0]));
            default:
                return;
        }
    }

    public KeyczarKey getKey(KeyVersion keyVersion) {
        return (KeyczarKey) this.versionMap.get(keyVersion);
    }

    public KeyMetadata getMetadata() {
        return this.kmd;
    }

    public KeyVersion getVersion(int i) throws KeyczarException {
        KeyVersion version = this.kmd.getVersion(i);
        if (version != null) {
            return version;
        }
        throw new KeyczarException(Messages.getString("Keyczar.NoSuchVersion", Integer.valueOf(i)));
    }

    public Set<KeyVersion> getVersions() {
        return Collections.unmodifiableSet(this.versionMap.keySet());
    }

    public boolean isAcceptablePurpose(KeyPurpose keyPurpose) {
        return true;
    }

    public void promote(int i) throws KeyczarException {
        KeyVersion version = getVersion(i);
        switch (version.getStatus()) {
            case PRIMARY:
                throw new KeyczarException(Messages.getString("Keyczar.CantPromotePrimary", new Object[0]));
            case ACTIVE:
                version.setStatus(KeyStatus.PRIMARY);
                if (this.primaryVersion != null) {
                    this.primaryVersion.setStatus(KeyStatus.ACTIVE);
                }
                this.primaryVersion = version;
                return;
            case INACTIVE:
                version.setStatus(KeyStatus.ACTIVE);
                return;
            default:
                return;
        }
    }

    /* access modifiers changed from: 0000 */
    public void publicKeyExport(String str) throws KeyczarException {
        if (str != null && !str.endsWith(File.separator)) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(File.separator);
            str = sb.toString();
        }
        KeyMetadata metadata = getMetadata();
        KeyMetadata keyMetadata = null;
        if (metadata.getType() != DefaultKeyType.DSA_PRIV) {
            if (metadata.getType() == DefaultKeyType.RSA_PRIV) {
                switch (metadata.getPurpose()) {
                    case DECRYPT_AND_ENCRYPT:
                        keyMetadata = new KeyMetadata(metadata.getName(), KeyPurpose.ENCRYPT, DefaultKeyType.RSA_PUB);
                        break;
                    case SIGN_AND_VERIFY:
                        keyMetadata = new KeyMetadata(metadata.getName(), KeyPurpose.VERIFY, DefaultKeyType.RSA_PUB);
                        break;
                }
            }
        } else if (metadata.getPurpose() == KeyPurpose.SIGN_AND_VERIFY) {
            keyMetadata = new KeyMetadata(metadata.getName(), KeyPurpose.VERIFY, DefaultKeyType.DSA_PUB);
        }
        if (keyMetadata != null) {
            for (KeyVersion keyVersion : getVersions()) {
                KeyczarPublicKey keyczarPublicKey = ((KeyczarPrivateKey) getKey(keyVersion)).getPublic();
                if (KeyczarTool.getMock() == null) {
                    String keyczarKey = keyczarPublicKey.toString();
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(str);
                    sb2.append(keyVersion.getVersionNumber());
                    writeFile(keyczarKey, sb2.toString());
                } else {
                    KeyczarTool.getMock().setPublicKey(keyVersion.getVersionNumber(), keyczarPublicKey);
                }
                keyMetadata.addVersion(keyVersion);
            }
            if (KeyczarTool.getMock() == null) {
                String keyMetadata2 = keyMetadata.toString();
                StringBuilder sb3 = new StringBuilder();
                sb3.append(str);
                sb3.append("meta");
                writeFile(keyMetadata2, sb3.toString());
                return;
            }
            KeyczarTool.getMock().setPublicKeyMetadata(keyMetadata);
            return;
        }
        throw new KeyczarException(Messages.getString("KeyczarTool.CannotExportPubKey", metadata.getType(), metadata.getPurpose()));
    }

    public void revoke(int i) throws KeyczarException {
        if (getVersion(i).getStatus() == KeyStatus.INACTIVE) {
            this.kmd.removeVersion(i);
        } else {
            throw new KeyczarException(Messages.getString("Keyczar.CantRevoke", new Object[0]));
        }
    }

    /* access modifiers changed from: 0000 */
    public void write(String str) throws KeyczarException {
        String keyMetadata = this.kmd.toString();
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("meta");
        writeFile(keyMetadata, sb.toString());
        for (KeyVersion keyVersion : getVersions()) {
            String keyczarKey = getKey(keyVersion).toString();
            StringBuilder sb2 = new StringBuilder();
            sb2.append(str);
            sb2.append(keyVersion.getVersionNumber());
            writeFile(keyczarKey, sb2.toString());
        }
    }

    /* access modifiers changed from: 0000 */
    public void writeEncrypted(String str, Encrypter encrypter) throws KeyczarException {
        KeyMetadata metadata = getMetadata();
        metadata.setEncrypted(true);
        String keyMetadata = metadata.toString();
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("meta");
        writeFile(keyMetadata, sb.toString());
        for (KeyVersion keyVersion : getVersions()) {
            String encrypt = encrypter.encrypt(getKey(keyVersion).toString());
            StringBuilder sb2 = new StringBuilder();
            sb2.append(str);
            sb2.append(keyVersion.getVersionNumber());
            writeFile(encrypt, sb2.toString());
        }
    }

    /* access modifiers changed from: 0000 */
    public void writeFile(String str, String str2) throws KeyczarException {
        File file = new File(str2);
        try {
            FileWriter fileWriter = new FileWriter(file);
            fileWriter.write(str);
            fileWriter.close();
        } catch (IOException e) {
            throw new KeyczarException(Messages.getString("KeyczarTool.UnableToWrite", file.toString()), e);
        }
    }
}
