package com.miui.gallery.sdk.download.executor;

import android.accounts.Account;
import android.net.Uri;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.sdk.download.assist.DownloadFailReason;
import com.miui.gallery.sdk.download.assist.DownloadItem;
import com.miui.gallery.sdk.download.assist.DownloadItem.Builder;
import com.miui.gallery.sdk.download.assist.DownloadedItem;
import com.miui.gallery.sdk.download.downloader.IDownloader;
import com.miui.gallery.sdk.download.listener.DownloadListener;
import com.miui.gallery.sdk.download.listener.DownloadProgressListener;
import com.miui.gallery.sdk.download.util.DownloadUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public abstract class AbsDownloadExecutor {
    protected DownloadListenerController mListenerController = new DownloadListenerController();
    protected DownloadCommandQueue mQueue;

    private static class DownloadListenerController {
        private final DownloadListener mDownloadListener;
        private final HashMap<String, HashSet<DownloadListener>> mDownloadListeners;
        private final DownloadProgressListener mProgressListener;
        private final HashMap<String, HashSet<DownloadProgressListener>> mProgressListeners;

        private interface Caller<P> {
            void call(P p);
        }

        private DownloadListenerController() {
            this.mDownloadListeners = new HashMap<>();
            this.mProgressListeners = new HashMap<>();
            this.mDownloadListener = new DownloadListener() {
                public void onDownloadCancel(Uri uri, DownloadType downloadType) {
                    DownloadListenerController.this.callCancel(uri, downloadType);
                }

                public void onDownloadFail(Uri uri, DownloadType downloadType, DownloadFailReason downloadFailReason) {
                    DownloadListenerController.this.callFail(uri, downloadType, downloadFailReason);
                }

                public void onDownloadStarted(Uri uri, DownloadType downloadType) {
                    DownloadListenerController.this.callStarted(uri, downloadType);
                }

                public void onDownloadSuccess(Uri uri, DownloadType downloadType, DownloadedItem downloadedItem) {
                    DownloadListenerController.this.callSuccess(uri, downloadType, downloadedItem);
                }
            };
            this.mProgressListener = new DownloadProgressListener() {
                public void onDownloadProgress(Uri uri, DownloadType downloadType, long j, long j2) {
                    DownloadListenerController.this.callProgress(uri, downloadType, j, j2);
                }
            };
        }

        /* access modifiers changed from: private */
        public void callCancel(final Uri uri, final DownloadType downloadType) {
            dispatchListener(getDownloadListeners(DownloadUtil.generateKey(uri, downloadType), true), new Caller<DownloadListener>() {
                public void call(DownloadListener downloadListener) {
                    downloadListener.onDownloadCancel(uri, downloadType);
                }
            });
        }

        /* access modifiers changed from: private */
        public void callFail(final Uri uri, final DownloadType downloadType, final DownloadFailReason downloadFailReason) {
            dispatchListener(getDownloadListeners(DownloadUtil.generateKey(uri, downloadType), true), new Caller<DownloadListener>() {
                public void call(DownloadListener downloadListener) {
                    downloadListener.onDownloadFail(uri, downloadType, downloadFailReason);
                }
            });
        }

        /* access modifiers changed from: private */
        public void callProgress(Uri uri, DownloadType downloadType, long j, long j2) {
            LinkedList progressListeners = getProgressListeners(DownloadUtil.generateKey(uri, downloadType));
            final Uri uri2 = uri;
            final DownloadType downloadType2 = downloadType;
            final long j3 = j;
            final long j4 = j2;
            AnonymousClass7 r0 = new Caller<DownloadProgressListener>() {
                public void call(DownloadProgressListener downloadProgressListener) {
                    downloadProgressListener.onDownloadProgress(uri2, downloadType2, j3, j4);
                }
            };
            dispatchListener(progressListeners, r0);
        }

        /* access modifiers changed from: private */
        public void callStarted(final Uri uri, final DownloadType downloadType) {
            dispatchListener(getDownloadListeners(DownloadUtil.generateKey(uri, downloadType), false), new Caller<DownloadListener>() {
                public void call(DownloadListener downloadListener) {
                    downloadListener.onDownloadStarted(uri, downloadType);
                }
            });
        }

        /* access modifiers changed from: private */
        public void callSuccess(final Uri uri, final DownloadType downloadType, final DownloadedItem downloadedItem) {
            dispatchListener(getDownloadListeners(DownloadUtil.generateKey(uri, downloadType), true), new Caller<DownloadListener>() {
                public void call(DownloadListener downloadListener) {
                    downloadListener.onDownloadSuccess(uri, downloadType, downloadedItem);
                }
            });
        }

        private <E> void dispatchListener(LinkedList<E> linkedList, Caller<E> caller) {
            if (linkedList != null) {
                Iterator it = linkedList.iterator();
                while (it.hasNext()) {
                    Object next = it.next();
                    if (next != null) {
                        caller.call(next);
                    }
                }
            }
        }

        private LinkedList<DownloadListener> getDownloadListeners(String str, boolean z) {
            LinkedList<DownloadListener> listeners;
            synchronized (this.mDownloadListeners) {
                listeners = getListeners(this.mDownloadListeners, str);
                if (z) {
                    this.mDownloadListeners.remove(str);
                }
            }
            if (z) {
                synchronized (this.mProgressListeners) {
                    this.mProgressListeners.remove(str);
                }
            }
            return listeners;
        }

        private <E> LinkedList<E> getListeners(HashMap<String, HashSet<E>> hashMap, String str) {
            LinkedList<E> linkedList = new LinkedList<>();
            HashSet hashSet = (HashSet) hashMap.get(str);
            if (hashSet != null) {
                Iterator it = hashSet.iterator();
                while (it.hasNext()) {
                    linkedList.add(it.next());
                }
            }
            return linkedList;
        }

        private LinkedList<DownloadProgressListener> getProgressListeners(String str) {
            LinkedList<DownloadProgressListener> listeners;
            synchronized (this.mProgressListeners) {
                listeners = getListeners(this.mProgressListeners, str);
            }
            return listeners;
        }

        private <E> boolean putItem(HashMap<String, HashSet<E>> hashMap, String str, E e) {
            HashSet hashSet = (HashSet) hashMap.get(str);
            if (hashSet == null) {
                hashSet = new HashSet();
                hashMap.put(str, hashSet);
            }
            return hashSet.add(e);
        }

        public DownloadListener getDownloadListener() {
            return this.mDownloadListener;
        }

        public DownloadProgressListener getDownloadProgressListener() {
            return this.mProgressListener;
        }

        public boolean putItem(DownloadItem downloadItem) {
            boolean z = false;
            if (downloadItem != null) {
                String generateKey = DownloadUtil.generateKey(downloadItem.getUri(), downloadItem.getType());
                if (downloadItem.getDownloadListener() != null) {
                    synchronized (this.mDownloadListeners) {
                        z = false | putItem(this.mDownloadListeners, generateKey, downloadItem.getDownloadListener());
                    }
                }
                if (downloadItem.getProgressListener() != null) {
                    synchronized (this.mProgressListeners) {
                        z |= putItem(this.mProgressListeners, generateKey, downloadItem.getProgressListener());
                    }
                }
            }
            return z;
        }
    }

    public AbsDownloadExecutor(int i, int i2) {
        this.mQueue = new DownloadCommandQueue(i, i2, getTag());
    }

    protected static Map<IDownloader, List<DownloadCommand>> classifyCommand(List<DownloadCommand> list) {
        if (!MiscUtil.isValid(list)) {
            return null;
        }
        HashMap hashMap = new HashMap();
        for (DownloadCommand downloadCommand : list) {
            IDownloader downloader = downloadCommand.getItem().getDownloader();
            if (downloader != null) {
                List list2 = (List) hashMap.get(downloader);
                if (list2 == null) {
                    list2 = new LinkedList();
                    hashMap.put(downloader, list2);
                }
                list2.add(downloadCommand);
            }
        }
        return hashMap;
    }

    private DownloadItem repackageItem(DownloadItem downloadItem) {
        return new Builder().cloneFrom(downloadItem).setDownloadListener(this.mListenerController.getDownloadListener()).setProgressListener(this.mListenerController.getDownloadProgressListener()).build();
    }

    public boolean cancel(DownloadItem downloadItem) {
        return this.mQueue.cancel(downloadItem.getKey()) != -1;
    }

    public void cancelAll() {
        this.mQueue.cancelAll();
    }

    public boolean contains(DownloadItem downloadItem) {
        return this.mQueue.contains(downloadItem.getKey()) != -1;
    }

    /* access modifiers changed from: protected */
    public abstract void dispatch();

    public void download(DownloadItem downloadItem, boolean z, boolean z2) {
        Account account = AccountCache.getAccount();
        if (account == null) {
            Log.e(getTag(), "invoke: no account");
            DownloadItem.callbackError(downloadItem, new DownloadFailReason(ErrorCode.NO_ACCOUNT, "no account", null));
        } else if (downloadItem == null || downloadItem.getKey() == null) {
            Log.e(getTag(), "invoke: invalid download item");
            DownloadItem.callbackError(downloadItem, new DownloadFailReason(ErrorCode.PARAMS_ERROR, "key is null", null));
        } else {
            if (this.mListenerController.putItem(downloadItem)) {
                DownloadItem.callbackStarted(downloadItem);
            }
            DownloadCommand downloadCommand = new DownloadCommand(account, repackageItem(downloadItem));
            boolean z3 = false;
            if (z2) {
                int contains = this.mQueue.contains(downloadCommand.getKey());
                if (contains != 1) {
                    interrupt();
                    if (contains == 0) {
                        this.mQueue.remove(downloadCommand.getKey());
                    }
                    if (this.mQueue.getPendingSize() > 0) {
                        z3 = true;
                    }
                } else {
                    return;
                }
            }
            if (this.mQueue.put(downloadCommand, z) > 0) {
                z3 = true;
            }
            if (z3) {
                dispatch();
            }
        }
    }

    /* access modifiers changed from: protected */
    public abstract String getTag();

    public abstract void interrupt();
}
