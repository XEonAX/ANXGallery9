package com.xiaomi.channel.commonutils.file;

import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.util.Date;
import java.util.zip.GZIPOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class IOUtils {
    public static final String[] SUPPORTED_IMAGE_FORMATS = {"jpg", "png", "bmp", "gif", "webp"};

    public static void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Exception unused) {
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x0039  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x003e  */
    public static void copyFile(File file, File file2) throws IOException {
        InputStream inputStream;
        FileOutputStream fileOutputStream;
        if (!file.getAbsolutePath().equals(file2.getAbsolutePath())) {
            OutputStream outputStream = null;
            try {
                inputStream = new FileInputStream(file);
                try {
                    fileOutputStream = new FileOutputStream(file2);
                } catch (Throwable th) {
                    th = th;
                    if (inputStream != null) {
                    }
                    if (outputStream != null) {
                    }
                    throw th;
                }
                try {
                    byte[] bArr = new byte[1024];
                    while (true) {
                        int read = inputStream.read(bArr);
                        if (read >= 0) {
                            fileOutputStream.write(bArr, 0, read);
                        } else {
                            inputStream.close();
                            fileOutputStream.close();
                            return;
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                    outputStream = fileOutputStream;
                    if (inputStream != null) {
                        inputStream.close();
                    }
                    if (outputStream != null) {
                        outputStream.close();
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                inputStream = null;
                if (inputStream != null) {
                }
                if (outputStream != null) {
                }
                throw th;
            }
        }
    }

    public static boolean createFileQuietly(File file) {
        try {
            if (file.isDirectory()) {
                return false;
            }
            if (file.exists()) {
                return true;
            }
            File parentFile = file.getParentFile();
            if (parentFile.exists() || parentFile.mkdirs()) {
                return file.createNewFile();
            }
            return false;
        } catch (Throwable th) {
            th.printStackTrace();
            return false;
        }
    }

    public static String fileToStr(File file) {
        InputStreamReader inputStreamReader;
        StringWriter stringWriter = new StringWriter();
        try {
            inputStreamReader = new InputStreamReader(new BufferedInputStream(new FileInputStream(file)));
            try {
                char[] cArr = new char[2048];
                while (true) {
                    int read = inputStreamReader.read(cArr);
                    if (read != -1) {
                        stringWriter.write(cArr, 0, read);
                    } else {
                        String stringWriter2 = stringWriter.toString();
                        closeQuietly(inputStreamReader);
                        closeQuietly(stringWriter);
                        return stringWriter2;
                    }
                }
            } catch (IOException e) {
                e = e;
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("read file :");
                    sb.append(file.getAbsolutePath());
                    sb.append(" failure :");
                    sb.append(e.getMessage());
                    MyLog.v(sb.toString());
                    closeQuietly(inputStreamReader);
                    closeQuietly(stringWriter);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    closeQuietly(inputStreamReader);
                    closeQuietly(stringWriter);
                    throw th;
                }
            }
        } catch (IOException e2) {
            e = e2;
            inputStreamReader = null;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("read file :");
            sb2.append(file.getAbsolutePath());
            sb2.append(" failure :");
            sb2.append(e.getMessage());
            MyLog.v(sb2.toString());
            closeQuietly(inputStreamReader);
            closeQuietly(stringWriter);
            return null;
        } catch (Throwable th2) {
            th = th2;
            inputStreamReader = null;
            closeQuietly(inputStreamReader);
            closeQuietly(stringWriter);
            throw th;
        }
    }

    public static byte[] gZip(byte[] bArr) {
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
            gZIPOutputStream.write(bArr);
            gZIPOutputStream.finish();
            gZIPOutputStream.close();
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();
            return byteArray;
        } catch (Exception unused) {
            return bArr;
        }
    }

    public static void remove(File file) {
        if (file.isDirectory()) {
            File[] listFiles = file.listFiles();
            for (File remove : listFiles) {
                remove(remove);
            }
            file.delete();
        } else if (file.exists()) {
            file.delete();
        }
    }

    public static void strToFile(File file, String str) {
        if (!file.exists()) {
            StringBuilder sb = new StringBuilder();
            sb.append("mkdir ");
            sb.append(file.getAbsolutePath());
            MyLog.v(sb.toString());
            file.getParentFile().mkdirs();
        }
        BufferedWriter bufferedWriter = null;
        try {
            BufferedWriter bufferedWriter2 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file)));
            try {
                bufferedWriter2.write(str);
                closeQuietly(bufferedWriter2);
            } catch (IOException e) {
                e = e;
                bufferedWriter = bufferedWriter2;
                try {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("write file :");
                    sb2.append(file.getAbsolutePath());
                    sb2.append(" failure :");
                    sb2.append(e.getMessage());
                    MyLog.v(sb2.toString());
                    closeQuietly(bufferedWriter);
                } catch (Throwable th) {
                    th = th;
                    closeQuietly(bufferedWriter);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                bufferedWriter = bufferedWriter2;
                closeQuietly(bufferedWriter);
                throw th;
            }
        } catch (IOException e2) {
            e = e2;
            StringBuilder sb22 = new StringBuilder();
            sb22.append("write file :");
            sb22.append(file.getAbsolutePath());
            sb22.append(" failure :");
            sb22.append(e.getMessage());
            MyLog.v(sb22.toString());
            closeQuietly(bufferedWriter);
        }
    }

    public static void zip(File file, File file2) {
        ZipOutputStream zipOutputStream = null;
        try {
            ZipOutputStream zipOutputStream2 = new ZipOutputStream(new FileOutputStream(file, false));
            try {
                zip(zipOutputStream2, file2, null, null);
                closeQuietly(zipOutputStream2);
            } catch (FileNotFoundException unused) {
                zipOutputStream = zipOutputStream2;
                closeQuietly(zipOutputStream);
            } catch (IOException e) {
                e = e;
                zipOutputStream = zipOutputStream2;
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("zip file failure + ");
                    sb.append(e.getMessage());
                    MyLog.w(sb.toString());
                    closeQuietly(zipOutputStream);
                } catch (Throwable th) {
                    th = th;
                }
            } catch (Throwable th2) {
                th = th2;
                zipOutputStream = zipOutputStream2;
                closeQuietly(zipOutputStream);
                throw th;
            }
        } catch (FileNotFoundException unused2) {
            closeQuietly(zipOutputStream);
        } catch (IOException e2) {
            e = e2;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("zip file failure + ");
            sb2.append(e.getMessage());
            MyLog.w(sb2.toString());
            closeQuietly(zipOutputStream);
        }
    }

    public static void zip(ZipOutputStream zipOutputStream, File file, String str, FileFilter fileFilter) throws IOException {
        FileInputStream fileInputStream;
        String str2;
        if (str == null) {
            str = "";
        }
        FileInputStream fileInputStream2 = null;
        try {
            if (file.isDirectory()) {
                File[] listFiles = fileFilter != null ? file.listFiles(fileFilter) : file.listFiles();
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(File.separator);
                zipOutputStream.putNextEntry(new ZipEntry(sb.toString()));
                if (TextUtils.isEmpty(str)) {
                    str2 = "";
                } else {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(str);
                    sb2.append(File.separator);
                    str2 = sb2.toString();
                }
                for (int i = 0; i < listFiles.length; i++) {
                    File file2 = listFiles[i];
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(str2);
                    sb3.append(listFiles[i].getName());
                    zip(zipOutputStream, file2, sb3.toString(), null);
                }
                File[] listFiles2 = file.listFiles(new FileFilter() {
                    public boolean accept(File file) {
                        return file.isDirectory();
                    }
                });
                if (listFiles2 != null) {
                    for (File file3 : listFiles2) {
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append(str2);
                        sb4.append(File.separator);
                        sb4.append(file3.getName());
                        zip(zipOutputStream, file3, sb4.toString(), fileFilter);
                    }
                }
                fileInputStream = null;
            } else {
                if (!TextUtils.isEmpty(str)) {
                    zipOutputStream.putNextEntry(new ZipEntry(str));
                } else {
                    Date date = new Date();
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append(String.valueOf(date.getTime()));
                    sb5.append(".txt");
                    zipOutputStream.putNextEntry(new ZipEntry(sb5.toString()));
                }
                fileInputStream = new FileInputStream(file);
                try {
                    byte[] bArr = new byte[1024];
                    while (true) {
                        int read = fileInputStream.read(bArr);
                        if (read == -1) {
                            break;
                        }
                        zipOutputStream.write(bArr, 0, read);
                    }
                } catch (IOException e) {
                    e = e;
                    fileInputStream2 = fileInputStream;
                    try {
                        StringBuilder sb6 = new StringBuilder();
                        sb6.append("zipFiction failed with exception:");
                        sb6.append(e.toString());
                        MyLog.e(sb6.toString());
                        closeQuietly(fileInputStream2);
                    } catch (Throwable th) {
                        th = th;
                        closeQuietly(fileInputStream2);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    fileInputStream2 = fileInputStream;
                    closeQuietly(fileInputStream2);
                    throw th;
                }
            }
            closeQuietly(fileInputStream);
        } catch (IOException e2) {
            e = e2;
            StringBuilder sb62 = new StringBuilder();
            sb62.append("zipFiction failed with exception:");
            sb62.append(e.toString());
            MyLog.e(sb62.toString());
            closeQuietly(fileInputStream2);
        }
    }
}
