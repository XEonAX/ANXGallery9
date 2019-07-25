package cn.kuaipan.android.http.multipart;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

public class FilePartSource implements PartSource {
    private File file = null;
    private String fileName = null;

    public FilePartSource(File file2) throws FileNotFoundException {
        this.file = file2;
        if (file2 == null) {
            return;
        }
        if (!file2.isFile()) {
            throw new FileNotFoundException("File is not a normal file.");
        } else if (file2.canRead()) {
            this.fileName = file2.getName();
        } else {
            throw new FileNotFoundException("File is not readable.");
        }
    }

    public InputStream createInputStream() throws IOException {
        return this.file != null ? new FileInputStream(this.file) : new ByteArrayInputStream(new byte[0]);
    }

    public String getFileName() {
        return this.fileName == null ? "noname" : this.fileName;
    }

    public long getLength() {
        if (this.file != null) {
            return this.file.length();
        }
        return 0;
    }
}
