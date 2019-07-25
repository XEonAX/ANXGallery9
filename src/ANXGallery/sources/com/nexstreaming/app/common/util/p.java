package com.nexstreaming.app.common.util;

import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/* compiled from: ZipUtil */
public class p {
    private static String a(int i) {
        if (i == 0) {
            return "STORED";
        }
        if (i == 8) {
            return "DEFLATED";
        }
        StringBuilder sb = new StringBuilder();
        sb.append("UNKNOWN_");
        sb.append(i);
        return sb.toString();
    }

    public static void a(File file, File file2) throws IOException {
        FileOutputStream fileOutputStream;
        StringBuilder sb = new StringBuilder();
        sb.append("Unzipping '");
        sb.append(file);
        sb.append("' to '");
        sb.append(file2);
        sb.append("'");
        Log.d("ZipUtil", sb.toString());
        if (file2.mkdirs() || file2.exists()) {
            ZipInputStream zipInputStream = new ZipInputStream(new FileInputStream(file));
            while (true) {
                try {
                    ZipEntry nextEntry = zipInputStream.getNextEntry();
                    if (nextEntry != null) {
                        String name = nextEntry.getName();
                        if (!name.contains("..")) {
                            File file3 = new File(file2, name);
                            if (nextEntry.isDirectory()) {
                                if (!file3.mkdirs()) {
                                    if (!file3.exists()) {
                                        StringBuilder sb2 = new StringBuilder();
                                        sb2.append("Failed to create directory: ");
                                        sb2.append(file3);
                                        throw new IOException(sb2.toString());
                                    }
                                }
                                StringBuilder sb3 = new StringBuilder();
                                sb3.append("  - unzip: made folder '");
                                sb3.append(name);
                                sb3.append("'");
                                Log.d("ZipUtil", sb3.toString());
                            } else {
                                StringBuilder sb4 = new StringBuilder();
                                sb4.append("  - unzip: unzipping file '");
                                sb4.append(name);
                                sb4.append("' ");
                                sb4.append(nextEntry.getCompressedSize());
                                sb4.append("->");
                                sb4.append(nextEntry.getSize());
                                sb4.append(" (");
                                sb4.append(a(nextEntry.getMethod()));
                                sb4.append(")");
                                Log.d("ZipUtil", sb4.toString());
                                fileOutputStream = new FileOutputStream(file3);
                                a((InputStream) zipInputStream, (OutputStream) fileOutputStream);
                                b.a(fileOutputStream);
                            }
                        } else {
                            throw new IOException("Relative paths not allowed");
                        }
                    } else {
                        b.a(zipInputStream);
                        StringBuilder sb5 = new StringBuilder();
                        sb5.append("Unzipping DONE for: '");
                        sb5.append(file);
                        sb5.append("' to '");
                        sb5.append(file2);
                        sb5.append("'");
                        Log.d("ZipUtil", sb5.toString());
                        return;
                    }
                } catch (Throwable th) {
                    b.a(zipInputStream);
                    throw th;
                }
            }
        } else {
            StringBuilder sb6 = new StringBuilder();
            sb6.append("Failed to create directory: ");
            sb6.append(file2);
            throw new IOException(sb6.toString());
        }
    }

    private static void a(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[4096];
        while (true) {
            int read = inputStream.read(bArr);
            if (-1 != read) {
                outputStream.write(bArr, 0, read);
            } else {
                return;
            }
        }
    }

    public static boolean a(File file) {
        try {
            FileInputStream fileInputStream = new FileInputStream(file);
            byte[] bArr = new byte[2];
            try {
                fileInputStream.read(bArr);
                fileInputStream.close();
                if (bArr[0] == 80 && bArr[1] == 75) {
                    return true;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("magic[0]=");
                sb.append(bArr[0]);
                sb.append(",magic[1]=");
                sb.append(bArr[1]);
                Log.d("ZipUtil", sb.toString());
                return false;
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e2) {
            e2.printStackTrace();
        }
    }
}
