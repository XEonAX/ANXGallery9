package com.miui.gallery.video.editor.util;

import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.util.DocumentProviderUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.StorageUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class FileHelper {
    public static boolean createDir(String str) {
        File file = new File(str);
        if (file.exists()) {
            Log.d("FileHelper", "The target directory already exists");
            return true;
        } else if (file.mkdirs()) {
            Log.d("FileHelper", "create dir sucessed！");
            return true;
        } else {
            Log.d("FileHelper", "create dir failed！ ");
            return false;
        }
    }

    private static String generateFileName(String str, String str2, String str3, int i, boolean z) {
        StringBuilder sb = new StringBuilder();
        if (z && !str2.startsWith(".")) {
            sb.append(".");
        }
        sb.append(str2);
        sb.append("(");
        sb.append(String.valueOf(i));
        sb.append(")");
        if (!TextUtils.isEmpty(str3)) {
            sb.append(".");
            sb.append(str3);
        }
        File file = new File(str, sb.toString());
        return file.exists() ? generateFileName(str, str2, str3, i + 1, z) : file.getAbsolutePath();
    }

    public static String generateOutputFilePath(File file, boolean z) {
        String str;
        String str2 = null;
        if (file == null) {
            return null;
        }
        File parentFile = file.getParentFile();
        if (parentFile != null) {
            str2 = parentFile.getAbsolutePath();
        }
        if (TextUtils.isEmpty(str2)) {
            str2 = StorageUtils.getCreativeDirectory();
            FileUtils.createFolder(str2, false);
        } else if (DocumentProviderUtils.needUseDocumentProvider(str2)) {
            str2 = StorageUtils.getPathInPrimaryStorage(StorageUtils.getRelativePath(GalleryApp.sGetAndroidContext(), str2));
            FileUtils.createFolder(str2, false);
        }
        String str3 = "";
        int lastIndexOf = file.getName().lastIndexOf(".");
        if (lastIndexOf == -1 || lastIndexOf >= file.getName().length() - 1) {
            str = file.getName();
        } else {
            str3 = file.getName().substring(lastIndexOf + 1);
            str = file.getName().substring(0, lastIndexOf);
        }
        return generateFileName(str2, str, str3, 0, z);
    }

    public static String generateOutputFilePath(String str, boolean z) {
        if (!TextUtils.isEmpty(str)) {
            return generateOutputFilePath(new File(str), z);
        }
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:42:0x00e7 A[Catch:{ all -> 0x00fe }] */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x00f5 A[SYNTHETIC, Splitter:B:45:0x00f5] */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x0101 A[SYNTHETIC, Splitter:B:52:0x0101] */
    public static String unZipFile(String str, String str2) {
        ZipInputStream zipInputStream;
        File file = new File(str);
        if (!file.exists() || TextUtils.isEmpty(str2)) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(file.getParent());
        sb.append("/");
        sb.append(file.getName().replaceAll("[.][^.]+$", ""));
        File file2 = new File(sb.toString());
        StringBuilder sb2 = new StringBuilder();
        sb2.append(file2.getAbsolutePath());
        sb2.append("/");
        sb2.append(str2);
        if (!new File(sb2.toString()).exists()) {
            if (!file2.exists()) {
                file2.mkdirs();
            }
            try {
                zipInputStream = new ZipInputStream(new FileInputStream(file));
                try {
                    byte[] bArr = new byte[1024];
                    for (ZipEntry nextEntry = zipInputStream.getNextEntry(); nextEntry != null; nextEntry = zipInputStream.getNextEntry()) {
                        if (nextEntry.isDirectory()) {
                            File file3 = new File(file2, nextEntry.getName());
                            if (!file3.exists()) {
                                file3.mkdir();
                            }
                        } else {
                            File file4 = new File(file2, nextEntry.getName());
                            if (!file4.getParentFile().exists()) {
                                file4.getParentFile().mkdirs();
                            }
                            if (!file4.exists()) {
                                file4.createNewFile();
                                FileOutputStream fileOutputStream = new FileOutputStream(file4);
                                while (true) {
                                    int read = zipInputStream.read(bArr);
                                    if (read <= 0) {
                                        break;
                                    }
                                    fileOutputStream.write(bArr, 0, read);
                                }
                                fileOutputStream.close();
                            }
                        }
                    }
                    try {
                        zipInputStream.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } catch (IOException e2) {
                    e = e2;
                    try {
                        if (file2.exists()) {
                            file2.delete();
                        }
                        Log.e("FileHelper", e.toString());
                        if (zipInputStream != null) {
                            try {
                                zipInputStream.close();
                            } catch (IOException e3) {
                                e3.printStackTrace();
                            }
                        }
                        return null;
                    } catch (Throwable th) {
                        th = th;
                        if (zipInputStream != null) {
                            try {
                                zipInputStream.close();
                            } catch (IOException e4) {
                                e4.printStackTrace();
                            }
                        }
                        throw th;
                    }
                }
            } catch (IOException e5) {
                e = e5;
                zipInputStream = null;
                if (file2.exists()) {
                }
                Log.e("FileHelper", e.toString());
                if (zipInputStream != null) {
                }
                return null;
            } catch (Throwable th2) {
                th = th2;
                zipInputStream = null;
                if (zipInputStream != null) {
                }
                throw th;
            }
        }
        if (!file2.exists()) {
            return null;
        }
        if (file.exists()) {
            file.delete();
        }
        return file2.getAbsolutePath();
    }

    /* JADX WARNING: Removed duplicated region for block: B:45:0x00a7 A[Catch:{ all -> 0x00be }] */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00b5 A[SYNTHETIC, Splitter:B:48:0x00b5] */
    /* JADX WARNING: Removed duplicated region for block: B:55:0x00c1 A[SYNTHETIC, Splitter:B:55:0x00c1] */
    public static String unZipTemplateFile(String str, String str2) {
        ZipInputStream zipInputStream;
        File file = new File(str);
        if (!file.exists()) {
            return null;
        }
        File file2 = new File(str2);
        if (!file2.exists()) {
            file2.mkdirs();
        }
        try {
            zipInputStream = new ZipInputStream(new FileInputStream(file));
            try {
                byte[] bArr = new byte[1024];
                for (ZipEntry nextEntry = zipInputStream.getNextEntry(); nextEntry != null; nextEntry = zipInputStream.getNextEntry()) {
                    if (nextEntry.isDirectory()) {
                        File file3 = new File(file2, nextEntry.getName());
                        if (!file3.exists()) {
                            file3.mkdir();
                        }
                    } else {
                        File file4 = new File(file2, nextEntry.getName());
                        if (!file4.getParentFile().exists()) {
                            file4.getParentFile().mkdirs();
                        }
                        file4.createNewFile();
                        FileOutputStream fileOutputStream = new FileOutputStream(file4);
                        while (true) {
                            int read = zipInputStream.read(bArr);
                            if (read <= 0) {
                                break;
                            }
                            fileOutputStream.write(bArr, 0, read);
                        }
                        fileOutputStream.close();
                    }
                }
                try {
                    zipInputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                if (!file2.exists()) {
                    return null;
                }
                if (file.exists()) {
                    file.delete();
                }
                return file2.getAbsolutePath();
            } catch (IOException e2) {
                e = e2;
                try {
                    if (file2.exists()) {
                        file2.delete();
                    }
                    Log.e("FileHelper", e.toString());
                    if (zipInputStream != null) {
                        try {
                            zipInputStream.close();
                        } catch (IOException e3) {
                            e3.printStackTrace();
                        }
                    }
                    return null;
                } catch (Throwable th) {
                    th = th;
                    if (zipInputStream != null) {
                        try {
                            zipInputStream.close();
                        } catch (IOException e4) {
                            e4.printStackTrace();
                        }
                    }
                    throw th;
                }
            }
        } catch (IOException e5) {
            e = e5;
            zipInputStream = null;
            if (file2.exists()) {
            }
            Log.e("FileHelper", e.toString());
            if (zipInputStream != null) {
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            zipInputStream = null;
            if (zipInputStream != null) {
            }
            throw th;
        }
    }
}
