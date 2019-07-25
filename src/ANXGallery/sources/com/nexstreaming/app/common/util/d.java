package com.nexstreaming.app.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: CopyUtil */
public class d {
    public static void a(InputStream inputStream, File file) throws IOException {
        byte[] bArr = new byte[1024];
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream fileOutputStream2 = new FileOutputStream(file);
            while (true) {
                try {
                    int read = inputStream.read(bArr);
                    if (read <= 0) {
                        fileOutputStream2.close();
                        return;
                    }
                    fileOutputStream2.write(bArr, 0, read);
                } catch (IOException e) {
                    e = e;
                    fileOutputStream = fileOutputStream2;
                } catch (Throwable th) {
                    th = th;
                    fileOutputStream = fileOutputStream2;
                    if (fileOutputStream != null) {
                        fileOutputStream.close();
                    }
                    throw th;
                }
            }
        } catch (IOException e2) {
            e = e2;
            try {
                throw e;
            } catch (Throwable th2) {
                th = th2;
            }
        }
    }
}
