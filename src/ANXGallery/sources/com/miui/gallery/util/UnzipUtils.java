package com.miui.gallery.util;

import com.nexstreaming.nexeditorsdk.nexEngine;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class UnzipUtils {
    private static final String TAG = "UnzipUtils";

    /* JADX WARNING: Removed duplicated region for block: B:42:0x00a0 A[Catch:{ all -> 0x00c0 }] */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x00ae A[SYNTHETIC, Splitter:B:45:0x00ae] */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x00bc  */
    /* JADX WARNING: Removed duplicated region for block: B:55:0x00c3 A[SYNTHETIC, Splitter:B:55:0x00c3] */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x00d1  */
    public static boolean unZipFile(String str) {
        ZipInputStream zipInputStream;
        IOException e;
        File file = new File(str);
        if (!file.exists()) {
            return false;
        }
        File file2 = new File(file.getParent());
        try {
            zipInputStream = new ZipInputStream(new FileInputStream(file));
            try {
                byte[] bArr = new byte[nexEngine.ExportHEVCMainTierLevel6];
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
                } catch (IOException e2) {
                    e2.printStackTrace();
                }
                if (file.exists()) {
                    file.delete();
                }
                return true;
            } catch (IOException e3) {
                e = e3;
                try {
                    if (file2.exists()) {
                        file2.delete();
                    }
                    Log.e(TAG, e.toString());
                    if (zipInputStream != null) {
                        try {
                            zipInputStream.close();
                        } catch (IOException e4) {
                            e4.printStackTrace();
                        }
                    }
                    if (file.exists()) {
                        file.delete();
                    }
                    return false;
                } catch (Throwable th) {
                    th = th;
                    if (zipInputStream != null) {
                        try {
                            zipInputStream.close();
                        } catch (IOException e5) {
                            e5.printStackTrace();
                        }
                    }
                    if (file.exists()) {
                        file.delete();
                    }
                    throw th;
                }
            }
        } catch (IOException e6) {
            IOException iOException = e6;
            zipInputStream = null;
            e = iOException;
            if (file2.exists()) {
            }
            Log.e(TAG, e.toString());
            if (zipInputStream != null) {
            }
            if (file.exists()) {
            }
            return false;
        } catch (Throwable th2) {
            th = th2;
            zipInputStream = null;
            if (zipInputStream != null) {
            }
            if (file.exists()) {
            }
            throw th;
        }
    }
}
