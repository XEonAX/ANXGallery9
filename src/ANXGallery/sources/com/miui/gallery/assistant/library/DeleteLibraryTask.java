package com.miui.gallery.assistant.library;

import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.pendingtask.PendingTaskManager;
import com.miui.gallery.pendingtask.base.PendingTask;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.io.File;
import java.util.HashSet;

public class DeleteLibraryTask extends PendingTask {
    public DeleteLibraryTask(int i) {
        super(i);
    }

    private boolean isDownloadTempFile(File file) {
        return file != null && file.getName().endsWith(".download");
    }

    public static void post() {
        PendingTaskManager.getInstance().postTask(8, null);
    }

    public int getNetworkType() {
        return 0;
    }

    public Object parseData(byte[] bArr) throws Exception {
        return new Object();
    }

    public boolean process(Object obj) throws Exception {
        Long[] lArr = LibraryConstants.sAllLibraries;
        HashSet hashSet = new HashSet();
        if (lArr == null || lArr.length <= 0 || !LibraryManager.getInstance().isInitialized()) {
            return false;
        }
        for (Long longValue : lArr) {
            Library librarySync = LibraryManager.getInstance().getLibrarySync(longValue.longValue());
            if (librarySync == null || !MiscUtil.isValid(librarySync.getLibraryItems())) {
                return false;
            }
            for (LibraryItem sha1 : librarySync.getLibraryItems()) {
                hashSet.add(sha1.getSha1());
            }
        }
        File dir = GalleryApp.sGetAndroidContext().getDir("libs", 0);
        if (dir.exists() && dir.isDirectory()) {
            File[] listFiles = dir.listFiles();
            if (listFiles != null && listFiles.length > 0) {
                for (File file : listFiles) {
                    String sha12 = FileUtils.getSha1(file);
                    if (!TextUtils.isEmpty(sha12) && !hashSet.contains(sha12) && !isDownloadTempFile(file)) {
                        Log.e("DeleteLibraryTask", "Overdue Library item file (%s) delete success:%b", file.getName(), Boolean.valueOf(FileUtils.deleteFile(file)));
                    }
                }
            }
        }
        return false;
    }

    public boolean requireCharging() {
        return false;
    }

    public boolean requireDeviceIdle() {
        return true;
    }

    public byte[] wrapData(Object obj) throws Exception {
        return new byte[0];
    }
}
