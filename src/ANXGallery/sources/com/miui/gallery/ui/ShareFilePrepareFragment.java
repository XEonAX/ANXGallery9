package com.miui.gallery.ui;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.cloud.CloudUtils.SecretAlbumUtils;
import com.miui.gallery.editor.photo.sdk.CleanService;
import com.miui.gallery.editor.photo.sdk.RenderTask;
import com.miui.gallery.editor.photo.sdk.RenderTask.Callback;
import com.miui.gallery.editor.photo.sdk.RenderTask.Generator;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.BulkDownloadHelper;
import com.miui.gallery.util.BulkDownloadHelper.BulkDownloadItem;
import com.miui.gallery.util.BulkDownloadHelper.BulkDownloadListener;
import com.miui.gallery.util.FileCompressTask;
import com.miui.gallery.util.FileCompressTask.OnCompressListener;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.Numbers;
import com.miui.gallery.util.SecretAlbumCryptoUtils;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.GalleryDialogFragment;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import miui.app.ProgressDialog;

public class ShareFilePrepareFragment extends GalleryDialogFragment implements BulkDownloadListener, OnCompressListener {
    private OnCancelListener mCancelListener;
    private final List<String> mCompressFails = new ArrayList();
    private Future mCompressFuture;
    private DecodeSecretTask mDecodeSecretTask;
    private final List<BulkDownloadItem> mDownloadFails = new ArrayList();
    private OnPrepareListener mDownloadListener;
    private OnErrorListener mErrorListener;
    private BulkDownloadHelper mHelper;
    private int mMaxCompressProgress;
    /* access modifiers changed from: private */
    public int mMaxDownloadProgress;
    /* access modifiers changed from: private */
    public int mMaxRenderProgress;
    /* access modifiers changed from: private */
    public int mMaxSecretProgress;
    private boolean mPendingPrepareEnd;
    /* access modifiers changed from: private */
    public ProgressDialog mProgressDialog;
    /* access modifiers changed from: private */
    public final List<Uri> mRenderFails = new ArrayList();
    /* access modifiers changed from: private */
    public final Set<Uri> mRenderItems = new HashSet();
    /* access modifiers changed from: private */
    public final List<Uri> mRenderSuccess = new ArrayList();
    /* access modifiers changed from: private */
    public RenderTask mRenderTask;
    private long[] mSecretIds;
    private byte[][] mSecretKeys;
    /* access modifiers changed from: private */
    public final List<Uri> mSecretList = new ArrayList();
    /* access modifiers changed from: private */
    public final List<Uri> mShareUris = new ArrayList();
    private boolean mStopped;
    /* access modifiers changed from: private */
    public final List<String> mSuccessPaths = new ArrayList();
    private String mTitle;

    private static class DecodeSecretTask extends AsyncTask<Void, Integer, Void> {
        private File mCacheFolder;
        private DecodeSecretListener mDecodeSecretListener;
        private List<Uri> mFinalUris = new ArrayList();
        private SimpleDateFormat mFormat = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss_SSS", Locale.US);
        private byte[][] mKeys;
        private long[] mSecretIds;
        private List<Uri> mUris;

        interface DecodeSecretListener {
            void onEnd(List<Uri> list);

            void onItemFinish(float f);
        }

        DecodeSecretTask(File file, List<Uri> list, byte[][] bArr, long[] jArr, DecodeSecretListener decodeSecretListener) {
            this.mUris = list;
            this.mKeys = bArr;
            this.mSecretIds = jArr;
            this.mCacheFolder = file;
            this.mDecodeSecretListener = decodeSecretListener;
        }

        /* access modifiers changed from: protected */
        public Void doInBackground(Void... voidArr) {
            String str;
            this.mFinalUris.clear();
            for (int i = 0; i < this.mUris.size() && !isCancelled(); i++) {
                Uri uri = (Uri) this.mUris.get(i);
                String path = uri.getPath();
                if (SecretAlbumUtils.isEncryptedVideoByPath(path)) {
                    Uri decryptVideo2CacheFolder = SecretAlbumCryptoUtils.decryptVideo2CacheFolder(Uri.fromFile(new File(path)), this.mKeys[i], this.mSecretIds[i]);
                    if (decryptVideo2CacheFolder != null) {
                        this.mFinalUris.add(decryptVideo2CacheFolder);
                    }
                } else if (SecretAlbumUtils.isUnencryptedVideoByPath(path) || SecretAlbumUtils.isUnencryptedImageByPath(path)) {
                    this.mFinalUris.add(uri);
                } else {
                    File file = new File(this.mCacheFolder, String.format(Locale.US, "%s.jpg", new Object[]{this.mFormat.format(new Date(System.currentTimeMillis()))}));
                    String path2 = file.getPath();
                    if (this.mKeys[i] != null) {
                        str = SecretAlbumUtils.decryptFile(path, path2, false, this.mKeys[i], false);
                    } else {
                        str = SecretAlbumUtils.decryptFile(path, path2, false, this.mSecretIds[i], false);
                        Log.d("ShareFilePrepareFragment", "decode %s and secret key is null", (Object) path);
                    }
                    if (str != null) {
                        this.mFinalUris.add(Uri.fromFile(file));
                        Log.d("ShareFilePrepareFragment", "decode %s is success:%s", path, file);
                    } else {
                        Log.d("ShareFilePrepareFragment", "decode %s is failed", (Object) path);
                    }
                }
                publishProgress(new Integer[]{Integer.valueOf(i)});
            }
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Void voidR) {
            if (this.mDecodeSecretListener != null && !isCancelled()) {
                this.mDecodeSecretListener.onEnd(this.mFinalUris);
            }
        }

        /* access modifiers changed from: protected */
        public void onProgressUpdate(Integer... numArr) {
            if (this.mDecodeSecretListener != null) {
                this.mDecodeSecretListener.onItemFinish(((float) (numArr[0].intValue() + 1)) / ((float) this.mUris.size()));
            }
        }
    }

    interface OnErrorListener {
        void onError();
    }

    public interface OnPrepareListener {
        void onPrepareComplete(List<String> list, List<String> list2, Collection<Uri> collection, Collection<Uri> collection2, List<BulkDownloadItem> list3);
    }

    private class OutputGenerator implements Generator {
        private File mCacheFolder;
        private SimpleDateFormat mFormat;

        private OutputGenerator() {
            this.mFormat = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss_SSS", Locale.US);
            this.mCacheFolder = new File(ShareFilePrepareFragment.this.getActivity().getExternalCacheDir(), "render_tmp_files");
        }

        public Uri generate(Uri uri) {
            return Uri.fromFile(new File(this.mCacheFolder, String.format(Locale.US, "%s.jpg", new Object[]{this.mFormat.format(new Date(System.currentTimeMillis()))})));
        }
    }

    private void doCompress(ArrayList<String> arrayList) {
        if (this.mCompressFuture == null) {
            this.mCompressFuture = ThreadManager.getMiscPool().submit(new FileCompressTask(arrayList, this, "MIUI/Gallery/.compressShare"));
        }
    }

    private void doDownload(ArrayList<BulkDownloadItem> arrayList) {
        if (this.mHelper == null) {
            this.mHelper = new BulkDownloadHelper();
        }
        this.mHelper.download(arrayList, true, this);
    }

    /* access modifiers changed from: private */
    public void doRender() {
        Log.d("ShareFilePrepareFragment", "render items: %s", (Object) this.mRenderItems);
        this.mRenderTask = new RenderTask(getActivity(), this.mRenderItems, new OutputGenerator());
        this.mRenderTask.setCallback(new Callback() {
            public void onItemFinish(Uri uri, Uri uri2) {
                Log.d("ShareFilePrepareFragment", "render one item: %s -> %s", uri, uri2);
                ShareFilePrepareFragment.this.mRenderItems.remove(uri);
                if (uri2 == null) {
                    ShareFilePrepareFragment.this.mRenderFails.add(uri);
                } else {
                    ShareFilePrepareFragment.this.mRenderSuccess.add(uri);
                    ShareFilePrepareFragment.this.mSuccessPaths.add(uri2.getPath());
                }
                int size = ShareFilePrepareFragment.this.mRenderSuccess.size() + ShareFilePrepareFragment.this.mRenderFails.size();
                ShareFilePrepareFragment.this.updateProgress(ShareFilePrepareFragment.this.mMaxDownloadProgress + ShareFilePrepareFragment.this.mMaxSecretProgress + ((int) ((((float) size) / ((float) ((ShareFilePrepareFragment.this.mRenderSuccess.size() + ShareFilePrepareFragment.this.mRenderFails.size()) + ShareFilePrepareFragment.this.mRenderItems.size()))) * ((float) ShareFilePrepareFragment.this.mMaxRenderProgress))));
            }

            public void onTaskCancelled() {
                Log.d("ShareFilePrepareFragment", "render finish");
                ShareFilePrepareFragment.this.scheduleClean();
                ShareFilePrepareFragment.this.scheduleCleanSecret();
                ShareFilePrepareFragment.this.mRenderTask = null;
            }

            public void onTaskError() {
                Log.d("ShareFilePrepareFragment", "render error");
                ShareFilePrepareFragment.this.scheduleClean();
                ShareFilePrepareFragment.this.scheduleCleanSecret();
                ShareFilePrepareFragment.this.mRenderTask = null;
                ShareFilePrepareFragment.this.resolveError(R.string.send_file_beautify_failed);
            }

            public void onTaskFinish() {
                Log.d("ShareFilePrepareFragment", "render finish");
                ShareFilePrepareFragment.this.scheduleClean();
                ShareFilePrepareFragment.this.scheduleCleanSecret();
                ShareFilePrepareFragment.this.onPrepareEnd();
                ShareFilePrepareFragment.this.mRenderTask = null;
            }
        });
        this.mRenderTask.start();
    }

    private void doSecret() {
        File secretFolder = getSecretFolder();
        if (secretFolder.exists() || secretFolder.mkdirs()) {
            DecodeSecretTask decodeSecretTask = new DecodeSecretTask(secretFolder, this.mSecretList, this.mSecretKeys, this.mSecretIds, new DecodeSecretListener() {
                public void onEnd(List<Uri> list) {
                    ShareFilePrepareFragment.this.mSuccessPaths.clear();
                    if (list.isEmpty()) {
                        ShareFilePrepareFragment.this.resolveError(R.string.send_secret_file_failed);
                        return;
                    }
                    for (int i = 0; i < list.size(); i++) {
                        ShareFilePrepareFragment.this.mSuccessPaths.add(((Uri) list.get(i)).getPath());
                        int indexOf = ShareFilePrepareFragment.this.mShareUris.indexOf(ShareFilePrepareFragment.this.mSecretList.get(i));
                        if (indexOf != -1) {
                            ShareFilePrepareFragment.this.mShareUris.set(indexOf, list.get(i));
                        }
                    }
                    if (MiscUtil.isValid(ShareFilePrepareFragment.this.mRenderItems)) {
                        for (int i2 = 0; i2 < ShareFilePrepareFragment.this.mSecretList.size(); i2++) {
                            Uri uri = (Uri) ShareFilePrepareFragment.this.mSecretList.get(i2);
                            if (ShareFilePrepareFragment.this.mRenderItems.contains(uri)) {
                                ShareFilePrepareFragment.this.mRenderItems.remove(uri);
                                ShareFilePrepareFragment.this.mRenderItems.add(list.get(i2));
                                Log.d("ShareFilePrepareFragment", "download success, need render: %s", list.get(i2));
                            }
                        }
                        ShareFilePrepareFragment.this.doRender();
                    } else {
                        ShareFilePrepareFragment.this.onPrepareEnd();
                    }
                    ShareFilePrepareFragment.this.scheduleCleanSecret();
                }

                public void onItemFinish(float f) {
                    ShareFilePrepareFragment.this.updateProgress(ShareFilePrepareFragment.this.mMaxDownloadProgress + ((int) (f * ((float) ShareFilePrepareFragment.this.mMaxSecretProgress))));
                }
            });
            this.mDecodeSecretTask = decodeSecretTask;
            this.mDecodeSecretTask.execute(new Void[0]);
            return;
        }
        resolveError(R.string.send_secret_file_space_low);
    }

    private File getSecretFolder() {
        return new File(getActivity().getCacheDir(), "dc_tmp_files");
    }

    private void handleFiles() {
        ArrayList stringArrayList = getArguments().getStringArrayList("key_compress_items");
        ArrayList parcelableArrayList = getArguments().getParcelableArrayList("key_download_items");
        ArrayList parcelableArrayList2 = getArguments().getParcelableArrayList("key_render_items");
        ArrayList parcelableArrayList3 = getArguments().getParcelableArrayList("key_secret_items");
        ArrayList parcelableArrayList4 = getArguments().getParcelableArrayList("key_share_uri");
        byte[][] bArr = (byte[][]) getArguments().getSerializable("key_secret_keys");
        long[] longArray = getArguments().getLongArray("key_secret_ids");
        if (parcelableArrayList4 != null) {
            this.mShareUris.clear();
            this.mShareUris.addAll(parcelableArrayList4);
        }
        if (parcelableArrayList2 != null) {
            Log.d("ShareFilePrepareFragment", "render files: %s", (Object) parcelableArrayList2.toString());
            this.mRenderItems.clear();
            this.mRenderFails.clear();
            this.mRenderSuccess.clear();
            this.mRenderItems.addAll(parcelableArrayList2);
        }
        if (parcelableArrayList3 != null) {
            this.mSecretList.clear();
            this.mSecretList.addAll(parcelableArrayList3);
            this.mSecretKeys = bArr;
            this.mSecretIds = longArray;
        }
        if (MiscUtil.isValid(stringArrayList)) {
            Log.d("ShareFilePrepareFragment", "compress file.");
            int size = stringArrayList.size();
            int i = 0;
            if (MiscUtil.isValid(parcelableArrayList)) {
                i = parcelableArrayList.size();
            }
            this.mMaxCompressProgress = (int) ((((float) size) * 100.0f) / ((float) (size + i)));
            this.mMaxDownloadProgress = 100 - this.mMaxCompressProgress;
            doCompress(stringArrayList);
        } else if (MiscUtil.isValid(parcelableArrayList)) {
            int size2 = this.mRenderItems.size();
            int size3 = parcelableArrayList.size();
            int size4 = this.mSecretList.size();
            float f = (float) (size3 + size2 + size4);
            this.mMaxDownloadProgress = (int) ((((float) (size3 * 100)) * 1.0f) / f);
            this.mMaxSecretProgress = (int) ((((float) (size4 * 100)) * 1.0f) / f);
            this.mMaxRenderProgress = (100 - this.mMaxDownloadProgress) - this.mMaxSecretProgress;
            doDownload(parcelableArrayList);
        } else if (MiscUtil.isValid(this.mSecretList)) {
            int size5 = this.mRenderItems.size();
            int size6 = this.mSecretList.size();
            this.mMaxSecretProgress = (int) ((((float) (size6 * 100)) * 1.0f) / ((float) (size5 + size6)));
            this.mMaxRenderProgress = 100 - this.mMaxSecretProgress;
            doSecret();
        } else if (MiscUtil.isValid(this.mRenderItems)) {
            this.mMaxRenderProgress = 100;
            doRender();
        } else {
            dismissAllowingStateLoss();
        }
    }

    /* JADX WARNING: type inference failed for: r3v8, types: [byte[][], java.io.Serializable] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v8, types: [byte[][], java.io.Serializable]
  assigns: [byte[][]]
  uses: [?[], java.io.Serializable, ?[OBJECT, ARRAY][]]
  mth insns count: 31
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public static ShareFilePrepareFragment newInstance(ArrayList<String> arrayList, ArrayList<BulkDownloadItem> arrayList2, ArrayList<Uri> arrayList3, ArrayList<Uri> arrayList4, List<byte[]> list, ArrayList<Uri> arrayList5, ArrayList<Long> arrayList6) {
        ShareFilePrepareFragment shareFilePrepareFragment = new ShareFilePrepareFragment();
        Bundle bundle = new Bundle();
        bundle.putStringArrayList("key_compress_items", arrayList);
        bundle.putParcelableArrayList("key_download_items", arrayList2);
        bundle.putParcelableArrayList("key_render_items", arrayList3);
        bundle.putParcelableArrayList("key_secret_items", arrayList4);
        bundle.putLongArray("key_secret_ids", Numbers.toArray(arrayList6));
        bundle.putParcelableArrayList("key_share_uri", arrayList5);
        if (list != null && list.size() > 0) {
            ? r3 = new byte[list.size()][];
            for (int i = 0; i < r3.length; i++) {
                r3[i] = (byte[]) list.get(i);
            }
            bundle.putSerializable("key_secret_keys", r3);
        }
        shareFilePrepareFragment.setArguments(bundle);
        return shareFilePrepareFragment;
    }

    /* access modifiers changed from: private */
    public void onPrepareEnd() {
        Log.d("ShareFilePrepareFragment", "prepare finish, render fails: %d", (Object) Integer.valueOf(this.mRenderFails.size()));
        if (!this.mStopped) {
            dismissAllowingStateLoss();
            if (this.mDownloadListener != null) {
                this.mDownloadListener.onPrepareComplete(this.mSuccessPaths, this.mCompressFails, this.mRenderFails, this.mRenderSuccess, this.mDownloadFails);
                this.mDownloadListener = null;
                return;
            }
            return;
        }
        this.mPendingPrepareEnd = true;
    }

    /* access modifiers changed from: private */
    public void resolveError(int i) {
        ToastUtils.makeText((Context) getActivity(), i);
        dismissAllowingStateLoss();
        if (this.mErrorListener != null) {
            this.mErrorListener.onError();
        }
    }

    /* access modifiers changed from: private */
    public void scheduleClean() {
        if (getActivity() != null) {
            CleanService.schedule(getActivity(), new File(getActivity().getExternalCacheDir(), "render_tmp_files").getPath());
        }
    }

    /* access modifiers changed from: private */
    public void scheduleCleanSecret() {
        if (getActivity() != null) {
            CleanService.schedule(getActivity(), getSecretFolder().getPath());
        }
    }

    /* access modifiers changed from: private */
    public void updateProgress(int i) {
        this.mProgressDialog.setProgress(i);
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        handleFiles();
    }

    public void onCancel(DialogInterface dialogInterface) {
        super.onCancel(dialogInterface);
        if (this.mCancelListener != null) {
            this.mCancelListener.onCancel(dialogInterface);
        }
    }

    public void onCompressComplete(List<String> list, List<String> list2) {
        if (list != null) {
            this.mSuccessPaths.addAll(list);
        }
        if (list2 != null) {
            this.mSuccessPaths.addAll(list2);
        }
        ArrayList parcelableArrayList = getArguments().getParcelableArrayList("key_download_items");
        if (MiscUtil.isValid(parcelableArrayList)) {
            doDownload(parcelableArrayList);
        } else {
            onPrepareEnd();
        }
    }

    public void onCompressProgress(float f) {
        updateProgress((int) (f * ((float) this.mMaxCompressProgress)));
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.mProgressDialog = new ProgressDialog(getActivity());
        this.mTitle = getResources().getString(R.string.download_title);
        this.mProgressDialog.setTitle(this.mTitle);
        this.mProgressDialog.setProgressStyle(1);
        this.mProgressDialog.setIndeterminate(false);
        this.mProgressDialog.setMax(100);
        this.mProgressDialog.setCanceledOnTouchOutside(false);
        this.mProgressDialog.setButton(-2, getResources().getString(17039360), new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                ShareFilePrepareFragment.this.mProgressDialog.cancel();
            }
        });
        setCancelable(false);
        return this.mProgressDialog;
    }

    public void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        if (this.mHelper != null) {
            this.mHelper.cancel();
            this.mHelper = null;
        }
        if (this.mRenderTask != null) {
            this.mRenderTask.cancel();
        }
        if (this.mDecodeSecretTask != null) {
            this.mDecodeSecretTask.cancel(true);
        }
        this.mDownloadListener = null;
    }

    public void onDownloadEnd(List<BulkDownloadItem> list, List<BulkDownloadItem> list2) {
        if (MiscUtil.isValid(list)) {
            for (BulkDownloadItem bulkDownloadItem : list) {
                if (this.mRenderItems.contains(bulkDownloadItem.getDownloadUri())) {
                    Log.d("ShareFilePrepareFragment", "download success, need render: %s", (Object) bulkDownloadItem.getDownloadUri());
                    this.mRenderItems.remove(bulkDownloadItem.getDownloadUri());
                    this.mRenderItems.add(Uri.fromFile(new File(bulkDownloadItem.getDownloadPath())));
                }
                int indexOf = this.mSecretList.indexOf(bulkDownloadItem.getDownloadUri());
                if (indexOf != -1) {
                    Log.d("ShareFilePrepareFragment", "download success, need secret: %s", (Object) bulkDownloadItem.getDownloadUri());
                    this.mSecretList.set(indexOf, Uri.fromFile(new File(bulkDownloadItem.getDownloadPath())));
                }
                Log.d("ShareFilePrepareFragment", "download success, continue");
                this.mSuccessPaths.add(bulkDownloadItem.getDownloadPath());
            }
        }
        if (MiscUtil.isValid(list2)) {
            for (BulkDownloadItem bulkDownloadItem2 : list2) {
                Uri downloadUri = bulkDownloadItem2.getDownloadUri();
                if (this.mRenderItems.contains(downloadUri)) {
                    Log.d("ShareFilePrepareFragment", "download failed, skip render: %s", (Object) bulkDownloadItem2.getDownloadUri());
                    this.mRenderFails.add(downloadUri);
                    this.mRenderItems.remove(downloadUri);
                }
            }
        }
        this.mDownloadFails.addAll(list2);
        if (MiscUtil.isValid(this.mSecretList)) {
            Log.d("ShareFilePrepareFragment", "download finish, need secret %d items", (Object) Integer.valueOf(this.mSecretList.size()));
            doSecret();
        } else if (MiscUtil.isValid(this.mRenderItems)) {
            Log.d("ShareFilePrepareFragment", "download finish, need render %d items", (Object) Integer.valueOf(this.mRenderItems.size()));
            doRender();
        } else {
            onPrepareEnd();
        }
    }

    public void onDownloadProgress(float f) {
        updateProgress(((int) (f * ((float) this.mMaxDownloadProgress))) + this.mMaxCompressProgress);
    }

    public void onStart() {
        this.mStopped = false;
        super.onStart();
        if (this.mPendingPrepareEnd) {
            this.mPendingPrepareEnd = false;
            onPrepareEnd();
        }
    }

    public void onStop() {
        this.mStopped = true;
        super.onStop();
    }

    public void setErrorListener(OnErrorListener onErrorListener) {
        this.mErrorListener = onErrorListener;
    }

    public void setOnCancelListener(OnCancelListener onCancelListener) {
        this.mCancelListener = onCancelListener;
    }

    public void setOnDownloadListener(OnPrepareListener onPrepareListener) {
        this.mDownloadListener = onPrepareListener;
    }
}
