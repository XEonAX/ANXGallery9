package com.miui.gallery.editor.photo.core.imports.obsoletes;

import com.miui.gallery.util.Log;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Locale;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public abstract class ZipUtils {
    public static void unzip(File file, File file2) throws FileNotFoundException, IOException {
        ZipFile zipFile;
        BufferedOutputStream bufferedOutputStream;
        Log.d("ZipUtils", "unzip zipfile[%s] to [%s]", file, file2);
        if (file == null) {
            throw new NullPointerException("zip file can't be null");
        } else if (file2 == null) {
            throw new NullPointerException("unzip folder can't be null");
        } else if (!file.exists()) {
            throw new FileNotFoundException("zip file not exists");
        } else if (file2.exists() || file2.mkdirs()) {
            zipFile = new ZipFile(file);
            Enumeration entries = zipFile.entries();
            while (entries.hasMoreElements()) {
                ZipEntry zipEntry = (ZipEntry) entries.nextElement();
                InputStream inputStream = zipFile.getInputStream(zipEntry);
                try {
                    File file3 = new File(file2, zipEntry.getName());
                    Log.d("ZipUtils", "unzipping %s", (Object) zipEntry.getName());
                    if (!zipEntry.isDirectory()) {
                        bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(file3));
                        byte[] bArr = new byte[8192];
                        while (true) {
                            int read = inputStream.read(bArr);
                            if (read == -1) {
                                break;
                            }
                            bufferedOutputStream.write(bArr, 0, read);
                        }
                        bufferedOutputStream.flush();
                        bufferedOutputStream.close();
                        try {
                            inputStream.close();
                        } catch (IOException e) {
                            e = e;
                        }
                    } else if (file3.mkdirs()) {
                        try {
                            inputStream.close();
                        } catch (IOException e2) {
                            e = e2;
                        }
                    } else {
                        throw new IOException(String.format(Locale.US, "mkdir for %s failed", new Object[]{zipEntry.getName()}));
                    }
                } catch (IOException e3) {
                    e3.printStackTrace();
                } catch (Throwable th) {
                    inputStream.close();
                    throw th;
                }
            }
            try {
                zipFile.close();
                return;
            } catch (IOException e4) {
                e4.printStackTrace();
                return;
            }
        } else {
            throw new IOException("create folder failed");
        }
        try {
            e.printStackTrace();
        } catch (IOException e5) {
            e5.printStackTrace();
        } catch (Throwable th2) {
            try {
                zipFile.close();
            } catch (IOException e6) {
                e6.printStackTrace();
            }
            throw th2;
        }
    }
}
