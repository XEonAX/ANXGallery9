package com.miui.gallery.util;

import android.net.Uri;
import android.os.SystemClock;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CloudUtils.SecretAlbumUtils;
import com.miui.gallery.editor.photo.sdk.CleanService;
import java.io.File;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.locks.ReentrantLock;

public class SecretAlbumCryptoUtils {
    private static final Map<String, ReentrantLock> sFileLocks = new WeakHashMap();

    public static boolean decrypt(String str, String str2, boolean z, byte[] bArr) {
        return z ? CryptoUtil.decryptFileHeader(str, str2, bArr) : CryptoUtil.decryptFile(str, str2, bArr);
    }

    public static Uri decryptVideo2CacheFolder(Uri uri, byte[] bArr, long j) {
        String str;
        byte[] bArr2 = bArr;
        Uri uri2 = null;
        if (uri == null) {
            return null;
        }
        File secretFolder = getSecretFolder();
        if (secretFolder.exists() || secretFolder.mkdirs()) {
            String path = uri.getPath();
            File file = new File(path);
            if (!SecretAlbumUtils.isEncryptedVideoByPath(path)) {
                return Uri.fromFile(file);
            }
            if (!file.exists() || !file.isFile()) {
                return null;
            }
            File file2 = new File(secretFolder, generateDecryptFileName4Video(file, bArr2));
            ReentrantLock lockForFile = getLockForFile(file2.getPath());
            if (lockForFile.isLocked()) {
                Log.d("SecretAlbumCryptoUtils", "file is already decrypting, just waiting... %s", (Object) file2.getName());
            }
            lockForFile.lock();
            try {
                if (file2.exists()) {
                    Log.d("SecretAlbumCryptoUtils", "decrypted file [%s] already exists, reuse it", (Object) file2.getName());
                    uri2 = Uri.fromFile(file2);
                } else {
                    long currentTimeMillis = System.currentTimeMillis();
                    File file3 = new File(secretFolder, generateTempFileName(file2.getName()));
                    String path2 = file3.getPath();
                    if (bArr2 != null) {
                        str = SecretAlbumUtils.decryptFile(path, path2, true, bArr2, false);
                    } else {
                        str = SecretAlbumUtils.decryptFile(path, path2, true, j, false);
                        Log.d("SecretAlbumCryptoUtils", "decode %s and secret key is null", (Object) path);
                    }
                    Log.d("SecretAlbumCryptoUtils", "decrypt video costs %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                    if (file2.exists()) {
                        Log.d("SecretAlbumCryptoUtils", "decrypted file [%s] already exists", (Object) file2.getName());
                        uri2 = Uri.fromFile(file2);
                        Log.d("SecretAlbumCryptoUtils", "delete temp file");
                        FileUtils.deleteFile(file3);
                    } else if (str != null) {
                        if (file3.renameTo(file2)) {
                            uri2 = Uri.fromFile(file2);
                        } else {
                            Log.e("SecretAlbumCryptoUtils", "rename temp file failed");
                            FileUtils.deleteFile(file3);
                            FileUtils.deleteFile(file2);
                        }
                    }
                }
                if (uri2 != null) {
                    CleanService.schedule(GalleryApp.sGetAndroidContext(), secretFolder.getPath());
                }
                return uri2;
            } finally {
                lockForFile.unlock();
            }
        } else {
            Log.e("SecretAlbumCryptoUtils", "Failed to create secret temp folder!!!");
            return null;
        }
    }

    public static boolean encrypt(String str, String str2, boolean z, byte[] bArr) {
        return z ? CryptoUtil.encryptFileHeader(str, str2, bArr) : CryptoUtil.encryptFile(str, str2, bArr);
    }

    private static String generateDecryptFileName4Video(File file, byte[] bArr) {
        String absolutePath = file.getAbsolutePath();
        long length = file.length();
        String fileName = FileUtils.getFileName(FileUtils.getFileTitle(absolutePath));
        if (bArr != null) {
            StringBuilder sb = new StringBuilder();
            sb.append(".");
            sb.append(SecretAlbumUtils.getMD5Key(bArr));
            String sb2 = sb.toString();
            if (fileName.endsWith(sb2)) {
                fileName = fileName.substring(0, fileName.lastIndexOf(sb2));
            }
        }
        return String.format(Locale.US, "%s%s%d.mp4", new Object[]{fileName, "L", Long.valueOf(length)});
    }

    private static String generateTempFileName(String str) {
        return String.format(Locale.US, "temp_%s_%d", new Object[]{str, Long.valueOf(SystemClock.elapsedRealtimeNanos())});
    }

    private static ReentrantLock getLockForFile(String str) {
        ReentrantLock reentrantLock;
        synchronized (sFileLocks) {
            reentrantLock = (ReentrantLock) sFileLocks.get(str);
            if (reentrantLock == null) {
                reentrantLock = new ReentrantLock();
                sFileLocks.put(str, reentrantLock);
            }
        }
        return reentrantLock;
    }

    private static File getSecretFolder() {
        return new File(GalleryApp.sGetAndroidContext().getCacheDir(), ".temp_video_files");
    }
}
