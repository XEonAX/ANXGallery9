package com.miui.gallery.cloud;

import android.content.ContentValues;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.miui.gallery.cloud.thread.BackUploadTask;
import com.miui.gallery.cloud.thread.BaseTask;
import com.miui.gallery.cloud.thread.RequestCommandQueue.OnItemChangedListener;
import com.miui.gallery.cloud.thread.TaskFactory;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

public class UpDownloadManager {
    private static final int[] DOWNLOAD_FILE_PRIORITY = {9, 10, 11};
    private static final Map<Integer, Integer> PRIORITY_ELEMENTS;
    private static final Map<Integer, ThreadElement> THREAD_ELEMENTS;
    private static final TaskFactory sFactory = new TaskFactory() {
        public BaseTask createTask(int i, int i2, int i3, int i4, OnItemChangedListener onItemChangedListener) {
            switch (i) {
                case 0:
                case 1:
                    BackUploadTask backUploadTask = new BackUploadTask(i, i2, i3, i4, onItemChangedListener);
                    return backUploadTask;
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                    throw new UnsupportedOperationException("this api is deprecated");
                default:
                    return null;
            }
        }
    };
    private static final UpDownloadManager[] sInstances = new UpDownloadManager[8];
    private final RequestItemExecutor mExecutor;
    private final OnItemChangedDecorator mItemChangedListener = new OnItemChangedDecorator();

    private class OnItemChangedDecorator implements OnItemChangedListener {
        final List<OnItemChangedListener> mListeners;

        private OnItemChangedDecorator() {
            this.mListeners = Lists.newArrayList();
        }

        public void addOnItemChangedListener(OnItemChangedListener onItemChangedListener) {
            synchronized (this.mListeners) {
                this.mListeners.add(onItemChangedListener);
            }
        }

        public void onAddItem(RequestCloudItem requestCloudItem) {
            UpDownloadManager.startDownload(requestCloudItem);
            synchronized (this.mListeners) {
                for (OnItemChangedListener onAddItem : this.mListeners) {
                    onAddItem.onAddItem(requestCloudItem);
                }
            }
        }

        public void onRemoveItem(RequestCloudItem requestCloudItem) {
            UpDownloadManager.endDownload(requestCloudItem);
            synchronized (this.mListeners) {
                for (OnItemChangedListener onRemoveItem : this.mListeners) {
                    onRemoveItem.onRemoveItem(requestCloudItem);
                }
            }
        }
    }

    static class ThreadElement {
        int batchSize;
        int commandMaxSize;
        int type;

        public ThreadElement(int i, int i2, int i3) {
            this.type = i;
            this.batchSize = i2;
            this.commandMaxSize = i3;
        }
    }

    static {
        HashMap newHashMap = Maps.newHashMap();
        newHashMap.put(Integer.valueOf(0), new ThreadElement(0, 10, -1));
        newHashMap.put(Integer.valueOf(1), new ThreadElement(1, 2, -1));
        newHashMap.put(Integer.valueOf(2), new ThreadElement(2, 10, -1));
        newHashMap.put(Integer.valueOf(3), new ThreadElement(3, 1, 30));
        newHashMap.put(Integer.valueOf(4), new ThreadElement(4, 10, 100));
        newHashMap.put(Integer.valueOf(5), new ThreadElement(5, 1, -1));
        newHashMap.put(Integer.valueOf(6), new ThreadElement(6, 1, -1));
        newHashMap.put(Integer.valueOf(7), new ThreadElement(7, 1, -1));
        THREAD_ELEMENTS = Collections.unmodifiableMap(newHashMap);
        HashMap newHashMap2 = Maps.newHashMap();
        newHashMap2.put(Integer.valueOf(0), Integer.valueOf(-1));
        newHashMap2.put(Integer.valueOf(1), Integer.valueOf(-1));
        newHashMap2.put(Integer.valueOf(2), Integer.valueOf(1));
        newHashMap2.put(Integer.valueOf(3), Integer.valueOf(1));
        newHashMap2.put(Integer.valueOf(4), Integer.valueOf(0));
        newHashMap2.put(Integer.valueOf(5), Integer.valueOf(0));
        newHashMap2.put(Integer.valueOf(6), Integer.valueOf(2));
        newHashMap2.put(Integer.valueOf(8), Integer.valueOf(2));
        newHashMap2.put(Integer.valueOf(7), Integer.valueOf(2));
        newHashMap2.put(Integer.valueOf(9), Integer.valueOf(7));
        newHashMap2.put(Integer.valueOf(10), Integer.valueOf(5));
        newHashMap2.put(Integer.valueOf(11), Integer.valueOf(6));
        newHashMap2.put(Integer.valueOf(12), Integer.valueOf(3));
        newHashMap2.put(Integer.valueOf(13), Integer.valueOf(4));
        PRIORITY_ELEMENTS = Collections.unmodifiableMap(newHashMap2);
    }

    private UpDownloadManager(int i) {
        this.mExecutor = new RequestItemExecutor(sFactory.createTask(i, PRIORITY_ELEMENTS.size(), getBatchLimit(i), getCommandMaxSize(i), this.mItemChangedListener));
    }

    public static void cancel(int i, boolean z, boolean z2) {
        int threadType = getThreadType(i);
        if (threadType == -1) {
            StringBuilder sb = new StringBuilder();
            sb.append("invalid thread type, priority=");
            sb.append(i);
            Log.w("UpDownloadManager", sb.toString());
            Thread.dumpStack();
            return;
        }
        if (sInstances[threadType] != null) {
            sInstances[threadType].cancelAll(i, z, z2);
        }
    }

    public static void cancelAllBackgroundPriority(boolean z, boolean z2) {
        HashSet hashSet = new HashSet();
        for (Entry entry : PRIORITY_ELEMENTS.entrySet()) {
            if (RequestItemBase.isBackgroundPriority(((Integer) entry.getKey()).intValue()) && ((Integer) entry.getValue()).intValue() != -1 && !hashSet.contains(entry.getValue())) {
                UpDownloadManager upDownloadManager = sInstances[((Integer) entry.getValue()).intValue()];
                if (upDownloadManager != null) {
                    upDownloadManager.cancelAll(z, z2);
                    hashSet.add(entry.getValue());
                }
            }
        }
    }

    private static void deleteTempFile(RequestCloudItem requestCloudItem) {
        String downloadTempFilePath = requestCloudItem.getDownloadTempFilePath();
        File file = new File(downloadTempFilePath);
        StringBuilder sb = new StringBuilder();
        sb.append(file.getParent());
        sb.append("/.");
        sb.append(file.getName());
        sb.append(".kinfo");
        String sb2 = sb.toString();
        MediaFileUtils.deleteFileType(FileType.TEMP, downloadTempFilePath);
        MediaFileUtils.deleteFileType(FileType.TEMP, sb2);
    }

    public static int dispatchList(List<RequestCloudItem> list) {
        return dispatchList(list, false);
    }

    public static int dispatchList(List<RequestCloudItem> list, boolean z) {
        if (list.isEmpty()) {
            return 0;
        }
        return instance(((RequestCloudItem) list.get(0)).priority).invokeList(list, z);
    }

    /* access modifiers changed from: private */
    public static void endDownload(RequestCloudItem requestCloudItem) {
        if (needPersisit(requestCloudItem)) {
            StringBuilder sb = new StringBuilder();
            sb.append(requestCloudItem.getIdentity());
            sb.append(" end download, status=");
            sb.append(requestCloudItem.getStatus());
            Log.d("UpDownloadManager", sb.toString());
            int status = requestCloudItem.getStatus();
            DBImage dBImage = requestCloudItem.dbCloud;
            switch (status) {
                case -1:
                case 0:
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("bad status: status=");
                    sb2.append(status);
                    sb2.append(", file name=");
                    sb2.append(requestCloudItem.getFileName());
                    Log.e("UpDownloadManager", sb2.toString());
                    break;
                case 1:
                    toDatabase(dBImage, 2);
                    break;
                case 2:
                    toDatabase(dBImage, 3);
                    break;
                case 3:
                    toDatabase(dBImage, 0);
                    deleteTempFile(requestCloudItem);
                    break;
            }
        }
    }

    private static int getBatchLimit(int i) {
        return ((ThreadElement) THREAD_ELEMENTS.get(Integer.valueOf(i))).batchSize;
    }

    private static int getCommandMaxSize(int i) {
        return ((ThreadElement) THREAD_ELEMENTS.get(Integer.valueOf(i))).commandMaxSize;
    }

    public static int getThreadType(int i) {
        return ((Integer) PRIORITY_ELEMENTS.get(Integer.valueOf(i))).intValue();
    }

    public static UpDownloadManager instance(int i) {
        return instanceInternel(getThreadType(i));
    }

    private static synchronized UpDownloadManager instanceInternel(int i) {
        UpDownloadManager upDownloadManager;
        synchronized (UpDownloadManager.class) {
            if (sInstances[i] == null) {
                sInstances[i] = new UpDownloadManager(i);
            }
            upDownloadManager = sInstances[i];
        }
        return upDownloadManager;
    }

    public static int mapStatusToRequestItem(int i) {
        switch (i) {
            case 0:
                return -1;
            case 1:
                return 0;
            case 2:
                return 1;
            case 3:
                return 2;
            default:
                return -1;
        }
    }

    private static boolean needPersisit(RequestCloudItem requestCloudItem) {
        int i = requestCloudItem.priority;
        for (int i2 : DOWNLOAD_FILE_PRIORITY) {
            if (i2 == i) {
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: private */
    public static void startDownload(RequestCloudItem requestCloudItem) {
        if (needPersisit(requestCloudItem)) {
            StringBuilder sb = new StringBuilder();
            sb.append(requestCloudItem.getIdentity());
            sb.append(" start download");
            Log.d("UpDownloadManager", sb.toString());
            toDatabase(requestCloudItem.dbCloud, 1);
        }
    }

    private static void toDatabase(DBImage dBImage, int i) {
        if (i == 1) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("downloadFileTime", Long.valueOf(System.currentTimeMillis()));
            GalleryUtils.safeUpdate(dBImage.getBaseUri(), contentValues, String.format(Locale.US, "(%s) AND (%s is null OR %s=%d)", new Object[]{"_id=?", "downloadFileStatus", "downloadFileStatus", Integer.valueOf(0)}), new String[]{dBImage.getId()});
        }
        ContentValues contentValues2 = new ContentValues();
        contentValues2.put("downloadFileStatus", Integer.valueOf(i));
        if (i != 3) {
            contentValues2.put("localFile", "");
        }
        GalleryUtils.safeUpdate(dBImage.getBaseUri(), contentValues2, "_id=?", new String[]{dBImage.getId()});
    }

    public void addOnItemChangedListener(OnItemChangedListener onItemChangedListener) {
        this.mItemChangedListener.addOnItemChangedListener(onItemChangedListener);
    }

    public void cancelAll(int i, boolean z, boolean z2) {
        this.mExecutor.cancelAll(i, z, z2);
    }

    public void cancelAll(boolean z, boolean z2) {
        for (int i = 0; i < 14; i++) {
            if (!(SyncConditionManager.check(i) == 0 || getThreadType(i) == -1)) {
                this.mExecutor.cancelAll(i, z, z2);
            }
        }
    }

    public boolean hasDelayedItem() {
        return this.mExecutor.hasDelayedItem();
    }

    public int invokeList(List<RequestCloudItem> list, boolean z) {
        return this.mExecutor.invoke(list, z);
    }
}
