package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.cloud.base.RetryRequestHelper;
import com.miui.gallery.cloud.base.SyncTask;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deviceprovider.UploadStatusController;
import com.xiaomi.opensdk.exception.AuthenticationException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class RetryOperation {
    public static <T> GallerySyncResult<T> doOperation(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, List<? extends RequestItemBase> list, Operation<T> operation) {
        ArrayList arrayList = new ArrayList();
        GallerySyncResult<T> gallerySyncResult = null;
        for (int i = 0; i < list.size(); i++) {
            RequestItemBase requestItemBase = (RequestItemBase) list.get(i);
            boolean z = true;
            if (arrayList.isEmpty() || requestItemBase.isInSameAlbum((RequestItemBase) arrayList.get(arrayList.size() - 1))) {
                arrayList.add(requestItemBase);
                if (arrayList.size() >= requestItemBase.getRequestLimitAGroup() || i >= list.size() - 1) {
                    z = false;
                }
            } else {
                Log.d("RetryOperation", "requestItem in this group, try this group and add this item later.");
            }
            StringBuilder sb = new StringBuilder();
            sb.append("do ");
            sb.append(operation.getClass());
            sb.append(" a group items:");
            sb.append(i);
            Log.d("RetryOperation", sb.toString());
            if (requestItemBase.supportMultiRequest()) {
                RequestMultiItem requestMultiItem = new RequestMultiItem(arrayList, requestItemBase.priority);
                ArrayList arrayList2 = new ArrayList();
                arrayList2.add(requestMultiItem);
                gallerySyncResult = tryAGroupItems(account, galleryExtendedAuthToken, arrayList2, operation);
            } else {
                gallerySyncResult = tryAGroupItems(account, galleryExtendedAuthToken, arrayList, operation);
            }
            Log.v("RetryOperation", "finish one loop for upload");
            arrayList.clear();
            if (z) {
                arrayList.add(requestItemBase);
            }
        }
        return gallerySyncResult;
    }

    private static boolean isInterruptedException(Exception exc) {
        return (exc instanceof InterruptedException) || (exc instanceof AuthenticationException);
    }

    private static void setAllStatus(Iterator<? extends RequestItemBase> it, int i) {
        while (it.hasNext()) {
            ((RequestItemBase) it.next()).compareAndSetStatus(0, i);
        }
    }

    /* JADX INFO: finally extract failed */
    private static <T> GallerySyncResult<T> tryAGroupItems(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, ArrayList<? extends RequestItemBase> arrayList, Operation<T> operation) {
        GallerySyncResult<T> build = new Builder().setCode(GallerySyncCode.UNKNOWN).build();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            RequestItemBase requestItemBase = (RequestItemBase) it.next();
            if (requestItemBase.getStatus() != 0) {
                it.remove();
                SyncLog.e("RetryOperation", "The item of %s whose status of %s is invalid", requestItemBase, Integer.valueOf(requestItemBase.getStatus()));
            } else {
                UploadStatusController.getInstance().start(requestItemBase);
                try {
                    String simpleName = operation.getClass().getSimpleName();
                    final String str = simpleName;
                    final Operation<T> operation2 = operation;
                    final Account account2 = account;
                    final GalleryExtendedAuthToken galleryExtendedAuthToken2 = galleryExtendedAuthToken;
                    final RequestItemBase requestItemBase2 = requestItemBase;
                    AnonymousClass1 r2 = new SyncTask<T>() {
                        public String getIdentifier() {
                            return str;
                        }

                        public GallerySyncResult<T> run() throws Exception {
                            return operation2.execute(account2, galleryExtendedAuthToken2, null, requestItemBase2);
                        }
                    };
                    GallerySyncResult<T> retryTask = RetryRequestHelper.retryTask(r2);
                    it.remove();
                    if (retryTask.code == GallerySyncCode.OK) {
                        requestItemBase.compareAndSetStatus(0, 2);
                    } else {
                        requestItemBase.compareAndSetStatus(0, 1);
                        if (!(retryTask.code == GallerySyncCode.NOT_CONTINUE_ERROR || retryTask.code == GallerySyncCode.CANCEL)) {
                            if (retryTask.code != GallerySyncCode.CONDITION_INTERRUPTED) {
                                if (retryTask.exception != null && isInterruptedException(retryTask.exception)) {
                                    SyncLog.e("RetryOperation", "cancel all items for operation %s because of %s", simpleName, retryTask.exception);
                                    requestItemBase.compareAndSetStatus(0, 1);
                                    setAllStatus(it, 1);
                                    UploadStatusController.getInstance().end(requestItemBase);
                                    return retryTask;
                                }
                            }
                        }
                        SyncLog.e("RetryOperation", "cancel all items for operation %s because of %s", simpleName, retryTask.code);
                        requestItemBase.compareAndSetStatus(0, 3);
                        setAllStatus(it, 3);
                        UploadStatusController.getInstance().end(requestItemBase);
                        return retryTask;
                    }
                    UploadStatusController.getInstance().end(requestItemBase);
                    build = retryTask;
                } catch (Throwable th) {
                    UploadStatusController.getInstance().end(requestItemBase);
                    throw th;
                }
            }
        }
        return build;
    }
}
