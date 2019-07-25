package com.miui.gallery.net.library;

import android.net.Uri;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.assistant.library.LibraryItem;
import com.miui.gallery.assistant.library.LibraryManager.DownloadListener;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.net.base.RequestError;
import com.miui.gallery.net.download.GalleryDownloadManager;
import com.miui.gallery.net.download.Request;
import com.miui.gallery.net.download.Request.Listener;
import com.miui.gallery.net.download.Verifier.Sha1;
import com.miui.gallery.net.resource.DownloadInfo;
import com.miui.gallery.net.resource.DownloadRequest;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import miui.net.ConnectivityHelper;

public class LibraryDownloadManager {
    private Map<Long, List<DownloadListener>> mDownloadListenerMap = Collections.synchronizedMap(new HashMap());
    /* access modifiers changed from: private */
    public Set<Long> mDownloadingItems = Collections.synchronizedSet(new HashSet());
    private Map<Long, List<Request>> mRequestMap = Collections.synchronizedMap(new HashMap());

    private synchronized void addListener(long j, DownloadListener downloadListener) {
        List list = (List) this.mDownloadListenerMap.get(Long.valueOf(j));
        if (list == null) {
            list = new ArrayList();
            this.mDownloadListenerMap.put(Long.valueOf(j), list);
        }
        list.add(downloadListener);
    }

    public static boolean checkCondition(boolean z) {
        if (!CTA.canConnectNetwork()) {
            Log.e("LibraryDownloadManager", "CTA not confirmed");
            return false;
        } else if (!NetworkUtils.isNetworkConnected()) {
            Log.e("LibraryDownloadManager", "No network");
            return false;
        } else if (!z && !ConnectivityHelper.getInstance().isUnmeteredNetworkConnected()) {
            Log.e("LibraryDownloadManager", "No unmetered network connected");
            return false;
        } else if (haveEnoughSpace()) {
            return true;
        } else {
            Log.e("LibraryDownloadManager", "No enough space");
            return false;
        }
    }

    private Request download(LibraryItem libraryItem, boolean z, Listener listener) {
        File file = new File(libraryItem.getTargetPath(GalleryApp.sGetAndroidContext()));
        try {
            Object[] executeSync = new DownloadRequest(libraryItem.getId()).executeSync();
            if (executeSync != null && executeSync.length > 0) {
                Request request = new Request(Uri.parse(((DownloadInfo) executeSync[0]).url), file);
                request.setVerifier(new Sha1(libraryItem.getSha1()));
                request.setAllowedOverMetered(z);
                request.setListener(listener);
                GalleryDownloadManager.INSTANCE.enqueue(request);
                return request;
            }
        } catch (RequestError e) {
            StringBuilder sb = new StringBuilder();
            sb.append("fetch library item info error:");
            sb.append(e);
            Log.e("LibraryDownloadManager", sb.toString());
            e.printStackTrace();
        }
        return null;
    }

    /* access modifiers changed from: private */
    public void downloadProgress(long j, int i) {
        List<DownloadListener> list = (List) this.mDownloadListenerMap.get(Long.valueOf(j));
        if (MiscUtil.isValid(list)) {
            for (DownloadListener onDownloadProgress : list) {
                onDownloadProgress.onDownloadProgress(j, i);
            }
        }
    }

    /* access modifiers changed from: private */
    public void downloadResult(long j, int i) {
        List<Request> list = (List) this.mRequestMap.get(Long.valueOf(j));
        if (list != null) {
            if (i != 0) {
                for (Request cancel : list) {
                    GalleryDownloadManager.INSTANCE.cancel(cancel);
                }
            }
            list.clear();
        }
        List<DownloadListener> list2 = (List) this.mDownloadListenerMap.get(Long.valueOf(j));
        if (MiscUtil.isValid(list2)) {
            for (DownloadListener onDownloadResult : list2) {
                onDownloadResult.onDownloadResult(j, i);
            }
            list2.clear();
        }
        this.mRequestMap.remove(Long.valueOf(j));
        this.mDownloadListenerMap.remove(Long.valueOf(j));
    }

    private static boolean haveEnoughSpace() {
        try {
            if (GalleryApp.sGetAndroidContext().getDir("libs", 0).getFreeSpace() > 104857600) {
                return true;
            }
            Log.e("LibraryDownloadManager", "Sd card has less than 100M space left");
            return false;
        } catch (Exception e) {
            Log.e("LibraryDownloadManager", (Throwable) e);
            return false;
        }
    }

    /* access modifiers changed from: private */
    public boolean isDownloadItemsExists(Set<LibraryItem> set) {
        if (MiscUtil.isValid(set)) {
            for (LibraryItem isExist : set) {
                if (!isExist.isExist()) {
                    return false;
                }
            }
        }
        return true;
    }

    public void cancel(long j) {
        downloadResult(j, 2);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:24:0x007c, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:7:0x000e, code lost:
        return;
     */
    public synchronized void download(long j, boolean z, Set<LibraryItem> set, DownloadListener downloadListener) {
        if (checkCondition(z)) {
            addListener(j, downloadListener);
            if (!this.mRequestMap.containsKey(Long.valueOf(j))) {
                ArrayList arrayList = new ArrayList(set.size());
                this.mRequestMap.put(Long.valueOf(j), arrayList);
                HashSet hashSet = new HashSet(set);
                Iterator it = set.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    LibraryItem libraryItem = (LibraryItem) it.next();
                    if (!this.mDownloadingItems.contains(Long.valueOf(libraryItem.getId()))) {
                        final long j2 = j;
                        final LibraryItem libraryItem2 = libraryItem;
                        final HashSet hashSet2 = hashSet;
                        AnonymousClass1 r3 = new Listener() {
                            public void onComplete(int i) {
                                LibraryDownloadManager.this.mDownloadingItems.remove(Long.valueOf(libraryItem2.getId()));
                                if (i == 0) {
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("Library ");
                                    sb.append(libraryItem2.getName());
                                    sb.append(" download success!");
                                    Log.d("LibraryDownloadManager", sb.toString());
                                    hashSet2.remove(libraryItem2);
                                    if (hashSet2.isEmpty() || LibraryDownloadManager.this.isDownloadItemsExists(hashSet2)) {
                                        LibraryDownloadManager.this.downloadResult(j2, 0);
                                        return;
                                    }
                                    return;
                                }
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("Library ");
                                sb2.append(libraryItem2.getName());
                                sb2.append(" download failed!");
                                Log.d("LibraryDownloadManager", sb2.toString());
                                LibraryDownloadManager.this.downloadResult(j2, 1);
                            }

                            public void onProgressUpdate(int i) {
                                LibraryDownloadManager.this.downloadProgress(j2, i);
                            }

                            public void onStart() {
                            }
                        };
                        Request download = download(libraryItem, z, r3);
                        if (download == null) {
                            downloadResult(j, 1);
                            break;
                        } else {
                            arrayList.add(download);
                            this.mDownloadingItems.add(Long.valueOf(libraryItem.getId()));
                        }
                    }
                }
            }
        } else if (downloadListener != null) {
            downloadListener.onDownloadResult(j, 1);
        }
    }

    public boolean isLibraryDownloading(long j) {
        return this.mRequestMap.containsKey(Long.valueOf(j));
    }
}
