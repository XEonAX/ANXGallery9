package org.keyczar;

import com.google.gson_nex.annotations.Expose;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.keyczar.enums.KeyPurpose;
import org.keyczar.enums.KeyStatus;
import org.keyczar.exceptions.NoPrimaryKeyException;
import org.keyczar.interfaces.KeyType;
import org.keyczar.util.Util;

public class KeyMetadata {
    @Expose
    boolean encrypted = false;
    @Expose
    String name = "";
    @Expose
    KeyPurpose purpose = KeyPurpose.TEST;
    @Expose
    KeyType type = DefaultKeyType.TEST;
    protected Map<Integer, KeyVersion> versionMap = new HashMap();
    @Expose
    List<KeyVersion> versions = new ArrayList();

    public KeyMetadata() {
    }

    public KeyMetadata(String str, KeyPurpose keyPurpose, KeyType keyType) {
        this.name = str;
        this.purpose = keyPurpose;
        this.type = keyType;
    }

    public static KeyMetadata read(String str) {
        KeyMetadata keyMetadata = (KeyMetadata) Util.gson().fromJson(str, KeyMetadata.class);
        for (KeyVersion keyVersion : keyMetadata.getVersions()) {
            keyMetadata.versionMap.put(Integer.valueOf(keyVersion.getVersionNumber()), keyVersion);
        }
        return keyMetadata;
    }

    public boolean addVersion(KeyVersion keyVersion) {
        int versionNumber = keyVersion.getVersionNumber();
        if (this.versionMap.containsKey(Integer.valueOf(versionNumber))) {
            return false;
        }
        this.versionMap.put(Integer.valueOf(versionNumber), keyVersion);
        this.versions.add(keyVersion);
        return true;
    }

    public String getName() {
        return this.name;
    }

    public KeyVersion getPrimaryVersion() throws NoPrimaryKeyException {
        for (KeyVersion keyVersion : this.versions) {
            if (keyVersion.getStatus() == KeyStatus.PRIMARY) {
                return keyVersion;
            }
        }
        throw new NoPrimaryKeyException();
    }

    public KeyPurpose getPurpose() {
        return this.purpose;
    }

    public KeyType getType() {
        return this.type;
    }

    public KeyVersion getVersion(int i) {
        return (KeyVersion) this.versionMap.get(Integer.valueOf(i));
    }

    public List<KeyVersion> getVersions() {
        return this.versions;
    }

    public boolean isEncrypted() {
        return this.encrypted;
    }

    public boolean removeVersion(int i) {
        if (!this.versionMap.containsKey(Integer.valueOf(i))) {
            return false;
        }
        this.versions.remove((KeyVersion) this.versionMap.get(Integer.valueOf(i)));
        this.versionMap.remove(Integer.valueOf(i));
        return true;
    }

    /* access modifiers changed from: 0000 */
    public void setEncrypted(boolean z) {
        this.encrypted = z;
    }

    /* access modifiers changed from: 0000 */
    public void setType(KeyType keyType) {
        this.type = keyType;
    }

    public String toString() {
        return Util.gson().toJson((Object) this);
    }
}
