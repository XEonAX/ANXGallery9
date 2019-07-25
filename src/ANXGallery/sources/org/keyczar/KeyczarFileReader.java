package org.keyczar;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import org.keyczar.exceptions.KeyczarException;
import org.keyczar.i18n.Messages;
import org.keyczar.interfaces.KeyczarReader;

public class KeyczarFileReader implements KeyczarReader {
    static final String META_FILE = "meta";
    private String location;

    public KeyczarFileReader(String str) {
        if (str != null && !str.endsWith(File.separator)) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(File.separator);
            str = sb.toString();
        }
        this.location = str;
    }

    private String readFile(String str) throws KeyczarException {
        try {
            RandomAccessFile randomAccessFile = new RandomAccessFile(str, "r");
            byte[] bArr = new byte[((int) randomAccessFile.length())];
            randomAccessFile.read(bArr);
            randomAccessFile.close();
            return new String(bArr);
        } catch (IOException e) {
            throw new KeyczarException(Messages.getString("KeyczarFileReader.FileError", str), e);
        }
    }

    public String getKey() throws KeyczarException {
        return getKey(KeyMetadata.read(getMetadata()).getPrimaryVersion().getVersionNumber());
    }

    public String getKey(int i) throws KeyczarException {
        StringBuilder sb = new StringBuilder();
        sb.append(this.location);
        sb.append(i);
        return readFile(sb.toString());
    }

    public String getMetadata() throws KeyczarException {
        StringBuilder sb = new StringBuilder();
        sb.append(this.location);
        sb.append(META_FILE);
        return readFile(sb.toString());
    }
}
