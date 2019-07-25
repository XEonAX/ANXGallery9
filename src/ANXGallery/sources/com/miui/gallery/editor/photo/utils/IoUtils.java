package com.miui.gallery.editor.photo.utils;

import android.content.Context;
import android.content.res.AssetManager;
import android.net.Uri;
import com.miui.gallery.util.Log;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import org.keyczar.Keyczar;

public final class IoUtils {
    public static final void close(Closeable closeable) {
        close("IoUtils", closeable);
    }

    public static final void close(String str, Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
                Log.w(str, (Throwable) e);
            }
        } else {
            Log.d(str, "res is null");
        }
    }

    public static String loadAssetFileString(AssetManager assetManager, String str) {
        InputStream inputStream;
        try {
            inputStream = assetManager.open(str);
            try {
                String readInputStreamToString = readInputStreamToString("IoUtils", inputStream);
                close(inputStream);
                return readInputStreamToString;
            } catch (IOException e) {
                e = e;
                try {
                    Log.e("IoUtils", (Throwable) e);
                    close(inputStream);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    close(inputStream);
                    throw th;
                }
            }
        } catch (IOException e2) {
            e = e2;
            inputStream = null;
            Log.e("IoUtils", (Throwable) e);
            close(inputStream);
            return null;
        } catch (Throwable th2) {
            th = th2;
            inputStream = null;
            close(inputStream);
            throw th;
        }
    }

    public static InputStream openInputStream(Context context, Uri uri) throws FileNotFoundException {
        return "file".equals(uri.getScheme()) ? new FileInputStream(uri.getPath()) : context.getContentResolver().openInputStream(uri);
    }

    public static InputStream openInputStream(String str, Context context, Uri uri) {
        try {
            return openInputStream(context, uri);
        } catch (FileNotFoundException e) {
            Log.e(str, (Throwable) e);
            return null;
        }
    }

    public static OutputStream openOutputStream(Context context, Uri uri) throws FileNotFoundException {
        return "file".equals(uri.getScheme()) ? new FileOutputStream(uri.getPath()) : context.getContentResolver().openOutputStream(uri);
    }

    public static OutputStream openOutputStream(String str, Context context, Uri uri) {
        try {
            return openOutputStream(context, uri);
        } catch (FileNotFoundException e) {
            Log.e(str, (Throwable) e);
            return null;
        }
    }

    public static Reader openReader(File file) {
        try {
            return new FileReader(file);
        } catch (FileNotFoundException e) {
            Log.w("IoUtils", (Throwable) e);
            return null;
        }
    }

    public static Writer openWriter(File file) {
        try {
            return new FileWriter(file);
        } catch (IOException e) {
            Log.w("IoUtils", (Throwable) e);
            return null;
        }
    }

    public static String readInputStreamToString(String str, InputStream inputStream) {
        return readInputStreamToString(str, inputStream, Keyczar.DEFAULT_ENCODING);
    }

    /* JADX INFO: finally extract failed */
    public static String readInputStreamToString(String str, InputStream inputStream, String str2) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bArr = new byte[1024];
        while (true) {
            try {
                int read = inputStream.read(bArr);
                if (read != -1) {
                    byteArrayOutputStream.write(bArr, 0, read);
                } else {
                    String byteArrayOutputStream2 = byteArrayOutputStream.toString(str2);
                    close(str, inputStream);
                    close(str, byteArrayOutputStream);
                    return byteArrayOutputStream2;
                }
            } catch (IOException e) {
                Log.e(str, (Throwable) e);
                close(str, inputStream);
                close(str, byteArrayOutputStream);
                return null;
            } catch (Throwable th) {
                close(str, inputStream);
                close(str, byteArrayOutputStream);
                throw th;
            }
        }
    }
}
