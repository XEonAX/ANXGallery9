package com.android.internal.storage;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build.VERSION;
import android.os.Environment;
import android.os.FileUtils;
import android.os.storage.DiskInfo;
import android.os.storage.StorageVolume;
import android.os.storage.VolumeInfo;
import android.text.TextUtils;
import java.io.File;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class StorageManager {

    private static class Singleton {
        /* access modifiers changed from: private */
        public static final StorageManager INSTANCE = new StorageManager();
    }

    private StorageManager() {
    }

    public static StorageManager getInstance() {
        return Singleton.INSTANCE;
    }

    private static StorageInfo toStorageInfo(Context context, StorageVolume storageVolume) {
        if (TextUtils.isEmpty(storageVolume.getPath())) {
            return null;
        }
        StorageInfo storageInfo = new StorageInfo(storageVolume.getPath());
        storageInfo.setWrapped(storageVolume);
        storageInfo.setDescription(storageVolume.getDescription(context));
        storageInfo.setMounted("mounted".equalsIgnoreCase(storageVolume.getState()));
        boolean z = true;
        if (storageVolume.isPrimary() && "mounted".equals(Environment.getExternalStorageState())) {
            storageInfo.setPrimary(true);
            storageInfo.setPath(Environment.getExternalStorageDirectory().getAbsolutePath());
        }
        if (!storageVolume.isRemovable() || !storageVolume.getPath().startsWith("/storage/sdcard")) {
            z = false;
        }
        storageInfo.setSd(z);
        return storageInfo;
    }

    private static StorageInfo toStorageInfo(VolumeInfo volumeInfo) {
        File path = volumeInfo.getPath();
        if (path != null && !TextUtils.isEmpty(path.getAbsolutePath())) {
            int type = volumeInfo.getType();
            if (type == 2 || type == 0) {
                StorageInfo storageInfo = new StorageInfo(path.getAbsolutePath());
                storageInfo.setWrapped(volumeInfo);
                storageInfo.setDescription(volumeInfo.getDescription());
                storageInfo.setMounted(volumeInfo.getState() == 2);
                storageInfo.setVisible(volumeInfo.isVisible());
                if (volumeInfo.isPrimary() && "mounted".equals(Environment.getExternalStorageState())) {
                    storageInfo.setPrimary(true);
                    storageInfo.setPath(Environment.getExternalStorageDirectory().getAbsolutePath());
                }
                DiskInfo disk = volumeInfo.getDisk();
                if (disk != null) {
                    storageInfo.setSd(disk.isSd());
                    storageInfo.setUsb(disk.isUsb());
                }
                return storageInfo;
            }
        }
        return null;
    }

    @TargetApi(24)
    public StorageInfo getStorageInfo(Context context, File file) {
        if (context == null || file == null) {
            return null;
        }
        try {
            android.os.storage.StorageManager storageManager = (android.os.storage.StorageManager) context.getSystemService("storage");
            StorageVolume storageVolume = storageManager.getStorageVolume(file);
            if (storageVolume == null) {
                Iterator it = storageManager.getStorageVolumes().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    StorageVolume storageVolume2 = (StorageVolume) it.next();
                    if (FileUtils.contains(storageVolume2.getPath(), file.getAbsolutePath())) {
                        storageVolume = storageVolume2;
                        break;
                    }
                }
            }
            return storageVolume != null ? toStorageInfo(context, storageVolume) : null;
        } catch (Throwable th) {
            th.printStackTrace();
            return null;
        }
    }

    public List<StorageInfo> getStorageInfos(Context context) {
        LinkedList linkedList = new LinkedList();
        if (context == null) {
            return linkedList;
        }
        android.os.storage.StorageManager storageManager = (android.os.storage.StorageManager) context.getSystemService("storage");
        try {
            if (VERSION.SDK_INT >= 23) {
                List<VolumeInfo> volumes = storageManager.getVolumes();
                if (volumes != null) {
                    for (VolumeInfo storageInfo : volumes) {
                        StorageInfo storageInfo2 = toStorageInfo(storageInfo);
                        if (storageInfo2 != null) {
                            linkedList.add(storageInfo2);
                        }
                    }
                }
            } else {
                StorageVolume[] volumeList = storageManager.getVolumeList();
                if (volumeList != null) {
                    for (StorageVolume storageInfo3 : volumeList) {
                        StorageInfo storageInfo4 = toStorageInfo(context, storageInfo3);
                        if (storageInfo4 != null) {
                            linkedList.add(storageInfo4);
                        }
                    }
                }
            }
        } catch (Throwable th) {
            th.printStackTrace();
            StorageInfo storageInfo5 = new StorageInfo(Environment.getExternalStorageDirectory().getAbsolutePath());
            storageInfo5.setMounted(true);
            storageInfo5.setPrimary(true);
            linkedList.add(storageInfo5);
        }
        return linkedList;
    }
}
