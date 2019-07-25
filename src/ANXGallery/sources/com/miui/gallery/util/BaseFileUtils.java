package com.miui.gallery.util;

import android.support.v4.provider.DocumentFile;
import android.text.TextUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.Locale;
import miui.os.FileUtils;

public class BaseFileUtils extends FileUtils {
    public static String concat(String str, String str2) {
        String str3 = "";
        if (!TextUtils.isEmpty(str2) && !str2.startsWith(File.separator)) {
            str3 = File.separator;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(str3);
        sb.append(str2);
        return sb.toString();
    }

    public static boolean contains(String str, String str2) {
        if (str == null || str2 == null) {
            return false;
        }
        if (str.equals(str2)) {
            return true;
        }
        if (!str.endsWith("/")) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("/");
            str = sb.toString();
        }
        return str2.toLowerCase().startsWith(str.toLowerCase());
    }

    public static boolean deleteFile(File file) {
        boolean z;
        boolean z2 = false;
        if (file == null || !file.exists()) {
            return false;
        }
        if (BaseDocumentProviderUtils.needUseDocumentProvider(file.getAbsolutePath())) {
            boolean isDirectory = file.isDirectory();
            DocumentFile documentFile = BaseDocumentProviderUtils.getDocumentFile(StaticContext.sGetAndroidContext(), file);
            if (documentFile != null) {
                z2 = documentFile.delete();
            }
            if (isDirectory) {
                Log.i("BaseFileUtils", "delete folder [%s]'s files, result %s", file.getAbsolutePath(), Boolean.valueOf(z2));
            } else {
                Log.i("BaseFileUtils", "delete [%s]'s file, result %s", file.getAbsolutePath(), Boolean.valueOf(z2));
            }
            return z2;
        }
        if (file.isDirectory()) {
            z = rm(file.getAbsolutePath());
            Log.i("BaseFileUtils", "delete folder [%s]'s files, result %s", file.getAbsolutePath(), Boolean.valueOf(z));
        } else {
            z = file.delete();
            if (!z) {
                Log.e("BaseFileUtils", "File.delete() returns false %s", (Object) file.getAbsoluteFile());
                z = file.delete();
                Log.d("BaseFileUtils", "Try File.delete() again. return %s", (Object) Boolean.valueOf(z));
            }
            Log.i("BaseFileUtils", "delete [%s]'s file, result %s", file.getAbsolutePath(), Boolean.valueOf(z));
        }
        return z;
    }

    public static int getBucketID(String str) {
        if (TextUtils.isEmpty(str)) {
            return -1;
        }
        return str.toLowerCase(Locale.ENGLISH).hashCode();
    }

    public static String getFileName(String str) {
        String trim = str == null ? null : str.trim();
        String str2 = "";
        if (TextUtils.isEmpty(trim)) {
            return str2;
        }
        if (trim.endsWith(File.separator)) {
            trim = trim.substring(0, trim.length() - 1);
        }
        return trim.substring(trim.lastIndexOf(File.separator) + 1);
    }

    public static String getFileNameWithoutExtension(String str) {
        String fileName = getFileName(str);
        if (TextUtils.isEmpty(fileName)) {
            return fileName;
        }
        int lastIndexOf = str.lastIndexOf(46);
        return lastIndexOf > 0 ? str.substring(0, lastIndexOf) : fileName;
    }

    public static long getFileSize(String str) {
        if (!TextUtils.isEmpty(str)) {
            return new File(str).length();
        }
        return 0;
    }

    public static String getFileTitle(String str) {
        if (TextUtils.isEmpty(str)) {
            return "";
        }
        int lastIndexOf = str.lastIndexOf(".");
        return lastIndexOf > -1 ? str.substring(0, lastIndexOf) : str;
    }

    public static String getParentFolderPath(String str) {
        if (TextUtils.isEmpty(str)) {
            return "";
        }
        int lastIndexOf = str.lastIndexOf(File.separator);
        return lastIndexOf > -1 ? str.substring(0, lastIndexOf) : str;
    }

    public static boolean isFileExist(String str) {
        return !TextUtils.isEmpty(str) && new File(str).exists();
    }

    /* JADX WARNING: Removed duplicated region for block: B:53:0x008d  */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x00a9  */
    /* JADX WARNING: Removed duplicated region for block: B:83:0x00be  */
    /* JADX WARNING: Removed duplicated region for block: B:84:0x00c2  */
    /* JADX WARNING: Removed duplicated region for block: B:90:0x00c9  */
    /* JADX WARNING: Removed duplicated region for block: B:91:0x00cd  */
    public static boolean renameFile(File file, File file2) {
        boolean z;
        Throwable th;
        Throwable th2;
        Throwable th3;
        boolean z2 = true;
        if (file.renameTo(file2)) {
            return true;
        }
        if (!BaseDocumentProviderUtils.needUseDocumentProvider(file2.getAbsolutePath())) {
            try {
                FileChannel channel = new FileInputStream(file).getChannel();
                Throwable th4 = null;
                try {
                    FileChannel channel2 = new FileOutputStream(file2).getChannel();
                    try {
                        long size = channel.size();
                        long transferTo = channel.transferTo(0, size, channel2);
                        if (size != transferTo) {
                            z2 = false;
                        }
                        if (!z2) {
                            try {
                                Log.w("BaseFileUtils", "transfer error, expect count %s, actual count %s", Long.valueOf(size), Long.valueOf(transferTo));
                            } catch (Throwable th5) {
                                th = th5;
                                z = z2;
                                th2 = null;
                                if (channel2 != null) {
                                }
                                throw th;
                            }
                        }
                        if (channel2 != null) {
                            try {
                                channel2.close();
                            } catch (Throwable th6) {
                                th = th6;
                                z = z2;
                                if (channel != null) {
                                }
                                throw th;
                            }
                        }
                        if (channel != null) {
                            try {
                                channel.close();
                            } catch (IOException unused) {
                                z = z2;
                            } catch (Throwable th7) {
                                th = th7;
                                z = z2;
                                if (z) {
                                }
                                throw th;
                            }
                        }
                        if (z2) {
                            deleteFile(file);
                        } else {
                            deleteFile(file2);
                        }
                        return z2;
                    } catch (Throwable th8) {
                        th = th8;
                        th2 = null;
                        z = false;
                        if (channel2 != null) {
                            if (th2 != null) {
                                try {
                                    channel2.close();
                                } catch (Throwable th9) {
                                    th4 = th9;
                                    try {
                                        throw th4;
                                    } catch (Throwable th10) {
                                        th = th10;
                                    }
                                }
                            } else {
                                channel2.close();
                            }
                        }
                        throw th;
                    }
                } catch (Throwable th11) {
                    th = th11;
                    z = false;
                    if (channel != null) {
                        if (th4 != null) {
                            try {
                                channel.close();
                            } catch (Throwable th12) {
                                try {
                                    th4.addSuppressed(th12);
                                } catch (IOException unused2) {
                                    if (!z) {
                                    }
                                    return false;
                                } catch (Throwable th13) {
                                    th = th13;
                                    if (z) {
                                    }
                                    throw th;
                                }
                            }
                        } else {
                            channel.close();
                        }
                    }
                    throw th;
                }
            } catch (IOException unused3) {
                z = false;
                if (!z) {
                    deleteFile(file);
                } else {
                    deleteFile(file2);
                }
                return false;
            } catch (Throwable th14) {
                th = th14;
                z = false;
                if (z) {
                    deleteFile(file);
                } else {
                    deleteFile(file2);
                }
                throw th;
            }
        } else if (copyFile(file, file2)) {
            deleteFile(file);
            return true;
        }
        return false;
    }
}
