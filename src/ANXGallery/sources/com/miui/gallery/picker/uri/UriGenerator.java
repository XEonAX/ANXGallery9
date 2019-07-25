package com.miui.gallery.picker.uri;

import android.app.Activity;
import android.app.Dialog;
import android.app.Fragment;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.LongSparseArray;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.adapter.CheckableAdapter.CheckedItem;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.picker.helper.Picker.ImageType;
import com.miui.gallery.picker.uri.Downloader.DownloadListener;
import com.miui.gallery.picker.uri.Downloader.DownloadResult;
import com.miui.gallery.picker.uri.Downloader.DownloadTask;
import com.miui.gallery.picker.uri.OriginUrlRequestor.OriginInfo;
import com.miui.gallery.picker.uri.OriginUrlRequestor.OriginUrlRequestTask;
import com.miui.gallery.picker.uri.OriginUrlRequestor.ProgressListener;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.UriUtil;
import com.miui.gallery.util.uil.CloudUriAdapter;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class UriGenerator {
    private static final String[] CHECKED_ITEM_PROJECTION = {"_id", "sha1", "serverType", "size", "exifImageLength", "exifImageWidth"};
    /* access modifiers changed from: private */
    public WeakReference<Activity> mActivityWeakReference;
    /* access modifiers changed from: private */
    public OnCancelListener mCancelConfirmListener = new OnCancelListener() {
        public void onCancel(DialogInterface dialogInterface) {
            int remainSize = UriGenerator.this.mDownloader == null ? 0 : UriGenerator.this.mDownloader.getRemainSize();
            Activity activity = (Activity) UriGenerator.this.mActivityWeakReference.get();
            if (remainSize > 0 && activity != null) {
                DownloadCancelDialog downloadCancelDialog = new DownloadCancelDialog();
                Bundle bundle = new Bundle();
                bundle.putInt("remaining_count", remainSize);
                downloadCancelDialog.setCancelListener(UriGenerator.this.mCancelDownloadListener);
                downloadCancelDialog.setContinueListener(UriGenerator.this.mContinueDownloadListener);
                downloadCancelDialog.setArguments(bundle);
                downloadCancelDialog.showAllowingStateLoss(activity.getFragmentManager(), "cancel_dialog");
            }
        }
    };
    /* access modifiers changed from: private */
    public OnClickListener mCancelDownloadListener = new OnClickListener() {
        public void onClick(DialogInterface dialogInterface, int i) {
            if (UriGenerator.this.mDownloader != null) {
                UriGenerator.this.mDownloader.cancel();
            }
        }
    };
    /* access modifiers changed from: private */
    public OnCancelListener mCancelOriginInfoListener = new OnCancelListener() {
        public void onCancel(DialogInterface dialogInterface) {
            if (UriGenerator.this.mOriginUrlRequestor != null) {
                UriGenerator.this.mOriginUrlRequestor.cancel();
            }
        }
    };
    private List<CheckedItem> mCheckedItems;
    /* access modifiers changed from: private */
    public OnClickListener mContinueDownloadListener = new OnClickListener() {
        public void onClick(DialogInterface dialogInterface, int i) {
            Activity activity = (Activity) UriGenerator.this.mActivityWeakReference.get();
            if (UriGenerator.this.mDownloadProgressDialog != null && activity != null) {
                UriGenerator.this.mDownloadProgressDialog.showAllowingStateLoss(activity.getFragmentManager(), "prepare_progress_dialog");
            }
        }
    };
    private AsyncTask<Void, Void, Void> mDataBaseQueryTask = new AsyncTask<Void, Void, Void>() {
        /* access modifiers changed from: protected */
        public Void doInBackground(Void... voidArr) {
            UriGenerator.this.queryCheckedItems();
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Void voidR) {
            UriGenerator.this.getUrisFromCheckedItems();
        }
    };
    private OnClickListener mDownloadListener = new OnClickListener() {
        public void onClick(DialogInterface dialogInterface, int i) {
            if (!NetworkUtils.isNetworkConnected()) {
                ToastUtils.makeText(GalleryApp.sGetAndroidContext(), (int) R.string.picker_no_network_message);
                UriGenerator.this.showDownloadConfirmDialog(true);
                return;
            }
            UriGenerator.this.startDownload();
        }
    };
    /* access modifiers changed from: private */
    public ArrayList<DownloadTask> mDownloadPendings;
    /* access modifiers changed from: private */
    public PrepareProgressDialog mDownloadProgressDialog;
    /* access modifiers changed from: private */
    public Downloader mDownloader;
    private ImageType mImageType;
    /* access modifiers changed from: private */
    public ArrayList<OriginUrlRequestTask> mOriginRequestPendings;
    /* access modifiers changed from: private */
    public PrepareProgressDialog mOriginRequestProgressDialog;
    /* access modifiers changed from: private */
    public OriginUrlRequestor mOriginUrlRequestor;
    /* access modifiers changed from: private */
    public Uri[] mResults;
    private String[] mSha1s;
    /* access modifiers changed from: private */
    public UriGenerateListener mUriGenerateListener;

    private class OriginUrlRequestProgressListener implements ProgressListener {
        private OriginUrlRequestProgressListener() {
        }

        private void finish() {
            if (UriGenerator.this.mOriginRequestProgressDialog != null) {
                Dialog dialog = UriGenerator.this.mOriginRequestProgressDialog.getDialog();
                if (dialog != null && dialog.isShowing()) {
                    UriGenerator.this.mOriginRequestProgressDialog.dismissAllowingStateLoss();
                }
                UriGenerator.this.mOriginRequestProgressDialog = null;
            }
            if (UriGenerator.this.mOriginRequestPendings != null) {
                UriGenerator.this.mOriginRequestPendings.clear();
            }
            if (UriGenerator.this.mOriginUrlRequestor != null) {
                UriGenerator.this.mOriginUrlRequestor.destroy();
                UriGenerator.this.mOriginUrlRequestor = null;
            }
        }

        public void onCancelled() {
            finish();
        }

        public void onEnd(ArrayList<OriginInfo> arrayList, boolean z) {
            finish();
            if (!MiscUtil.isValid(arrayList) || !z) {
                Log.e("UriGenerator", "selected images OriginInfo generate error");
                ToastUtils.makeText(GalleryApp.sGetAndroidContext(), (int) R.string.picker_origin_request_progress_fail);
                UriGenerator.this.mUriGenerateListener.onFail();
                return;
            }
            UriGenerator.this.deliverResult(arrayList);
        }

        public void onStart(int i) {
            Activity activity = (Activity) UriGenerator.this.mActivityWeakReference.get();
            if (activity != null) {
                UriGenerator.this.mOriginRequestProgressDialog = new PrepareProgressDialog();
                UriGenerator.this.mOriginRequestProgressDialog.setMax(i);
                UriGenerator.this.mOriginRequestProgressDialog.setStage(1);
                UriGenerator.this.mOriginRequestProgressDialog.setCancelListener(UriGenerator.this.mCancelOriginInfoListener);
                UriGenerator.this.mOriginRequestProgressDialog.showAllowingStateLoss(activity.getFragmentManager(), "prepare_progress_dialog");
            }
        }

        public void onUpdate(int i) {
            if (UriGenerator.this.mOriginRequestProgressDialog != null) {
                UriGenerator.this.mOriginRequestProgressDialog.updateProgress(i);
            }
        }
    }

    public interface UriGenerateListener {
        void onFail();

        void onSuccess(Uri[] uriArr, List<OriginInfo> list);
    }

    public UriGenerator(Activity activity, List<CheckedItem> list, ImageType imageType, UriGenerateListener uriGenerateListener) {
        this.mActivityWeakReference = new WeakReference<>(activity);
        this.mCheckedItems = list;
        this.mImageType = imageType;
        this.mUriGenerateListener = uriGenerateListener;
    }

    /* access modifiers changed from: private */
    public void deliverResult(List<OriginInfo> list) {
        if (this.mResults.length == 0) {
            this.mUriGenerateListener.onFail();
            return;
        }
        if (this.mImageType != ImageType.ORIGIN_OR_DOWNLOAD_INFO || MiscUtil.isValid(list)) {
            this.mUriGenerateListener.onSuccess(this.mResults, list);
        } else {
            this.mOriginUrlRequestor = new OriginUrlRequestor(this.mOriginRequestPendings, new OriginUrlRequestProgressListener());
            this.mOriginUrlRequestor.start(this.mResults, this.mSha1s);
        }
    }

    /* access modifiers changed from: private */
    public void getUrisFromCheckedItems() {
        this.mResults = new Uri[this.mCheckedItems.size()];
        this.mSha1s = new String[this.mCheckedItems.size()];
        this.mDownloadPendings = new ArrayList<>();
        this.mOriginRequestPendings = new ArrayList<>();
        for (int i = 0; i < this.mCheckedItems.size(); i++) {
            CheckedItem checkedItem = (CheckedItem) this.mCheckedItems.get(i);
            this.mSha1s[i] = checkedItem.getSha1();
            String originFile = checkedItem.getOriginFile();
            if (!TextUtils.isEmpty(originFile)) {
                File file = new File(originFile);
                if (file.exists()) {
                    this.mResults[i] = Uri.fromFile(file);
                }
            }
            if (this.mImageType == ImageType.ORIGIN) {
                this.mDownloadPendings.add(new DownloadTask(CloudUriAdapter.getDownloadUri(checkedItem.getId()), NetworkUtils.isActiveNetworkMetered() ? DownloadType.ORIGIN_FORCE : DownloadType.ORIGIN, (int) checkedItem.getSize(), i));
            } else {
                if (this.mImageType == ImageType.ORIGIN_OR_DOWNLOAD_INFO) {
                    ArrayList<OriginUrlRequestTask> arrayList = this.mOriginRequestPendings;
                    OriginUrlRequestTask originUrlRequestTask = new OriginUrlRequestTask(i, CloudUriAdapter.getDownloadUri(checkedItem.getId()), checkedItem.getHeight(), checkedItem.getWidth(), checkedItem.getServerType());
                    arrayList.add(originUrlRequestTask);
                }
                String thumbnailFile = checkedItem.getThumbnailFile();
                if (!TextUtils.isEmpty(thumbnailFile)) {
                    File file2 = new File(thumbnailFile);
                    if (file2.exists()) {
                        this.mResults[i] = Uri.fromFile(file2);
                    }
                }
                this.mDownloadPendings.add(new DownloadTask(CloudUriAdapter.getDownloadUri(checkedItem.getId()), DownloadType.THUMBNAIL, 0, i));
            }
        }
        Log.d("UriGenerator", "picked file: %d, pending: %d", Integer.valueOf(this.mResults.length), Integer.valueOf(this.mDownloadPendings.size()));
        Activity activity = (Activity) this.mActivityWeakReference.get();
        if (this.mDownloadPendings.isEmpty()) {
            deliverResult(null);
        } else if (!SyncUtil.existXiaomiAccount(activity)) {
            ToastUtils.makeText(GalleryApp.sGetAndroidContext(), (CharSequence) GalleryApp.sGetAndroidContext().getResources().getQuantityString(R.plurals.picker_skip_unavailable_images, this.mDownloadPendings.size(), new Object[]{Integer.valueOf(this.mDownloadPendings.size())}));
            if (this.mResults.length == 0) {
                this.mUriGenerateListener.onFail();
            } else {
                deliverResult(null);
            }
        } else if (NetworkUtils.isActiveNetworkMetered()) {
            showDownloadConfirmDialog(false);
        } else if (NetworkUtils.isNetworkConnected()) {
            ToastUtils.makeText(GalleryApp.sGetAndroidContext(), (CharSequence) this.mResults.length == 0 ? GalleryApp.sGetAndroidContext().getResources().getQuantityString(R.plurals.picker_all_image_will_download, this.mDownloadPendings.size()) : GalleryApp.sGetAndroidContext().getResources().getString(R.string.picker_image_will_download, new Object[]{Integer.valueOf(this.mDownloadPendings.size())}));
            startDownload();
        } else {
            showDownloadConfirmDialog(true);
        }
    }

    /* access modifiers changed from: private */
    public void queryCheckedItems() {
        if (MiscUtil.isValid(this.mCheckedItems)) {
            final LongSparseArray longSparseArray = new LongSparseArray();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < this.mCheckedItems.size(); i++) {
                CheckedItem checkedItem = (CheckedItem) this.mCheckedItems.get(i);
                longSparseArray.put(checkedItem.getId(), checkedItem);
                if (i != 0) {
                    sb.append(",");
                }
                sb.append(checkedItem.getId());
            }
            Activity activity = (Activity) this.mActivityWeakReference.get();
            if (activity != null) {
                SafeDBUtil.safeQuery((Context) activity, UriUtil.appendGroupBy(Media.URI_PICKER, "sha1", null), CHECKED_ITEM_PROJECTION, String.format("_id IN (%s) AND (localGroupId!=-1000) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", new Object[]{sb.toString()}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
                    public Void handle(Cursor cursor) {
                        if (cursor != null) {
                            while (cursor.moveToNext()) {
                                CheckedItem checkedItem = (CheckedItem) longSparseArray.get(cursor.getLong(0));
                                if (checkedItem != null) {
                                    checkedItem.setServerType(cursor.getInt(2));
                                    checkedItem.setSize(cursor.getLong(3));
                                    checkedItem.setWidth(cursor.getInt(5));
                                    checkedItem.setHeight(cursor.getInt(4));
                                }
                            }
                        }
                        return null;
                    }
                });
            }
        }
    }

    /* access modifiers changed from: private */
    public void showDownloadConfirmDialog(boolean z) {
        Activity activity = (Activity) this.mActivityWeakReference.get();
        if (activity != null) {
            Bundle bundle = new Bundle();
            bundle.putInt("download_file_count", this.mDownloadPendings.size());
            bundle.putInt("local_file_count", this.mResults.length);
            int i = 0;
            Iterator it = this.mDownloadPendings.iterator();
            while (it.hasNext()) {
                i += ((DownloadTask) it.next()).mSize;
            }
            bundle.putInt("download_file_size", i);
            bundle.putBoolean("retry_mode", z);
            DownloadConfirmDialog downloadConfirmDialog = new DownloadConfirmDialog();
            downloadConfirmDialog.setPositiveListener(this.mDownloadListener);
            downloadConfirmDialog.setNegativeListener(this.mCancelDownloadListener);
            downloadConfirmDialog.setArguments(bundle);
            downloadConfirmDialog.showAllowingStateLoss(activity.getFragmentManager(), "confirm_dialog");
        }
    }

    /* access modifiers changed from: private */
    public void startDownload() {
        if (this.mDownloader != null) {
            this.mDownloader.cancel();
            this.mDownloader.destroy();
        }
        this.mDownloader = new Downloader(this.mDownloadPendings, new DownloadListener() {
            private void parseDownloadResult(List<DownloadResult> list, List<DownloadResult> list2) {
                for (DownloadResult downloadResult : list) {
                    if (downloadResult != null && !TextUtils.isEmpty(downloadResult.mPath)) {
                        File file = new File(downloadResult.mPath);
                        if (file.exists()) {
                            UriGenerator.this.mResults[downloadResult.mTask.mPosition] = Uri.fromFile(file);
                        }
                    }
                    list2.add(downloadResult);
                }
                UriGenerator.this.mDownloadPendings.clear();
                for (DownloadResult downloadResult2 : list2) {
                    UriGenerator.this.mDownloadPendings.add(downloadResult2.mTask);
                }
            }

            public void onCancelled(List<DownloadResult> list, List<DownloadResult> list2) {
                Log.d("UriGenerator", "download cancelled, success: %d, fails: %d", Integer.valueOf(list.size()), Integer.valueOf(list2.size()));
                if (UriGenerator.this.mDownloadProgressDialog != null) {
                    Dialog dialog = UriGenerator.this.mDownloadProgressDialog.getDialog();
                    if (dialog != null && dialog.isShowing()) {
                        UriGenerator.this.mDownloadProgressDialog.dismissAllowingStateLoss();
                    }
                    UriGenerator.this.mDownloadProgressDialog = null;
                }
                parseDownloadResult(list, list2);
                UriGenerator.this.mDownloader.destroy();
                UriGenerator.this.mDownloader = null;
            }

            public void onEnd(List<DownloadResult> list, List<DownloadResult> list2) {
                Log.d("UriGenerator", "download end, success: %d, fails: %d", Integer.valueOf(list.size()), Integer.valueOf(list2.size()));
                if (UriGenerator.this.mDownloadProgressDialog != null) {
                    Dialog dialog = UriGenerator.this.mDownloadProgressDialog.getDialog();
                    if (dialog != null && dialog.isShowing()) {
                        UriGenerator.this.mDownloadProgressDialog.dismissAllowingStateLoss();
                    }
                    Activity activity = (Activity) UriGenerator.this.mActivityWeakReference.get();
                    if (activity != null) {
                        Fragment findFragmentByTag = activity.getFragmentManager().findFragmentByTag("cancel_dialog");
                        if (findFragmentByTag != null && (findFragmentByTag instanceof DownloadCancelDialog)) {
                            ((DownloadCancelDialog) findFragmentByTag).dismiss();
                        }
                    }
                    UriGenerator.this.mDownloadProgressDialog = null;
                }
                parseDownloadResult(list, list2);
                if (list2.isEmpty()) {
                    UriGenerator.this.deliverResult(null);
                } else {
                    UriGenerator.this.showDownloadConfirmDialog(true);
                }
                UriGenerator.this.mDownloader.destroy();
                UriGenerator.this.mDownloader = null;
            }

            public void onStart(List<DownloadTask> list) {
                Log.d("UriGenerator", "download start, %d", (Object) Integer.valueOf(list.size()));
                Activity activity = (Activity) UriGenerator.this.mActivityWeakReference.get();
                if (activity != null) {
                    UriGenerator.this.mDownloadProgressDialog = new PrepareProgressDialog();
                    UriGenerator.this.mDownloadProgressDialog.setMax(list.size());
                    UriGenerator.this.mDownloadProgressDialog.setStage(0);
                    UriGenerator.this.mDownloadProgressDialog.setCancelListener(UriGenerator.this.mCancelConfirmListener);
                    UriGenerator.this.mDownloadProgressDialog.showAllowingStateLoss(activity.getFragmentManager(), "prepare_progress_dialog");
                }
            }

            public void onUpdate(List<DownloadResult> list, List<DownloadResult> list2) {
                UriGenerator.this.mDownloadProgressDialog.updateProgress(list.size() + list2.size());
            }
        });
        this.mDownloader.start();
    }

    public void generate() {
        Activity activity = (Activity) this.mActivityWeakReference.get();
        if (activity == null || activity.isDestroyed() || !MiscUtil.isValid(this.mCheckedItems) || this.mImageType == null || this.mUriGenerateListener == null) {
            if (this.mUriGenerateListener != null) {
                this.mUriGenerateListener.onFail();
            }
            return;
        }
        if (this.mImageType == ImageType.ORIGIN || this.mImageType == ImageType.ORIGIN_OR_DOWNLOAD_INFO) {
            this.mDataBaseQueryTask.execute(new Void[0]);
        } else {
            getUrisFromCheckedItems();
        }
    }
}
