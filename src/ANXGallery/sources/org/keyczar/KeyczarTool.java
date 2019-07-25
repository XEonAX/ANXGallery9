package org.keyczar;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.cert.CertificateException;
import java.util.ArrayList;
import java.util.HashMap;
import org.keyczar.enums.Command;
import org.keyczar.enums.Flag;
import org.keyczar.enums.KeyPurpose;
import org.keyczar.enums.KeyStatus;
import org.keyczar.enums.RsaPadding;
import org.keyczar.exceptions.KeyczarException;
import org.keyczar.i18n.Messages;
import org.keyczar.interfaces.KeyType;
import org.keyczar.interfaces.KeyczarReader;

public class KeyczarTool {
    private static MockKeyczarReader mock;

    private static void addKey(String str, KeyStatus keyStatus, String str2, int i, String str3) throws KeyczarException {
        GenericKeyczar createGenericKeyczar = createGenericKeyczar(str, str2);
        if (i == -1) {
            createGenericKeyczar.addVersion(keyStatus, getPadding(str3));
        } else {
            createGenericKeyczar.addVersion(keyStatus, getPadding(str3), i);
        }
        updateGenericKeyczar(createGenericKeyczar, str2, str);
    }

    private static void create(String str, String str2, KeyPurpose keyPurpose, String str3) throws KeyczarException {
        KeyMetadata keyMetadata;
        if (keyPurpose != null) {
            switch (keyPurpose) {
                case DECRYPT_AND_ENCRYPT:
                    if (str3 == null) {
                        keyMetadata = new KeyMetadata(str2, KeyPurpose.DECRYPT_AND_ENCRYPT, DefaultKeyType.AES);
                        break;
                    } else {
                        keyMetadata = new KeyMetadata(str2, KeyPurpose.DECRYPT_AND_ENCRYPT, DefaultKeyType.RSA_PRIV);
                        break;
                    }
                case SIGN_AND_VERIFY:
                    if (str3 != null) {
                        if (!str3.equalsIgnoreCase("rsa")) {
                            if (!str3.equalsIgnoreCase("ec")) {
                                keyMetadata = new KeyMetadata(str2, KeyPurpose.SIGN_AND_VERIFY, DefaultKeyType.DSA_PRIV);
                                break;
                            } else {
                                keyMetadata = new KeyMetadata(str2, KeyPurpose.SIGN_AND_VERIFY, DefaultKeyType.EC_PRIV);
                                break;
                            }
                        } else {
                            keyMetadata = new KeyMetadata(str2, KeyPurpose.SIGN_AND_VERIFY, DefaultKeyType.RSA_PRIV);
                            break;
                        }
                    } else {
                        keyMetadata = new KeyMetadata(str2, KeyPurpose.SIGN_AND_VERIFY, DefaultKeyType.HMAC_SHA1);
                        break;
                    }
                case TEST:
                    keyMetadata = new KeyMetadata(str2, KeyPurpose.TEST, DefaultKeyType.TEST);
                    break;
                default:
                    keyMetadata = null;
                    break;
            }
            if (keyMetadata == null) {
                throw new KeyczarException(Messages.getString("KeyczarTool.UnsupportedPurpose", keyPurpose));
            } else if (mock != null) {
                mock.setMetadata(keyMetadata);
            } else if (str != null) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append("meta");
                File file = new File(sb.toString());
                if (!file.exists()) {
                    try {
                        FileOutputStream fileOutputStream = new FileOutputStream(file);
                        fileOutputStream.write(keyMetadata.toString().getBytes(Keyczar.DEFAULT_ENCODING));
                        fileOutputStream.close();
                    } catch (IOException e) {
                        throw new KeyczarException(Messages.getString("KeyczarTool.UnableToWrite", file.toString()), e);
                    }
                } else {
                    throw new KeyczarException(Messages.getString("KeyczarTool.FileExists", file));
                }
            } else {
                throw new KeyczarException(Messages.getString("KeyczarTool.MustDefineLocation", new Object[0]));
            }
        } else {
            throw new KeyczarException(Messages.getString("KeyczarTool.MustDefinePurpose", new Object[0]));
        }
    }

    private static GenericKeyczar createGenericKeyczar(String str) throws KeyczarException {
        return createGenericKeyczar(str, null);
    }

    private static GenericKeyczar createGenericKeyczar(String str, String str2) throws KeyczarException {
        if (mock != null) {
            return new GenericKeyczar((KeyczarReader) mock);
        }
        if (str != null) {
            KeyczarReader keyczarFileReader = new KeyczarFileReader(str);
            return new GenericKeyczar(str2 != null ? new KeyczarEncryptedReader(keyczarFileReader, new Crypter(str2)) : keyczarFileReader);
        }
        throw new KeyczarException(Messages.getString("KeyczarTool.NeedLocation", Messages.getString("KeyczarTool.Location", new Object[0])));
    }

    private static void demote(String str, int i) throws KeyczarException {
        if (i >= 0) {
            GenericKeyczar createGenericKeyczar = createGenericKeyczar(str);
            createGenericKeyczar.demote(i);
            updateGenericKeyczar(createGenericKeyczar, str);
            return;
        }
        throw new KeyczarException(Messages.getString("KeyczarTool.MissingVersion", new Object[0]));
    }

    private static void exportKey(String str, String str2, int i, String str3, String str4) throws KeyczarException {
        if (i >= 0) {
            GenericKeyczar createGenericKeyczar = createGenericKeyczar(str, str2);
            String pemString = createGenericKeyczar.getKey(createGenericKeyczar.getVersion(i)).getPemString(str4);
            try {
                File file = new File(str3);
                if (file.createNewFile()) {
                    new FileOutputStream(file).write(pemString.getBytes("UTF8"));
                } else {
                    throw new KeyczarException(Messages.getString("", file));
                }
            } catch (IOException e) {
                throw new KeyczarException(Messages.getString("", new Object[0]), e);
            }
        } else {
            throw new KeyczarException(Messages.getString("KeyczarTool.MissingVersion", new Object[0]));
        }
    }

    private static InputStream getFileStream(String str) throws KeyczarException {
        try {
            return new FileInputStream(str);
        } catch (FileNotFoundException unused) {
            throw new KeyczarException(Messages.getString("KeyczarTool.FileNotFound", str));
        }
    }

    private static GenericKeyczar getImportingKeyczar(String str, String str2, String str3, KeyPurpose keyPurpose) throws KeyczarException, IOException {
        Throwable th;
        InputStream fileStream;
        RsaPadding padding = getPadding(str2);
        InputStream fileStream2 = getFileStream(str);
        try {
            GenericKeyczar genericKeyczar = new GenericKeyczar((KeyczarReader) new X509CertificateReader(keyPurpose, fileStream2, padding));
            fileStream2.close();
            return genericKeyczar;
        } catch (KeyczarException e) {
            if (e.getCause() instanceof CertificateException) {
                fileStream2.close();
                fileStream = getFileStream(str);
                GenericKeyczar genericKeyczar2 = new GenericKeyczar((KeyczarReader) new PkcsKeyReader(keyPurpose, fileStream, padding, str3));
                fileStream.close();
                return genericKeyczar2;
            }
            throw e;
        } catch (Throwable th2) {
            fileStream2 = fileStream;
            th = th2;
        }
        fileStream2.close();
        throw th;
    }

    public static MockKeyczarReader getMock() {
        return mock;
    }

    private static RsaPadding getPadding(String str) throws KeyczarException {
        if (str == null) {
            return null;
        }
        try {
            return RsaPadding.valueOf(str.toUpperCase());
        } catch (IllegalArgumentException unused) {
            throw new KeyczarException(Messages.getString("InvalidPadding", str));
        }
    }

    private static void importKey(String str, String str2, KeyStatus keyStatus, String str3, String str4, String str5) throws KeyczarException, IOException {
        GenericKeyczar createGenericKeyczar = createGenericKeyczar(str, str3);
        KeyMetadata metadata = createGenericKeyczar.getMetadata();
        GenericKeyczar importingKeyczar = getImportingKeyczar(str2, str4, str5, metadata.getPurpose());
        KeyType type = importingKeyczar.getMetadata().getType();
        if (metadata.getType() != type && createGenericKeyczar.getVersions().isEmpty()) {
            metadata.setType(type);
        }
        createGenericKeyczar.addVersion(keyStatus, importingKeyczar.getPrimaryKey());
        updateGenericKeyczar(createGenericKeyczar, str3, str);
    }

    public static void main(String[] strArr) {
        String[] strArr2 = strArr;
        if (strArr2.length == 0) {
            printUsage();
            return;
        }
        try {
            Command command = Command.getCommand(strArr2[0]);
            HashMap hashMap = new HashMap();
            for (String str : strArr2) {
                if (str.startsWith("--")) {
                    String[] split = str.substring(2).split("=");
                    if (split.length > 1) {
                        hashMap.put(Flag.getFlag(split[0]), split[1]);
                    }
                }
            }
            String str2 = (String) hashMap.get(Flag.LOCATION);
            if (str2 != null && !str2.endsWith(File.separator)) {
                StringBuilder sb = new StringBuilder();
                sb.append(str2);
                sb.append(File.separator);
                str2 = sb.toString();
            }
            String str3 = str2;
            KeyPurpose purpose = KeyPurpose.getPurpose((String) hashMap.get(Flag.PURPOSE));
            KeyStatus status = KeyStatus.getStatus((String) hashMap.get(Flag.STATUS));
            String str4 = (String) hashMap.get(Flag.ASYMMETRIC);
            String str5 = (String) hashMap.get(Flag.CRYPTER);
            String str6 = (String) hashMap.get(Flag.DESTINATION);
            String str7 = (String) hashMap.get(Flag.NAME);
            String str8 = (String) hashMap.get(Flag.PADDING);
            String str9 = (String) hashMap.get(Flag.PASSPHRASE);
            String str10 = (String) hashMap.get(Flag.PEMFILE);
            String str11 = (String) hashMap.get(Flag.VERSION);
            int parseInt = hashMap.containsKey(Flag.SIZE) ? Integer.parseInt((String) hashMap.get(Flag.SIZE)) : -1;
            switch (command) {
                case CREATE:
                    create(str3, str7, purpose, str4);
                    return;
                case ADDKEY:
                    addKey(str3, status, str5, parseInt, str8);
                    return;
                case PUBKEY:
                    publicKeys(str3, str6);
                    return;
                case PROMOTE:
                    promote(str3, Integer.parseInt(str11));
                    return;
                case DEMOTE:
                    demote(str3, Integer.parseInt(str11));
                    return;
                case REVOKE:
                    revoke(str3, Integer.parseInt(str11));
                    return;
                case USEKEY:
                    if (strArr2.length > 2) {
                        useKey(strArr2[1], str3, str6, str5);
                        return;
                    } else {
                        printUsage();
                        return;
                    }
                case IMPORT_KEY:
                    importKey(str3, str10, status, str5, str8, str9);
                    return;
                case EXPORT_KEY:
                    exportKey(str3, str5, Integer.parseInt(str11), str10, str9);
                    return;
                default:
                    return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            printUsage();
        }
    }

    private static void printUsage() {
        ArrayList arrayList = new ArrayList();
        for (Command command : Command.values()) {
            arrayList.add(command.toString());
        }
        for (Flag flag : Flag.values()) {
            arrayList.add(flag.toString());
        }
        System.out.println(Messages.getString("KeyczarTool.Usage", arrayList.toArray()));
    }

    private static void promote(String str, int i) throws KeyczarException {
        if (i >= 0) {
            GenericKeyczar createGenericKeyczar = createGenericKeyczar(str);
            createGenericKeyczar.promote(i);
            updateGenericKeyczar(createGenericKeyczar, str);
            return;
        }
        throw new KeyczarException(Messages.getString("KeyczarTool.MissingVersion", new Object[0]));
    }

    private static void publicKeys(String str, String str2) throws KeyczarException {
        if (mock == null && str2 == null) {
            throw new KeyczarException(Messages.getString("KeyczarTool.MustDefineDestination", new Object[0]));
        } else {
            createGenericKeyczar(str).publicKeyExport(str2);
        }
    }

    private static void revoke(String str, int i) throws KeyczarException {
        GenericKeyczar createGenericKeyczar = createGenericKeyczar(str);
        createGenericKeyczar.revoke(i);
        updateGenericKeyczar(createGenericKeyczar, str);
        if (mock == null) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(i);
            if (!new File(sb.toString()).delete()) {
                throw new KeyczarException(Messages.getString("KeyczarTool.UnableToDelete", new Object[0]));
            }
            return;
        }
        mock.removeKey(i);
    }

    public static void setReader(MockKeyczarReader mockKeyczarReader) {
        mock = mockKeyczarReader;
    }

    private static void updateGenericKeyczar(GenericKeyczar genericKeyczar, String str) throws KeyczarException {
        updateGenericKeyczar(genericKeyczar, null, str);
    }

    private static void updateGenericKeyczar(GenericKeyczar genericKeyczar, String str, String str2) throws KeyczarException {
        if (mock != null) {
            mock.setMetadata(genericKeyczar.getMetadata());
            for (KeyVersion keyVersion : genericKeyczar.getVersions()) {
                mock.setKey(keyVersion.getVersionNumber(), genericKeyczar.getKey(keyVersion));
            }
        } else if (str != null) {
            genericKeyczar.writeEncrypted(str2, new Encrypter(str));
        } else {
            genericKeyczar.write(str2);
        }
    }

    private static void useKey(String str, String str2, String str3, String str4) throws KeyczarException {
        String str5;
        GenericKeyczar createGenericKeyczar = createGenericKeyczar(str2, str4);
        if (str3 != null) {
            KeyczarReader keyczarFileReader = new KeyczarFileReader(str2);
            KeyczarReader keyczarEncryptedReader = str4 != null ? new KeyczarEncryptedReader(keyczarFileReader, new Crypter(str4)) : keyczarFileReader;
            switch (createGenericKeyczar.getMetadata().getPurpose()) {
                case DECRYPT_AND_ENCRYPT:
                    str5 = new Crypter(keyczarEncryptedReader).encrypt(str);
                    break;
                case SIGN_AND_VERIFY:
                    str5 = new Signer(keyczarEncryptedReader).sign(str);
                    break;
                default:
                    throw new KeyczarException(Messages.getString("KeyczarTool.UnsupportedPurpose", createGenericKeyczar.getMetadata().getPurpose()));
            }
            createGenericKeyczar.writeFile(str5, str3);
            return;
        }
        throw new KeyczarException(Messages.getString("KeyczarTool.MustDefinePublic", new Object[0]));
    }
}
