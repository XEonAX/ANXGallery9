package com.miui.gallery.editor.photo.utils;

import android.os.MemoryFile;
import android.os.ParcelFileDescriptor;
import com.miui.gallery.util.ReflectUtils;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.IOException;

public class MemoryFileUtils {
    public static MemoryFile createMemoryFile(String str, int i) {
        try {
            return new MemoryFile(str, i);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static FileDescriptor getFileDescriptor(MemoryFile memoryFile) {
        if (memoryFile != null) {
            return (FileDescriptor) ReflectUtils.invoke("android.os.MemoryFile", memoryFile, "getFileDescriptor", new Object[0]);
        }
        throw new IllegalArgumentException("memoryFile can not be null");
    }

    public static FileInputStream getInputStream(ParcelFileDescriptor parcelFileDescriptor) {
        if (parcelFileDescriptor != null) {
            return new FileInputStream(parcelFileDescriptor.getFileDescriptor());
        }
        throw new IllegalArgumentException("ParcelFileDescriptor can not be null");
    }

    public static ParcelFileDescriptor getParcelFileDescriptor(MemoryFile memoryFile) {
        if (memoryFile != null) {
            return (ParcelFileDescriptor) ReflectUtils.getInstance("android.os.ParcelFileDescriptor", getFileDescriptor(memoryFile));
        }
        throw new IllegalArgumentException("memoryFile can not be null");
    }
}
