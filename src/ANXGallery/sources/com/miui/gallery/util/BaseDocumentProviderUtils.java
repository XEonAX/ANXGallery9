package com.miui.gallery.util;

import android.content.Context;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.ParcelFileDescriptor;
import android.support.v4.provider.DocumentFile;
import android.text.TextUtils;
import com.miui.gallery.preference.BaseGalleryPreferences.BaseDocumentProvider;
import java.io.File;
import java.io.FileOutputStream;

public class BaseDocumentProviderUtils {

    public interface WriteHandler<T> {
        T handle(FileOutputStream fileOutputStream);
    }

    private static DocumentFile findFileIgnoreCase(DocumentFile documentFile, String str) {
        DocumentFile[] listFiles;
        for (DocumentFile documentFile2 : documentFile.listFiles()) {
            if (str.equalsIgnoreCase(documentFile2.getName())) {
                return documentFile2;
            }
        }
        return null;
    }

    public static DocumentFile getDocumentFile(Context context, File file) {
        return getDocumentFileOrDir(context, file, false);
    }

    public static DocumentFile getDocumentFileDirectory(Context context, File file) {
        return getDocumentFileOrDir(context, file, true);
    }

    private static DocumentFile getDocumentFileOrDir(Context context, File file, boolean z) {
        if (context == null) {
            Log.d("BaseDocumentProviderUtils", "getDocumentFileOrDir context null");
            return null;
        }
        String volumePath = StorageUtils.getVolumePath(context, file.getAbsolutePath());
        if (volumePath == null) {
            Log.d("BaseDocumentProviderUtils", "getDocumentFileOrDir basefolder null");
            return null;
        }
        String relativePath = StorageUtils.getRelativePath(context, file.getAbsolutePath());
        int i = 0;
        boolean z2 = relativePath == StorageUtils.KEY_FOR_EMPTY_RELATIVE_PATH;
        String uri = BaseDocumentProvider.getUri(volumePath);
        if (TextUtils.isEmpty(uri)) {
            return null;
        }
        DocumentFile fromTreeUri = DocumentFile.fromTreeUri(context, Uri.parse(uri));
        if (z2) {
            return fromTreeUri;
        }
        String mimeType = BaseFileMimeUtil.getMimeType(file.getAbsolutePath());
        String[] split = relativePath.split(File.separator);
        while (i < split.length) {
            try {
                DocumentFile findFileIgnoreCase = findFileIgnoreCase(fromTreeUri, split[i]);
                if (findFileIgnoreCase == null) {
                    if (i >= split.length - 1 && !file.isDirectory()) {
                        if (!z) {
                            fromTreeUri = fromTreeUri.createFile(mimeType, split[i]);
                        }
                    }
                    fromTreeUri = fromTreeUri.createDirectory(split[i]);
                    if (fromTreeUri == null) {
                        return null;
                    }
                } else {
                    fromTreeUri = findFileIgnoreCase;
                }
                i++;
            } catch (Exception e) {
                Log.e("BaseDocumentProviderUtils", (Throwable) e);
                fromTreeUri = null;
            }
        }
        return fromTreeUri;
    }

    public static boolean needRequestExternalSDCardPermission(Context context) {
        return VERSION.SDK_INT >= 28 && StorageUtils.hasExternalSDCard(context) && TextUtils.isEmpty(BaseDocumentProvider.getExternalSDCardUri());
    }

    public static boolean needUseDocumentProvider(String str) {
        return VERSION.SDK_INT >= 28 && StorageUtils.isInSecondaryStorage(str);
    }

    public static ParcelFileDescriptor openFileDescriptor(Context context, String str) {
        if (context == null || TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            DocumentFile documentFile = getDocumentFile(context, new File(str));
            if (documentFile != null) {
                return context.getContentResolver().openFileDescriptor(documentFile.getUri(), "rw");
            }
            Log.e("BaseDocumentProviderUtils", "Failed to get document for file %s", (Object) str);
            return null;
        } catch (Exception e) {
            Log.e("BaseDocumentProviderUtils", "Failed to get file descriptor for %s, %s", str, e);
            return null;
        }
    }

    public static <T> T safeWriteFile(String str, WriteHandler<T> writeHandler) {
        ParcelFileDescriptor parcelFileDescriptor;
        FileOutputStream fileOutputStream;
        Context sGetAndroidContext = StaticContext.sGetAndroidContext();
        FileOutputStream fileOutputStream2 = null;
        try {
            if (needUseDocumentProvider(str)) {
                parcelFileDescriptor = openFileDescriptor(sGetAndroidContext, str);
                if (parcelFileDescriptor == null) {
                    BaseMiscUtil.closeSilently(null);
                    BaseMiscUtil.closeSilently(parcelFileDescriptor);
                    return null;
                }
                try {
                    fileOutputStream = new FileOutputStream(parcelFileDescriptor.getFileDescriptor());
                } catch (Exception e) {
                    e = e;
                    fileOutputStream = null;
                } catch (Throwable th) {
                    th = th;
                    BaseMiscUtil.closeSilently(fileOutputStream2);
                    BaseMiscUtil.closeSilently(parcelFileDescriptor);
                    throw th;
                }
            } else {
                fileOutputStream = new FileOutputStream(str);
                parcelFileDescriptor = null;
            }
            try {
                T handle = writeHandler.handle(fileOutputStream);
                BaseMiscUtil.closeSilently(fileOutputStream);
                BaseMiscUtil.closeSilently(parcelFileDescriptor);
                return handle;
            } catch (Exception e2) {
                e = e2;
                try {
                    Log.e("BaseDocumentProviderUtils", "Failed to write file: %s", (Object) e);
                    BaseMiscUtil.closeSilently(fileOutputStream);
                    BaseMiscUtil.closeSilently(parcelFileDescriptor);
                    return null;
                } catch (Throwable th2) {
                    th = th2;
                    fileOutputStream2 = fileOutputStream;
                    BaseMiscUtil.closeSilently(fileOutputStream2);
                    BaseMiscUtil.closeSilently(parcelFileDescriptor);
                    throw th;
                }
            }
        } catch (Exception e3) {
            e = e3;
            parcelFileDescriptor = null;
            fileOutputStream = null;
            Log.e("BaseDocumentProviderUtils", "Failed to write file: %s", (Object) e);
            BaseMiscUtil.closeSilently(fileOutputStream);
            BaseMiscUtil.closeSilently(parcelFileDescriptor);
            return null;
        } catch (Throwable th3) {
            th = th3;
            parcelFileDescriptor = null;
            BaseMiscUtil.closeSilently(fileOutputStream2);
            BaseMiscUtil.closeSilently(parcelFileDescriptor);
            throw th;
        }
    }
}
